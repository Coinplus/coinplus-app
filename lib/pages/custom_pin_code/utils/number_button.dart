import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';

typedef OnNumberButtonPressed = void Function(int number);

class NumberButton extends StatelessWidget {
  const NumberButton({
    super.key,
    required this.number,
    required this.size,
    required this.color,
    required this.onNumberTap,
    this.buttonElevation,
    this.foregroundColor,
    this.buttonRadius,
  });
  final int number;
  final Size size;
  final Color color;
  final OnNumberButtonPressed onNumberTap;
  final double? buttonElevation;
  final double? buttonRadius;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shadowColor: Colors.grey.withOpacity(0.9),
          foregroundColor: Colors.grey.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(buttonRadius ?? 100),
          ),
          elevation: buttonElevation ?? 4,
          surfaceTintColor: Colors.white,
        ),
        onPressed: () {
          HapticFeedback.mediumImpact();
          onNumberTap(number);
        },
        child: FittedBox(
          child: Center(
            child: Text(
              number.toString(),
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                fontWeight: FontWeight.bold,
                color: foregroundColor ?? AppColors.primary,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
