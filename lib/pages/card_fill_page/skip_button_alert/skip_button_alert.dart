import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';

import '../../../constants/card_color.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../widgets/loading_button.dart';
import '../../splash_screen/splash_screen.dart';

Future<void> showMyDialog(BuildContext context) {
  final saveButton = LoadingButton(
    child: const Text(
      'Save to wallet',
      style: TextStyle(
        fontFamily: FontFamily.redHatMedium,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    onPressed: () {
      router.push(const WalletProtectionRoute());
    },
  ).paddingHorizontal();

  final skipButton = ScaleTap(
    enableFeedback: false,
    onPressed: () {
      hasShownWallet().then(
        (hasShown) {
          if (hasShown) {
            router.pop(const Dashboard());
          } else {
            router.pushAndPopAll(const OnboardingRoute());
          }
          return;
        },
      );
      return;
    },
    child: const Text(
      'Skip anyway',
      style: TextStyle(fontFamily: FontFamily.redHatMedium, fontSize: 15),
    ),
  );
  return showDialog<void>(
    context: context,
    builder: (context) {
      return EmergeAlertDialog(
        emergeAlertDialogOptions: EmergeAlertDialogOptions(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          content: SizedBox(
            height: 220,
            child: Column(
              children: [
                const Text(
                  'Keep it accessible!',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatBold,
                    fontSize: 17,
                  ),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Assets.images.cardAndBarForms.image(
                      height: 100,
                    ),
                  ],
                ),
                const Spacer(),
                const Text(
                  'Save your card or bar to your mobile wallet to track its balance and keep it within reach for future transactions.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontFamily.redHatLight,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          elevation: 0,
          actions: [
            Center(child: saveButton),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Center(child: skipButton),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    },
  );
}
