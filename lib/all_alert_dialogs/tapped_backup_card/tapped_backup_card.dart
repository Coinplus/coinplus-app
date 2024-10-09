import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';
import '../../providers/screen_service.dart';
import '../../utils/card_nfc_session.dart';

Future<void> tappedBackupCard(BuildContext context) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      text: 'This is a backup card, please connect the primary wallet first',
      title: const Text(
        'Backup card',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/info.json',
      primaryActionText: 'Connect primary',
      primaryAction: () async {
        await router.maybePop();
        await nfcSessionIos();
      },
    ),
    isDismissible: true,
  );
}
