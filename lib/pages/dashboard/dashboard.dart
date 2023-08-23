import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../store/nav_bar_state/nav_bar_state.dart';
import '../send_receive_page/send_receive_page.dart';
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
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          WalletPage(),
          SendAndReceivePage(),
          SettingsPage(),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            thickness: 0,
            indent: 0,
            endIndent: 0,
            color: Colors.grey.withOpacity(0.2),
          ),
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
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        child: Assets.icons.sendReceive.image(
          color: Colors.white,
          height: 32,
        ),
        onPressed: () {},
      ),
    );
  }
}
