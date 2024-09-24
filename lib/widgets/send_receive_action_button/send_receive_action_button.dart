import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';

import '../../constants/card_record.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event.dart';
import '../../services/amplitude_service.dart';
import '../../store/all_settings_state/all_settings_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/wallet_activation_status.dart';
import '../wallet_connect_methods/bar_connect_methods.dart';
import '../wallet_connect_methods/card_connect_methods.dart';

class SendReceiveActionButton extends StatelessWidget {
  const SendReceiveActionButton({
    super.key,
    required this.isInactive,
    required this.appLocked,
    required WalletProtectState walletProtectState,
    required this.currentCard,
    required BalanceStore balanceStore,
    required PageController pageController,
    required this.isModalOpened,
    required AllSettingsState nfcStore,
    required this.onOpenSendReceiveModal,
    required AllSettingsState allSettingsState,
  })  : _walletProtectState = walletProtectState,
        _balanceStore = balanceStore,
        _pageController = pageController,
        _nfcStore = nfcStore,
        _allSettingsState = allSettingsState;

  final ValueNotifier<bool> isInactive;
  final ValueNotifier<bool> appLocked;
  final WalletProtectState _walletProtectState;
  final ObjectRef<CardRecord> currentCard;
  final BalanceStore _balanceStore;
  final PageController _pageController;
  final ValueNotifier<bool> isModalOpened;
  final AllSettingsState _nfcStore;
  final Future<void> Function() onOpenSendReceiveModal;
  final AllSettingsState _allSettingsState;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (_) {
        if (isInactive.value &&
            appLocked.value &&
            !_walletProtectState.isNfcSessionStarted) {
          return const SizedBox();
        }
        return ScaleTap(
          enableFeedback: false,
          onPressed: () async {
            final selectedCard = currentCard.value.card;
            final isBarList = currentCard.value.index == 1;
            dynamic isCardActivated;
            dynamic isBarActivated;
            if (selectedCard?.blockchain == 'BTC') {
              isCardActivated =
                  isCardWalletActivated(balanceStore: _balanceStore);
              isBarActivated =
                  isBarWalletActivated(balanceStore: _balanceStore);
            } else if (selectedCard?.blockchain == 'ETH') {
              isCardActivated =
                  isEthCardWalletActivated(balanceStore: _balanceStore);
            }

            if (selectedCard == null || _pageController.page != 0) {
              if (isBarList) {
                await recordAmplitudeEvent(
                  AddNewPlusClicked(
                    source: _pageController.page == 0
                        ? 'Wallet'
                        : _pageController.page == 1
                            ? 'Market'
                            : _pageController.page == 2
                                ? 'History'
                                : 'Settings',
                  ),
                );
                isModalOpened.value = true;
                await showModalBottomSheet(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Assets.icons.notch.image(
                            height: 4,
                          ),
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 20, top: 10),
                              child: Text(
                                'Add new wallet',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatBold,
                                  fontSize: 17,
                                  color: AppColors.primaryTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(18),
                        BarScanMethodsPage(
                          isAvailable: _nfcStore,
                        ).paddingHorizontal(20),
                        const Gap(40),
                      ],
                    );
                  },
                );
                isModalOpened.value = false;
              } else {
                await recordAmplitudeEvent(
                  AddNewPlusClicked(
                    source: _pageController.page == 0 ? 'Wallet' : 'Settings',
                  ),
                );
                isModalOpened.value = true;
                await showModalBottomSheet(
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  context: context,
                  builder: (context) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Assets.icons.notch.image(
                            height: 4,
                          ),
                        ),
                        const Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                left: 20,
                                top: 10,
                              ),
                              child: Text(
                                'Add new wallet',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatBold,
                                  fontSize: 17,
                                  color: AppColors.primaryTextColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Gap(18),
                        CardScanMethodsPage(
                          isAvailable: _nfcStore,
                        ).paddingHorizontal(20),
                        const Gap(40),
                      ],
                    );
                  },
                );
                isModalOpened.value = false;
              }
              return;
            }
            isModalOpened.value = true;
            await onOpenSendReceiveModal();
            isModalOpened.value = false;
            await recordAmplitudeEvent(
              TransactionsButtonClicked(
                walletType: isBarList ? 'Bar' : 'Card',
                walletAddress: currentCard.value.card!.address,
                activated:
                    isBarList ? await isBarActivated : await isCardActivated,
              ),
            );
          },
          child: Observer(
            builder: (context) {
              return FloatingActionButton(
                shape: const CircleBorder(),
                elevation: 3,
                backgroundColor: Colors.deepOrangeAccent.withOpacity(0.9),
                onPressed: null,
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 1),
                  crossFadeState: _allSettingsState.tabCurrentIndex == 0
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  firstChild: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 1),
                    crossFadeState: _allSettingsState.currentIndex != 0
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 1),
                      crossFadeState: _allSettingsState.isInAddCard
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: _balanceStore.cards.isEmpty
                          ? _balanceStore.ethCards.isEmpty
                              ? Assets.icons.plus.image(
                                  color: Colors.white,
                                  height: 32,
                                )
                              : Assets.icons.sendReceive.image(
                                  color: Colors.white,
                                  height: 32,
                                )
                          : Assets.icons.sendReceive.image(
                              color: Colors.white,
                              height: 32,
                            ),
                      secondChild: Assets.icons.plus.image(
                        color: Colors.white,
                        height: 32,
                      ),
                    ),
                    secondChild: Assets.icons.plus.image(
                      color: Colors.white,
                      height: 32,
                    ),
                  ),
                  secondChild: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 1),
                    crossFadeState: _allSettingsState.currentIndex != 0
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    firstChild: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 1),
                      crossFadeState: _allSettingsState.isInAddBar
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: _balanceStore.bars.isEmpty
                          ? Assets.icons.plus.image(
                              color: Colors.white,
                              height: 32,
                            )
                          : Assets.icons.sendReceive.image(
                              color: Colors.white,
                              height: 32,
                            ),
                      secondChild: Assets.icons.plus.image(
                        color: Colors.white,
                        height: 32,
                      ),
                    ),
                    secondChild: Assets.icons.plus.image(
                      color: Colors.white,
                      height: 32,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
