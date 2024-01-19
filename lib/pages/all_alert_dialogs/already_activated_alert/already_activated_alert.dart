import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> alreadyActivatedWallet(BuildContext context, WalletProtectState walletProtectState) {
  return showDialogBox(
    context,
    walletProtectState,
    DialogBoxWithAction(
      text: 'Check out our detailed guide on how to send crypto from your wallet.',
      title: const Text(
        'Your wallet is \nalready activated!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/info.json',
      primaryActionText: 'Help center',
      primaryAction: () async {
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
      secondaryActionText: 'Close',
      secondaryAction: router.pop,
    ),
    isDismissible: true,
  );
}
