import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../providers/screen_service.dart';
import '../../../services/amplitude_service.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';
import '../../splash_screen/splash_screen.dart';

Future<void> alreadySavedWallet(BuildContext context, String walletAddress) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      text:
          'It looks like you have already saved this wallet. To connect another one please change the wallet address.',
      title: const Text(
        'You have already \nsaved this wallet!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      primaryActionText: 'Got it',
      primaryAction: () async {
        await hasShownWallet().then((hasShown) {
          if (hasShown) {
            router.pop();
            unawaited(recordAmplitudeEvent(AlreadySavedGotItClicked(walletType: 'Card', walletAddress: walletAddress)));
          }
        });
      },
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Assets.icons.savedWallet.image(
              height: 100,
            ),
          ).expandedHorizontally(),
          const Gap(30),
        ],
      ),
    ),
    isDismissible: false,
  );
}
