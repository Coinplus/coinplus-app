import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:nxp_originality_verifier/nxp_originality_verifier.dart';

import '../../../gen/fonts.gen.dart';
import '../../../models/abstract_card/abstract_card.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../alert_dialog/dialog_box_with_action.dart';
import '../../alert_dialog/show_dialog_box.dart';
import '../../send_button_widget/send_page_modals.dart';
import '../not_coinplus_card_alert/not_coinplus_card_alert.dart';

WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

Future<void> recommendedToWaitDialog({
  required BuildContext context,
  required ValueNotifier<bool> isModalOpened,
  required AbstractCard card,
  required bool isBarList,
}) async {
  await showDialogBox(
    context,
    DialogBoxWithAction(
      text:
          'The in-app send option will be available soon. To maintain the highest level of security, we encourage you to wait for the upcoming app update.',
      title: const Text(
        'Recommended to wait',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      primaryActionText: 'Got it',
      primaryAction: () {
        recordAmplitudeEvent(const GotItSendClicked());
        router.maybePop();
      },
      secondaryActionText: 'Send anyway',
      secondaryAction: Platform.isIOS
          ? () async {
              await recordAmplitudeEvent(const SendAnywayClicked());
              await _walletProtectState.updateNfcSessionStatus(
                isStarted: true,
              );
              await router.maybePop();
              await NfcManager.instance.startSession(
                alertMessage:
                    "Please tap your phone on the top of your Bar's box to verify it's legitimacy",
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
                      await NfcManager.instance.stopSession(
                        alertMessage: 'Complete',
                      );
                      await Future.delayed(
                        const Duration(
                          milliseconds: 2500,
                        ),
                      );
                      await router.maybePop();
                      isBarList
                          ? await router.push(
                              BarSecretFillRoute(
                                receivedData: walletAddress.toString(),
                              ),
                            )
                          : await router.push(
                              CardSecretFillRoute(
                                receivedData: walletAddress.toString(),
                              ),
                            );
                    } else {
                      await NfcManager.instance.stopSession();
                      await Future.delayed(
                        const Duration(
                          milliseconds: 2900,
                        ),
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
                    () => showBarTapIssueBottomSheet(
                      isModalOpened: isModalOpened,
                    ),
                  );
                },
              );
            }
          : () async {
              await recordAmplitudeEvent(const SendAnywayClicked());
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
                    if (isOriginalTag) {
                      await router.maybePop();
                      isBarList
                          ? await router.push(
                              BarSecretFillRoute(
                                receivedData: walletAddress.toString(),
                              ),
                            )
                          : await router.push(
                              CardSecretFillRoute(
                                receivedData: walletAddress.toString(),
                              ),
                            );
                    } else {
                      await router.maybePop();
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
                  return Future(() {
                    NfcManager.instance.stopSession();
                    return Future(
                      () => showBarTapIssueBottomSheet(
                        isModalOpened: isModalOpened,
                      ),
                    );
                  });
                },
              );
              await router.maybePop();
              await showAndroidBarNfcBottomSheet(isModalOpened: isModalOpened);
            },
      lottieAsset: 'assets/lottie_animations/please_wait.json',
      lottieHeight: 140,
    ),
    isDismissible: true,
  );
}
