import 'dart:convert';
import 'dart:typed_data';

import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:nxp_originality_verifier/nxp_originality_verifier.dart';

import '../providers/screen_service.dart';
import '../router.gr.dart';
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

      final mifare = MiFare.from(tag);
      final tagId = mifare!.identifier;
      final signature = await mifare.sendMiFareCommand(
        Uint8List.fromList(
          [0x3C, 0x00],
        ),
      );
      var isOriginalTag = false;
      if (signature.length > 2) {
        isOriginalTag = OriginalityVerifier().verify(
          tagId,
          signature,
        );
      }
      if (isOriginalTag) {
        await NfcManager.instance.stopSession();
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
        await NfcManager.instance.stopSession();
        await Future.delayed(const Duration(milliseconds: 2700));
        if (tag.data.containsKey('mifare')) {
          isMifareUltralight = true;
          await router.push(
            CardFillWithNfc(
              isMiFareUltralight: isMifareUltralight,
              isOriginalCard: false,
              receivedData: walletAddress,
            ),
          );
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
      if (isOriginalTag) {
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
        if (tag.data.containsKey('mifareultralight')) {
          isMifareUltralight = true;
          await router.push(
            CardFillWithNfc(
              isMiFareUltralight: isMifareUltralight,
              isOriginalCard: isOriginalTag,
              receivedData: walletAddress,
              cardColor: cardColor,
            ),
          );
        } else {
          await router.push(
            CardFillWithNfc(
              isOriginalCard: isOriginalTag,
              isMiFareUltralight: isMifareUltralight,
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
