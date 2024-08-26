import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:nxp_originality_verifier/nxp_originality_verifier.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/abstract_card/abstract_card.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../pages/send_page/send_to/send_to_state.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../services/amplitude_service.dart';
import '../../../services/cloud_firestore_service.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';

import '../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../widgets/alert_dialog/show_dialog_box.dart';
import '../../widgets/send_button_widget/send_page_modals.dart';
import '../not_coinplus_card_alert/not_coinplus_card_alert.dart';

WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

Future<void> cardRecommendedToWaitDialog({
  required BuildContext context,
  required ValueNotifier<bool> isModalOpened,
  required AbstractCard card,
  required bool isBarList,
  required SendToState state,
}) async {
  await showDialogBox(
    context,
    DialogBoxWithAction(
      text:
          'To send from your card you will need to remove Security Stickers. To maintain the highest level of security, we encourage you to not remove stickers if you don’t need to Send now.',
      title: const Text(
        'Important',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      underTitleWidget: Assets.images.card.cardStickers.image(height: 107),
      primaryActionText: 'I need to Send now',
      primaryAction: Platform.isIOS
          ? () async {
              await recordAmplitudeEvent(const IneedToSendNow());
              await router.maybePop();
              await _walletProtectState.updateNfcSessionStatus(
                isStarted: true,
              );
              await NfcManager.instance.startSession(
                alertMessage:
                    "Please tap your card on the phone to verify it's legitimacy",
                onDiscovered: (tag) async {
                  final ndef = Ndef.from(tag);
                  final records = ndef!.cachedMessage!.records;
                  dynamic walletAddress;
                  dynamic isOriginalTag = false;
                  if (records.length >= 2) {
                    final hasJson = records[1].payload;
                    final payloadString = String.fromCharCodes(
                      hasJson,
                    );
                    final Map payloadData = await json.decode(
                      payloadString,
                    );
                    walletAddress = payloadData['a'];
                  } else {
                    final hasUrl = records[0].payload;
                    final payloadString = String.fromCharCodes(
                      hasUrl,
                    );
                    final parts = payloadString.split(
                      'air.coinplus.com/btc/',
                    );
                    walletAddress = parts[1];
                  }
                  if (card.address == walletAddress) {
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
                    if (isOriginalTag && card != null) {
                      if (formattedTagId == card.nfcId) {
                        await NfcManager.instance.stopSession(
                          alertMessage: 'Complete',
                        );
                        await Future.delayed(
                          const Duration(
                            milliseconds: 2500,
                          ),
                        );
                        await router.maybePop();
                        await router.push(
                          CardActivationRoute(
                            receivedData: walletAddress.toString(),
                            state: state,
                          ),
                        );
                      } else {
                        await NfcManager.instance.stopSession();
                        await Future.delayed(
                          const Duration(milliseconds: 2500),
                        );
                        Future.delayed(
                          Duration.zero,
                          () => isModalOpened.value = true,
                        );
                        await notCoinplusCardAlert(
                          context: router.navigatorKey.currentContext!,
                          walletAddress: walletAddress,
                          walletType: isBarList ? 'Bar' : 'Card',
                          source: 'Wallet',
                        );
                        Future.delayed(
                          Duration.zero,
                          () => isModalOpened.value = false,
                        );
                      }
                    } else {
                      await NfcManager.instance.stopSession();
                      if (card!.possibleOldCard == true &&
                          card.nfcId == formattedTagId) {
                        await Future.delayed(
                          const Duration(
                            milliseconds: 2900,
                          ),
                        );
                        await router.push(
                          CardActivationRoute(
                            receivedData: walletAddress.toString(),
                            state: state,
                          ),
                        );
                      } else {
                        await router.maybePop();
                        await Future.delayed(
                          const Duration(
                            milliseconds: 2900,
                          ),
                          () => isModalOpened.value = true,
                        );
                        await maybeCoinplusCardModal(
                          isModalOpened: isModalOpened,
                        );
                        isModalOpened.value = false;
                      }
                    }
                  } else {
                    await _walletProtectState.updateNfcSessionStatus(
                      isStarted: true,
                    );

                    await NfcManager.instance.stopSession(
                      errorMessage:
                          'You tapped the wrong card. Please check the wallet address of the card.',
                    );
                  }
                },
                onError: (_) {
                  _walletProtectState.updateNfcSessionStatus(
                    isStarted: false,
                  );
                  NfcManager.instance.stopSession();
                  return Future(
                    () => showCardTapIssueBottomSheet(
                      isModalOpened: isModalOpened,
                      state: state,
                    ),
                  );
                },
              );
            }
          : () async {
              await recordAmplitudeEvent(const IneedToSendNow());
              await _walletProtectState.updateNfcSessionStatus(
                isStarted: true,
              );
              await router.maybePop();
              await NfcManager.instance.startSession(
                onDiscovered: (tag) async {
                  final ndef = Ndef.from(tag);
                  final records = ndef!.cachedMessage!.records;
                  dynamic walletAddress;
                  if (records.length >= 2) {
                    final hasJson = records[1].payload;
                    final payloadString = String.fromCharCodes(
                      hasJson,
                    );
                    final Map payloadData = await json.decode(
                      payloadString,
                    );
                    walletAddress = payloadData['a'];
                  } else {
                    final hasUrl = records[0].payload;
                    final payloadString = String.fromCharCodes(
                      hasUrl,
                    );
                    final parts = payloadString.split(
                      'air.coinplus.com/btc/',
                    );
                    walletAddress = parts[1];
                  }
                  if (card.address == walletAddress) {
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
                    final card = await getCardData(walletAddress);
                    final formattedTagId = uid
                        .map((e) => e.toRadixString(16).padLeft(2, '0'))
                        .join(':')
                        .toUpperCase();

                    if (isOriginalTag && card != null) {
                      await router.maybePop();
                      if (card.nfcId == formattedTagId) {
                        await router.push(
                          CardActivationRoute(
                            receivedData: walletAddress,
                            state: state,
                          ),
                        );
                      } else {
                        Future.delayed(
                          Duration.zero,
                          () => isModalOpened.value = true,
                        );
                        await notCoinplusCardAlert(
                          context: router.navigatorKey.currentContext!,
                          walletAddress: walletAddress,
                          walletType: isBarList ? 'Bar' : 'Card',
                          source: 'Wallet',
                        );
                        Future.delayed(
                          Duration.zero,
                          () => isModalOpened.value = false,
                        );
                      }
                    } else {
                      if (card!.possibleOldCard == true &&
                          card.nfcId == formattedTagId) {
                        await router.maybePop();
                        await router.push(
                          CardActivationRoute(
                            receivedData: walletAddress.toString(),
                            state: state,
                          ),
                        );
                      } else {
                        await router.maybePop();
                        Future.delayed(
                          Duration.zero,
                          () => isModalOpened.value = true,
                        );
                        await maybeCoinplusCardModal(
                          isModalOpened: isModalOpened,
                        );
                        isModalOpened.value = false;
                      }
                    }
                  } else {
                    await router.maybePop();
                    await showWrongCardModal(isModalOpened: isModalOpened);
                    await Future.delayed(
                      const Duration(milliseconds: 3000),
                    );
                    await NfcManager.instance.stopSession();
                  }
                  await _walletProtectState.updateNfcSessionStatus(
                    isStarted: false,
                  );
                },
                onError: (_) {
                  _walletProtectState.updateNfcSessionStatus(
                    isStarted: false,
                  );
                  return Future(() async {
                    await NfcManager.instance.stopSession();
                    await Future.delayed(
                      const Duration(milliseconds: 1000),
                    );
                    return Future(
                      () => showCardTapIssueBottomSheet(
                        isModalOpened: isModalOpened,
                        state: state,
                      ),
                    );
                  });
                },
              );
              await router.maybePop();
              await showAndroidCardNfcBottomSheet(
                isModalOpened: isModalOpened,
                state: state,
              );
            },
      secondaryActionText: 'Got it',
      secondaryAction: () {
        recordAmplitudeEvent(const GotItSendClicked());
        router.maybePop();
      },
    ),
    isDismissible: true,
  );
}
