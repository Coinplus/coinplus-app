import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../constants/card_type.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../models/amplitude_event/amplitude_event.dart';
import '../../providers/screen_service.dart';
import '../../services/amplitude_service.dart';
import '../../services/ramp_service.dart';
import '../../store/all_settings_state/all_settings_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../widgets/loading_button/loading_button.dart';
import '../../widgets/send_button_widget/send_button_widget.dart';
import '../receive_modal/receive_modal.dart';
import 'tap_to_connect_button.dart';

BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

RampService get _rampService => GetIt.I<RampService>();

Future<void> sendReceiveButtonModal({
  required AbstractCard selectedCard,
  required bool isBarList,
  required Future<bool> isCardActivated,
  required Future<bool> isBarActivated,
  required ObjectRef<({AbstractCard? card, int index})> currentCard,
  required ValueNotifier<bool> isModalOpened,
  required PageController pageController,
  required AllSettingsState settingsState,
  required AllSettingsState allSettingsState,
  required TabController tabController,
  required BuildContext context,
}) async {
  await showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    context: router.navigatorKey.currentContext!,
    builder: (_) {
      final card = [
        ..._balanceStore.cards,
        ..._balanceStore.ethCards,
        ..._balanceStore.bars,
      ].firstWhere(
        (element) => (element as AbstractCard).address == selectedCard.address,
      ) as AbstractCard;
      return Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Assets.icons.notch.image(width: 42),
            const Gap(18),
            LoadingButton(
              style: router.navigatorKey.currentContext!.theme
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
              onPressed: () async {
                await router.maybePop();
                unawaited(
                  recordAmplitudeEvent(
                    ReceiveClicked(
                      walletType: isBarList ? 'Bar' : 'Card',
                      walletAddress: card.address,
                      activated: isBarList
                          ? await isBarActivated
                          : await isCardActivated,
                    ),
                  ),
                );
                isModalOpened.value = true;
                await receiveModal(
                  card: card,
                  isBarList: isBarList,
                  isCardActivated: isCardActivated,
                  isBarActivated: isBarActivated,
                  currentCard: currentCard,
                  isModalOpened: isModalOpened,
                  settingsState: settingsState,
                );
                isModalOpened.value = false;
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: Assets.icons.receive.image(
                      height: 24,
                      width: 24,
                      color: AppColors.primaryButtonColor,
                    ),
                  ),
                  const Gap(8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Receive',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: FontFamily.redHatMedium,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                      Text(
                        'Receive crypto on this address',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: FontFamily.redHatMedium,
                          fontWeight: FontWeight.normal,
                          color: AppColors.textHintsColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(8),
            if (card.label != WalletType.TRACKER)
              SendButtonWidget(
                isBarList: isBarList,
                card: card,
                isModalOpened: isModalOpened,
                tabController: tabController,
                walletContext: context,
                allSettingsState: allSettingsState,
              ),
            if (card.blockchain == 'ETH') const SizedBox(),
            const Gap(8),
            LoadingButton(
              style: router.navigatorKey.currentContext!.theme
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
              onPressed: () async {
                await recordAmplitudeEvent(
                  BuyWithCardClicked(
                    walletType: isBarList ? 'Bar' : 'Card',
                    walletAddress: card.address,
                    activated: isBarList
                        ? await isBarActivated
                        : await isCardActivated,
                  ),
                );
                await router.maybePop();
                _rampService.presentRamp();
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: Assets.icons.buy.image(
                      height: 24,
                      width: 24,
                      color: AppColors.primaryButtonColor,
                    ),
                  ),
                  const Gap(8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Buy with card',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: FontFamily.redHatMedium,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                      Text(
                        'Purchase crypto with cash',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: FontFamily.redHatMedium,
                          fontWeight: FontWeight.normal,
                          color: AppColors.textHintsColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(8),
            LoadingButton(
              style: router.navigatorKey.currentContext!.theme
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
              onPressed: () async {
                await recordAmplitudeEvent(
                  HistoryClicked(
                    walletType: isBarList ? 'Bar' : 'Card',
                    walletAddress: card.address,
                    activated: isBarList
                        ? await isBarActivated
                        : await isCardActivated,
                  ),
                );
                await router.maybePop();
                await Future.delayed(const Duration(milliseconds: 400));
                await allSettingsState.updateIndex(2);
                pageController.jumpToPage(2);
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 8,
                    ),
                    child: Assets.icons.history.image(
                      height: 24,
                      width: 24,
                      color: AppColors.primaryButtonColor,
                    ),
                  ),
                  const Gap(8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'History',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: FontFamily.redHatMedium,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryTextColor,
                        ),
                      ),
                      Text(
                        'Check the list of your transactions',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: FontFamily.redHatMedium,
                          fontWeight: FontWeight.normal,
                          color: AppColors.textHintsColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Gap(8),
            const TapToConnectButton(),
            const Gap(30),
          ],
        ),
      );
    },
  );
}
