import 'dart:async';

import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> recommendedActivateBarByTap({
  required BuildContext context,
  required String walletAddress,
  required String walletType,
  required bool activated,
  required WalletProtectState walletProtectState,
}) {
  return showDialogBox(
    context,
    walletProtectState,
    DialogBoxWithAction(
      title: const Text(
        'Recommended to \nactivate by tap!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/animated_logo/warning.json',
      primaryActionText: 'Activate',
      primaryAction: () async {
        await router.pop();
        unawaited(
          recordAmplitudeEvent(
            TroubleActivateClicked(walletAddress: walletAddress, walletType: walletType, activated: activated),
          ),
        );
        await router.push(BarSecretFillRoute());
      },
      text:
          'To be able to check the validity of the bar we need you to tap the top of bar box. In case you can’t tap, we can’t validate that your bar is authentic.',
      secondaryActionText: 'Close',
      secondaryAction: () async {
        unawaited(
          recordAmplitudeEvent(
            TroubleCloseClicked(walletAddress: walletAddress, walletType: walletType, activated: activated),
          ),
        );
        await router.pop();
      },
    ),
    isDismissible: true,
  );
}
