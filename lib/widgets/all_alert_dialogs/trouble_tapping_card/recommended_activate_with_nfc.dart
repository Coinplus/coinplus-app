import 'dart:async';

import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../services/amplitude_service.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> recommendedActivateByTap({
  required BuildContext context,
  required String walletAddress,
  required String walletType,
  required bool activated,
}) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      title: const Text(
        'Recommended to \nactivate by tap!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/warning.json',
      primaryActionText: 'Activate',
      primaryAction: () async {
        await router.pop();
        unawaited(
          recordAmplitudeEventPartTwo(
            TroubleActivateClicked(walletAddress: walletAddress, walletType: walletType, activated: activated),
          ),
        );
        await router.push(CardSecretFillRoute());
      },
      text:
          'To be able to check the validity of the card we need you to tap the card. In case you can’t tap, we can’t validate that your card is authentic.',
      secondaryActionText: 'Close',
      secondaryAction: () async {
        unawaited(
          recordAmplitudeEventPartTwo(
            TroubleCloseClicked(walletAddress: walletAddress, walletType: walletType, activated: activated),
          ),
        );
        await router.pop();
      },
    ),
    isDismissible: true,
  );
}
