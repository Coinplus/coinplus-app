import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../widgets/loading_button.dart';

Future<void> showMyDialog(BuildContext context) {
  final okButton = LoadingButton(
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
      router.pushAndPopAll(const OnboardingRoute());
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
            height: 230,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Row(
                    children: [
                      Center(
                        child: IconButton(
                          onPressed: () {
                            router.pop(context);
                          },
                          icon: const Icon(
                            Icons.close_sharp,
                            size: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      const Gap(15),
                      const Text(
                        'Keep it accessible!',
                        style: TextStyle(
                          fontFamily: FontFamily.redHatBold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 55,
                  left: 30,
                  child: Row(
                    children: [
                      Assets.images.formCard.image(height: 63),
                      const SizedBox(
                        width: 38,
                      ),
                      Assets.images.formBar.image(height: 90),
                    ],
                  ),
                ),
                const Positioned(
                  top: 180,
                  left: 0,
                  right: 0,
                  child: Text(
                    'Save your card or bar to your mobile wallet to track its balance and keep it within reach for future transactions.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: FontFamily.redHatLight,
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
          elevation: 0,
          actions: [
            Center(child: okButton),
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
