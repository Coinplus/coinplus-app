import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../pages/splash_screen/splash_screen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';
import '../../models/amplitude_event/amplitude_event_part_one/amplitude_event.dart';

Future<void> alreadySavedCard(BuildContext context, String walletAddress) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      text:
          'It looks like you have already saved this card to your wallet. To connect another one please change the wallet address.',
      title: const Text(
        'You have already \nsaved this card!',
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
            router.pushAndPopAll(const DashboardRoute());
            unawaited(
              recordAmplitudeEvent(
                AlreadySavedGotItClicked(
                  walletType: 'Card',
                  walletAddress: walletAddress,
                ),
              ),
            );
          }
        });
      },
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(40),
                Assets.images.card.cardForm.image(height: 63),
                const Gap(16),
                Assets.icons.taskAlt.image(height: 24),
              ],
            ),
          ).expandedHorizontally(),
          const Gap(20),
        ],
      ),
    ),
    isDismissible: false,
  );
}

Future<void> alreadySavedBar(
  BuildContext context,
  WalletProtectState walletProtectState,
  String walletAddress,
) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      text:
          'It looks like you have already saved this bar to your wallet. To connect another one please change the wallet address.',
      title: const Text(
        'You have already \nsaved this bar!',
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
            router.pushAndPopAll(const DashboardRoute());
            unawaited(
              recordAmplitudeEvent(
                AlreadySavedGotItClicked(
                  walletType: 'Card',
                  walletAddress: walletAddress,
                ),
              ),
            );
          }
        });
      },
      widget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Gap(40),
                Assets.images.bar.barForm.image(height: 90),
                const Gap(16),
                Assets.icons.taskAlt.image(height: 24),
              ],
            ),
          ).expandedHorizontally(),
          const Gap(20),
        ],
      ),
    ),
    isDismissible: false,
  );
}
