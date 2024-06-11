import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../alert_dialog/dialog_box_with_action.dart';
import '../../alert_dialog/show_dialog_box.dart';

Future<void> feeAlertDialog({
  required BuildContext context,
}) async {
  await showDialogBox(
    context,
    DialogBoxWithAction(
      text:
          'This fee is not charged by Coinplus, \nit is charged by the Bitcoin network to execute a transaction.',
      title: const Text(
        'Info!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/please_wait.json',
      primaryActionText: 'Got it',
      primaryAction: router.maybePop,
    ),
    isDismissible: true,
  );
}
