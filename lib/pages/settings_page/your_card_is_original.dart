import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../widgets/loading_button.dart';

Future<void> yourCardIsOriginal(BuildContext context) {
  final closeButton = LoadingButton(
    style: context.theme
        .buttonStyle(
      textStyle: const TextStyle(
        fontFamily: FontFamily.redHatMedium,
        color: Colors.white,
        fontSize: 15,
      ),
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
        color: Colors.white,
      ),
    ),
  ).paddingHorizontal(40);

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
                'Your card is authentic',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatBold,
                  fontSize: 17,
                ),
              ),
              const Gap(23),
              Lottie.asset(
                height: 120,
                'assets/animated_logo/secrets_success.json',
                repeat: false,
              ),
              const Gap(23),
              Center(child: closeButton),
            ],
          ),
          elevation: 0,
        ),
      );
    },
  );
}