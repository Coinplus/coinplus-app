import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> emailSendAlert(BuildContext context, WalletProtectState walletProtectState) {
  return showDialogBox(
    context,
    walletProtectState,
    DialogBoxWithAction(
      text: 'You’ll get the reply shortly, before that you can check out our Help Center.',
      title: const Text(
        'Success!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/secrets_success.json',
      primaryActionText: 'Help Center',
      primaryAction: () async {
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
      secondaryActionText: 'Close',
      secondaryAction: () async {
        await router.pop();
        await router.pop(const SettingsRoute());
      },
    ),
    isDismissible: true,
  );
}

Future<void> emailSendFailAlert(BuildContext context, WalletProtectState walletProtectState) {
  return showDialogBox(
    context,
    walletProtectState,
    DialogBoxWithAction(
      text: 'You’ll get the reply shortly, before that you can check out our Help Center.',
      title: const Text(
        'Oops…',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/sad_emoji.json',
      primaryActionText: 'Help Center',
      primaryAction: () async {
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
      widget: ScaleTap(
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
      secondaryActionText: 'Close',
      secondaryAction: () async {
        await router.pop();
        await router.pop(const SettingsRoute());
      },
    ),
    isDismissible: true,
  );
}
