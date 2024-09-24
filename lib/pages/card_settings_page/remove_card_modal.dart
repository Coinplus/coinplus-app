import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../constants/button_settings.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../providers/screen_service.dart';
import '../../services/amplitude_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../utils/wallet_activation_status.dart';
import '../../widgets/loading_button/loading_button.dart';
import 'action_slider.dart';

class RemoveCard extends StatefulWidget {
  const RemoveCard({super.key, required this.card});

  final AbstractCard card;

  @override
  State<RemoveCard> createState() => _RemoveCardState();
}

class _RemoveCardState extends State<RemoveCard> with TickerProviderStateMixin {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

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
          const Gap(16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              'Remove the card',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                fontWeight: FontWeight.w700,
                fontSize: 17,
                color: AppColors.primaryTextColor,
              ),
            ).expandedHorizontally(),
          ),
          const Gap(30),
          Assets.images.card.cardForm.image(
            height: 84,
          ),
          const Gap(27),
          const Text(
            'Your Coinplus Bitcoin card will be deleted from your wallet permanently!',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              fontFamily: FontFamily.redHatMedium,
              color: AppColors.primary,
            ),
          ).paddingHorizontal(31),
          const Gap(25),
          ActionSliderForCardDelete(
            balanceStore: _balanceStore,
            card: widget.card,
          ).paddingHorizontal(50),
          const Gap(15),
          LoadingButton(
            onPressed: () async {
              if(widget.card.blockchain == 'BTC') {
                final isCardActivated =
                isCardWalletActivated(balanceStore: _balanceStore);
                await recordAmplitudeEventPartTwo(
                  NotSureClicked(
                    walletAddress: widget.card.address,
                    walletType: 'Card',
                    activated: await isCardActivated,
                  ),
                );
              } else if(widget.card.blockchain == 'ETH') {
                final isCardActivated =
                isEthCardWalletActivated(balanceStore: _balanceStore);
                await recordAmplitudeEventPartTwo(
                  NotSureClicked(
                    walletAddress: widget.card.address,
                    walletType: 'EthCard',
                    activated: await isCardActivated,
                  ),
                );
              }

              await router.maybePop();
            },
            style: context.theme
                .buttonStyle(
                  buttonType: ButtonTypes.TRANSPARENT,
                  textStyle: const TextStyle(
                    fontFamily: FontFamily.redHatSemiBold,
                    color: AppColors.primaryTextColor,
                    fontSize: 17,
                  ),
                )
                .copyWith(
                  padding: const WidgetStatePropertyAll(EdgeInsets.zero),
                ),
            child: const Text(
              'Not now',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          const Gap(30),
        ],
      ),
    );
  }
}
