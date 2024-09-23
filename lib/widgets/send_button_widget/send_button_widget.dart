import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
import '../../all_alert_dialogs/already_activated_alert/already_activated_alert.dart';
import '../../all_alert_dialogs/bar_recommended_to_wait_dialog/bar_recommended_to_wait_dialog.dart';
import '../../all_alert_dialogs/card_recommended_to_wait_dialog/card_recommended_to_wait_dialog.dart';
import '../../constants/card_type.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../pages/send_page/send_to/send_to_modal.dart';
import '../../pages/send_page/send_to/send_to_state.dart';
import '../../store/all_settings_state/all_settings_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../utils/wallet_activation_status.dart';
import '../loading_button/loading_button.dart';
import 'send_page_modals.dart';

class SendButtonWidget extends HookWidget {
  const SendButtonWidget({
    super.key,
    required this.isBarList,
    required this.card,
    required this.isModalOpened,
    required this.tabController,
    required this.walletContext,
    required this.allSettingsState,
    required this.state,
  });

  final bool isBarList;
  final AbstractCard card;
  final ValueNotifier<bool> isModalOpened;
  final TabController tabController;
  final BuildContext walletContext;
  final AllSettingsState allSettingsState;
  final SendToState state;

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        dynamic isCardActivated;
        dynamic isBarActivated;
        if (card.blockchain == 'BTC') {
          isCardActivated = isCardWalletActivated(balanceStore: _balanceStore);
          isBarActivated = isBarWalletActivated(balanceStore: _balanceStore);
        } else if (card.blockchain == 'ETH') {
          isCardActivated =
              isEthCardWalletActivated(balanceStore: _balanceStore);
        }

        return LoadingButton(
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
          onPressed: card.label == WalletType.COINPLUS_WALLET
              ? isBarList
                  ? () async {
                      if (await isBarActivated) {
                        await router.maybePop();
                        await recordAmplitudeEvent(
                          SendClicked(
                            walletType: 'Bar',
                            walletAddress: card.address,
                            activated: await isBarActivated,
                          ),
                        );
                        isModalOpened.value = true;
                        await showSendFromWalletModal(
                          allSettingsState: allSettingsState,
                          isBarList: isBarList,
                          state: state,
                        );
                        isModalOpened.value = false;
                      } else {
                        await recordAmplitudeEvent(
                          SendClicked(
                            walletType: 'Bar',
                            walletAddress: card.address,
                            activated: await isBarActivated,
                          ),
                        );
                        await router.maybePop();
                        Future.delayed(
                          Duration.zero,
                          () => isModalOpened.value = true,
                        );
                        await recommendedToWaitDialog(
                          isBarList: isBarList,
                          isModalOpened: isModalOpened,
                          card: card,
                          context: context,
                          state: state,
                        );
                        isModalOpened.value = false;
                      }
                    }
                  : () async {
                      if (await isCardActivated) {
                        await router.maybePop();
                        await recordAmplitudeEvent(
                          SendClicked(
                            walletType: 'Card',
                            walletAddress: card.address,
                            activated: await isCardActivated,
                          ),
                        );
                        isModalOpened.value = true;
                        if (card.blockchain == 'BTC') {
                          await showSendFromWalletModal(
                            allSettingsState: allSettingsState,
                            isBarList: isBarList,
                            state: state,
                          );
                        } else {
                          await alreadyActivatedWallet(context);
                        }
                        isModalOpened.value = false;
                      } else {
                        await recordAmplitudeEvent(
                          SendClicked(
                            walletType: 'Card',
                            walletAddress: card.address,
                            activated: await isCardActivated,
                          ),
                        );
                        await router.maybePop();
                        Future.delayed(
                          Duration.zero,
                          () => isModalOpened.value = true,
                        );
                        await cardRecommendedToWaitDialog(
                          isBarList: isBarList,
                          isModalOpened: isModalOpened,
                          card: card,
                          context: context,
                          state: state,
                        );
                        isModalOpened.value = false;
                      }
                    }
              : () async {
                  await router.maybePop();
                  Future.delayed(
                    Duration.zero,
                    () => isModalOpened.value = true,
                  );
                  await maybeCoinplusCardModal(isModalOpened: isModalOpened);
                  isModalOpened.value = false;
                },
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: Assets.icons.send.image(
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
                    'Send',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: FontFamily.redHatMedium,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  Text(
                    'Transfer crypto to another wallet',
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
        );
      },
    );
  }
}

BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

Future<void> showSendFromWalletModal({
  required AllSettingsState allSettingsState,
  required bool isBarList,
  required SendToState state,
}) async {
  await showModalBottomSheet(
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    context: router.navigatorKey.currentContext!,
    builder: (_) {
      return SendToModal(
        allSettingsState: allSettingsState,
        isBarList: isBarList,
        state: state,
      );
    },
  );
  state
    ..clearAddressController()
    ..clearAmountControllers()
    ..isUseMaxClicked = false
    ..shouldValidateReceiverAddress = false
    ..transactionsStore.selectedCard = state.historyPageStore.cardHistoryIndex
    ..setAmount('0');
  isBarList
      ? state.transactionsStore.selectedBar = _balanceStore.cardCurrentIndex
      : state.transactionsStore.selectedCard = _balanceStore.cardCurrentIndex;
}
