import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../services/amplitude_service.dart';
import '../../../widgets/loading_button.dart';

Future<void> secretsSuccessAlert({
  required BuildContext context,
  required String walletAddress,
  required String walletType,
}) {
  final okButton = LoadingButton(
    onPressed: () async {
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
