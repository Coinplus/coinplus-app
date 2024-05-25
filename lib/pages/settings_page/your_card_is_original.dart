import 'package:flutter/material.dart';

import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> yourCardIsOriginal(BuildContext context) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      text: 'The card is authentic \nand produced by Coinplus',
      title: const Text(
        'Your card is authentic',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/secrets_success.json',
      primaryActionText: 'Close',
      primaryAction: router.maybePop,
    ),
    isDismissible: true,
  );
}
