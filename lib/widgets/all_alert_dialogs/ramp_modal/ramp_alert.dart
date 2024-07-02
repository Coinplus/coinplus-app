import 'dart:async';

import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../services/ramp_service.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> topUpAlertDialog({
  required BuildContext context,
  required RampService rampService,
}) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      title: const Text(
        'Top Up',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/ramp_lottie.json',
      lottieHeight: 100,
      text: 'Have you tried Ramp?',
      primaryActionText: 'Try',
      primaryAction: () async {
        await router.maybePop();
        rampService.presentRamp();
      },
    ),
    isDismissible: true,
  );
}
