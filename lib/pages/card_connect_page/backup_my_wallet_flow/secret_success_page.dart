import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../extensions/context_extension.dart';
import '../../../extensions/elevated_button_extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../store/all_settings_state/all_settings_state.dart';
import '../../../utils/card_nfc_session.dart';
import '../../../widgets/loading_button/loading_button.dart';
import '../../splash_screen/splash_screen.dart';

@RoutePage()
class SecretSuccess extends StatefulWidget {
  const SecretSuccess({super.key, required this.walletAddress, this.initialPageIndex});

  final String walletAddress;
  final int? initialPageIndex;

  @override
  State<SecretSuccess> createState() => _SecretSuccessState();
}

class _SecretSuccessState extends State<SecretSuccess> {
  final _pageController = PageController();
  final _settingsState = AllSettingsState();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.initialPageIndex != null) {
        _pageController.jumpToPage(
          widget.initialPageIndex!,
        );
      }
    });
    _pageController.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final page = _pageController.page?.round() ?? 0;
    _settingsState.setPage(page);
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_onPageChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              splashRadius: 30,
              splashColor: Colors.transparent,
              onPressed: () async {
                await hasShownWallet().then((hasShown) async {
                  if (hasShown) {
                    await router.pushAndPopAll(const DashboardRoute());
                  } else {
                    await router.pushAndPopAll(const WalletProtectionRoute());
                  }
                });
              },
              icon: Assets.icons.close.image(),
            ),
            const Gap(5),
            const Text(
              'Let’s backup your wallet',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                color: AppColors.primary,
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: AppColors.primary),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(
                flex: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 108),
                child: Assets.icons.successfullyActivated.image(),
              ),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 31),
                child: Text(
                  'Your wallet is successfully activated',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    color: AppColors.primary,
                    fontSize: 14,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: LoadingButton(
                  style: context.theme
                      .buttonStyle(
                        textStyle: const TextStyle(
                          fontFamily: FontFamily.redHatMedium,
                          color: AppColors.primaryTextColor,
                          fontSize: 15,
                        ),
                      )
                      .copyWith(),
                  onPressed: () async {
                    try {
                      await connectBackupWalletIos(
                        mainWalletAddress: widget.walletAddress,
                        pageController: _pageController,
                      );
                    } catch (e) {
                      log(e.toString());
                    }
                  },
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const Gap(40),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Lottie.asset('assets/lottie_animations/lost_card_animation.json'),
              const Spacer(),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 31),
                child: Text(
                  'Your wallet has been successfully backed up. In case of an emergency, go to the Wallet Settings ⚙️.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    color: AppColors.primary,
                    fontSize: 14,
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64),
                child: LoadingButton(
                  style: context.theme
                      .buttonStyle(
                        textStyle: const TextStyle(
                          fontFamily: FontFamily.redHatMedium,
                          color: AppColors.primaryTextColor,
                          fontSize: 15,
                        ),
                      )
                      .copyWith(),
                  onPressed: () async {
                    await router.pushAndPopAll(const DashboardRoute());
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const Gap(40),
            ],
          ),
        ],
      ),
    );
  }
}
