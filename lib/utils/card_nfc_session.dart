import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';

import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:nxp_originality_verifier/nxp_originality_verifier.dart';

import '../pages/dashboard/not_coinplus_card_alert/not_coinplus_card_alert.dart';
import '../providers/screen_service.dart';
import '../router.gr.dart';
import '../services/cloud_firestore_service.dart';
import '../store/wallet_protect_state/wallet_protect_state.dart';

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
      if (isOriginalTag && card != null) {
        await NfcManager.instance.stopSession();
        if(card.nfcId == formattedTagId) {
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
        }else {
          await NfcManager.instance.stopSession();
          await Future.delayed(const Duration(milliseconds: 2700));
          await notCoinplusCardAlert(router.navigatorKey.currentContext!);
        }
      }
      else {
        await NfcManager.instance.stopSession();
        await Future.delayed(const Duration(milliseconds: 2700));
        if (tag.data.containsKey('mifare')) {
          isMifareUltralight = true;
          if(card != null && card.possibleOldCard == true) {
            if(card.nfcId == formattedTagId) {
              //Connect as Coinplus Bitcoin Wallet
              await router.push(
                CardFillWithNfc(
                  isOldCard: card.possibleOldCard,
                  isMiFareUltralight: isMifareUltralight,
                  isOriginalCard: false,
                  receivedData: walletAddress,
                ),
              );
            } else {
              //Fake card
              await NfcManager.instance.stopSession();
              await Future.delayed(const Duration(milliseconds: 2700));
              await notCoinplusCardAlert(router.navigatorKey.currentContext!);
            }
          } else {
            //Connect as TrackerPlus
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
        if(card.nfcId == formattedTagId) {
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
        }else {
          await notCoinplusCardAlert(router.navigatorKey.currentContext!);
        }
      } else {
        if (tag.data.containsKey('mifareultralight')) {
          isMifareUltralight = true;
          if(card != null && card.possibleOldCard == true) {
            log(card.nfcId.toString());
            log(formattedTagId.toString());
            if(card.nfcId == formattedTagId) {
              await router.push(
                CardFillWithNfc(
                  isOldCard: card.possibleOldCard,
                  isMiFareUltralight: isMifareUltralight,
                  isOriginalCard: false,
                  receivedData: walletAddress,
                ),
              );
            } else {
              await notCoinplusCardAlert(router.navigatorKey.currentContext!);
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
