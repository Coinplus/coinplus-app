import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../extensions/elevated_button_extensions.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../modals/send_to/send_to_state.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../providers/screen_service.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../utils/wallet_activation_status.dart';
import '../../loading_button/loading_button.dart';
import '../recommended_by_tap_card/recommended_by_tap.dart';
import 'recommended_activate_with_nfc.dart';

class CardIssueOptionsSheet extends StatelessWidget {
  const CardIssueOptionsSheet({super.key, required this.state});

  final SendToState state;

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  @override
  Widget build(BuildContext context) {
    final card = _balanceStore.cards[_balanceStore.cardCurrentIndex];
    final walletAddress = card.address;
    final isActivated = isCardWalletActivated(balanceStore: _balanceStore);
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
              await router.maybePop();
              unawaited(
                recordAmplitudeEventPartTwo(
                  CardDamagedClicked(
                    walletAddress: walletAddress,
                    walletType: 'Card',
                    activated: await isActivated,
                  ),
                ),
              );
              unawaited(
                recommendedActivateByTap(
                  context: context,
                  walletAddress: walletAddress,
                  walletType: 'Card',
                  activated: await isActivated,
                  state: state,
                ),
              );
            },
          ),
          const Gap(8),
          buildOptionButton(
            context,
            "NFC on my phone doesn't work",
            Assets.icons.contactlessOff.image(height: 24),
            onPressed: () async {
              await router.maybePop();
              unawaited(
                recordAmplitudeEventPartTwo(
                  NfcNotWorkingCLicked(
                    walletAddress: walletAddress,
                    walletType: 'Card',
                    activated: await isActivated,
                  ),
                ),
              );
              unawaited(
                recommendedActivateByTap(
                  context: context,
                  walletAddress: walletAddress,
                  walletType: 'Card',
                  activated: await isActivated,
                  state: state,
                ),
              );
            },
          ),
          const Gap(8),
          buildOptionButton(
            context,
            'Don’t have the card with me now',
            Assets.icons.dontHaveCardWithMeNow.image(height: 24),
            onPressed: () async {
              await router.maybePop();
              unawaited(
                recordAmplitudeEventPartTwo(
                  DontHaveCardClicked(
                    walletAddress: walletAddress,
                    walletType: 'Card',
                    activated: await isActivated,
                  ),
                ),
              );
              await recommendedByTapAlert(
                context: context,
                walletAddress: walletAddress,
                walletType: 'Card',
                activated: await isActivated,
                state: state,
              );
            },
          ),
          const Gap(8),
          buildOptionButton(
            context,
            'Lost the card',
            Assets.icons.creditCardOff.image(height: 24),
            onPressed: () async {
              await router.maybePop();
              unawaited(
                recordAmplitudeEventPartTwo(
                  LostCardClicked(
                    walletAddress: walletAddress,
                    walletType: 'Card',
                    activated: await isActivated,
                  ),
                ),
              );
              unawaited(
                recommendedActivateByTap(
                  context: context,
                  walletAddress: walletAddress,
                  walletType: 'Card',
                  activated: await isActivated,
                  state: state,
                ),
              );
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
            padding: const WidgetStatePropertyAll(
              EdgeInsets.all(10),
            ),
            backgroundColor: WidgetStateProperty.all(
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
