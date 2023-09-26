import 'dart:async';
import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../gen/colors.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../utils/btc_validation.dart';
import '../../utils/storage_utils.dart';
import '../custom_pin_code/data/pin_repository.dart';

@RoutePage()
class SplashScreenPage extends HookWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    final streamSubscription = useMemoized(
      () {
        return FlutterBranchSdk.initSession().listen(
          (data) {
            if (data.containsKey('+non_branch_link') &&
                data['+non_branch_link'] != null) {
              final String url = data['+non_branch_link'];
              final splitting = url.split('/');
              final part = splitting[splitting.length - 1];
              if (isValidBTCAddress(part)) {
                router
                  ..pushAndPopAll(const OnboardingRoute())
                  ..push(CardFillRoute(receivedData: part));
              } else {
              router.push(const OnboardingRoute());
              }
            } else {
              hasShownWallet().then(
                (hasShown) {
                  if (hasShown) {
                    openWallet();
                  } else {
                    openOnboardingPage();
                  }
                },
              );
            }
          },
          onError: (error) {
            final platformException = error as PlatformException;
            log(
              '${platformException.code} - ${platformException.message}',
            );
          },
        );
      },
      [],
    );

    useEffect(
      () {
        return streamSubscription.cancel;
      },
      [],
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
    if (await HivePINRepository().isPINSet()) {
      await router.pushAndPopAll(const PinRoute());
    } else {
      await router.pushAndPopAll(const Dashboard());
    }
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
