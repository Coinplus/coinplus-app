import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/nav_bar_state/nav_bar_state.dart';
import '../../store/settings_button_state/settings_button_state.dart';
import '../../utils/btc_validation.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button.dart';
import '../settings_page/settings_page.dart';
import '../wallet_page/wallet_page.dart';

@RoutePage()
class Dashboard extends HookWidget {
  const Dashboard({super.key});

  void useBranchSDK(BuildContext context) {
    useEffect(
      () {
        final streamSubscription = FlutterBranchSdk.initSession().listen(
          (data) {
            if (data.containsKey('+non_branch_link') &&
                data['+non_branch_link'] != null) {
              final String url = data['+non_branch_link'];
              final splitting = url.split('/');
              final part = splitting[splitting.length - 1];
              if (isValidBTCAddress(part)) {
                router.push(CardFillRoute(receivedData: part));
              } else {
                showTopSnackBar(
                  displayDuration: const Duration(milliseconds: 400),
                  Overlay.of(context),
                  CustomSnackBar.success(
                    backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
                    message: 'This is not a valid Coinplus Bitcoin address',
                    textStyle: const TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                );
              }
            }
          },
        );

        return streamSubscription.cancel;
      },
      [],
    );
  }

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  SettingsState get _settingsState => GetIt.instance<SettingsState>();

  @override
  Widget build(BuildContext context) {
    useBranchSDK(context);

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
              Divider(
                thickness: 0.5,
                endIndent: 1,
                indent: 0,
                color: Colors.grey.withOpacity(0.2),
              ),
              Theme(
                data: ThemeData(
                  canvasColor: Colors.white,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: Observer(
                  builder: (context) {
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
                    );
                  },
                ),
              ),
            ],
          ),
          Observer(
            builder: (_) {
              return Positioned(
                bottom: context.height > 667 ? 50 : 20,
                child: SizedBox(
                  height: 50,
                  child: ScaleTap(
                    onPressed: _settingsState.cardCurrentIndex !=
                            _balanceStore.cards.length
                        ? () {
                            showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: Colors.white,
                              context: context,
                              builder: (_) {
                                final card = _balanceStore
                                    .cards[_settingsState.cardCurrentIndex];
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
                                                fontFamily:
                                                    FontFamily.redHatMedium,
                                                color:
                                                    AppColors.primaryTextColor,
                                                fontSize: 15,
                                              ),
                                            )
                                            .copyWith(
                                              padding:
                                                  const MaterialStatePropertyAll(
                                                EdgeInsets.all(10),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                AppColors.silver,
                                              ),
                                            ),
                                        onPressed: () async {
                                          await router.pop(const Dashboard());
                                          await showModalBottomSheet(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            backgroundColor: Colors.white,
                                            isScrollControlled: true,
                                            context: context,
                                            builder: (_) {
                                              return SizedBox(
                                                height: 780,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(15),
                                                  child: Column(
                                                    children: [
                                                      Assets.icons.notch.image(
                                                        height: 4,
                                                      ),
                                                      Row(
                                                        children: [
                                                          IconButton(
                                                            onPressed:
                                                                router.pop,
                                                            icon: Assets
                                                                .icons.close
                                                                .image(),
                                                          ),
                                                          Expanded(
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                const Text(
                                                                  'Receive BTC',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        FontFamily
                                                                            .redHatMedium,
                                                                    fontSize:
                                                                        17,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                  ),
                                                                ),
                                                                const Gap(6),
                                                                Assets.icons
                                                                    .bTCIcon
                                                                    .image(
                                                                  height: 24,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 40,
                                                          ),
                                                        ],
                                                      ),
                                                      const Gap(20),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(14),
                                                          color: const Color(
                                                            0xFFF7F7FA,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                top: 12,
                                                                left: 62,
                                                                right: 62,
                                                                bottom: 17,
                                                              ),
                                                              child:
                                                                  QrImageView(
                                                                data: card
                                                                    .address,
                                                                size: 220,
                                                                gapless: false,
                                                              ),
                                                            ),
                                                            ScaleTap(
                                                              enableFeedback:
                                                                  false,
                                                              onPressed: () {
                                                                Clipboard
                                                                    .setData(
                                                                  ClipboardData(
                                                                    text: card
                                                                        .address
                                                                        .toString(),
                                                                  ),
                                                                ).then(
                                                                  (_) {
                                                                    HapticFeedback
                                                                        .mediumImpact();
                                                                    Overlay.of(context);
                                                                    CustomSnackBar.success(
                                                                    backgroundColor:
                                                                    const Color(0xFF4A4A4A)
                                                                        .withOpacity(0.9),
                                                                    message: 'Address was copied',
                                                                    textStyle: const TextStyle(
                                                                    fontFamily:
                                                                    FontFamily.redHatMedium,
                                                                    fontSize: 14,
                                                                    color: Colors.white,
                                                                    ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  left: 12,
                                                                  right: 12,
                                                                  bottom: 12,
                                                                ),
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                      8,
                                                                    ),
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .only(
                                                                      top: 10,
                                                                      bottom:
                                                                          10,
                                                                    ),
                                                                    child: Row(
                                                                      children: [
                                                                        Assets
                                                                            .icons
                                                                            .contentCopy
                                                                            .image(
                                                                          height:
                                                                              32,
                                                                          color:
                                                                              AppColors.primaryButtonColor,
                                                                        ),
                                                                        const Gap(
                                                                          8,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            const Text(
                                                                              'Your address',
                                                                              style: TextStyle(
                                                                                fontFamily: FontFamily.redHatMedium,
                                                                                fontSize: 16,
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              card.address,
                                                                              style: const TextStyle(
                                                                                fontFamily: FontFamily.redHatMedium,
                                                                                fontSize: 14,
                                                                                color: Color(
                                                                                  0xFF4F6486,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      const Gap(16),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          border: Border.all(
                                                            color: const Color(
                                                              0xFF4A83E0,
                                                            ).withOpacity(
                                                              0.1,
                                                            ),
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(14),
                                                          color: const Color(
                                                            0xFF4A83E0,
                                                          ).withOpacity(0.05),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(14),
                                                          child: Row(
                                                            children: [
                                                              Assets.icons.error
                                                                  .image(
                                                                height: 24,
                                                              ),
                                                              const Gap(10),
                                                              const Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    'Please note',
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .redHatMedium,
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      color:
                                                                          Color(
                                                                        0xFF4F6486,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Gap(4),
                                                                  Text(
                                                                    'This address is exclusively for receiving \nBitcoin. You cannot receive any other \ncryptocurrency to this address.',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .left,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .redHatMedium,
                                                                      fontSize:
                                                                          14,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      color:
                                                                          Color(
                                                                        0xFF4F6486,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      const Gap(140),
                                                      LoadingButton(
                                                        onPressed: () {
                                                          Share.share(
                                                            card.address,
                                                          );
                                                        },
                                                        child: const Text(
                                                          'Share',
                                                          style: TextStyle(
                                                            fontFamily: FontFamily
                                                                .redHatMedium,
                                                          ),
                                                        ),
                                                      ).paddingHorizontal(60),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 8,
                                              ),
                                              child: Assets.icons.receive.image(
                                                height: 24,
                                                width: 24,
                                                color: AppColors
                                                    .primaryButtonColor,
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
                                                    fontFamily:
                                                        FontFamily.redHatMedium,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors
                                                        .primaryTextColor,
                                                  ),
                                                ),
                                                Text(
                                                  'Receive crypto on this address',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily:
                                                        FontFamily.redHatMedium,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: AppColors
                                                        .textHintsColor,
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
                                                fontFamily:
                                                    FontFamily.redHatMedium,
                                                color:
                                                    AppColors.primaryTextColor,
                                                fontSize: 15,
                                              ),
                                            )
                                            .copyWith(
                                              padding:
                                                  const MaterialStatePropertyAll(
                                                EdgeInsets.all(10),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                AppColors.silver,
                                              ),
                                            ),
                                        onPressed: () async {
                                          await router.pop();
                                          await router
                                              .push(CardSecretFillRoute());
                                        },
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 8,
                                              ),
                                              child: Assets.icons.send.image(
                                                height: 24,
                                                width: 24,
                                                color: AppColors
                                                    .primaryButtonColor,
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
                                                    fontFamily:
                                                        FontFamily.redHatMedium,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors
                                                        .primaryTextColor,
                                                  ),
                                                ),
                                                Text(
                                                  'Transfer crypto to another wallet',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily:
                                                        FontFamily.redHatMedium,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: AppColors
                                                        .textHintsColor,
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
                                                fontFamily:
                                                    FontFamily.redHatMedium,
                                                color:
                                                    AppColors.primaryTextColor,
                                                fontSize: 15,
                                              ),
                                            )
                                            .copyWith(
                                              padding:
                                                  const MaterialStatePropertyAll(
                                                EdgeInsets.all(10),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                AppColors.silver,
                                              ),
                                            ),
                                        onPressed: () async {},
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 8,
                                              ),
                                              child: Assets.icons.buy.image(
                                                height: 24,
                                                width: 24,
                                                color: AppColors
                                                    .primaryButtonColor,
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
                                                    fontFamily:
                                                        FontFamily.redHatMedium,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors
                                                        .primaryTextColor,
                                                  ),
                                                ),
                                                Text(
                                                  'Purchase crypto with cash',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily:
                                                        FontFamily.redHatMedium,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: AppColors
                                                        .textHintsColor,
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
                                                fontFamily:
                                                    FontFamily.redHatMedium,
                                                color:
                                                    AppColors.primaryTextColor,
                                                fontSize: 15,
                                              ),
                                            )
                                            .copyWith(
                                              padding:
                                                  const MaterialStatePropertyAll(
                                                EdgeInsets.all(10),
                                              ),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                AppColors.silver,
                                              ),
                                            ),
                                        onPressed: () async {
                                          await router.pop();
                                          final url = Uri.parse(
                                            'https://www.blockchain.com/explorer/addresses/btc/${card.address}',
                                          );
                                          if (await canLaunchUrl(url)) {
                                            await launchUrl(url);
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                right: 8,
                                              ),
                                              child: Assets.icons.history.image(
                                                height: 24,
                                                width: 24,
                                                color: AppColors
                                                    .primaryButtonColor,
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
                                                    fontFamily:
                                                        FontFamily.redHatMedium,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors
                                                        .primaryTextColor,
                                                  ),
                                                ),
                                                Text(
                                                  'Check the list of your transactions',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily:
                                                        FontFamily.redHatMedium,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: AppColors
                                                        .textHintsColor,
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
                          }
                        : () {},
                    child: FloatingActionButton(
                      shape: const CircleBorder(),
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
              );
            },
          ),
        ],
      ),
    );
  }
}
