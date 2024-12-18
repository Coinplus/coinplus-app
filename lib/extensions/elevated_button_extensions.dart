import 'package:flutter/material.dart';

import '../constants/button_settings.dart';
import '../gen/colors.gen.dart';
import '../gen/fonts.gen.dart';

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
        backgroundColor = const Color(0xFFFD5340);
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
      foregroundColor: WidgetStateProperty.resolveWith(
        (states) {
          return textStyle?.color ??
              (states.contains(WidgetState.disabled) ? foregroundColor.withValues(alpha: 0.5) : foregroundColor);
        },
      ),
      shadowColor: const WidgetStatePropertyAll(Colors.transparent),
      padding: WidgetStateProperty.all(contentPadding),
      shape: WidgetStateProperty.resolveWith(
        (states) {
          return RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            side: BorderSide(
              color: states.contains(WidgetState.disabled) ? Colors.transparent : borderColor,
            ),
          );
        },
      ),
      textStyle: WidgetStateProperty.all(
        textStyle ??
            const TextStyle(
              fontFamily: FontFamily.redHatMedium,
              fontWeight: FontWeight.w700,
              fontSize: 18,
              height: 1,
            ),
      ),
      enableFeedback: true,
      overlayColor: WidgetStateProperty.all(overlayColor),
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          return states.contains(WidgetState.disabled) ? backgroundColor.withValues(alpha: 0.5) : backgroundColor;
        },
      ),
    );
  }
}
