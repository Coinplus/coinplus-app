import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../store/nav_bar_state/nav_bar_state.dart';
import '../settings_page/settings_page.dart';
import '../wallet_page/wallet_page.dart';

@RoutePage()
class Dashboard extends HookWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final _navBarState = useMemoized(NavBarState.new);
    final _pageController = usePageController();

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
                  return BottomNavigationBar(
                    selectedLabelStyle: const TextStyle(
                      fontSize: 11,
                      fontFamily: FontFamily.redHatMedium,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontSize: 11,
                      fontFamily: FontFamily.redHatMedium,
                    ),
                    onTap: (index) => [
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
                  );
                },
              ),
            ],
          ),
          Positioned(
            bottom: 45,
            child: SizedBox(
              height: 50,
              child: FloatingActionButton(
                backgroundColor: Colors.deepOrangeAccent.withOpacity(0.9),
                onPressed: () {},
                child: Assets.icons.sendReceive.image(
                  color: Colors.white,
                  height: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
