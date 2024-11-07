import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/card_color.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/abstract_card/abstract_card.dart';
import 'lost_card_action_slider.dart';

class LostMyCardWidget extends StatelessWidget {
  const LostMyCardWidget({super.key, required this.card});

  final AbstractCard card;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(10),
          Assets.icons.notch.image(height: 4),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              'Lost my card',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: AppColors.primaryTextColor,
              ),
            ).expandedHorizontally(),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              'Immediate action is required!',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: AppColors.secondaryTextColor,
              ),
            ).expandedHorizontally(),
          ),
          const Gap(20),
          card.color.image.image(height: 100),
          const Gap(20),
          Text(
            card.address,
            style: const TextStyle(
              fontFamily: FontFamily.redHatMedium,
              color: AppColors.secondaryTextColor,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const Gap(27),
          const Text(
            'All your funds will be transferred to your backup wallet, and this wallet will be blocked. This ensures that anyone who finds it won’t be able to send funds using the Coinplus app.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontFamily: FontFamily.redHatMedium,
              color: AppColors.primary,
            ),
          ).paddingHorizontal(31),
          const Gap(25),
          LostCardActionSlider(
            card: card,
          ).paddingHorizontal(50),
          const Gap(40),
        ],
      ),
    );
  }
}
