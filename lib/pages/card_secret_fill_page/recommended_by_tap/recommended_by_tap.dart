import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../extensions/elevated_button_extensions.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../widgets/loading_button.dart';

Future<void> recommendedByTapAlert(BuildContext context) {
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
        'Activate now',
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
                'Recommended to \nactivate by tap!',
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
                      height: 120,
                      repeat: false,
                      'assets/animated_logo/warning.json',
                    ),
                  ],
                ),
              ).expandedHorizontally(),
              const Gap(31),
              const Text(
                'To be able to validate that the card is legit we recommend you to activate wallet when you have your card with you.',
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
