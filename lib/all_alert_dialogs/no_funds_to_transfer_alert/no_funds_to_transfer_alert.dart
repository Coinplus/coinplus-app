import 'package:flutter/cupertino.dart';

import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> noFundsToTransfer({required BuildContext context, required bool notCoverFee}) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      text: notCoverFee
          ? 'No enough funds to cover the bitcoin network fee.'
          : 'You don’t have enough funds in your wallet to make a transfer.',
      title: Text(
        notCoverFee ? 'No enough funds' : 'No funds to transfer',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/secrets_fail.json',
      lottieHeight: 100,
      primaryActionText: 'Got it',
      primaryAction: router.maybePop,
    ),
    isDismissible: true,
  );
}
