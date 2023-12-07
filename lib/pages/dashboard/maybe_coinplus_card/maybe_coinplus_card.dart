import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:styled_text/widgets/styled_text.dart';

import '../../../extensions/elevated_button_extensions.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../widgets/loading_button.dart';

Future<void> maybeCoinplusCard(BuildContext context) {
  final closeButton = LoadingButton(
    style: context.theme.buttonStyle(
      textStyle: const TextStyle(
        fontFamily: FontFamily.redHatMedium,
        color: AppColors.primaryTextColor,
        fontSize: 15,
      ),
    ),
    onPressed: () async {
      await router.pop();
      await router.push(const ContactUs());
    },
    child: const Text(
      'Contact Us',
      style: TextStyle(
        fontSize: 15,
        fontFamily: FontFamily.redHatMedium,
        fontWeight: FontWeight.normal,
        color: AppColors.white,
      ),
    ),
  ).paddingHorizontal(40);

  return showDialog<void>(
    context: context,
    builder: (_) {
      return EmergeAlertDialog(
        emergeAlertDialogOptions: EmergeAlertDialogOptions(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Card Identification Notice',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatBold,
                  fontSize: 17,
                ),
              ),
              Lottie.asset(
                height: 130,
                'assets/animated_logo/please_wait.json',
                repeat: false,
              ),

              StyledText(
                textAlign: TextAlign.center,
                text:
                    "This card may be an old version or not produced by Coinplus. If you believe it's an old version, please contact support for assistance.",
                style: const TextStyle(
                  fontFamily: FontFamily.redHatLight,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              const Gap(28),
              Center(child: closeButton),
            ],
          ),
          elevation: 0,
        ),
      );
    },
  );
}