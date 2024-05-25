import 'package:auto_size_text_field/auto_size_text_field.dart';
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
    return AutoSizeTextField(
      controller: state.usdController,
      focusNode: usdFocusNode,
      decoration: const InputDecoration(
        border: InputBorder.none,
        prefixText: r'$',
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
        Gaimon.selection();
        var previousTextLength = 0;
        if (state.isUseMaxClicked) {
          if (value.length > previousTextLength) {
            state.hideMaxValue();
          }
        }
        state.setAmount(value);
        state.transactionsStore.findOptimalUtxo();
        if (value.isNotEmpty) {
          final amountToDouble = double.tryParse(value);
          if (amountToDouble != null) {
            final btcAMount = amountToDouble.usdToBtc(
              btcCurrentPrice: state.btcPrice,
            );
            final stringBtcAmount = btcAMount.toStringAsFixed(8);
            state.btcController.text = stringBtcAmount;
          }
        } else {
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
      textAlign: TextAlign.center,
      autocorrect: false,
    );
  }
}
