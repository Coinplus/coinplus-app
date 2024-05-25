import 'package:auto_size_text_field/auto_size_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return AutoSizeTextField(
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
        prefixText: '₿',
        prefixStyle: TextStyle(
          fontFamily: FontFamily.redHatMedium,
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w800,
          fontSize: 32,
        ),
      ),
      fullwidth: false,
      minFontSize: 24,
      minWidth: 50,
      autofocus: true,
      cursorHeight: 24,
      inputFormatters: [
        CommaFormatter(),
        FilteringTextInputFormatter.allow(
          RegExp('[,.0-9]'),
        ),
      ],
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
      ),
      cursorColor: Colors.blue,
      onChanged: (value) {
        var previousTextLength = 0;
        if (state.isUseMaxClicked) {
          if (value.length > previousTextLength) {
            state.hideMaxValue();
          }
        }
        final btcDoubleAMount = double.tryParse(value);
        final btcToUsd =
            btcDoubleAMount?.btcToUsd(btcCurrentPrice: state.btcPrice);
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
            final stringUsdAmount = usdAmount.toStringAsFixed(2);
            state.usdController.text = stringUsdAmount;
          }
        } else {
          state.usdController.text = '0';
        }
        previousTextLength = value.length;
      },
      style: const TextStyle(
        fontSize: 32,
        fontFamily: FontFamily.redHatMedium,
        fontWeight: FontWeight.w800,
        color: AppColors.primaryTextColor,
      ),
      textAlign: TextAlign.center,
      autocorrect: false,
    );
  }
}
