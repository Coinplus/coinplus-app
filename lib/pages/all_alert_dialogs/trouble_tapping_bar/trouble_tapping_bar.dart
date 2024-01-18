import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../extensions/elevated_button_extensions.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../providers/screen_service.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../store/settings_button_state/settings_button_state.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../../utils/wallet_activation_status.dart';
import '../../../widgets/loading_button.dart';
import '../recommended_by_tap_bar/recommended_by_tap.dart';
import 'recommended_activate_bar_by_tap.dart';

class BarIssueOptionsSheet extends StatelessWidget {
  const BarIssueOptionsSheet({super.key});

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  SettingsState get _settingsState => GetIt.I<SettingsState>();

  @override
  Widget build(BuildContext context) {
    final bar = _balanceStore.bars[_settingsState.barCurrentIndex];
    final walletAddress = bar.address;
    final isActivated = isBarWalletActivated(balanceStore: _balanceStore, settingsState: _settingsState);

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
                  'Trouble tapping a bar?',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ).expandedHorizontally(),
                const Gap(8),
                const Text(
                  'Please select an option why you can’t tap a bar.',
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
            'My bar is damaged',
            Assets.icons.damagedCard.image(
              height: 24,
            ),
            onPressed: () async {
              await router.pop();
              unawaited(
                recordAmplitudeEvent(
                  CardDamagedClicked(walletAddress: walletAddress, walletType: 'Bar', activated: await isActivated),
                ),
              );
              await recommendedActivateBarByTap(
                context: context,
                walletAddress: walletAddress,
                walletType: 'Card',
                activated: await isActivated,
                walletProtectState: _walletProtectState,
              );
            },
          ),
          const Gap(8),
          buildOptionButton(
            context,
            "NFC on my phone doesn't work",
            Assets.icons.contactlessOff.image(height: 24),
            onPressed: () async {
              await router.pop();

              await recommendedActivateBarByTap(
                context: context,
                walletAddress: walletAddress,
                walletType: 'Bar',
                activated: await isActivated,
                walletProtectState: _walletProtectState,
              );
            },
          ),
          const Gap(8),
          buildOptionButton(
            context,
            'Don’t have the bar with me now',
            Assets.icons.dontHaveCardWithMeNow.image(height: 24),
            onPressed: () async {
              await router.pop();
              await recommendedByTapBarAlert(
                walletAddress: walletAddress,
                walletType: 'Bar',
                activated: await isActivated,
                context: context,
                walletProtectState: _walletProtectState,
              );
            },
          ),
          const Gap(8),
          buildOptionButton(
            context,
            'Lost the bar',
            Assets.icons.creditCardOff.image(height: 24),
            onPressed: () async {
              await router.pop();
              await recommendedActivateBarByTap(
                context: context,
                walletAddress: walletAddress,
                walletType: 'Bar',
                activated: await isActivated,
                walletProtectState: _walletProtectState,
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
