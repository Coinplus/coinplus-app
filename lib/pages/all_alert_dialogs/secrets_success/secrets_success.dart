import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../services/amplitude_service.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> secretsSuccessAlert({
  required BuildContext context,
  required String walletAddress,
  required String walletType,
}) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      title: const Text(
        'Success!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/secrets_success.json',
      text:
          'Your wallet activation is successful. \nTo proceed, please check out our informative guide for detailed instructions.',
      primaryActionText: 'Guide Me',
      primaryAction: () async {
        await recordAmplitudeEvent(GuideMeClicked(walletAddress: walletAddress, walletType: walletType));
        router.popUntilRouteWithName(DashboardRoute.name);
        await FlutterWebBrowser.openWebPage(
          url: 'https://coinplus.gitbook.io/help-center/getting-started/how-to-send-crypto-from-the-coinplus-wallet',
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
    ),
    isDismissible: true,
  );
}
