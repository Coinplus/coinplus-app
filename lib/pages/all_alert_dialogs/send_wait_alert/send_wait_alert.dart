import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../../extensions/elevated_button_extensions.dart';
import '../../../../extensions/extensions.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../providers/screen_service.dart';
import '../../../../router.gr.dart';
import '../../../../widgets/loading_button.dart';

Future<void> sendWaitAlert(BuildContext context) {
  final okButton = LoadingButton(
    onPressed: router.pop,
    child: const Text(
      'Got it',
      style: TextStyle(
        fontFamily: FontFamily.redHatMedium,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
  ).paddingHorizontal(40);
  final sendButton = SizedBox(
    height: 48,
    child: LoadingButton(
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
        await router.push(CardSecretFillRoute());
      },
      child: const Text(
        'Send anyway',
        style: TextStyle(
          fontSize: 15,
          fontFamily: FontFamily.redHatMedium,
          fontWeight: FontWeight.normal,
          color: AppColors.primaryTextColor,
        ),
      ),
    ).paddingHorizontal(40),
  );
  return showDialog<void>(
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
                'Recommended to Wait!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatBold,
                  fontSize: 17,
                ),
              ),
              const Gap(23),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      height: 140,
                      repeat: false,
                      'assets/animated_logo/please_wait.json',
                    ),
                  ],
                ),
              ).expandedHorizontally(),
              const Gap(31),
              const Text(
                'The in-app send option will be available soon. To maintain the highest level of security, we encourage you to wait for the upcoming app update.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatLight,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              const Gap(18),
              Center(child: okButton),
              const Gap(8),
              Center(child: sendButton),
            ],
          ),
          elevation: 0,
        ),
      );
    },
  );
}
