import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../store/all_settings_state/all_settings_state.dart';
import '../../../utils/page_controller_manager.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> transactionSubmittedAlert({
  required BuildContext context,
  required AllSettingsState allSettingsState,
}) {
  final pageController = PageControllerManager();
  final allSettingsState = AllSettingsState();
  return showDialogBox(
    context,
    DialogBoxWithAction(
      text:
          'Your transaction is submitted and is currently pending. You can track the status in the History tab.',
      title: const Text(
        'Submitted',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/phone_coin_splash.json',
      primaryActionText: 'Got it',
      primaryAction: () async {
        await router.maybePop();
        await allSettingsState.updateIndex(2);
        pageController.navigateToPage(2);
      },
      secondaryActionText: 'Close',
      secondaryAction: router.maybePop,
    ),
    isDismissible: true,
  );
}
