import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../gen/colors.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../utils/storage_utils.dart';

@RoutePage()
class SplashScreenPage extends HookWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {

    useEffect(
      () {
        hasShownWallet().then(
          (hasShown) {
            if (hasShown) {
              openWallet();
            } else {
              openOnboardingPage();
            }
            return;
          },
        );
        return;
      },
    );
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

  Future<void> openWallet() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    await router.pushAndPopAll(const WalletRoute());
  }
}
Future<bool> hasShownWallet() async {
  return StorageUtils.getBool();

}

Future<void> setWalletShown() async {
  await StorageUtils.setBool( value: true,);
}

