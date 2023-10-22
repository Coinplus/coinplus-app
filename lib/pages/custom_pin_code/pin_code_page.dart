import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'custom_pin_code.dart';

@RoutePage()
class CustomPinCodePage extends StatelessWidget {
  const CustomPinCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Setup pin code',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const Gap(50),
          PinLockScreen(
            correctPin: 111111,
            pinLength: 6,
            onPinMatched: (pin) {},
            onPinChanged: (pin) {},
            disableDotColor: Colors.grey.withOpacity(0.5),
            wrongPinDotColor: Colors.red,
            filledPinDotColor: const Color(0xFFFD5340),
            buttonElevation: 20,
            dotsShape: BoxShape.circle,
            gapBtwDotsAndNumPad: 80,
            buttonBackgroundColor: Colors.white,
            buttonForegroundColor: Colors.black,
            buttonBorderRadius: 20,
            buttonSize: const Size(70, 70),
            numPadVerticalSpacing: 30,
            numPadHorizontalSpacing: 20,
          ),
        ],
      ),
    );
  }
}
