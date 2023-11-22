import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../extensions/elevated_button_extensions.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../widgets/loading_button.dart';

Future<void> alreadyActivatedWallet(BuildContext context) {
  final helpButton = LoadingButton(
    child: const Text(
      'Help center',
      style: TextStyle(
        fontFamily: FontFamily.redHatMedium,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    onPressed: () async {
      await router.pop();
      await FlutterWebBrowser.openWebPage(
        url: 'https://coinplus.com/',
        customTabsOptions: const CustomTabsOptions(
          shareState: CustomTabsShareState.on,
          instantAppsEnabled: true,
          showTitle: true,
          urlBarHidingEnabled: true,
        ),
        safariVCOptions: const SafariViewControllerOptions(
          barCollapsingEnabled: true,
          modalPresentationStyle: UIModalPresentationStyle.formSheet,
          dismissButtonStyle: SafariViewControllerDismissButtonStyle.done,
          modalPresentationCapturesStatusBarAppearance: true,
        ),
      );
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
                'Your wallet is \nalready activated!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatBold,
                  fontSize: 17,
                ),
              ),
              const Gap(23),
              Lottie.asset(
                height: 120,
                'assets/animated_logo/info.json',
                repeat: false,
              ),
              const Gap(25),
              const Text(
                'Check out our detailed guide on how to send crypto from your wallet.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatLight,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              const Gap(28),
              Center(child: helpButton),
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
