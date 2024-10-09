import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gaimon/gaimon.dart';
import 'package:get_it/get_it.dart';

import '/../../../../extensions/num_extension.dart';
import '../../../../../../extensions/extensions.dart';
import '../../../../../../gen/colors.gen.dart';
import '../../../../../../gen/fonts.gen.dart';
import '../../../../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../../../../services/amplitude_service.dart';
import '../../../send_to_state.dart';
import '../usd_amount_text_field/comma_formatter.dart';

class BtcAmountTextField extends HookWidget {
  const BtcAmountTextField({
    super.key,
    required this.btcFocusNode,
  });

  final FocusNode btcFocusNode;

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
          recordAmplitudeEventPartTwo(
            AmountEntered(
              amount: '${_sendToState.amount.usdToBtc(btcCurrentPrice: _sendToState.btcPrice)}BTC',
              balance: '${_sendToState.selectedCard!.finalBalance!.satoshiToBtc()} BTC',
              fee:
                  '\$ ${formatter.format(_sendToState.transactionsStore.calculatedTxFee.satoshiToUsd(btcCurrentPrice: _sendToState.btcPrice))} ≈ ${_sendToState.transactionsStore.calculatedTxFee.satoshiToBtc()} BTC',
            ),
          );
          _hasPrinted.value = true;
        }
      });
    }

    useEffect(() {
      _sendToState.btcController.addListener(_onTextChanged);
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
                      '₿',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.w800,
                        fontSize: 32,
                      ),
                    ),
                    Flexible(
                      child: TextField(
                        controller: _sendToState.btcController,
                        focusNode: btcFocusNode,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: AppColors.textHintsColor,
                          ),
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
                          var previousTextLength = 0;
                          Gaimon.selection();
                          _sendToState.handleBtcAmountSelection();
                          if (_sendToState.isUseMaxClicked) {
                            if (value.length > previousTextLength) {
                              _sendToState.hideMaxValue();
                            }
                          }
                          final btcDoubleAMount = double.tryParse(value);
                          final btcToUsd = btcDoubleAMount?.btcToUsd(
                            btcCurrentPrice: _sendToState.btcPrice,
                          );
                          _sendToState.setAmount(btcToUsd.toString());
                          _sendToState.transactionsStore.findOptimalUtxo();
                          final amountToDouble = double.tryParse(value);
                          if (value.isNotEmpty) {
                            if (value == '0') {
                              _sendToState.usdController.text = '0';
                            } else {
                              final usdAmount = amountToDouble?.btcToUsd(
                                    btcCurrentPrice: _sendToState.btcPrice,
                                  ) ??
                                  0;
                              final stringUsdAmount = usdAmount.toStringAsFixed(3);
                              _sendToState.usdController.text = stringUsdAmount;
                            }
                          } else {
                            _sendToState.usdController.text = '0';
                            _sendToState.btcController.text = '0';
                          }
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
