import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:nxp_originality_verifier/nxp_originality_verifier.dart';

import '../../../extensions/context_extension.dart';
import '../../../extensions/elevated_button_extensions.dart';
import '../../../extensions/widget_extension.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../store/nfc_state/nfc_state.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../../widgets/loading_button.dart';

class CardScanMethodsPage extends HookWidget {
  const CardScanMethodsPage({
    super.key,
    this.isAvailable,
  });

  final NfcStore? isAvailable;

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isAvailable!.isNfcSupported)
          LoadingButton(
            style: context.theme
                .buttonStyle(
                  textStyle: const TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    color: AppColors.primaryTextColor,
                    fontSize: 15,
                  ),
                )
                .copyWith(
                  backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
                ),
            onPressed: Platform.isIOS
                ? () async {
                    await _walletProtectState.updateNfcSessionStatus(isStarted: true);
                    await router.pop();
                    await NfcManager.instance.startSession(
                      alertMessage: 'It’s easy! Just hold your phone near the Coinplus Card.',
                      onDiscovered: (tag) async {
                        final ndef = Ndef.from(tag);
                        final records = ndef!.cachedMessage!.records;
                        dynamic walletAddress;
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
                          await router.push(
                            CardFillWithNfc(
                              receivedData: walletAddress,
                            ),
                          );
                        } else {
                          await NfcManager.instance.stopSession();
                          await router.pop();
                          await Future.delayed(
                            const Duration(
                              milliseconds: 2500,
                            ),
                          );
                          await router.push(
                            CardFillWithNfc(
                              receivedData: walletAddress,
                            ),
                          );
                        }
                        await _walletProtectState.updateNfcSessionStatus(isStarted: false);
                      },
                      onError: (_) => Future(() => _walletProtectState.updateNfcSessionStatus(isStarted: false)),
                    );
                  }
                : () async {
                    await _walletProtectState.updateNfcSessionStatus(isStarted: true);
                    await NfcManager.instance.startSession(
                      onDiscovered: (tag) async {
                        final ndef = Ndef.from(tag);
                        final records = ndef!.cachedMessage!.records;
                        dynamic walletAddress;

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

                        await router.pop();
                        await router.push(
                          CardFillWithNfc(
                            receivedData: walletAddress.toString(),
                          ),
                        );
                        await _walletProtectState.updateNfcSessionStatus(isStarted: false);
                      },
                      onError: (_) => Future(() => _walletProtectState.updateNfcSessionStatus(isStarted: false)),
                    );
                    await router.pop();

                    await showModalBottomSheet(
                      context: context,
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
                                  'It’s easy! Hold your phone near the Coinplus Card \nor on top of your Coinplus Bar’s box',
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
                  },
            child: Row(
              children: [
                Assets.icons.nfcIcon.image(
                  height: 24,
                  width: 24,
                  color: AppColors.primaryButtonColor,
                ),
                const Gap(8),
                const Text(
                  'Tap to connect',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: FontFamily.redHatMedium,
                    fontWeight: FontWeight.normal,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        const Gap(8),
        LoadingButton(
          style: context.theme
              .buttonStyle(
                textStyle: const TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  color: AppColors.primaryTextColor,
                  fontSize: 15,
                ),
              )
              .copyWith(
                backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
              ),
          onPressed: () async {
            await router.pop(context);
            final res = await context.pushRoute<String?>(
              const QrScannerRoute(),
            );
            if (res != null) {
              await router.push(
                CardFillRoute(receivedData: res),
              );
            }
          },
          child: Row(
            children: [
              Assets.icons.qrCode.image(
                height: 24,
                width: 24,
                color: AppColors.primaryButtonColor,
              ),
              const Gap(8),
              const Text(
                'Connect with QR',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ],
          ),
        ),
        const Gap(8),
        LoadingButton(
          style: context.theme
              .buttonStyle(
                textStyle: const TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  color: AppColors.primaryTextColor,
                  fontSize: 15,
                ),
              )
              .copyWith(
                backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
              ),
          onPressed: () {
            router
              ..pop()
              ..push(CardFillRoute());
          },
          child: Row(
            children: [
              Assets.icons.stylus.image(
                height: 24,
                width: 24,
                color: AppColors.primaryButtonColor,
              ),
              const Gap(8),
              const Text(
                'Connect manually',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ],
          ),
        ),
        const Gap(8),
        LoadingButton(
          style: context.theme
              .buttonStyle(
                textStyle: const TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  color: AppColors.primaryTextColor,
                  fontSize: 15,
                ),
              )
              .copyWith(
                backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
              ),
          onPressed: () async {
            await FlutterWebBrowser.openWebPage(
              url: 'https://coinplus.com/shop/',
              customTabsOptions: const CustomTabsOptions(
                shareState: CustomTabsShareState.on,
                instantAppsEnabled: true,
                showTitle: true,
                urlBarHidingEnabled: true,
              ),
              safariVCOptions: const SafariViewControllerOptions(
                barCollapsingEnabled: true,
                modalPresentationStyle: UIModalPresentationStyle.formSheet,
                dismissButtonStyle: SafariViewControllerDismissButtonStyle.done,
                modalPresentationCapturesStatusBarAppearance: true,
              ),
            );
          },
          child: Row(
            children: [
              Assets.icons.shop.image(
                height: 24,
                width: 24,
                color: AppColors.primaryButtonColor,
              ),
              const Gap(8),
              const Text(
                'Buy new card',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
