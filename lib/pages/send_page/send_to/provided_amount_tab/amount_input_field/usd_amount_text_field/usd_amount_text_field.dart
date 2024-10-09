import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gaimon/gaimon.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../extensions/extensions.dart';
import '../../../../../../extensions/num_extension.dart';
import '../../../../../../gen/colors.gen.dart';
import '../../../../../../gen/fonts.gen.dart';
import '../../../../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../../../../services/amplitude_service.dart';
import '../../../send_to_state.dart';
import 'comma_formatter.dart';

class UsdAmountTextField extends HookWidget {
  const UsdAmountTextField({
    super.key,
    required this.usdFocusNode,
  });

  final FocusNode usdFocusNode;

  SendToState get _sendToState => GetIt.I<SendToState>();

  @override
  Widget build(BuildContext context) {
    final formatter = useMemoized(
      () => NumberFormat.decimalPattern(context.locale.toString()),
      [context.locale],
    );
    Timer? _typingTimer;

    final _hasPrinted = useRef<bool?>(false);

    void _onTextChanged() {
      if (_typingTimer?.isActive ?? false) {
        _typingTimer?.cancel();
      }
      _hasPrinted.value = false;
      _typingTimer = Timer(const Duration(milliseconds: 1000), () {
        if (_hasPrinted.value == false) {
          final text = _sendToState.usdController.text;
          final textToInt = double.tryParse(text);
          if (textToInt != 0) {
            recordAmplitudeEventPartTwo(
              AmountEntered(
                amount: '${_sendToState.amount}\$',
                balance:
                    '${formatter.format(_sendToState.selectedCard!.finalBalance!.satoshiToUsd(btcCurrentPrice: _sendToState.btcPrice))}\$',
                fee:
                    '\$ ${formatter.format(_sendToState.transactionsStore.calculatedTxFee.satoshiToUsd(btcCurrentPrice: _sendToState.btcPrice))} ≈ ${_sendToState.transactionsStore.calculatedTxFee.satoshiToBtc()} BTC',
              ),
            );
          }
          _hasPrinted.value = true;
        }
      });
    }

    useEffect(() {
      _sendToState.usdController.addListener(_onTextChanged);
      return null;
    });
    return Expanded(
      child: Center(
        child: IntrinsicWidth(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      r'$',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 32,
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        controller: _sendToState.usdController,
                        focusNode: usdFocusNode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 8),
                        ),
                        autofocus: true,
                        cursorHeight: Platform.isIOS ? 24 : 40,
                        inputFormatters: [
                          CommaFormatter(),
                          FilteringTextInputFormatter.allow(
                            RegExp('[,.0-9]'),
                          ),
                          LengthLimitingTextInputFormatter(
                            15,
                          ),
                        ],
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        cursorColor: Colors.blue,
                        onChanged: (value) {
                          Gaimon.selection();
                          _sendToState.handleUsdAmountSelection();
                          var previousTextLength = 0;
                          if (_sendToState.isUseMaxClicked) {
                            if (value.length > previousTextLength) {
                              _sendToState.hideMaxValue();
                            }
                          }

                          if (value.isNotEmpty) {
                            final amountToDouble = double.tryParse(value);
                            if (amountToDouble != null) {
                              final btcAmount = amountToDouble.usdToBtc(
                                btcCurrentPrice: _sendToState.btcPrice,
                              );
                              final stringBtcAmount = btcAmount.toStringAsFixed(8);
                              _sendToState.btcController.text = stringBtcAmount;
                            }
                          } else {
                            _sendToState.btcController.text = '0';
                            _sendToState.usdController.text = '0';
                          }
                          _sendToState.setAmount(value);
                          _sendToState.transactionsStore.findOptimalUtxo();
                          previousTextLength = value.length;
                        },
                        style: const TextStyle(
                          fontSize: 32,
                          fontFamily: FontFamily.redHatMedium,
                          fontWeight: FontWeight.w800,
                          color: AppColors.primaryTextColor,
                        ),
                        autocorrect: false,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
