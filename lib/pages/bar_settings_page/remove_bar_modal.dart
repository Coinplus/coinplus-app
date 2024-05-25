import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../constants/button_settings.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../models/bar_model/bar_model.dart';
import '../../providers/screen_service.dart';
import '../../services/amplitude_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../utils/wallet_activation_status.dart';
import '../../widgets/loading_button/loading_button.dart';
import 'action_slider_bar.dart';

class RemoveBar extends StatefulWidget {
  const RemoveBar({super.key, required this.bar});

  final BarModel bar;

  @override
  State<RemoveBar> createState() => _RemoveBarState();
}

class _RemoveBarState extends State<RemoveBar> with TickerProviderStateMixin {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(10),
        Assets.icons.notch.image(height: 4),
        const Gap(16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            'Remove the bar',
            style: TextStyle(
              fontFamily: FontFamily.redHatMedium,
              fontWeight: FontWeight.w700,
              fontSize: 17,
              color: AppColors.primaryTextColor,
            ),
          ).expandedHorizontally(),
        ),
        const Gap(30),
        Assets.images.bar.barForm.image(
          height: 120,
        ),
        const Gap(27),
        const Text(
          'Your Coinplus Bitcoin bar will be deleted from your wallet permanently!',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontFamily: FontFamily.redHatMedium,
            color: AppColors.primary,
          ),
        ).paddingHorizontal(31),
        const Gap(25),
        ActionSliderForBarDelete(
          bar: widget.bar,
          balanceStore: _balanceStore,
        ).paddingHorizontal(50),
        const Gap(15),
        LoadingButton(
          onPressed: () async {
            final isBarActivated =
                isBarWalletActivated(balanceStore: _balanceStore);
            await recordAmplitudeEventPartTwo(
              NotSureClicked(
                walletAddress: widget.bar.address,
                walletType: 'Bar',
                activated: await isBarActivated,
              ),
            );
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
    );
  }
}
