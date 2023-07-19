import 'package:flutter/material.dart';

import '../constants/buttons/button_settings.dart';
import '../gen/colors.gen.dart';

extension ElevatedButtonExtensions on ThemeData {
  ButtonStyle buttonStyle({
    ButtonTypes buttonType = ButtonTypes.PRIMARY,
    TextStyle? textStyle,
  }) {
    Color backgroundColor;
    const overlayColor = Colors.transparent;
    Color foregroundColor;
    Color borderColor;
    EdgeInsets contentPadding;
    contentPadding = const EdgeInsets.symmetric(
      vertical: 15,
      horizontal: 22,
    );
    switch (buttonType) {
      case ButtonTypes.PRIMARY:
        backgroundColor = AppColors.primaryButtonColor;
        foregroundColor = AppColors.mainTextColor;
        borderColor = Colors.transparent;
        break;
      case ButtonTypes.RED:
        backgroundColor = AppColors.red;
        foregroundColor = AppColors.mainTextColor;
        borderColor = Colors.transparent;
        break;
      case ButtonTypes.TRANSPARENT:
        backgroundColor = Colors.transparent;
        foregroundColor = AppColors.mainTextColor;
        borderColor = Colors.transparent;
        break;
    }

    return ButtonStyle(
      foregroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled)
              ? foregroundColor.withOpacity(0.5)
              : foregroundColor;
        },
      ),
      shadowColor: const MaterialStatePropertyAll(Colors.transparent),
      padding: MaterialStateProperty.all(contentPadding),
      shape: MaterialStateProperty.resolveWith(
        (states) {
          return RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            side: BorderSide(
              color: states.contains(MaterialState.disabled)
                  ? Colors.transparent
                  : borderColor,
            ),
          );
        },
      ),
      textStyle: MaterialStateProperty.all(
        textStyle ??
            const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              height: 1,
            ),
      ),
      enableFeedback: true,
      overlayColor: MaterialStateProperty.all(overlayColor),
      backgroundColor: MaterialStateProperty.resolveWith(
            (states) {
          return states.contains(MaterialState.disabled)
              ? backgroundColor.withOpacity(0.5)
              : backgroundColor;
        },
      ),
    );
  }
}
