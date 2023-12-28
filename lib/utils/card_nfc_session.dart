import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:nxp_originality_verifier/nxp_originality_verifier.dart';

import '../extensions/elevated_button_extensions.dart';
import '../extensions/extensions.dart';
import '../gen/assets.gen.dart';
import '../gen/colors.gen.dart';
import '../gen/fonts.gen.dart';
import '../models/amplitude_event/amplitude_event.dart';
import '../pages/dashboard/maybe_coinplus_card/maybe_coinplus_card.dart';
import '../pages/dashboard/not_coinplus_card_alert/not_coinplus_card_alert.dart';
import '../pages/settings_page/your_card_is_original.dart';
import '../pages/splash_screen/splash_screen.dart';
import '../providers/screen_service.dart';
import '../router.gr.dart';
import '../services/amplitude_service.dart';
import '../services/cloud_firestore_service.dart';
import '../store/balance_store/balance_store.dart';
import '../store/settings_button_state/settings_button_state.dart';
import '../store/wallet_protect_state/wallet_protect_state.dart';
import '../widgets/loading_button.dart';
import 'wallet_activation_status.dart';

Future<void> nfcSessionIos({
  required bool? isMifareUltralight,
  required WalletProtectState walletProtectState,
  bool? isBarList,
}) async {
  await NfcManager.instance.startSession(
    alertMessage: isBarList!
        ? "Please tap your phone on the top of your Bar's box"
        : 'It’s easy! Just hold your phone near the Coinplus Card.',
    onDiscovered: (tag) async {
      final ndef = Ndef.from(tag);
      final records = ndef!.cachedMessage!.records;
      dynamic walletAddress;
      dynamic cardColor;
      dynamic formFactor;
      dynamic isOriginalTag = false;
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
      await hasShownWallet().then(
        (hasShown) async {
          if (hasShown) {
            await recordAmplitudeEvent(NfcTapped(source: 'Wallet', walletAddress: walletAddress));
          } else {
            await recordAmplitudeEvent(NfcTapped(source: 'Onboarding', walletAddress: walletAddress));
          }
        },
      );
      final card = await getCardData(walletAddress);
      final mifare = MiFare.from(tag);
      final tagId = mifare!.identifier;
      final formattedTagId = tagId.map((e) => e.toRadixString(16).padLeft(2, '0')).join(':').toUpperCase();
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
      if (signature!.length > 2) {
        isOriginalTag = OriginalityVerifier().verify(
          tagId,
          signature,
        );
      }
      if (isOriginalTag && card != null) {
        await NfcManager.instance.stopSession();
        if (card.nfcId == formattedTagId) {
          await Future.delayed(const Duration(milliseconds: 2700));
          if (formFactor == 'c') {
            await router.push(
              CardFillWithNfc(
                isOriginalCard: isOriginalTag,
                receivedData: walletAddress,
                cardColor: cardColor,
                isActivated: card.activated,
              ),
            );
          } else if (formFactor == 'b') {
            await router.push(
              BarFillWithNfc(
                isOriginalTag: isOriginalTag,
                receivedData: walletAddress,
                barColor: cardColor,
              ),
            );
          }
        } else {
          await NfcManager.instance.stopSession();
          await Future.delayed(const Duration(milliseconds: 2700));
          await notCoinplusCardAlert(context: router.navigatorKey.currentContext!, walletAddress: walletAddress);
        }
      } else {
        await NfcManager.instance.stopSession();
        await Future.delayed(const Duration(milliseconds: 2700));
        if (tag.data.containsKey('mifare')) {
          isMifareUltralight = true;
          if (card != null && card.possibleOldCard == true) {
            if (card.nfcId == formattedTagId) {
              //Connect as Coinplus Bitcoin Wallet
              await router.push(
                CardFillWithNfc(
                  isOldCard: card.possibleOldCard,
                  isMiFareUltralight: isMifareUltralight,
                  isOriginalCard: false,
                  receivedData: walletAddress,
                  isActivated: card.activated,
                ),
              );
            } else {
              //Fake card
              await NfcManager.instance.stopSession();
              await Future.delayed(const Duration(milliseconds: 2700));
              await notCoinplusCardAlert(context: router.navigatorKey.currentContext!, walletAddress: walletAddress);
            }
          } else {
            //Connect as TrackerPlus
            await router.push(
              CardFillWithNfc(
                isOldCard: card?.possibleOldCard,
                isMiFareUltralight: isMifareUltralight,
                isOriginalCard: false,
                receivedData: walletAddress,
                isActivated: card?.activated,
              ),
            );
          }
        } else {
          //Connect as Tracker
          await router.push(
            CardFillWithNfc(
              isOriginalCard: false,
              isMiFareUltralight: false,
              receivedData: walletAddress,
            ),
          );
        }
      }
      await walletProtectState.updateNfcSessionStatus(isStarted: false);
    },
    onError: (_) => Future(() => walletProtectState.updateNfcSessionStatus(isStarted: false)),
  );
}

Future<void> nfcSessionAndroid({
  required bool? isMifareUltralight,
  required WalletProtectState walletProtectState,
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
      await hasShownWallet().then(
        (hasShown) async {
          if (hasShown) {
            await recordAmplitudeEvent(NfcTapped(source: 'Wallet', walletAddress: walletAddress));
          } else {
            await recordAmplitudeEvent(NfcTapped(source: 'Onboarding', walletAddress: walletAddress));
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
      await router.pop();
      final card = await getCardData(walletAddress);
      final formattedTagId = uid.map((e) => e.toRadixString(16).padLeft(2, '0')).join(':').toUpperCase();
      if (isOriginalTag && card != null) {
        await NfcManager.instance.stopSession();
        if (card.nfcId == formattedTagId) {
          await Future.delayed(const Duration(milliseconds: 2700));
          if (formFactor == 'c') {
            await router.push(
              CardFillWithNfc(
                isOriginalCard: isOriginalTag,
                receivedData: walletAddress,
                cardColor: cardColor,
              ),
            );
          } else if (formFactor == 'b') {
            await router.push(
              BarFillWithNfc(
                isOriginalTag: isOriginalTag,
                receivedData: walletAddress,
                barColor: cardColor,
              ),
            );
          }
        } else {
          await notCoinplusCardAlert(context: router.navigatorKey.currentContext!, walletAddress: walletAddress);
        }
      } else {
        if (tag.data.containsKey('mifareultralight')) {
          isMifareUltralight = true;
          if (card != null && card.possibleOldCard == true) {
            if (card.nfcId == formattedTagId) {
              await router.push(
                CardFillWithNfc(
                  isOldCard: card.possibleOldCard,
                  isMiFareUltralight: isMifareUltralight,
                  isOriginalCard: false,
                  receivedData: walletAddress,
                ),
              );
            } else {
              await notCoinplusCardAlert(context: router.navigatorKey.currentContext!, walletAddress: walletAddress);
            }
          } else {
            await router.push(
              CardFillWithNfc(
                isOldCard: card?.possibleOldCard,
                isMiFareUltralight: isMifareUltralight,
                isOriginalCard: false,
                receivedData: walletAddress,
              ),
            );
          }
        } else {
          await router.push(
            CardFillWithNfc(
              isOriginalCard: false,
              isMiFareUltralight: false,
              receivedData: walletAddress,
            ),
          );
        }
      }
      await walletProtectState.updateNfcSessionStatus(isStarted: false);
    },
    onError: (_) => Future(() => walletProtectState.updateNfcSessionStatus(isStarted: false)),
  );
}

Future<void> checkNfcIos({
  required WalletProtectState walletProtectState,
  required BalanceStore balanceStore,
  required SettingsState settingsState,
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
      final formattedTagId = tagId.map((e) => e.toRadixString(16).padLeft(2, '0')).join(':').toUpperCase();
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
      final isCardActivated = isCardWalletActivated(
        balanceStore: balanceStore,
        settingsState: settingsState,
      );
      await recordAmplitudeEvent(
        VerifyCardTapped(
          walletAddress: walletAddress,
          walletType: card?.type ?? '',
          activated: await isCardActivated,
        ),
      );
      if (isOriginalTag && card != null && card.nfcId == formattedTagId) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await Future.delayed(const Duration(milliseconds: 2500));
        await yourCardIsOriginal(router.navigatorKey.currentContext!, walletProtectState);
      } else if (isOriginalTag && card != null && card.nfcId != formattedTagId) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await Future.delayed(const Duration(milliseconds: 2500));
        await setCardsData(documentID: walletAddress, tagId: formattedTagId, type: 'FAKE');
        await notCoinplusCardAlert(context: router.navigatorKey.currentContext!, walletAddress: walletAddress);
      } else if (isOriginalTag && card == null) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await Future.delayed(const Duration(milliseconds: 2500));
        await setCardsData(documentID: walletAddress, tagId: formattedTagId, type: 'TRACKER');
        await maybeCoinplusCard(router.navigatorKey.currentContext!, walletProtectState);
      } else if (isOriginalTag == false && card != null && card.nfcId == formattedTagId) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await Future.delayed(const Duration(milliseconds: 2500));
        await yourCardIsOriginal(router.navigatorKey.currentContext!, walletProtectState);
      } else if (isOriginalTag == false && card == null) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await Future.delayed(const Duration(milliseconds: 2500));
        await setCardsData(documentID: walletAddress, tagId: formattedTagId, type: 'UNKNOWN');
        await maybeCoinplusCard(router.navigatorKey.currentContext!, walletProtectState);
      } else if (card == null && !isMifareUltralight!) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await Future.delayed(const Duration(milliseconds: 2500));
        await setCardsData(documentID: walletAddress, tagId: formattedTagId, type: 'TRACKER');
        await maybeCoinplusCard(router.navigatorKey.currentContext!, walletProtectState);
      }
      await walletProtectState.updateNfcSessionStatus(isStarted: false);
    },
    onError: (_) => Future(() => walletProtectState.updateNfcSessionStatus(isStarted: false)),
  );
}

Future<void> checkNfcAndroid({
  required WalletProtectState walletProtectState,
  required BalanceStore balanceStore,
  required SettingsState settingsState,
  bool? isMifareUltralight,
}) async {
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
                  'assets/animated_logo/nfcanimation.json',
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
                  await router.pop();
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
                      backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.3)),
                    ),
                child: const Text('Cancel'),
              ).paddingHorizontal(60),
            ],
          ),
        ),
      );
    },
  );
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
      final formattedTagId = uid.map((e) => e.toRadixString(16).padLeft(2, '0')).join(':').toUpperCase();

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
      final isCardActivated = isCardWalletActivated(balanceStore: balanceStore, settingsState: settingsState);
      await recordAmplitudeEvent(
        VerifyCardTapped(
          walletAddress: walletAddress,
          walletType: card?.type ?? '',
          activated: await isCardActivated,
        ),
      );
      if (isOriginalTag && card != null && card.nfcId == formattedTagId) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await router.pop();
        await yourCardIsOriginal(router.navigatorKey.currentContext!, walletProtectState);
      } else if (isOriginalTag && card != null && card.nfcId != formattedTagId) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await setCardsData(documentID: walletAddress, tagId: formattedTagId, type: 'FAKE');
        await router.pop();

        await notCoinplusCardAlert(context: router.navigatorKey.currentContext!, walletAddress: walletAddress);
      } else if (isOriginalTag && card == null) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await setCardsData(documentID: walletAddress, tagId: formattedTagId, type: 'TRACKER');
        await router.pop();

        await maybeCoinplusCard(router.navigatorKey.currentContext!, walletProtectState);
      } else if (isOriginalTag == false && card != null && card.nfcId == formattedTagId) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await router.pop();

        await yourCardIsOriginal(router.navigatorKey.currentContext!, walletProtectState);
      } else if (isOriginalTag == false && card == null) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await setCardsData(documentID: walletAddress, tagId: formattedTagId, type: 'UNKNOWN');
        await router.pop();

        await maybeCoinplusCard(router.navigatorKey.currentContext!, walletProtectState);
      } else if (card == null && !isMifareUltralight!) {
        await NfcManager.instance.stopSession(alertMessage: 'Completed');
        await setCardsData(documentID: walletAddress, tagId: formattedTagId, type: 'TRACKER');
        await router.pop();

        await maybeCoinplusCard(router.navigatorKey.currentContext!, walletProtectState);
      }
      await walletProtectState.updateNfcSessionStatus(isStarted: false);
    },
    onError: (_) => Future(() => walletProtectState.updateNfcSessionStatus(isStarted: false)),
  );
}
