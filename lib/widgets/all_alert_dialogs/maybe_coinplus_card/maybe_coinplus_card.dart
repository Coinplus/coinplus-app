import 'dart:async';

import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../services/amplitude_service.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> maybeCoinplusCard(BuildContext context) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      text:
          "This card may be an old version or not produced by Coinplus. If you believe it's an old version, please contact support for assistance.",
      title: const Text(
        'Card Identification Notice',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/please_wait.json',
      primaryActionText: 'Contact Us',
      primaryAction: () async {
        await router.pop();
        unawaited(recordAmplitudeEventPartTwo(const ContactUsClicked()));
        await router.push(const ContactUs());
      },
      secondaryActionText: 'Close',
      secondaryAction: router.pop,
    ),
    isDismissible: true,
  );
}
