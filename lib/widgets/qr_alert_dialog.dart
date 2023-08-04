import 'dart:ui';

import 'package:flutter/material.dart';

import '../extensions/extensions.dart';
import '../providers/screen_service.dart';
import '../router.gr.dart';
import 'loading_button.dart';

Future<void> showAlertDialog(BuildContext context) async {
  final okButton = LoadingButton(
    child: const Text(
      'OK',
      style: TextStyle(fontFamily: 'RedHatMedium', fontSize: 16),
    ),
    onPressed: () {
      router.pushAndPopAll(const OnboardingRoute());
    },
  ).paddingHorizontal(60);
  final alert = BackdropFilter(
    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
    child: AlertDialog(
      actionsPadding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      contentPadding: const EdgeInsets.all(20),
      content: const Text(
        'This is not a wallet address, please try to scan the QR on the certificate of the Bar or QR on the back of the card again',
        textAlign: TextAlign.center,
        style: TextStyle(fontFamily: 'RedHatLight', fontSize: 14),
      ),
      actions: [
        Center(child: okButton),
      ],
    ),
  );
  await showDialog(
    context: context,
    builder: (context) {
      return alert;
    },
  );
}
