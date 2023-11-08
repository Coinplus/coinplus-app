import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../gen/colors.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../utils/secure_storage_utils.dart';
import '../../utils/storage_utils.dart';

@RoutePage()
class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  final isPinCodeSet = getIsPinCodeSet();

  @override
  void initState() {
    super.initState();
    hasShownWallet().then(
      (hasShown) async {
        if (hasShown) {
          unawaited(
            await isPinCodeSet ? showPinCode() : openWallet(),
          );
        } else {
          await openOnboardingPage();
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Center(
        child: SizedBox(
          height: 56,
          width: double.infinity,
          child: Image.asset('assets/images/coinpluslogo.png'),
        ),
      ),
    );
  }

  Future<void> openOnboardingPage() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    await router.pushAndPopAll(const OnboardingRoute());
  }

  Future<void> showPinCode() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    await router.push(const PinAfterSplash());
  }

  Future<void> openWallet() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    await router.pushAndPopAll(Dashboard());
  }
}

Future<bool> hasShownWallet() async {
  return StorageUtils.getBool();
}

Future<void> setWalletShown() async {
  await StorageUtils.setBool(
    value: true,
  );
}
