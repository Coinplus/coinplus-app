import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gaimon/gaimon.dart';

import '/../../../../extensions/num_extension.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../gen/fonts.gen.dart';
import '../../../send_to_state.dart';
import '../usd_amount_text_field/comma_formatter.dart';

class BtcAmountTextField extends StatelessWidget {
  const BtcAmountTextField({
    super.key,
    required this.btcFocusNode,
    required this.state,
  });

  final FocusNode btcFocusNode;
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
                        controller: state.btcController,
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
                          state.handleBtcAmountSelection();
                          if (state.isUseMaxClicked) {
                            if (value.length > previousTextLength) {
                              state.hideMaxValue();
                            }
                          }
                          final btcDoubleAMount = double.tryParse(value);
                          final btcToUsd = btcDoubleAMount?.btcToUsd(
                            btcCurrentPrice: state.btcPrice,
                          );
                          state.setAmount(btcToUsd.toString());
                          state.transactionsStore.findOptimalUtxo();
                          final amountToDouble = double.tryParse(value);
                          if (value.isNotEmpty) {
                            if (value == '0') {
                              state.usdController.text = '0';
                            } else {
                              final usdAmount = amountToDouble?.btcToUsd(
                                    btcCurrentPrice: state.btcPrice,
                                  ) ??
                                  0;
                              final stringUsdAmount =
                                  usdAmount.toStringAsFixed(3);
                              state.usdController.text = stringUsdAmount;
                            }
                          } else {
                            state.usdController.text = '0';
                            state.btcController.text = '0';
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
