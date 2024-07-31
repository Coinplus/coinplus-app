import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../extensions/context_extension.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../pages/coin_chart_page/card_select_dropdown.dart';
import '../../providers/screen_service.dart';
import '../../services/amplitude_service.dart';
import '../../widgets/loading_button/loading_button.dart';

class BuyBitcoinModal extends StatelessWidget {
  const BuyBitcoinModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.53,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const Gap(12),
          Assets.icons.notch.image(height: 4),
          const Gap(20),
          const Text(
            'Boost Your Portfolio with Bitcoin!',
            style: TextStyle(
              fontSize: 17,
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
              fontFamily: FontFamily.redHatMedium,
            ),
          ),
          const Gap(16),
          Assets.icons.buyBitcoin.image(height: 165),
          const Gap(24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 31),
            child: Text(
              "Diversify your investments with Bitcoin. It's never been easier to buy and start enjoying the benefits of crypto.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                fontFamily: FontFamily.redHatMedium,
              ),
            ),
          ),
          const Gap(25),
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
              onPressed: () {
                recordAmplitudeEventPartTwo(const BuyBitcoinNowClicked());
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: router.navigatorKey.currentContext!,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (_) {
                    return const CardSelectDropdown();
                  },
                );
              },
              child: const Text(
                'Buy bitcoin now',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
