import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';

import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../store/nav_bar_state/nav_bar_state.dart';
import '../../widgets/loading_button.dart';
import '../custom_pin_code/data/pin_repository.dart';
import '../settings_page/settings_page.dart';
import '../wallet_page/wallet_page.dart';

@RoutePage()
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (WidgetsBinding.instance.lifecycleState == AppLifecycleState.paused) {
        showPasscodePageIfNeeded();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      showPasscodePageIfNeeded();
    }
  }

  Future<void> showPasscodePageIfNeeded() async {
    if (await HivePINRepository().isPINSet()) {
      await router.push(const PinRoute());
    }
  }

  @override
  Widget build(BuildContext context) {
    final _navBarState = NavBarState();
    final _pageController = PageController();

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: const [
              WalletPage(),
              SettingsPage(),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Observer(
                builder: (_) {
                  return Theme(
                    data: ThemeData(
                      canvasColor: Colors.white,
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                    child: BottomNavigationBar(
                      selectedLabelStyle: const TextStyle(
                        fontSize: 11,
                        fontFamily: FontFamily.redHatMedium,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 11,
                        fontFamily: FontFamily.redHatMedium,
                      ),
                      onTap: (index) => [
                        HapticFeedback.lightImpact(),
                        _pageController.jumpToPage(
                          index,
                        ),
                        _navBarState.updateIndex(index),
                      ],
                      currentIndex: _navBarState.currentIndex,
                      elevation: 0,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.black,
                      unselectedItemColor: const Color(0xFfB8BEC5),
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Assets.icons.walletIcon.image(
                            height: 32,
                            color: _navBarState.currentIndex == 0
                                ? Colors.black
                                : const Color(0xFfB8BEC5),
                          ),
                          label: 'Wallet',
                        ),
                        BottomNavigationBarItem(
                          icon: Assets.icons.pageInfo.image(
                            height: 32,
                            color: _navBarState.currentIndex == 1
                                ? Colors.black
                                : const Color(0xFfB8BEC5),
                          ),
                          label: 'Settings',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          Positioned(
            bottom: context.height > 667 ? 40 : 20,
            child: SizedBox(
              height: 50,
              child: ScaleTap(
                onPressed: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.icons.notch.image(width: 42),
                            const Gap(18),
                            LoadingButton(
                              style: context.theme
                                  .buttonStyle(
                                    textStyle: const TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      color: AppColors.primaryTextColor,
                                      fontSize: 15,
                                    ),
                                  )
                                  .copyWith(
                                    padding: const MaterialStatePropertyAll(
                                      EdgeInsets.all(10),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      AppColors.silver,
                                    ),
                                  ),
                              onPressed: () async {},
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Assets.icons.receive.image(
                                      height: 24,
                                      width: 24,
                                      color: AppColors.primaryButtonColor,
                                    ),
                                  ),
                                  const Gap(8),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Receive',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: FontFamily.redHatMedium,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primaryTextColor,
                                        ),
                                      ),
                                      Text(
                                        'Receive crypto on this address',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: FontFamily.redHatMedium,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.textHintsColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Gap(8),
                            LoadingButton(
                              style: context.theme
                                  .buttonStyle(
                                    textStyle: const TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      color: AppColors.primaryTextColor,
                                      fontSize: 15,
                                    ),
                                  )
                                  .copyWith(
                                    padding: const MaterialStatePropertyAll(
                                      EdgeInsets.all(10),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      AppColors.silver,
                                    ),
                                  ),
                              onPressed: () async {},
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Assets.icons.send.image(
                                      height: 24,
                                      width: 24,
                                      color: AppColors.primaryButtonColor,
                                    ),
                                  ),
                                  const Gap(8),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Send',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: FontFamily.redHatMedium,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primaryTextColor,
                                        ),
                                      ),
                                      Text(
                                        'Transfer crypto to another wallet',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: FontFamily.redHatMedium,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.textHintsColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Gap(8),
                            LoadingButton(
                              style: context.theme
                                  .buttonStyle(
                                    textStyle: const TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      color: AppColors.primaryTextColor,
                                      fontSize: 15,
                                    ),
                                  )
                                  .copyWith(
                                    padding: const MaterialStatePropertyAll(
                                      EdgeInsets.all(10),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      AppColors.silver,
                                    ),
                                  ),
                              onPressed: () async {},
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Assets.icons.buy.image(
                                      height: 24,
                                      width: 24,
                                      color: AppColors.primaryButtonColor,
                                    ),
                                  ),
                                  const Gap(8),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Buy with card',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: FontFamily.redHatMedium,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primaryTextColor,
                                        ),
                                      ),
                                      Text(
                                        'Purchase crypto with cash',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: FontFamily.redHatMedium,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.textHintsColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Gap(8),
                            LoadingButton(
                              style: context.theme
                                  .buttonStyle(
                                    textStyle: const TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      color: AppColors.primaryTextColor,
                                      fontSize: 15,
                                    ),
                                  )
                                  .copyWith(
                                    padding: const MaterialStatePropertyAll(
                                      EdgeInsets.all(10),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      AppColors.silver,
                                    ),
                                  ),
                              onPressed: () async {},
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Assets.icons.history.image(
                                      height: 24,
                                      width: 24,
                                      color: AppColors.primaryButtonColor,
                                    ),
                                  ),
                                  const Gap(8),
                                  const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'History',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontFamily: FontFamily.redHatMedium,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primaryTextColor,
                                        ),
                                      ),
                                      Text(
                                        'Check the list of your transactions',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: FontFamily.redHatMedium,
                                          fontWeight: FontWeight.normal,
                                          color: AppColors.textHintsColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const Gap(30),
                          ],
                        ),
                      );
                    },
                  );
                },
                //splashFactory: NoSplash.splashFactory,
                child: FloatingActionButton(
                  elevation: 3,
                  backgroundColor: Colors.deepOrangeAccent.withOpacity(0.9),
                  onPressed: null,
                  child: Assets.icons.sendReceive.image(
                    color: Colors.white,
                    height: 32,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
