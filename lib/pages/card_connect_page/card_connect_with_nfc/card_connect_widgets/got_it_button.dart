import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:iosish_shaker/iosish_shaker.dart';

import '../../../../all_alert_dialogs/already_saved_card_dialog/already_saved_card_dialog.dart';
import '../../../../constants/card_color.dart';
import '../../../../constants/card_type.dart';
import '../../../../extensions/extensions.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../models/amplitude_event/amplitude_event_part_one/amplitude_event.dart';
import '../../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../../models/amplitude_user_property_model/amplitude_user_property_model.dart';
import '../../../../providers/screen_service.dart';
import '../../../../router.gr.dart';
import '../../../../services/amplitude_service.dart';
import '../../../../services/cloud_firestore_service.dart';
import '../../../../store/address_and_balance_state/address_and_balance_state.dart';
import '../../../../store/all_settings_state/all_settings_state.dart';
import '../../../../store/balance_store/balance_store.dart';
import '../../../../store/connectivity_store/connectivity_store.dart';
import '../../../../store/history_page_store/history_page_store.dart';
import '../../../../utils/secure_storage_utils.dart';
import '../../../../utils/storage_utils.dart';
import '../../../../widgets/loading_button/loading_button.dart';
import '../../../splash_screen/splash_screen.dart';
import '../../card_connect_events/card_connect_events.dart';

class GotItButton extends StatelessWidget {
  const GotItButton({
    super.key,
    required this.allSettingsState,
    required this.receivedData,
    required this.balanceStore,
    required this.cardColor,
    required this.isOriginalNxp,
    required this.shakeAnimationController,
    required this.isOldCard,
    required this.isMiFareUltralight,
    required this.isActivated,
    required this.historyPageStore,
    required this.connectivityStore,
    required this.addressState,
    required this.toggleCard,
    required this.flipCardController,
    required this.backupPack,
    required this.backup,
    required this.mainWalletAddress,
    required this.isFromBackupConnect,
  });

  final AllSettingsState allSettingsState;
  final String receivedData;
  final BalanceStore balanceStore;
  final String? cardColor;
  final bool isOriginalNxp;
  final ShakerController shakeAnimationController;
  final bool? isMiFareUltralight;
  final bool? isOldCard;
  final bool? isActivated;
  final bool? backupPack;
  final bool backup;
  final HistoryPageStore historyPageStore;
  final ConnectivityStore connectivityStore;
  final AddressState addressState;
  final Future<void> Function()? toggleCard;
  final FlipCardController flipCardController;
  final String mainWalletAddress;
  final bool isFromBackupConnect;

  @override
  Widget build(BuildContext context) {
    final _secureStorage = SecureStorageService();

    return Observer(
      builder: (_) {
        return allSettingsState.isLineVisible
            ? receivedData.startsWith('0')
                ? LoadingButton(
                    onPressed: () async {
                      if (allSettingsState.isActive) {
                        await balanceStore.updateCardIndicatorIndex(
                          balanceStore.cardCurrentIndex,
                        );
                        if (isOriginalNxp == true) {
                          unawaited(connectedCount(receivedData));
                          if (cardColor == '0') {
                            balanceStore.saveSelectedEthCard(
                              color: CardColor.ETHEREUM,
                            );
                          } else if (cardColor == '1') {
                            balanceStore.saveSelectedEthCard(
                              color: CardColor.ETHEREUM,
                            );
                          } else if (cardColor == '2') {
                            balanceStore.saveSelectedEthCard(
                              color: CardColor.ETHEREUM,
                            );
                          } else {
                            balanceStore.saveSelectedEthCard(
                              color: CardColor.ETHEREUM,
                            );
                          }
                        }
                        await cardTapEvent(
                          walletAddress: balanceStore.selectedEthCard!.address,
                        );
                      } else {
                        await HapticFeedback.vibrate();
                        allSettingsState.accept();
                        await shakeAnimationController.shake();
                      }
                      await cardAddedEvent(
                        walletAddress: balanceStore.selectedEthCard!.address,
                      );
                    },
                    child: const Text(
                      'Got it',
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: FontFamily.redHatSemiBold,
                      ),
                    ),
                  ).paddingHorizontal(49)
                : LoadingButton(
                    onPressed: () async {
                      if (allSettingsState.isActive) {
                        await balanceStore.updateCardIndicatorIndex(
                          balanceStore.cardCurrentIndex,
                        );
                        if (isOriginalNxp == true) {
                          unawaited(connectedCount(receivedData));
                          if (backup) {
                            if (cardColor == '0') {
                              balanceStore.saveSelectedBackupCard(
                                color: CardColor.ORANGE,
                              );
                            } else if (cardColor == '1') {
                              balanceStore.saveSelectedBackupCard(
                                color: CardColor.WHITE,
                              );
                            } else if (cardColor == '2') {
                              balanceStore.saveSelectedBackupCard(
                                color: CardColor.BLACK,
                              );
                            } else if (cardColor == '3') {
                              balanceStore.saveSelectedBackupCard(
                                color: CardColor.BACKUP,
                              );
                            }
                            await StorageUtils.saveMainAndBackupCard(
                              mainCardAddress: balanceStore.mainWalletAddress,
                              backupCard: balanceStore.selectedBackupCard!,
                            );
                            balanceStore.changeCardBackupStatusAndSave(
                              cardAddress: balanceStore.mainWalletAddress,
                              hasBackedUp: true,
                            );
                            await _secureStorage.setBackupStatus(
                              isSet: true,
                              address: balanceStore.mainWalletAddress,
                            );
                            await addBackupAddressToDb(
                              mainWalletAddress: balanceStore.mainWalletAddress,
                              backupWalletAddress: balanceStore.selectedBackupCard!.address,
                            );
                          } else {
                            if (cardColor == '0' || cardColor == 'ORANGE') {
                              balanceStore.saveSelectedCard(
                                color: CardColor.ORANGE,
                              );
                            } else if (cardColor == '1' || cardColor == 'WHITE') {
                              balanceStore.saveSelectedCard(
                                color: CardColor.WHITE,
                              );
                            } else if (cardColor == '2' || cardColor == 'BLACK') {
                              balanceStore.saveSelectedCard(
                                color: CardColor.BLACK,
                              );
                            } else if (cardColor == '3' || cardColor == 'BACKUP') {
                              balanceStore.saveSelectedCard(
                                color: CardColor.BACKUP,
                              );
                            } else {
                              balanceStore.saveSelectedCard(
                                color: CardColor.ORANGE,
                              );
                            }
                            unawaited(
                              historyPageStore.saveAndPatchCardAddress(
                                balanceStore.selectedCard!.address,
                              ),
                            );
                          }
                        } else {
                          if (isMiFareUltralight == true) {
                            unawaited(
                              historyPageStore.saveAndPatchCardAddress(
                                balanceStore.selectedCard!.address,
                              ),
                            );
                            if (isOldCard == false || isOldCard == null) {
                              await recordUserProperty(const Tracker());
                              balanceStore.saveSelectedCardManually(
                                color: CardColor.ORANGE,
                                label: WalletType.TRACKER_PLUS,
                                name: 'Bitcoin Wallet',
                              );
                            } else {
                              unawaited(
                                connectedCount(receivedData),
                              );
                              balanceStore.saveSelectedCardManually(
                                color: CardColor.ORANGE,
                                label: WalletType.COINPLUS_WALLET,
                                name: 'Coinplus Bitcoin Wallet',
                              );
                            }
                          } else {
                            unawaited(
                              historyPageStore.saveAndPatchCardAddress(
                                balanceStore.selectedCard!.address,
                              ),
                            );
                            await recordUserProperty(const Tracker());
                            balanceStore.saveSelectedCardManually(
                              color: CardColor.TRACKER,
                              label: WalletType.TRACKER,
                              name: 'Bitcoin Wallet',
                            );
                          }
                        }
                        await hasShownWallet().then((hasShown) {
                          recordAmplitudeEventPartTwo(
                            CardAddedEvent(
                              address: balanceStore.selectedCard!.address,
                            ),
                          );
                          recordUserProperty(const CardTap());
                          if (hasShown) {
                            isFromBackupConnect
                                ? router.push(
                                    BackupMyWalletRoute(
                                      walletAddress: receivedData,
                                      backupPack: backupPack,
                                      isWalletActivated: false,
                                      cardColor: cardColor,
                                    ),
                                  )
                                : backupPack == true
                                    ? router.push(
                                        BackupMyWalletRoute(
                                          walletAddress: receivedData,
                                          backupPack: backupPack,
                                          isWalletActivated: false,
                                          cardColor: cardColor,
                                        ),
                                      )
                                    : router.maybePop();
                          } else {
                            backupPack == true
                                ? router.push(
                                    BackupMyWalletRoute(
                                      walletAddress: receivedData,
                                      backupPack: backupPack,
                                      isWalletActivated: false,
                                      cardColor: cardColor,
                                    ),
                                  )
                                : router.pushAndPopAll(
                                    const WalletProtectionRoute(),
                                  );
                          }
                        });
                        await hasShownWallet().then((hasShown) async {
                          if (backup && !hasShown) {
                            await router.pushAndPopAll(const WalletProtectionRoute());
                          }
                        });
                      } else {
                        await HapticFeedback.vibrate();
                        allSettingsState.accept();
                        await shakeAnimationController.shake();
                      }
                      await hasShownWallet().then(
                        (hasShown) async {
                          if (hasShown) {
                            await recordAmplitudeEvent(
                              GotItClicked(
                                source: 'Wallet',
                                walletType: 'Card',
                                walletAddress: balanceStore.selectedCard!.address,
                              ),
                            );
                          } else {
                            await recordAmplitudeEvent(
                              GotItClicked(
                                source: 'Onboarding',
                                walletType: 'Card',
                                walletAddress: balanceStore.selectedCard!.address,
                              ),
                            );
                          }
                          await recordAmplitudeEventPartTwo(
                            CardAddedEvent(
                              address: balanceStore.selectedCard!.address,
                            ),
                          );
                        },
                      );
                    },
                    child: const Text(
                      'Got it',
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: FontFamily.redHatSemiBold,
                      ),
                    ),
                  ).paddingHorizontal(49)
            : Observer(
                builder: (context) {
                  return receivedData.startsWith('0')
                      ? LoadingButton(
                          onPressed: connectivityStore.connectionStatus == ConnectivityResult.none
                              ? null
                              : addressState.isAddressVisible
                                  ? allSettingsState.isActivatedCheckBox
                                      ? () async {
                                          await hasShownWallet().then(
                                            (hasShown) async {
                                              if (hasShown) {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Wallet',
                                                    walletType: 'Card',
                                                    walletAddress: balanceStore.selectedEthCard!.address,
                                                  ),
                                                );
                                              } else {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Onboarding',
                                                    walletType: 'Card',
                                                    walletAddress: balanceStore.selectedEthCard!.address,
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                          final cardIndex = balanceStore.cards.indexWhere(
                                            (element) => element.address == balanceStore.selectedEthCard?.address,
                                          );
                                          final barIndex = balanceStore.bars.indexWhere(
                                            (element) => element.address == balanceStore.selectedEthCard?.address,
                                          );
                                          if (cardIndex != -1 || barIndex != -1) {
                                            await alreadySavedCard(
                                              context,
                                              balanceStore.selectedEthCard!.address,
                                            );
                                          } else {
                                            await toggleCard!();
                                            await Future.delayed(
                                              const Duration(
                                                milliseconds: 300,
                                              ),
                                            );
                                            allSettingsState.makeVisible();
                                          }
                                        }
                                      : () async {
                                          await hasShownWallet().then(
                                            (hasShown) async {
                                              if (hasShown) {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Wallet',
                                                    walletType: 'Card',
                                                    walletAddress: balanceStore.selectedEthCard!.address,
                                                  ),
                                                );
                                              } else {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Onboarding',
                                                    walletType: 'Card',
                                                    walletAddress: balanceStore.selectedEthCard!.address,
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                          if (isActivated == true) {
                                            await HapticFeedback.vibrate();
                                            allSettingsState.checkboxAccept();
                                            await shakeAnimationController.shake();
                                          } else {
                                            final cardIndex = balanceStore.cards.indexWhere(
                                              (element) => element.address == balanceStore.selectedEthCard?.address,
                                            );
                                            final barIndex = balanceStore.bars.indexWhere(
                                              (element) => element.address == balanceStore.selectedEthCard?.address,
                                            );

                                            if (cardIndex != -1 || barIndex != -1) {
                                              await alreadySavedCard(
                                                context,
                                                balanceStore.selectedEthCard!.address,
                                              );
                                            } else {
                                              if (flipCardController.state!.isFront) {
                                                await toggleCard!();
                                                allSettingsState.makeVisible();
                                              }
                                            }
                                          }
                                        }
                                  : null,
                          child: const Text(
                            'Save to wallet',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: FontFamily.redHatSemiBold,
                            ),
                          ),
                        ).paddingHorizontal(49)
                      : LoadingButton(
                          onPressed: connectivityStore.connectionStatus == ConnectivityResult.none
                              ? null
                              : addressState.isAddressVisible
                                  ? allSettingsState.isActivatedCheckBox
                                      ? () async {
                                          await hasShownWallet().then(
                                            (hasShown) async {
                                              if (hasShown) {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Wallet',
                                                    walletType: 'Card',
                                                    walletAddress: balanceStore.selectedCard!.address,
                                                  ),
                                                );
                                              } else {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Onboarding',
                                                    walletType: 'Card',
                                                    walletAddress: balanceStore.selectedCard!.address,
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                          final cardIndex = balanceStore.cards.indexWhere(
                                            (element) => element.address == balanceStore.selectedCard?.address,
                                          );
                                          final barIndex = balanceStore.bars.indexWhere(
                                            (element) => element.address == balanceStore.selectedCard?.address,
                                          );
                                          if (cardIndex != -1 || barIndex != -1) {
                                            await alreadySavedCard(
                                              context,
                                              balanceStore.selectedCard!.address,
                                            );
                                          } else {
                                            await toggleCard!();
                                            await Future.delayed(
                                              const Duration(
                                                milliseconds: 300,
                                              ),
                                            );
                                            allSettingsState.makeVisible();
                                          }
                                        }
                                      : () async {
                                          await hasShownWallet().then(
                                            (hasShown) async {
                                              if (hasShown) {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Wallet',
                                                    walletType: 'Card',
                                                    walletAddress: balanceStore.selectedCard!.address,
                                                  ),
                                                );
                                              } else {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Onboarding',
                                                    walletType: 'Card',
                                                    walletAddress: balanceStore.selectedCard!.address,
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                          if (isActivated == true) {
                                            await HapticFeedback.vibrate();
                                            allSettingsState.checkboxAccept();
                                            await shakeAnimationController.shake();
                                          } else {
                                            final cardIndex = balanceStore.cards.indexWhere(
                                              (element) => element.address == balanceStore.selectedCard?.address,
                                            );
                                            final barIndex = balanceStore.bars.indexWhere(
                                              (element) => element.address == balanceStore.selectedCard?.address,
                                            );

                                            if (cardIndex != -1 || barIndex != -1) {
                                              await alreadySavedCard(
                                                context,
                                                balanceStore.selectedCard!.address,
                                              );
                                            } else {
                                              if (flipCardController.state!.isFront) {
                                                await toggleCard!();
                                                allSettingsState.makeVisible();
                                              }
                                            }
                                          }
                                        }
                                  : null,
                          child: Text(
                            backup ? 'Save backup card' : 'Save to wallet',
                            style: const TextStyle(
                              fontSize: 17,
                              fontFamily: FontFamily.redHatSemiBold,
                            ),
                          ),
                        ).paddingHorizontal(49);
                },
              );
      },
    );
  }
}
