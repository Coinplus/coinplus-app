import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../extensions/elevated_button_extensions.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../widgets/loading_button.dart';
import '../../card_secret_fill_page/recommended_by_tap/recommended_by_tap.dart';
import 'recommended_activate_with_nfc.dart';

class CardIssueOptionsSheet extends StatelessWidget {
  const CardIssueOptionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.icons.notch.image(height: 4),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Trouble tapping a card?',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ).expandedHorizontally(),
                const Gap(8),
                const Text(
                  'Please select an option why you can’t tap a card.',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 14,
                  ),
                ).expandedHorizontally(),
              ],
            ),
          ),
          const Gap(33),
          buildOptionButton(
            context,
            'My card is damaged',
            Assets.icons.damagedCard.image(
              height: 24,
            ),
            onPressed: () async {
              await router.pop();
              await recommendedActivateByTap(context);
            },
          ),
          const Gap(8),
          buildOptionButton(
            context,
            "NFC on my phone doesn't work",
            Assets.icons.contactlessOff.image(height: 24),
            onPressed: () async {
              await router.pop();
              await recommendedActivateByTap(context);
            },
          ),
          const Gap(8),
          buildOptionButton(
            context,
            'Don’t have the card with me now',
            Assets.icons.dontHaveCardWithMeNow.image(height: 24),
            onPressed: () async {
              await router.pop();
              await recommendedByTapAlert(context);
            },
          ),
          const Gap(8),
          buildOptionButton(
            context,
            'Lost the card',
            Assets.icons.creditCardOff.image(height: 24),
            onPressed: () async {
              await router.pop();
              await recommendedActivateByTap(context);
            },
          ),
          const Gap(30),
        ],
      ),
    );
  }

  Widget buildOptionButton(
    BuildContext context,
    String text,
    Image icon, {
    VoidCallback? onPressed,
  }) {
    return LoadingButton(
      onPressed: onPressed,
      style: context.theme
          .buttonStyle(
            textStyle: const TextStyle(
              fontFamily: FontFamily.redHatMedium,
              color: AppColors.primaryTextColor,
              fontSize: 15,
            ),
          )
          .copyWith(
            padding: const MaterialStatePropertyAll(
              EdgeInsets.all(10),
            ),
            backgroundColor: MaterialStateProperty.all(
              Colors.grey.withOpacity(0.1),
            ),
          ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 7,
              bottom: 7,
              right: 8,
            ),
            child: icon,
          ),
          const Gap(8),
          Text(
            text,
            style: const TextStyle(
              fontFamily: FontFamily.redHatMedium,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
