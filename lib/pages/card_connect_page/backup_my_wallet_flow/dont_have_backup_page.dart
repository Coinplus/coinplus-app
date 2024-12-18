import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../extensions/context_extension.dart';
import '../../../extensions/elevated_button_extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../modals/android_nfc_session_modal/android_nfc_session_modal.dart';
import '../../../models/abstract_card/abstract_card.dart';
import '../../../models/amplitude_event/amplitude_event_part_three/amplitude_event_part_three.dart';
import '../../../models/card_model/card_model.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/all_settings_state/all_settings_state.dart';
import '../../../utils/card_nfc_session.dart';
import '../../../widgets/loading_button/loading_button.dart';
import '../../../widgets/send_button_widget/send_button_widget.dart';
import '../../splash_screen/splash_screen.dart';

@RoutePage()
class DontHaveBackupPage extends StatefulWidget {
  const DontHaveBackupPage({
    super.key,
    required this.walletAddress,
    required this.cardColor,
    required this.backupCard,
    required this.mainCard,
  });

  final String walletAddress;
  final String? cardColor;
  final CardModel? backupCard;
  final AbstractCard? mainCard;

  @override
  State<DontHaveBackupPage> createState() => _DontHaveBackupPageState();
}

class _DontHaveBackupPageState extends State<DontHaveBackupPage> {
  final _pageController = PageController();
  final _settingsState = AllSettingsState();

  @override
  void initState() {
    super.initState();
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
        title: Observer(
          builder: (context) {
            return Row(
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: _settingsState.currentPage == 0
                      ? IconButton(
                          splashRadius: 30,
                          splashColor: Colors.transparent,
                          onPressed: () async {
                            await hasShownWallet().then((hasShown) {
                              if (hasShown) {
                                router.popUntilRouteWithName(DashboardRoute.name);
                              } else {
                                router.pushAndPopAll(const WalletProtectionRoute());
                              }
                            });
                          },
                          icon: Assets.icons.close.image(),
                        )
                      : IconButton(
                          splashRadius: 30,
                          splashColor: Colors.transparent,
                          onPressed: () {
                            _pageController.animateToPage(
                              0,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          icon: Assets.icons.arrowBackIos.image(height: 30),
                        ),
                ),
                const Gap(5),
                Text(
                  _settingsState.currentPage == 1 ? 'Your wallet is backed up!' : 'Let’s backup your wallet',
                  style: const TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    color: AppColors.primary,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            );
          },
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
              const Spacer(),
              Lottie.asset(
                widget.cardColor == '0' || widget.cardColor == 'ORANGE' || widget.cardColor == 'CardColor.ORANGE'
                    ? 'assets/lottie_animations/card_twist_orange.json'
                    : widget.cardColor == '1' || widget.cardColor == 'WHITE' || widget.cardColor == 'CardColor.WHITE'
                        ? 'assets/lottie_animations/card_twist_white.json'
                        : widget.cardColor == '2' ||
                                widget.cardColor == 'BLACK' ||
                                widget.cardColor == 'CardColor.BLACK'
                            ? 'assets/lottie_animations/card_twist_black.json'
                            : 'assets/lottie_animations/card_twist_orange.json',
                repeat: false,
              ),
              const Gap(11),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 31),
                child: Text(
                  'Backing up your wallet adds an extra layer of security, allowing you to quickly transfer your funds if the original wallet is lost.',
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
                padding: const EdgeInsets.symmetric(horizontal: 60),
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
                  },
                  child: const Text(
                    'Add a backup card',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              const Gap(14),
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
                      .copyWith(
                        backgroundColor: WidgetStateProperty.all(
                          Colors.grey.withValues(alpha: 0.1),
                        ),
                      ),
                  onPressed: () async {
                    router.popUntilRouteWithName(DashboardRoute.name);
                    await Future.delayed(const Duration(milliseconds: 400));
                    await showSendFromWalletModal(isBarList: false);
                    await recordAmplitudeEventPartThree(DontHaveBackup(walletAddress: widget.walletAddress));
                  },
                  child: const Text(
                    'Don’t have a backup card',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: FontFamily.redHatMedium,
                      fontWeight: FontWeight.normal,
                      color: AppColors.primaryTextColor,
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
                    await router.push(LostMyCardRoute(mainCard: widget.mainCard));
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
