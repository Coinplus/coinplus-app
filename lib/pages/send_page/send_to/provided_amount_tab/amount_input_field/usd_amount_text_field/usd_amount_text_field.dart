import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gaimon/gaimon.dart';

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
    required this.state,
  });

  final FocusNode usdFocusNode;
  final SendToState state;

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
          final text = state.usdController.text;
          final textToInt = int.parse(text);
          if (textToInt != 0) {
            recordAmplitudeEventPartTwo(
              AmountEntered(
                amount: '${state.amount}\$',
                balance:
                    '${formatter.format(state.selectedCard!.finalBalance!.satoshiToUsd(btcCurrentPrice: state.btcPrice))}\$',
                fee:
                    '\$ ${formatter.format(state.transactionsStore.calculatedTxFee.satoshiToUsd(btcCurrentPrice: state.btcPrice))} ≈ ${state.transactionsStore.calculatedTxFee.satoshiToBtc()} BTC',
              ),
            );
          }
          _hasPrinted.value = true;
        }
      });
    }

    useEffect(() {
      state.usdController.addListener(_onTextChanged);
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
                        controller: state.usdController,
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
                          state.handleUsdAmountSelection();
                          var previousTextLength = 0;
                          if (state.isUseMaxClicked) {
                            if (value.length > previousTextLength) {
                              state.hideMaxValue();
                            }
                          }

                          if (value.isNotEmpty) {
                            final amountToDouble = double.tryParse(value);
                            if (amountToDouble != null) {
                              final btcAmount = amountToDouble.usdToBtc(
                                btcCurrentPrice: state.btcPrice,
                              );
                              final stringBtcAmount =
                                  btcAmount.toStringAsFixed(8);
                              state.btcController.text = stringBtcAmount;
                            }
                          } else {
                            state.btcController.text = '0';
                            state.usdController.text = '0';
                          }
                          state.setAmount(value);
                          state.transactionsStore.findOptimalUtxo();
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
