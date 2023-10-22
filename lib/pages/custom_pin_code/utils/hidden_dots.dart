import 'package:flutter/material.dart';

class HiddenDots extends StatelessWidget {
  const HiddenDots({
    super.key,
    required this.values,
    required this.pinLength,
    this.isCorrect,
    this.disableDotColor,
    this.wrongPinColor,
    this.fillPinColor,
    this.dotsShape,
  });

  final String values;
  final int pinLength;
  final bool? isCorrect;
  final Color? disableDotColor;
  final Color? wrongPinColor;
  final Color? fillPinColor;
  final BoxShape? dotsShape;

  @override
  Widget build(BuildContext context) {
    final enteredLength = values.length;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pinLength,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 17,
          width: 17,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            shape: dotsShape ?? BoxShape.circle,
            color: isCorrect != null && !isCorrect!
                ? wrongPinColor ?? Theme.of(context).colorScheme.errorContainer
                : index < enteredLength
                    ? fillPinColor ?? Colors.black
                    : disableDotColor ?? Colors.grey.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
