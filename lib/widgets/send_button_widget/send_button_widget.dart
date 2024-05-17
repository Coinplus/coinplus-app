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
import '../../constants/card_type.dart';
import '../../modals/send_to/send_to_modal.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../store/all_settings_state/all_settings_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../utils/wallet_activation_status.dart';
import '../all_alert_dialogs/already_activated_alert/already_activated_alert.dart';
import '../all_alert_dialogs/bar_recommended_to_wait_dialog/bar_recommended_to_wait_dialog.dart';
import '../all_alert_dialogs/card_recommended_to_wait_dialog/card_recommended_to_wait_dialog.dart';
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
  });

  final bool isBarList;
  final AbstractCard card;
  final ValueNotifier<bool> isModalOpened;
  final TabController tabController;
  final BuildContext walletContext;
  final AllSettingsState allSettingsState;

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final isCardActivated =
            isCardWalletActivated(balanceStore: _balanceStore);
        final isBarActivated =
            isBarWalletActivated(balanceStore: _balanceStore);

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
                        await alreadyActivatedWallet(
                          router.navigatorKey.currentContext!,
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
                          context: context,
                          card: card,
                          isModalOpened: isModalOpened,
                          isBarList: isBarList,
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
                        await showSendFromWalletModal(
                          allSettingsState: allSettingsState,
                        );
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

Future<void> showSendFromWalletModal({
  required AllSettingsState allSettingsState,
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
      );
    },
  );
}
