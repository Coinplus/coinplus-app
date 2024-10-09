import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:nxp_originality_verifier/nxp_originality_verifier.dart';

import '../all_alert_dialogs/already_saved_wallet/already_saved_wallet.dart';
import '../all_alert_dialogs/maybe_coinplus_card/maybe_coinplus_card.dart';
import '../all_alert_dialogs/not_coinplus_card_alert/not_coinplus_card_alert.dart';
import '../all_alert_dialogs/tapped_backup_card/tapped_backup_card.dart';
import '../extensions/elevated_button_extensions.dart';
import '../extensions/extensions.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../gen/fonts.gen.dart';
import '../models/amplitude_event/amplitude_event.dart';
import '../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';

import '../pages/settings_page/your_card_is_original.dart';
import '../pages/splash_screen/splash_screen.dart';
import '../providers/screen_service.dart';
import '../router.gr.dart';
import '../services/amplitude_service.dart';
import '../services/cloud_firestore_service.dart';
import '../services/firebase_service.dart';
import '../store/all_settings_state/all_settings_state.dart';
import '../store/balance_store/balance_store.dart';
import '../store/wallet_protect_state/wallet_protect_state.dart';
import '../widgets/loading_button/loading_button.dart';
import 'wallet_activation_status.dart';

BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

Future<void> nfcSessionIos({
  bool? isMifareUltralight,
  bool isBarList = false,
}) async {
  await NfcManager.instance.startSession(
    alertMessage: isBarList
        ? "Please tap your phone on the top of your Bar's box"
        : 'It’s easy! Just hold your phone near the Coinplus Card.',
    onDiscovered: (tag) async {
      final ndef = Ndef.from(tag);
      final records = ndef!.cachedMessage?.records;
      dynamic walletAddress;
      dynamic cardColor;
      dynamic formFactor;
      dynamic isOriginalTag = false;
      if (records!.length >= 2) {
        final hasJson = records[1].payload;
        final payloadString = String.fromCharCodes(hasJson);
        final Map payloadData = await json.decode(payloadString);
        walletAddress = payloadData['a'];
        cardColor = payloadData['c'];
        formFactor = payloadData['t'];
      } else {
        final hasUrl = records[0].payload;
        final payloadString = String.fromCharCodes(hasUrl);
        final parts = payloadString.split('air.coinplus.com/btc/');
        walletAddress = parts[1];
      }

      await hasShownWallet().then(
        (hasShown) async {
          if (hasShown) {
            await recordAmplitudeEvent(
              NfcTapped(source: 'Wallet', walletAddress: walletAddress),
            );
          } else {
            await recordAmplitudeEvent(
              NfcTapped(source: 'Onboarding', walletAddress: walletAddress),
            );
          }
        },
      );
      await signInAnonymously();
      final card = await getCardData(walletAddress);
      final backupCard = await getBackupCardData(walletAddress);

      final mifare = MiFare.from(tag);
      final tagId = mifare!.identifier;
      final formattedTagId = tagId
          .map((e) => e.toRadixString(16).padLeft(2, '0'))
          .join(':')
          .toUpperCase();
      Uint8List? signature;
      try {
        final response = await mifare.sendMiFareCommand(
          Uint8List.fromList(
            [0x3C, 0x00],
          ),
        );
        signature = Uint8List.fromList(response);
        if (signature.length > 2) {
          isOriginalTag = OriginalityVerifier().verify(
            tagId,
            signature,
          );
        }
      } catch (e) {
        signature = null;
      }
      if (isOriginalTag && card != null) {
        await NfcManager.instance.stopSession();
        if (card.hasBackup == true) {
          await _balanceStore.setMainWalletAddress(
            walletAddress: walletAddress,
          );
        }
        if (card.nfcId == formattedTagId) {
          await Future.delayed(const Duration(milliseconds: 2700));
          if (formFactor == 'c') {
            final cardIndex = _balanceStore.cards.indexWhere(
              (element) => element.address == walletAddress,
            );
            if (cardIndex != -1) {
              await _walletProtectState.updateModalStatus(isOpened: true);
              await alreadySavedWallet(
                router.navigatorKey.currentContext!,
                walletAddress,
              );
              _balanceStore.onCardAdded(walletAddress);
              await _walletProtectState.updateModalStatus(isOpened: false);
            } else {
              await router.push(
                CardConnectWithNfc(
                  isOriginalNxp: isOriginalTag,
                  receivedData: walletAddress,
                  cardColor: cardColor,
                  isActivated: card.activated,
                  backup: backupCard?.backup ?? false,
                  hasBackup: card.hasBackup ?? false,
                ),
              );
            }
          } else if (formFactor == 'b') {
            final cardIndex = _balanceStore.bars.indexWhere(
              (element) => element.address == walletAddress,
            );
            if (cardIndex != -1) {
              await _walletProtectState.updateModalStatus(isOpened: true);
              await alreadySavedWallet(
                router.navigatorKey.currentContext!,
                walletAddress,
              );
              _balanceStore.onBarAdded(walletAddress);
              await _walletProtectState.updateModalStatus(isOpened: false);
            } else {
              await router.push(
                BarConnectWithNfc(
                  isOriginalTag: isOriginalTag,
                  receivedData: walletAddress,
                  barColor: cardColor,
                  isActivated: card.activated,
                ),
              );
            }
          }
        } else {
          await NfcManager.instance.stopSession();
          Future.delayed(
            Duration.zero,
            () => _walletProtectState.updateModalStatus(isOpened: true),
          );
          await Future.delayed(const Duration(milliseconds: 2700));
          await notCoinplusCardAlert(
            context: router.navigatorKey.currentContext!,
            walletAddress: walletAddress,
            walletType: 'Card',
            source: 'Wallet',
          );
          Future.delayed(
            Duration.zero,
            () => _walletProtectState.updateModalStatus(isOpened: false),
          );
        }
      } else if (isOriginalTag && backupCard != null) {
        await NfcManager.instance.stopSession();
        await Future.delayed(const Duration(milliseconds: 2700));
        if (_balanceStore.cards.isEmpty && backupCard.backup == true) {
          await tappedBackupCard(router.navigatorKey.currentContext!);
        } else {
          await router.push(
            CardConnectWithNfc(
              isOriginalNxp: isOriginalTag,
              receivedData: walletAddress,
              cardColor: cardColor,
              backup: backupCard.backup ?? false,
              hasBackup: card?.hasBackup ?? false,
              isActivated: backupCard.activated,
            ),
          );
        }
      } else {
        await NfcManager.instance.stopSession();
        await Future.delayed(const Duration(milliseconds: 2700));
        if (tag.data.containsKey('mifare')) {
          isMifareUltralight = true;
          if (card != null && card.possibleOldCard == true) {
            if (card.nfcId == formattedTagId) {
              //Connect as Coinplus Bitcoin Wallet
              final cardIndex = _balanceStore.cards.indexWhere(
                (element) => element.address == walletAddress,
              );
              if (cardIndex != -1) {
                await _walletProtectState.updateModalStatus(isOpened: true);
                await alreadySavedWallet(
                  router.navigatorKey.currentContext!,
                  walletAddress,
                );
                _balanceStore.onCardAdded(walletAddress);
                await _walletProtectState.updateModalStatus(isOpened: false);
              } else {
                await router.push(
                  CardConnectWithNfc(
                    isOldCard: card.possibleOldCard,
                    isMiFareUltralight: isMifareUltralight,
                    isOriginalNxp: false,
                    receivedData: walletAddress,
                    isActivated: card.activated,
                    backup: backupCard?.backup ?? false,
                    hasBackup: card.hasBackup ?? false,
                  ),
                );
              }
            } else {
              //Fake card
              await NfcManager.instance.stopSession();
              Future.delayed(
                Duration.zero,
                () => _walletProtectState.updateModalStatus(isOpened: true),
              );
              await Future.delayed(const Duration(milliseconds: 2700));
              await notCoinplusCardAlert(
                context: router.navigatorKey.currentContext!,
                walletAddress: walletAddress,
                walletType: 'Card',
                source: 'Wallet',
              );
              Future.delayed(
                Duration.zero,
                () => _walletProtectState.updateModalStatus(isOpened: false),
              );
            }
          } else {
            //Connect as TrackerPlus
            final cardIndex = _balanceStore.cards.indexWhere(
              (element) => element.address == walletAddress,
            );
            if (cardIndex != -1) {
              await _walletProtectState.updateModalStatus(isOpened: true);
              await alreadySavedWallet(
                router.navigatorKey.currentContext!,
                walletAddress,
              );
              _balanceStore.onCardAdded(walletAddress);
              await _walletProtectState.updateModalStatus(isOpened: false);
            } else {
              await router.push(
                CardConnectWithNfc(
                  isOldCard: card?.possibleOldCard,
                  isMiFareUltralight: isMifareUltralight,
                  isOriginalNxp: false,
                  receivedData: walletAddress,
                  backup: backupCard?.backup ?? false,
                  hasBackup: card?.hasBackup ?? false,
                  isActivated: card?.activated,
                ),
              );
            }
          }
        } else {
          //Connect as Tracker
          final cardIndex = _balanceStore.cards.indexWhere(
            (element) => element.address == walletAddress,
          );
          if (cardIndex != -1) {
            await _walletProtectState.updateModalStatus(isOpened: true);
            await alreadySavedWallet(
              router.navigatorKey.currentContext!,
              walletAddress,
            );
            _balanceStore.onCardAdded(walletAddress);
            await _walletProtectState.updateModalStatus(isOpened: false);
          } else {
            await router.push(
              CardConnectWithNfc(
                isOriginalNxp: false,
                isMiFareUltralight: false,
                receivedData: walletAddress,
                backup: backupCard?.backup ?? false,
                hasBackup: card?.hasBackup ?? false,
              ),
            );
          }
        }
      }
      await _walletProtectState.updateNfcSessionStatus(isStarted: false);
    },
    onError: (_) => Future(
      () => _walletProtectState.updateNfcSessionStatus(isStarted: false),
    ),
  );
}

Future<void> nfcSessionAndroid({
  bool? isMifareUltralight,
}) async {
  await NfcManager.instance.startSession(
    onDiscovered: (tag) async {
      final ndef = Ndef.from(tag);
      final records = ndef!.cachedMessage!.records;
      dynamic walletAddress;
      dynamic cardColor;
      dynamic formFactor;

      if (records.length >= 2) {
        final hasJson = records[1].payload;
        final payloadString = String.fromCharCodes(hasJson);
        final Map payloadData = await json.decode(payloadString);
        walletAddress = payloadData['a'];
        cardColor = payloadData['c'];
        formFactor = payloadData['t'];
      } else {
        final hasUrl = records[0].payload;
        final payloadString = String.fromCharCodes(hasUrl);
        final parts = payloadString.split('air.coinplus.com/btc/');
        walletAddress = parts[1];
      }
      await _balanceStore.setMainWalletAddress(walletAddress: walletAddress);
      await hasShownWallet().then(
        (hasShown) async {
          if (hasShown) {
            await recordAmplitudeEvent(
              NfcTapped(source: 'Wallet', walletAddress: walletAddress),
            );
          } else {
            await recordAmplitudeEvent(
              NfcTapped(source: 'Onboarding', walletAddress: walletAddress),
            );
          }
        },
      );
      final nfcA = NfcA.from(tag);
      final uid = nfcA!.identifier;

      Uint8List? signature;
      var isOriginalTag = false;

      try {
        final response = await nfcA.transceive(
          data: Uint8List.fromList([0x3C, 0x00]),
        );
        signature = Uint8List.fromList(response);
        if (signature.length > 2) {
          isOriginalTag = OriginalityVerifier().verify(
            uid,
            signature,
          );
        }
      } catch (e) {
        signature = null;
      }
      await router.maybePop();
      final card = await getCardData(walletAddress);
      final formattedTagId = uid
          .map((e) => e.toRadixString(16).padLeft(2, '0'))
          .join(':')
          .toUpperCase();
      if (isOriginalTag && card != null) {
        await NfcManager.instance.stopSession();
        if (card.nfcId == formattedTagId) {
          await Future.delayed(const Duration(milliseconds: 2700));
          if (formFactor == 'c') {
            final cardIndex = _balanceStore.cards.indexWhere(
              (element) => element.address == walletAddress,
            );
            if (cardIndex != -1) {
              await _walletProtectState.updateModalStatus(isOpened: true);
              await alreadySavedWallet(
                router.navigatorKey.currentContext!,
                walletAddress,
              );
              _balanceStore.onCardAdded(walletAddress);
              await _walletProtectState.updateModalStatus(isOpened: false);
            } else {
              await router.push(
                CardConnectWithNfc(
                  isOriginalNxp: isOriginalTag,
                  receivedData: walletAddress,
                  cardColor: cardColor,
                  hasBackup: card.hasBackup ?? false,
                  backup: card.backup ?? false,
                  isActivated: card.activated,
                ),
              );
            }
          } else if (formFactor == 'b') {
            final cardIndex = _balanceStore.bars.indexWhere(
              (element) => element.address == walletAddress,
            );
            if (cardIndex != -1) {
              await _walletProtectState.updateModalStatus(isOpened: true);
              await alreadySavedWallet(
                router.navigatorKey.currentContext!,
                walletAddress,
              );
              _balanceStore.onBarAdded(walletAddress);
              await _walletProtectState.updateModalStatus(isOpened: false);
            } else {
              await router.push(
                BarConnectWithNfc(
                  isOriginalTag: isOriginalTag,
                  receivedData: walletAddress,
                  barColor: cardColor,
                  isActivated: card.activated,
                ),
              );
            }
          }
        } else {
          Future.delayed(
            Duration.zero,
            () => _walletProtectState.updateModalStatus(isOpened: true),
          );
          await notCoinplusCardAlert(
            context: router.navigatorKey.currentContext!,
            walletAddress: walletAddress,
            walletType: 'Card',
            source: 'Wallet',
          );
          Future.delayed(
            Duration.zero,
            () => _walletProtectState.updateModalStatus(isOpened: false),
          );
        }
      } else {
        if (tag.data.containsKey('mifareultralight')) {
          isMifareUltralight = true;
          if (card != null && card.possibleOldCard == true) {
            if (card.nfcId == formattedTagId) {
              final cardIndex = _balanceStore.cards.indexWhere(
                (element) => element.address == walletAddress,
              );
              if (cardIndex != -1) {
                await _walletProtectState.updateModalStatus(isOpened: true);
                await alreadySavedWallet(
                  router.navigatorKey.currentContext!,
                  walletAddress,
                );
                _balanceStore.onCardAdded(walletAddress);
                await _walletProtectState.updateModalStatus(isOpened: false);
              } else {
                await router.push(
                  CardConnectWithNfc(
                    isOldCard: card.possibleOldCard,
                    isMiFareUltralight: isMifareUltralight,
                    isOriginalNxp: false,
                    isActivated: card.activated,
                    receivedData: walletAddress,
                    backup: card.backup ?? false,
                    hasBackup: card.hasBackup ?? false,
                  ),
                );
              }
            } else {
              Future.delayed(
                Duration.zero,
                () => _walletProtectState.updateModalStatus(isOpened: true),
              );
              await notCoinplusCardAlert(
                context: router.navigatorKey.currentContext!,
                walletAddress: walletAddress,
                walletType: 'Card',
                source: 'Wallet',
              );
              Future.delayed(
                Duration.zero,
                () => _walletProtectState.updateModalStatus(isOpened: false),
              );
            }
          } else {
            final cardIndex = _balanceStore.cards.indexWhere(
              (element) => element.address == walletAddress,
            );
            if (cardIndex != -1) {
              await _walletProtectState.updateModalStatus(isOpened: true);
              await alreadySavedWallet(
                router.navigatorKey.currentContext!,
                walletAddress,
              );
              _balanceStore.onCardAdded(walletAddress);
              await _walletProtectState.updateModalStatus(isOpened: false);
            } else {
              await router.push(
                CardConnectWithNfc(
                  isOldCard: card?.possibleOldCard,
                  isMiFareUltralight: isMifareUltralight,
                  isOriginalNxp: false,
                  isActivated: card?.activated,
                  receivedData: walletAddress,
                  backup: card?.backup ?? false,
                  hasBackup: card?.hasBackup ?? false,
                ),
              );
            }
          }
        } else {
          final cardIndex = _balanceStore.cards.indexWhere(
            (element) => element.address == walletAddress,
          );
          if (cardIndex != -1) {
            await _walletProtectState.updateModalStatus(isOpened: true);
            await alreadySavedWallet(
              router.navigatorKey.currentContext!,
              walletAddress,
            );
            _balanceStore.onCardAdded(walletAddress);
            await _walletProtectState.updateModalStatus(isOpened: false);
          } else {
            await router.push(
              CardConnectWithNfc(
                isOriginalNxp: false,
                isMiFareUltralight: false,
                receivedData: walletAddress,
                isActivated: card?.activated,
                backup: card?.backup ?? false,
                hasBackup: card?.hasBackup ?? false,
              ),
            );
          }
        }
      }
      await _walletProtectState.updateNfcSessionStatus(isStarted: false);
    },
    onError: (_) => Future(
      () => _walletProtectState.updateNfcSessionStatus(isStarted: false),
    ),
  );
}

Future<void> connectBackupWalletIos({
  required String mainWalletAddress,
  bool? isMifareUltralight,
  bool isBarList = false,
}) async {
  await _walletProtectState.updateNfcSessionStatus(isStarted: true);
  await NfcManager.instance.startSession(
    alertMessage: isBarList
        ? 'Tap your backup bar on the phone.'
        : 'Tap your backup card on the phone.',
    onDiscovered: (tag) async {
      final ndef = Ndef.from(tag);
      final records = ndef!.cachedMessage?.records;
      dynamic walletAddress;
      dynamic cardColor;
      dynamic isOriginalTag = false;
      if (records!.length >= 2) {
        final hasJson = records[1].payload;
        final payloadString = String.fromCharCodes(hasJson);
        final Map payloadData = await json.decode(payloadString);
        walletAddress = payloadData['a'];
        cardColor = payloadData['c'];
      } else {
        final hasUrl = records[0].payload;
        final payloadString = String.fromCharCodes(hasUrl);
        final parts = payloadString.split('air.coinplus.com/btc/');
        walletAddress = parts[1];
      }
      await hasShownWallet().then(
        (hasShown) async {
          if (hasShown) {
            await recordAmplitudeEvent(
              NfcTapped(source: 'Wallet', walletAddress: walletAddress),
            );
          } else {
            await recordAmplitudeEvent(
              NfcTapped(source: 'Onboarding', walletAddress: walletAddress),
            );
          }
        },
      );
      await signInAnonymously();

      final backupCard = await getBackupCardData(walletAddress);

      final mifare = MiFare.from(tag);
      final tagId = mifare!.identifier;
      final formattedTagId = tagId
          .map((e) => e.toRadixString(16).padLeft(2, '0'))
          .join(':')
          .toUpperCase();
      Uint8List? signature;
      try {
        final response = await mifare.sendMiFareCommand(
          Uint8List.fromList(
            [0x3C, 0x00],
          ),
        );
        signature = Uint8List.fromList(response);
        if (signature.length > 2) {
          isOriginalTag = OriginalityVerifier().verify(
            tagId,
            signature,
          );
        }
      } catch (e) {
        signature = null;
      }
      if (isOriginalTag &&
          backupCard != null &&
          backupCard.nfcId == formattedTagId) {
        await NfcManager.instance.stopSession();
        await Future.delayed(const Duration(milliseconds: 2700));
        if (_balanceStore.cards.isEmpty && backupCard.backup == true) {
          await tappedBackupCard(router.navigatorKey.currentContext!);
        } else {
          await router.push(
            CardConnectWithNfc(
              isOriginalNxp: isOriginalTag,
              receivedData: walletAddress,
              cardColor: cardColor,
              hasBackup: backupCard.hasBackup ?? false,
              backup: backupCard.backup ?? false,
              isActivated: backupCard.activated,
              mainWalletAddress: walletAddress ?? '',
            ),
          );
        }
      } else {
        await NfcManager.instance.stopSession(
          errorMessage: 'Wrong card. Please tap the backup card.',
        );
      }
      await _walletProtectState.updateNfcSessionStatus(isStarted: false);
    },
    onError: (_) => Future(
      () => _walletProtectState.updateNfcSessionStatus(isStarted: false),
    ),
  );
}

Future<void> checkNfcIos({
  required WalletProtectState walletProtectState,
  required BalanceStore balanceStore,
  required AllSettingsState settingsState,
  bool? isMifareUltralight,
}) async {
  await NfcManager.instance.startSession(
    alertMessage: 'Hold your phone near the Coinplus Card.',
    onDiscovered: (tag) async {
      final ndef = Ndef.from(tag);
      final records = ndef!.cachedMessage!.records;
      dynamic walletAddress;
      dynamic isOriginalTag = false;
      if (records.length >= 2) {
        final hasJson = records[1].payload;
        final payloadString = String.fromCharCodes(hasJson);
        final Map payloadData = await json.decode(payloadString);
        walletAddress = payloadData['a'];
      } else {
        final hasUrl = records[0].payload;
        final payloadString = String.fromCharCodes(hasUrl);
        final parts = payloadString.split('air.coinplus.com/btc/');
        walletAddress = parts[1];
      }
      final card = await getCardData(walletAddress);
      final mifare = MiFare.from(tag);
      final tagId = mifare!.identifier;
      final formattedTagId = tagId
          .map((e) => e.toRadixString(16).padLeft(2, '0'))
          .join(':')
          .toUpperCase();
      final signature = await mifare.sendMiFareCommand(
        Uint8List.fromList(
          [0x3C, 0x00],
        ),
      );
      if (signature.length > 2) {
        isOriginalTag = OriginalityVerifier().verify(
          tagId,
          signature,
        );
      }
      final isCardActivated = isCardWalletActivated();
      await recordAmplitudeEventPartTwo(
        VerifyCardTapped(
          walletAddress: walletAddress,
          walletType: card?.type ?? '',
          activated: await isCardActivated,
        ),
      );
      if (isOriginalTag && card != null && card.nfcId == formattedTagId) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await Future.delayed(const Duration(milliseconds: 2500));
        await yourCardIsOriginal(router.navigatorKey.currentContext!);
      } else if (isOriginalTag &&
          card != null &&
          card.nfcId != formattedTagId) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await Future.delayed(const Duration(milliseconds: 2500));
        await setCardsData(
          documentID: walletAddress,
          tagId: formattedTagId,
          type: 'FAKE',
        );
        Future.delayed(
          Duration.zero,
          () => _walletProtectState.updateModalStatus(isOpened: true),
        );
        await notCoinplusCardAlert(
          context: router.navigatorKey.currentContext!,
          walletAddress: walletAddress,
          walletType: 'Card',
          source: 'Wallet',
        );
        Future.delayed(
          Duration.zero,
          () => _walletProtectState.updateModalStatus(isOpened: false),
        );
      } else if (isOriginalTag && card == null) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await Future.delayed(const Duration(milliseconds: 2500));
        await setCardsData(
          documentID: walletAddress,
          tagId: formattedTagId,
          type: 'TRACKER',
        );
        await maybeCoinplusCard(router.navigatorKey.currentContext!);
      } else if (isOriginalTag == false &&
          card != null &&
          card.nfcId == formattedTagId) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await Future.delayed(const Duration(milliseconds: 2500));
        await yourCardIsOriginal(router.navigatorKey.currentContext!);
      } else if (isOriginalTag == false && card == null) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await Future.delayed(const Duration(milliseconds: 2500));
        await setCardsData(
          documentID: walletAddress,
          tagId: formattedTagId,
          type: 'UNKNOWN',
        );
        await maybeCoinplusCard(router.navigatorKey.currentContext!);
      } else if (card == null && !isMifareUltralight!) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await Future.delayed(const Duration(milliseconds: 2500));
        await setCardsData(
          documentID: walletAddress,
          tagId: formattedTagId,
          type: 'TRACKER',
        );
        await maybeCoinplusCard(router.navigatorKey.currentContext!);
      }
      await walletProtectState.updateNfcSessionStatus(isStarted: false);
    },
    onError: (_) => Future(
      () => walletProtectState.updateNfcSessionStatus(isStarted: false),
    ),
  );
}

Future<void> checkNfcAndroid({
  required WalletProtectState walletProtectState,
  required BalanceStore balanceStore,
  required AllSettingsState settingsState,
  bool? isMifareUltralight,
}) async {
  await NfcManager.instance.startSession(
    onDiscovered: (tag) async {
      final ndef = Ndef.from(tag);
      final records = ndef!.cachedMessage!.records;
      dynamic walletAddress;
      dynamic isOriginalTag = false;
      if (records.length >= 2) {
        final hasJson = records[1].payload;
        final payloadString = String.fromCharCodes(hasJson);
        final Map payloadData = await json.decode(payloadString);
        walletAddress = payloadData['a'];
      } else {
        final hasUrl = records[0].payload;
        final payloadString = String.fromCharCodes(hasUrl);
        final parts = payloadString.split('air.coinplus.com/btc/');
        walletAddress = parts[1];
      }
      final nfcA = NfcA.from(tag);
      final uid = nfcA!.identifier;
      final card = await getCardData(walletAddress);
      final formattedTagId = uid
          .map((e) => e.toRadixString(16).padLeft(2, '0'))
          .join(':')
          .toUpperCase();

      Uint8List? signature;

      try {
        final response = await nfcA.transceive(
          data: Uint8List.fromList([0x3C, 0x00]),
        );
        signature = Uint8List.fromList(response);
        if (signature.length > 2) {
          isOriginalTag = OriginalityVerifier().verify(
            uid,
            signature,
          );
        }
      } catch (e) {
        signature = null;
      }
      final isCardActivated = isCardWalletActivated();
      await recordAmplitudeEventPartTwo(
        VerifyCardTapped(
          walletAddress: walletAddress,
          walletType: card?.type ?? '',
          activated: await isCardActivated,
        ),
      );
      if (isOriginalTag && card != null && card.nfcId == formattedTagId) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await router.maybePop();
        await yourCardIsOriginal(router.navigatorKey.currentContext!);
      } else if (isOriginalTag &&
          card != null &&
          card.nfcId != formattedTagId) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await setCardsData(
          documentID: walletAddress,
          tagId: formattedTagId,
          type: 'FAKE',
        );
        await router.maybePop();
        Future.delayed(
          Duration.zero,
          () => _walletProtectState.updateModalStatus(isOpened: true),
        );
        await notCoinplusCardAlert(
          context: router.navigatorKey.currentContext!,
          walletAddress: walletAddress,
          walletType: 'Card',
          source: 'Wallet',
        );
        Future.delayed(
          Duration.zero,
          () => _walletProtectState.updateModalStatus(isOpened: false),
        );
      } else if (isOriginalTag && card == null) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await setCardsData(
          documentID: walletAddress,
          tagId: formattedTagId,
          type: 'TRACKER',
        );
        await router.maybePop();

        await maybeCoinplusCard(router.navigatorKey.currentContext!);
      } else if (isOriginalTag == false &&
          card != null &&
          card.nfcId == formattedTagId) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await router.maybePop();

        await yourCardIsOriginal(router.navigatorKey.currentContext!);
      } else if (isOriginalTag == false && card == null) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await setCardsData(
          documentID: walletAddress,
          tagId: formattedTagId,
          type: 'UNKNOWN',
        );
        await router.maybePop();

        await maybeCoinplusCard(router.navigatorKey.currentContext!);
      } else if (card == null && !isMifareUltralight!) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await setCardsData(
          documentID: walletAddress,
          tagId: formattedTagId,
          type: 'TRACKER',
        );
        await router.maybePop();

        await maybeCoinplusCard(router.navigatorKey.currentContext!);
      }
      await walletProtectState.updateNfcSessionStatus(isStarted: false);
    },
    onError: (_) => Future(
      () => walletProtectState.updateNfcSessionStatus(isStarted: false),
    ),
  );
  await showModalBottomSheet(
    context: router.navigatorKey.currentContext!,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.transparent,
    builder: (context) {
      return AnimatedOpacity(
        duration: const Duration(
          milliseconds: 300,
        ),
        opacity: 1,
        child: Container(
          height: 400,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                40,
              ),
            ),
          ),
          child: Column(
            children: [
              const Gap(10),
              Assets.icons.notch.image(
                height: 4,
              ),
              const Gap(15),
              const Text(
                'Ready to Scan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatSemiBold,
                  fontSize: 22,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const Gap(40),
              SizedBox(
                height: 150,
                width: 150,
                child: Lottie.asset(
                  'assets/lottie_animations/nfcanimation.json',
                ).expandedHorizontally(),
              ),
              const Gap(25),
              const Text(
                'Hold your phone near the Coinplus Card',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: FontFamily.redHatMedium,
                ),
              ).paddingHorizontal(50),
              const Gap(20),
              LoadingButton(
                onPressed: () async {
                  await router.maybePop();
                },
                style: context.theme
                    .buttonStyle(
                      textStyle: const TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        color: AppColors.primaryTextColor,
                        fontSize: 15,
                      ),
                    )
                    .copyWith(
                      backgroundColor: WidgetStateProperty.all(
                        Colors.grey.withOpacity(0.3),
                      ),
                    ),
                child: const Text('Cancel'),
              ).paddingHorizontal(60),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> nfcStop() async {
  await Future.delayed(const Duration(milliseconds: 5000));
  await NfcManager.instance.stopSession();
}
