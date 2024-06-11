import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaimon/gaimon.dart';

import '../../../../../extensions/num_extension.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../gen/fonts.gen.dart';
import '../../../send_to_state.dart';
import 'comma_formatter.dart';

class UsdAmountTextField extends StatelessWidget {
  const UsdAmountTextField({
    super.key,
    required this.usdFocusNode,
    required this.state,
  });

  final FocusNode usdFocusNode;
  final SendToState state;

  @override
  Widget build(BuildContext context) {
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
                        cursorHeight: 24,
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
