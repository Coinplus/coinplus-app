import 'package:flutter/material.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';
import '../../router.dart';

Future<void> alreadyActivatedWallet(BuildContext context) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      text: 'Check out our detailed guide on how to send crypto from your Ethereum wallet.',
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
        await router.maybePop();
        await router.push(WebViewRoute(link: 'https://coinplus.com/'));
      },
      secondaryActionText: 'Close',
      secondaryAction: router.maybePop,
    ),
    isDismissible: true,
  );
}
