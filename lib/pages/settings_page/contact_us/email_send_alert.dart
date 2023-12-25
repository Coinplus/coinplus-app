import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../extensions/elevated_button_extensions.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../services/amplitude_service.dart';
import '../../../widgets/loading_button.dart';

Future<void> emailSendAlert(BuildContext context) {
  final helpButton = LoadingButton(
    child: const Text(
      'Help Center',
      style: TextStyle(
        fontFamily: FontFamily.redHatMedium,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    onPressed: () async {
      await router.pop();
      await recordAmplitudeEvent(const HelpCenterClicked(source: 'Contact Us'));
      await router.pop(const SettingsRoute());
      await FlutterWebBrowser.openWebPage(
        url: 'https://coinplus.gitbook.io/help-center',
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
      await router.pop(const SettingsRoute());
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
              const Gap(23),
              Lottie.asset(
                height: 100,
                'assets/animated_logo/secrets_success.json',
                repeat: false,
              ),
              const Gap(25),
              const Text(
                'You’ll get the reply shortly, before that you can check out our Help Center.',
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

Future<void> emailSendFailAlert(BuildContext context) {
  final helpButton = LoadingButton(
    child: const Text(
      'Help Center',
      style: TextStyle(
        fontFamily: FontFamily.redHatMedium,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    onPressed: () async {
      await router.pop();
      await router.pop(const SettingsRoute());
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
      await router.pop(const SettingsRoute());
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
                'Oops…',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatBold,
                  fontSize: 17,
                ),
              ),
              const Gap(23),
              const Text(
                '🥺️️',
                style: TextStyle(fontSize: 100),
              ),
              const Gap(25),
              ScaleTap(
                enableFeedback: false,
                onPressed: () async {
                  final email = Uri.encodeComponent('support@coinplus.com');
                  final mail = Uri.parse('mailto:$email');
                  if (await launchUrl(mail)) {
                    //email app opened
                  } else {
                    //email app is not opened
                  }
                },
                child: StyledText(
                  textAlign: TextAlign.center,
                  text:
                      'Please get in touch with us at <p>support@coinplus.com</p>, or try again later. Before that you can check out \nour Help Center.',
                  tags: {
                    'p': StyledTextTag(
                      style: const TextStyle(
                        fontFamily: FontFamily.redHatLight,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  },
                  style: const TextStyle(
                    fontFamily: FontFamily.redHatLight,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
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
