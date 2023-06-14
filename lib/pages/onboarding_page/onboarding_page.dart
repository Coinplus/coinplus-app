import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../custom_widgets/loading_button.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

ValueNotifier<dynamic> result = ValueNotifier(null);
TextEditingController writerController = TextEditingController();

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Column(
          children: [
            const Gap(200),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 20,
                ),
                SizedBox(
                  height: 56,
                  child: Assets.images.coinpluslogo.image(),
                ),
              ],
            ),
            const Gap(62),
            const Text(
              'Hey there,\nlet’s connect your new card',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontFamily: 'RedHatSemiBold',
                color: AppColors.primaryTextColor,
              ),
            ),
            const Gap(39),
            ScaleTap(
              onPressed: _tagRead,
              child: Container(
                height: 72,
                width: 343,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.silver,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Tap the card on the front or back of your\nphone near the top to start',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'RedHatLight',
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      width: 60,
                      child: Lottie.asset(
                        'assets/animated_logo/nfcanimation.json',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Gap(137),
            LoadingButton(
              onPressed: () async {
                final res = await context.pushRoute<String?>(
                  const QrScannerRoute(),
                );
                if (res != null) {
                  await router.push(
                    CardFillRoute(receivedData: res),
                  );
                }
              },
              child: const Text(
                'Scan QR',
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: 'RedHatSemiBold',
                ),
              ),
            ).paddingHorizontal(100),
            const Gap(16),
            const Text(
              'Or',
              style: TextStyle(
                fontFamily: 'RedHatLight',
                fontSize: 13,
                color: AppColors.primary,
              ),
            ),
            const Gap(14),
            ScaleTap(
              onPressed: () => context.pushRoute(
                CardFillRoute(receivedData: ''),
              ),
              child: const Text(
                'fill in manually',
                style: TextStyle(
                  fontFamily: 'RedHatSemiBold',
                  fontSize: 17,
                  color: AppColors.primary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _tagRead() {
    NfcManager.instance.startSession(
      alertMessage: 'Hold your device near the Coinplus card',
      onDiscovered: (tag) async {
        final ndef = Ndef.from(tag);
        final records = ndef!.cachedMessage!.records;
        dynamic payloadString;
        for (var i = 0; i < records.length; i++) {
          final typeString = String.fromCharCodes(records[i].type);
          if (typeString == 'application/json') {
            payloadString =
                json.decode(String.fromCharCodes(records[i].payload));
          }
        }
        final walletAddress = payloadString['a'];
        await NfcManager.instance.stopSession(alertMessage: 'Complete');
        await context.pushRoute(CardFillRoute(receivedData: walletAddress));
      },
    );
  }
}
