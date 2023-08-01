import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../store/balance_store/balance_store.dart';

class ScanMethodsPage extends StatelessWidget {
  const ScanMethodsPage({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    final _balanceState = BalanceStore();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleTap(
          enableFeedback: false,
          onPressed: () {
            router.pop(context);
            NfcManager.instance.startSession(
              alertMessage:
                  'It’s easy! Hold your phone near the Coinplus Card or on top of your Coinplus Bar’s box',
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

                await NfcManager.instance.stopSession(alertMessage: 'Complete');
                await Future.delayed(const Duration(milliseconds: 2000));

                await router.push(
                  CardFillRoute(receivedData: walletAddress.toString()),
                );

                walletAddress = _balanceState.address;
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
        const Gap(38),
        ScaleTap(
          enableFeedback: false,
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
        const Gap(38),
        ScaleTap(
          onPressed: () {
            controller.animateToPage(
              1,
              duration: const Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          },
          enableFeedback: false,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Fill in manually',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: FontFamily.redHatMedium,
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
