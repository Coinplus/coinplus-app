import 'dart:async';

import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../services/amplitude_service.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';
import '../../services/cloud_firestore_service.dart';

Future<void> recommendedByTapAlert({
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
      primaryActionText: 'Got it',
      primaryAction: () {
        unawaited(
          recordAmplitudeEventPartTwo(
            TroubleGotItClicked(
              walletAddress: walletAddress,
              walletType: walletType,
              activated: activated,
            ),
          ),
        );
        router.maybePop();
      },
      text:
          'To be able to validate that the card is legit we recommend you to activate wallet when you have your card with you.',
      secondaryActionText: 'Activate now',
      secondaryAction: () async {
        await router.maybePop();
        final cardData = await getCardData(walletAddress);
        unawaited(
          recordAmplitudeEventPartTwo(
            TroubleActivateNowClicked(
              walletAddress: walletAddress,
              walletType: walletType,
              activated: activated,
            ),
          ),
        );
        await router.push(
          CardActivationRoute(
            s: cardData?.s == null ? null : 29,
          ),
        );
      },
    ),
    isDismissible: true,
  );
}
