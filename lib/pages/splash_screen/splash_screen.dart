import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../gen/colors.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../store/balance_store/balance_store.dart';
import '../../utils/secure_storage_utils.dart';
import '../../utils/storage_utils.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

class _SplashPageState extends State<SplashPage> {
  final isPinCodeSet = getIsPinCodeSet();

  @override
  void initState() {
    super.initState();
    hasShownWallet().then(
      (hasShown) async {
        if (hasShown) {
          unawaited(_balanceStore.getCardsInfo());
          unawaited(_balanceStore.getCardsInfo());
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
    await router.pushAndPopAll(const DashboardRoute());
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
