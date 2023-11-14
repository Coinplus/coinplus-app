import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../constants/card_record.dart';
import '../../../extensions/context_extension.dart';
import '../../../extensions/elevated_button_extensions.dart';
import '../../../extensions/widget_extension.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/abstract_card/abstract_card.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../../widgets/loading_button.dart';

class CardScanMethodsPage extends StatefulWidget {
  const CardScanMethodsPage({
    this.onChangeCard,
    this.onCardSelected,
    this.onCarouselScroll,
    super.key,
  });

  final CardChangeCallBack? onChangeCard;
  final ValueChanged<AbstractCard?>? onCardSelected;
  final ValueChanged<int>? onCarouselScroll;

  @override
  State<CardScanMethodsPage> createState() => _CardScanMethodsPageState();
}

class _CardScanMethodsPageState extends State<CardScanMethodsPage> {
  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
                backgroundColor: MaterialStateProperty.all(AppColors.silver),
              ),
          onPressed: Platform.isIOS
              ? () async {
                  _walletProtectState.isNfcSessionStart();
                  await router.pop();
                  await NfcManager.instance.startSession(
                    alertMessage:
                        'It’s easy! Just hold your phone near the Coinplus Card.',
                    onDiscovered: (tag) async {
                      _walletProtectState.isNfcSessionStarted = false;
                      final ndef = Ndef.from(tag);
                      final records = ndef!.cachedMessage!.records;
                      dynamic walletAddress;
                      if (records.length >= 2) {
                        final hasJson = records[1].payload;
                        final payloadString = String.fromCharCodes(hasJson);
                        final Map payloadData =
                            await json.decode(payloadString);
                        walletAddress = payloadData['a'];
                      } else {
                        final hasUrl = records[0].payload;
                        final payloadString = String.fromCharCodes(hasUrl);
                        final parts =
                            payloadString.split('air.coinplus.com/btc/');
                        walletAddress = parts[1];
                      }
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
                    },
                    onError: (_) {
                      return Future(() {
                        _walletProtectState.isNfcSessionStarted = false;
                      });
                    },
                  );
                }
              : () async {
                  _walletProtectState.isNfcSessionStart();
                  await NfcManager.instance.startSession(
                    onDiscovered: (tag) async {
                      final ndef = Ndef.from(tag);
                      final records = ndef!.cachedMessage!.records;
                      dynamic walletAddress;

                      if (records.length >= 2) {
                        final hasJson = records[1].payload;
                        final payloadString = String.fromCharCodes(hasJson);
                        final Map payloadData =
                            await json.decode(payloadString);
                        walletAddress = payloadData['a'];
                      } else {
                        final hasUrl = records[0].payload;
                        final payloadString = String.fromCharCodes(hasUrl);
                        final parts =
                            payloadString.split('air.coinplus.com/btc/');
                        walletAddress = parts[1];
                      }

                      await router.pop();
                      await router.push(
                        CardFillWithNfc(
                          receivedData: walletAddress.toString(),
                        ),
                      );
                    },
                    onError: (_) {
                      return Future(
                        () => _walletProtectState.isNfcSessionStarted = false,
                      );
                    },
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
                        duration: const Duration(milliseconds: 300),
                        opacity: 1,
                        child: Container(
                          height: 400,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              const Gap(10),
                              Row(
                                children: [
                                  const Gap(16),
                                  IconButton(
                                    onPressed: router.pop,
                                    icon: const Icon(
                                      Icons.close_sharp,
                                      size: 25,
                                      color: Colors.black,
                                    ),
                                  ),
                                  const Expanded(
                                    child: Text(
                                      'Start with your wallet',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: FontFamily.redHatSemiBold,
                                        fontSize: 17,
                                        color: AppColors.primaryTextColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 60,
                                  ),
                                ],
                              ),
                              const Gap(10),
                              const Divider(
                                thickness: 2,
                                height: 2,
                                indent: 15,
                                endIndent: 15,
                                color: Color(0xFFF1F1F1),
                              ),
                              const Gap(42),
                              SizedBox(
                                height: 120,
                                width: 120,
                                child: Lottie.asset(
                                  'assets/animated_logo/nfcanimation.json',
                                ).expandedHorizontally(),
                              ),
                              const Gap(20),
                              const Text(
                                'It’s easy! Just hold your phone near the Coinplus Card.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: FontFamily.redHatMedium,
                                ),
                              ),
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
                backgroundColor: MaterialStateProperty.all(AppColors.silver),
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
              Assets.images.qrCode.image(
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
                backgroundColor: MaterialStateProperty.all(AppColors.silver),
              ),
          onPressed: () {
            router
              ..pop()
              ..push(CardFillRoute());
          },
          child: Row(
            children: [
              Assets.images.stylus.image(
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
                backgroundColor: MaterialStateProperty.all(AppColors.silver),
              ),
          onPressed: () async {
            final url = Uri.parse('https://coinplus.com/shop/');
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            }
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
