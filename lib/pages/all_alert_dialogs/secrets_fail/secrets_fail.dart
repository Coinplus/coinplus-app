import 'dart:async';

import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../providers/screen_service.dart';
import '../../../services/amplitude_service.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> secretsFailDialog({
  required BuildContext context,
  required String walletAddress,
  required String walletType,
}) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      title: const Text(
        'Oops…',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/secrets_fail.json',
      lottieHeight: 100,
      text:
          "It appears the secrets you've entered don't match your wallet. Please double-check both Secret 1 and Secret 2 to ensure they are entered correctly.",
      primaryActionText: 'Edit',
      primaryAction: () async {
        unawaited(recordAmplitudeEvent(EditSecretsClicked(walletAddress: walletAddress, walletType: walletType)));
        await router.pop();
      },
    ),
    isDismissible: true,
  );
}
