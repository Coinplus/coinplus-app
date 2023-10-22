import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../store/pin_code_state/pin_code_state.dart';
import 'utils/hidden_dots.dart';
import 'utils/num_pad.dart';
import 'utils/type_def.dart';

class PinLockScreen extends StatelessWidget {
  PinLockScreen({
    super.key,
    required this.correctPin,
    required this.pinLength,
    this.onPinMatched,
    this.onPinChanged,
    this.disableDotColor,
    this.wrongPinDotColor,
    this.filledPinDotColor,
    this.buttonElevation,
    this.dotsShape,
    this.gapBtwDotsAndNumPad,
    this.buttonBackgroundColor,
    this.buttonForegroundColor,
    this.buttonBorderRadius,
    this.buttonSize,
    this.numPadVerticalSpacing,
    this.numPadHorizontalSpacing,
  });

  final _pinCodeState = PinLockStore();
  final int correctPin;
  final int pinLength;
  final OnPinMatched? onPinMatched;
  final OnPinChanged? onPinChanged;
  final Color? disableDotColor;
  final Color? wrongPinDotColor;
  final Color? filledPinDotColor;
  final double? buttonElevation;
  final BoxShape? dotsShape;
  final double? gapBtwDotsAndNumPad;
  final Color? buttonBackgroundColor;
  final Color? buttonForegroundColor;
  final double? buttonBorderRadius;
  final Size? buttonSize;
  final double? numPadVerticalSpacing;
  final double? numPadHorizontalSpacing;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Create a passcode',
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 27,
                fontFamily: FontFamily.redHatMedium,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            HiddenDots(
              values: _pinCodeState.value,
              pinLength: pinLength,
              isCorrect: _pinCodeState.isEnteredCorrect,
              disableDotColor: disableDotColor,
              wrongPinColor: wrongPinDotColor,
              fillPinColor: filledPinDotColor,
              dotsShape: dotsShape,
            ),
            SizedBox(height: gapBtwDotsAndNumPad ?? 60),
            NumPad(
              onDelete: _pinCodeState.onDelete,
              onNumberTap: _onNumberTap,
              buttonElevation: buttonElevation,
              buttonBackgroundColor: buttonBackgroundColor,
              buttonForegroundColor: buttonForegroundColor,
              buttonRadius: buttonBorderRadius,
              buttonSize: buttonSize,
              numPadVerticalSpacing: numPadVerticalSpacing,
              numPadHorizontalSpacing: numPadHorizontalSpacing,
            ),
          ],
        );
      },
    );
  }

  Future<void> _onNumberTap(int number) async {
    _pinCodeState.onNumberTap(number, pinLength, correctPin);
  }
}
