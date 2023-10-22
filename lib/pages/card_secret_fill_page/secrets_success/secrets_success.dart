import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../widgets/loading_button.dart';

Future<void> secretsSuccessAlert(BuildContext context) {
  final okButton = LoadingButton(
    onPressed: () async {
      await router.pop();
      await router.pop(const Dashboard());
    },
    child: const Text(
      'Got it',
      style: TextStyle(
        fontFamily: FontFamily.redHatMedium,
        fontSize: 15,
        fontWeight: FontWeight.w600,
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
                'Success!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatBold,
                  fontSize: 17,
                ),
              ),
              const Gap(31),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.icons.successEmail.image(height: 73),
                  ],
                ),
              ).expandedHorizontally(),
              const Gap(31),
              const Text(
                'Your wallet activation is successful. \nFor the next steps, please check our \nHelp Center article.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatLight,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              const Gap(18),
              Center(child: okButton),
            ],
          ),
          elevation: 0,
        ),
      );
    },
  );
}
