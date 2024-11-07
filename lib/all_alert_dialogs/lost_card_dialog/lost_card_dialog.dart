import 'dart:async';

import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../services/amplitude_service.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> lostCardDialog(BuildContext context) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      text:
          'This card has been reported lost and blocked by the owner. If you are the owner or have found the card, please contact support for assistance.',
      title: const Text(
        'The card is blocked',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/fake_card.json',
      primaryActionText: 'Contact Support',
      primaryAction: () async {
        await router.maybePop();
        unawaited(recordAmplitudeEventPartTwo(const ContactUsClicked()));
        await router.push(const ContactUs());
      },
      secondaryActionText: 'Close',
      secondaryAction: router.maybePop,
    ),
    isDismissible: true,
  );
}
