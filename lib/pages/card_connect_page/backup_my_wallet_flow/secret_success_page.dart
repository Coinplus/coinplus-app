import 'dart:developer';
import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

import '../../../extensions/context_extension.dart';
import '../../../extensions/elevated_button_extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../modals/android_nfc_session_modal/android_nfc_session_modal.dart';
import '../../../models/abstract_card/abstract_card.dart';
import '../../../models/amplitude_event/amplitude_event_part_three/amplitude_event_part_three.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/all_settings_state/all_settings_state.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../utils/card_nfc_session.dart';
import '../../../widgets/loading_button/loading_button.dart';
import '../../splash_screen/splash_screen.dart';

@RoutePage()
class SecretSuccess extends StatefulWidget {
  const SecretSuccess({super.key, required this.walletAddress, this.initialPageIndex, this.isFromLostCardPage});

  final String walletAddress;
  final int? initialPageIndex;
  final bool? isFromLostCardPage;

  @override
  State<SecretSuccess> createState() => _SecretSuccessState();
}

BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

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
                await recordAmplitudeEventPartThree(CloseBackup(walletAddress: widget.walletAddress));
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
            Observer(
              builder: (context) {
                return Text(
                  _settingsState.currentPage == 1 ? 'Your wallet is backed up!' : 'Let’s backup your wallet',
                  style: const TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    color: AppColors.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                );
              },
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
              const Spacer(flex: 2),
              SizedBox(
                height: 200,
                child: Lottie.asset('assets/lottie_animations/secrets_success.json', repeat: false),
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
                      if (Platform.isIOS) {
                        await connectBackupWalletIos(
                          mainWalletAddress: widget.walletAddress,
                          pageController: _pageController,
                        );
                      } else {
                        await connectBackupWalletAndroid(
                          mainWalletAddress: widget.walletAddress,
                          pageController: _pageController,
                        );
                        await showModalBottomSheet(
                          context: router.navigatorKey.currentContext!,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          backgroundColor: Colors.transparent,
                          builder: (context) {
                            return const AndroidNfcSessionModal();
                          },
                        );
                      }
                    } catch (e) {
                      log(e.toString());
                    }
                    await recordAmplitudeEventPartThree(
                      BackupActivationNextClicked(walletAddress: widget.walletAddress),
                    );
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
                    await recordAmplitudeEventPartThree(BackupDone(walletAddress: widget.walletAddress));
                    final mainCard = _balanceStore.cards.firstWhereOrNull(
                      (card) => card.address == widget.walletAddress,
                    );
                    if (widget.isFromLostCardPage == true) {
                      await router.push(LostMyCardRoute(mainCard: mainCard! as AbstractCard));
                    } else {
                      await router.pushAndPopAll(const DashboardRoute());
                    }
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
