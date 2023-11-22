import 'package:app_settings/app_settings.dart';
import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../widgets/loading_button.dart';

Future<void> pleaseEnableBiometrics(BuildContext context) {
  final settingsButton = LoadingButton(
    child: const Text(
      'Go to settings',
      style: TextStyle(
        fontFamily: FontFamily.redHatMedium,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    onPressed: () async {
      await router.pop();
      await AppSettings.openAppSettings(type: AppSettingsType.security);
    },
  ).paddingHorizontal(40);
  final closeButton = LoadingButton(
    style: context.theme
        .buttonStyle(
          textStyle: const TextStyle(
            fontFamily: FontFamily.redHatMedium,
            color: AppColors.primaryTextColor,
            fontSize: 15,
          ),
        )
        .copyWith(
          backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
        ),
    onPressed: () async {
      await router.pop();
    },
    child: const Text(
      'Close',
      style: TextStyle(
        fontSize: 15,
        fontFamily: FontFamily.redHatMedium,
        fontWeight: FontWeight.normal,
        color: AppColors.primaryTextColor,
      ),
    ),
  ).paddingHorizontal(40);

  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return EmergeAlertDialog(
        emergeAlertDialogOptions: EmergeAlertDialogOptions(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Biometrics fail',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatBold,
                  fontSize: 17,
                ),
              ),
              const Gap(23),
              Lottie.asset(
                height: 100,
                'assets/animated_logo/secrets_fail.json',
                repeat: false,
              ),
              const Gap(25),
              const Text(
                'Please enable biometrics option in your device settings',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatLight,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              const Gap(28),
              Center(child: settingsButton),
              const Gap(10),
              Center(child: closeButton),
            ],
          ),
          elevation: 0,
        ),
      );
    },
  );
}
