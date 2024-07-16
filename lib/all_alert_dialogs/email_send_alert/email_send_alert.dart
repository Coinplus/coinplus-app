import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:gap/gap.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> emailSendAlert(
  BuildContext context,
  WalletProtectState walletProtectState,
) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      text:
          'You’ll get the reply shortly, before that you can check out our Help Center.',
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
        await router.maybePop();
        await recordAmplitudeEventPartTwo(
          const HelpCenterClicked(source: 'Contact Us'),
        );
        await router.maybePop(const SettingsRoute());
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
        await router.maybePop();
        await router.maybePop(const SettingsRoute());
      },
    ),
    isDismissible: true,
  );
}

Future<void> emailSendFailAlert(BuildContext context) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      text: '',
      title: const Column(
        children: [
          Text(
            'Oops…',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: FontFamily.redHatBold,
              fontSize: 17,
            ),
          ),
          Gap(20),
          Text(
            '🥺',
            style: TextStyle(fontSize: 90),
          ),
        ],
      ),
      primaryActionText: 'Help Center',
      primaryAction: () async {
        await router.maybePop();
        await recordAmplitudeEventPartTwo(
          const HelpCenterClicked(source: 'Contact Us'),
        );
        await router.maybePop(const SettingsRoute());
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
          final email = Uri.encodeComponent('help@coinplus.com');
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
              'Please try again later or contact us at <p>help@coinplus.com</p>',
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
        await router.maybePop();
      },
    ),
    isDismissible: true,
  );
}
