import 'dart:async';

import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../../modals/send_to/send_to_state.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../services/amplitude_service.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> recommendedActivateBarByTap({
  required BuildContext context,
  required String walletAddress,
  required String walletType,
  required bool activated,
  required SendToState state,
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
        await router.maybePop();
        unawaited(
          recordAmplitudeEventPartTwo(
            TroubleActivateClicked(
              walletAddress: walletAddress,
              walletType: walletType,
              activated: activated,
            ),
          ),
        );
        await router.push(BarSecretFillRoute(state: state));
      },
      text:
          'To be able to check the validity of the bar we need you to tap the top of bar box. In case you can’t tap, we can’t validate that your bar is authentic.',
      secondaryActionText: 'Close',
      secondaryAction: () async {
        unawaited(
          recordAmplitudeEventPartTwo(
            TroubleCloseClicked(
              walletAddress: walletAddress,
              walletType: walletType,
              activated: activated,
            ),
          ),
        );
        await router.maybePop();
      },
    ),
    isDismissible: true,
  );
}
