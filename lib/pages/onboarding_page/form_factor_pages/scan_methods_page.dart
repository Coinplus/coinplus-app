import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../../extensions/widget_extension.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';

class ScanMethodsPage extends StatelessWidget {
  const ScanMethodsPage({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.grey.withOpacity(0.5),
            backgroundColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            shape: const RoundedRectangleBorder(),
          ),
          onPressed: Platform.isIOS
              ? () async {
                  await router.pop();
                  await NfcManager.instance.startSession(
                    alertMessage:
                        'It’s easy! Hold your phone near the Coinplus Card or on top of your Coinplus Bar’s box',
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

                      await NfcManager.instance
                          .stopSession(alertMessage: 'Complete');
                      await Future.delayed(const Duration(milliseconds: 2500));

                      await router.push(
                        CardFillRoute(receivedData: walletAddress.toString()),
                      );
                    },
                  );
                }
              : () async {
                  await router.pop();
                  await showModalBottomSheet(
                    context: context,
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
                                'It’s easy! Hold your phone near the Coinplus Card \nor on top of your Coinplus Bar’s box',
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
                      await NfcManager.instance.stopSession();
                      await Future.delayed(const Duration(milliseconds: 2500));

                      await router.push(
                        CardFillRoute(receivedData: walletAddress.toString()),
                      );
                    },
                  );
                },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Try with NFC',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const Gap(16),
              Assets.images.contactless.image(
                height: 24,
                width: 24,
              ),
            ],
          ),
        ),
        const Gap(10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.grey.withOpacity(0.5),
            backgroundColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            shape: const RoundedRectangleBorder(),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Try with QR scan',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const Gap(16),
              Assets.images.qrCode.image(
                height: 24,
                width: 24,
              ),
            ],
          ),
        ),
        const Gap(10),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.grey.withOpacity(0.5),
            backgroundColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            shape: const RoundedRectangleBorder(),
          ),
          onPressed: () {
            controller.animateToPage(
              1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Fill in manually',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const Gap(16),
              Assets.images.stylus.image(
                height: 24,
                width: 24,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
