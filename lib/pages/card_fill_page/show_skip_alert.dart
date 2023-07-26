import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

import '../../custom_widgets/loading_button.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';

Future<void> showSkipAlert(BuildContext context) async {
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
      router.pushAndPopAll(const OnboardingRoute());
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

  final alert = AlertDialog(
    actionsPadding:
        const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 35),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
    contentPadding: const EdgeInsets.all(10),
    content: SizedBox(
      height: 250,
      child: Stack(
        children: [
          Positioned(
            top: 18,
            left: 10,
            child: Row(
              children: [
                ScaleTap(
                  onPressed: () {
                    router.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  width: 40,
                ),
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
            top: 75,
            left: 45,
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
            top: 200,
            left: 0,
            right: 0,
            child: Text(
              'Save your card or bar to your mobile wallet to track its balance and keep it within reach for \nfuture transactions.',
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
    actions: [
      Center(child: okButton),
      Padding(
        padding: const EdgeInsets.only(top: 18),
        child: Center(child: skipButton),
      ),
    ],
  );
  await showDialog(
    context: context,
    builder: (context) {
      return alert;
    },
  );
}
