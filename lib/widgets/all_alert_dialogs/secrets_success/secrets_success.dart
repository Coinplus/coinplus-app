import 'dart:async';

import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../../modals/send_to/send_to_state.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../store/all_settings_state/all_settings_state.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';
import '../../send_button_widget/send_button_widget.dart';

Future<void> secretsSuccessAlert({
  required BuildContext context,
  required String walletAddress,
  required String walletType,
  required bool isBarList,
  required SendToState state,
}) {
  final allSettingsState = AllSettingsState();
  return showDialogBox(
    context,
    DialogBoxWithAction(
      title: const Text(
        'Success!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/card_hovering_transaction.json',
      text:
          'Your wallet activation is successful. You can find your private key in the card (bar) settings.',
      primaryActionText: 'Next',
      primaryAction: () async {
        router.popUntilRouteWithName(DashboardRoute.name);
        await showSendFromWalletModal(
          allSettingsState: allSettingsState,
          isBarList: isBarList,
          state: state,
        );
      },
      secondaryActionText: 'Close',
      secondaryAction: () {
        router.popUntilRouteWithName(DashboardRoute.name);
      },
    ),
    isDismissible: true,
  );
}
