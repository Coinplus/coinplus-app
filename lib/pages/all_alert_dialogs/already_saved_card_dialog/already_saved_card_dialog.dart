import 'dart:async';

import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../services/amplitude_service.dart';
import '../../../widgets/loading_button.dart';
import '../../splash_screen/splash_screen.dart';

Future<void> alreadySavedCard({required BuildContext context, required String walletAddress}) {
  final okButton = LoadingButton(
    child: const Text(
      'Got it',
      style: TextStyle(
        fontFamily: FontFamily.redHatMedium,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    onPressed: () async {
      await hasShownWallet().then((hasShown) {
        if (hasShown) {
          router.pushAndPopAll(const DashboardRoute());
          unawaited(recordAmplitudeEvent(AlreadySavedGotItClicked(walletType: 'Card', walletAddress: walletAddress)));
        }
      });
    },
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
                'You have already \nsaved this card!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatBold,
                  fontSize: 17,
                ),
              ),
              const Gap(23),
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
              const Gap(31),
              const Text(
                'It looks like you have already saved this card to your wallet. To connect another one please change the wallet address.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatLight,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              const Gap(18),
              Center(child: okButton),
            ],
          ),
          elevation: 0,
        ),
      );
    },
  );
}

Future<void> alreadySavedBar({required BuildContext context, required String walletAddress}) {
  final okButton = LoadingButton(
    child: const Text(
      'Got it',
      style: TextStyle(
        fontFamily: FontFamily.redHatMedium,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    onPressed: () {
      hasShownWallet().then((hasShown) {
        if (hasShown) {
          router.pushAndPopAll(const DashboardRoute());
          unawaited(recordAmplitudeEvent(AlreadySavedGotItClicked(walletType: 'Card', walletAddress: walletAddress)));
        }
      });
    },
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
                'You have already \nsaved this bar!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatBold,
                  fontSize: 17,
                ),
              ),
              const Gap(23),
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
              const Gap(31),
              const Text(
                'It looks like you have already saved this bar to your wallet. To connect another one please change the wallet address.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatLight,
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
              ),
              const Gap(18),
              Center(child: okButton),
            ],
          ),
          elevation: 0,
        ),
      );
    },
  );
}
