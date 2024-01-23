import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> pleaseEnableBiometrics(BuildContext context) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      text: 'Please enable biometrics option in your device settings',
      title: const Text(
        'Biometrics fail!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/secrets_fail.json',
      lottieHeight: 100,
      primaryActionText: 'Go to settings',
      primaryAction: () async {
        await router.pop();
        await AppSettings.openAppSettings(type: AppSettingsType.security);
      },
      secondaryActionText: 'Close',
      secondaryAction: router.pop,
    ),
    isDismissible: true,
  );
}
