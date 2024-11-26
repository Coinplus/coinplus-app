import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../extensions/context_extension.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../services/amplitude_service.dart';
import '../../widgets/loading_button/loading_button.dart';

class CardBlockedModal extends StatelessWidget {
  const CardBlockedModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(12),
        Assets.icons.notch.image(height: 4),
        const Gap(20),
        const Text(
          'The card is blocked',
          style: TextStyle(
            fontFamily: FontFamily.redHatMedium,
            fontSize: 17,
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        Assets.images.lostCardIllustration.image(),
        const Gap(24),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 31),
          child: Text(
            'This card has been reported lost and blocked by the owner. If you are the owner or have found it, please contact support.',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: FontFamily.redHatMedium, fontSize: 14, color: AppColors.primary),
          ),
        ),
        const Gap(48),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: LoadingButton(
            style: context.theme
                .buttonStyle(
                  textStyle: const TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    color: AppColors.primaryTextColor,
                    fontSize: 15,
                  ),
                )
                .copyWith(),
            onPressed: () async {
              await router.maybePop();
              unawaited(recordAmplitudeEventPartTwo(const ContactUsClicked()));
              await router.push(const ContactUs());
            },
            child: const Text(
              'Contact Support',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const Gap(30),
      ],
    );
  }
}
