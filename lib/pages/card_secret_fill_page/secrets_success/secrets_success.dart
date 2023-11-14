import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../widgets/loading_button.dart';

Future<void> secretsSuccessAlert(BuildContext context) {
  final okButton = LoadingButton(
    onPressed: () async {
      await router.pop();
      await router.pop(Dashboard());
      final url = Uri.parse(
        'https://coinplus.gitbook.io/help-center/getting-started/how-to-send-crypto-from-the-coinplus-wallet',
      );
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      }
    },
    child: const Text(
      'Guide Me',
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
              const Gap(21),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Lottie.asset(
                      height: 100,
                      'assets/animated_logo/secrets_success.json',
                      repeat: false,
                    ),
                  ],
                ),
              ).expandedHorizontally(),
              const Gap(21),
              const Text(
                'Your wallet activation is successful. \nTo proceed, please check out our informative guide for detailed instructions.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatLight,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              const Gap(28),
              Center(child: okButton),
            ],
          ),
          elevation: 0,
        ),
      );
    },
  );
}