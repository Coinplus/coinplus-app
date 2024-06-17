import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../constants/card_record.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../modals/send_receive_modal/send_receive_modal.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../models/amplitude_event/amplitude_event.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../services/amplitude_service.dart';
import '../../store/all_settings_state/all_settings_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/history_page_store/history_page_store.dart';
import '../../store/market_page_store/market_page_store.dart';
import '../../store/nfc_state/nfc_state.dart';
import '../../store/settings_button_state/settings_button_state.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/deep_link_util.dart';
import '../../utils/secure_storage_utils.dart';
import '../../utils/wallet_activation_status.dart';
import '../../widgets/all_alert_dialogs/already_saved_wallet/already_saved_wallet.dart';
import '../../widgets/wallet_connect_methods/bar_connect_methods.dart';
import '../../widgets/wallet_connect_methods/card_connect_methods.dart';
import '../history_page/history_page.dart';
import '../market_page/market_page.dart';
import '../send_page/send_to/send_to_state.dart';
import '../settings_page/settings_page.dart';
import '../splash_screen/background.dart';
import '../wallet_page/wallet_page.dart';
import 'page_controller_manager.dart';

@RoutePage()
class DashboardPage extends HookWidget {
  const DashboardPage({super.key});

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  @override
  Widget build(BuildContext context) {
    final deepLinkRes = useRef<String?>(null);
    final _settingsState = SettingsState();
    final isModalOpened = useState(false);
    final _nfcStore = useMemoized(NfcStore.new);
    final state = useMemoized(SendToState.new);
    final _allSettingsState = useMemoized(AllSettingsState.new);
    final pageController = useMemoized(PageControllerManager.new);
    final isPaused = useState(false);
    final isInactive = useState(false);
    final appLocked = useState(false);
    final resumed = useState(false);
    final _pageController = pageController.pageController;
    final tabController = useTabController(
      initialLength: 2,
      initialIndex: _historyPageStore.tabIndex == 0 ? 0 : 1,
    );

    final currentCard = useRef<CardRecord>(
      (
        card: _balanceStore.cards.firstOrNull as AbstractCard?,
        index: 0,
      ),
    );
    Timer? _timer;

    useOnAppLifecycleStateChange(
      (previous, current) async {
        if (router.current.name != DashboardRoute.name) {
          isPaused.value = false;
          isInactive.value = false;
          return;
        }

        isPaused.value = [AppLifecycleState.paused].contains(current);
        resumed.value = [AppLifecycleState.resumed].contains(current);

        if (!_walletProtectState.isBiometricsRunning) {
          isInactive.value = [AppLifecycleState.inactive].contains(current);
        }
        if (appLocked.value &&
            isInactive.value == true &&
            isModalOpened.value) {
          await router.maybePop();
        }
        if (appLocked.value &&
            isInactive.value == true &&
            _walletProtectState.isModalOpened == true) {
          await router.maybePop();
        }
        appLocked.value = await getIsPinCodeSet();
        if (isPaused.value &&
            router.current.name == DashboardRoute.name &&
            !_walletProtectState.isBiometricsRunning &&
            !_walletProtectState.isLinkOpened) {
          if (appLocked.value) {
            if (router.stackData
                .indexWhere((element) => element.name == PinCodeRoute.name)
                .isNegative) {
              await router.push(const PinCodeRoute());
              isPaused.value = false;
              isInactive.value = false;
              resumed.value = true;
              if (deepLinkRes.value != null) {
                await recordAmplitudeEvent(
                  DeeplinkClicked(
                    source: 'Wallet',
                    walletAddress: deepLinkRes.value!,
                    walletType: 'Card',
                  ),
                );
                final cardExists = _balanceStore.cards.any(
                  (element) => element.address == deepLinkRes.value.toString(),
                );
                if (!cardExists) {
                  await router
                      .push(CardFillRoute(receivedData: deepLinkRes.value));
                  deepLinkRes.value = null;
                } else {
                  Future.delayed(
                    Duration.zero,
                    () async {
                      await alreadySavedWallet(
                        router.navigatorKey.currentContext!,
                        deepLinkRes.toString(),
                      );
                      _balanceStore.onCardAdded(deepLinkRes.value.toString());
                    },
                  );
                }
              }
            }
          }
        }
      },
    );

    useEffect(
      () {
        _nfcStore.checkNfcSupport();
        pageController.setControllers(_pageController);
        _pageController.addListener(() {
          _allSettingsState.updateIndex((_pageController.page ?? 0).ceil());
        });
        final streamSubscription = FlutterBranchSdk.initSession().listen(
          (data) async {
            deepLinkRes.value = onLinkPassed(data);
            if (!appLocked.value &&
                deepLinkRes.value != null &&
                router.current.name != CardFillRoute.name) {
              await recordAmplitudeEvent(
                DeeplinkClicked(
                  source: 'Wallet',
                  walletAddress: deepLinkRes.value!,
                  walletType: 'Card',
                ),
              );
              final cardExists = _balanceStore.cards.any(
                (element) => element.address == deepLinkRes.value.toString(),
              );
              if (!cardExists) {
                await router
                    .push(CardFillRoute(receivedData: deepLinkRes.value));
                deepLinkRes.value = null;
              } else {
                Future.delayed(
                  Duration.zero,
                  () async {
                    await alreadySavedWallet(
                      router.navigatorKey.currentContext!,
                      deepLinkRes.toString(),
                    );
                    _balanceStore.onCardAdded(deepLinkRes.value.toString());
                  },
                );
              }
            } else if (appLocked.value &&
                deepLinkRes.value != null &&
                resumed.value &&
                router.current.name != CardFillRoute.name) {
              await recordAmplitudeEvent(
                DeeplinkClicked(
                  source: 'Wallet',
                  walletAddress: deepLinkRes.value!,
                  walletType: 'Card',
                ),
              );
              final cardExists = _balanceStore.cards.any(
                (element) => element.address == deepLinkRes.value.toString(),
              );
              if (!cardExists) {
                await router
                    .push(CardFillRoute(receivedData: deepLinkRes.value));
                deepLinkRes.value = null;
              } else {
                Future.delayed(
                  Duration.zero,
                  () async {
                    await alreadySavedWallet(
                      router.navigatorKey.currentContext!,
                      deepLinkRes.toString(),
                    );
                    _balanceStore.onCardAdded(deepLinkRes.value.toString());
                  },
                );
              }
            }
          },
        );
        return streamSubscription.cancel;
      },
      [],
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ReactionBuilder(
        builder: (_) =>
            reaction((p0) => _walletProtectState.isBiometricsRunning, (p0) {
          isInactive.value = false;
        }),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ReactionBuilder(
              builder: (context) {
                return reaction((_) => _balanceStore.cards.length, (length) {
                  _pageController.jumpToPage(0);
                  _allSettingsState.updateIndex(0);
                });
              },
              child: ReactionBuilder(
                builder: (context) {
                  return reaction((_) => _balanceStore.bars.length, (length) {
                    _pageController.jumpToPage(0);
                    _allSettingsState.updateIndex(0);
                  });
                },
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    WalletPage(
                      onChangeCard: (val) {
                        currentCard.value = val;
                        _allSettingsState
                          ..updateAddCardPosition(
                            tabIndex: val.index,
                            card: val.card,
                          )
                          ..updateTabIndex(val.index);
                      },
                      pageController: _pageController,
                      allSettingsState: _allSettingsState,
                      state: state,
                    ),
                    const MarketPage(),
                    HistoryPage(
                      onChangeCard: (val) {
                        currentCard.value = val;
                        _allSettingsState.updateTabIndex(val.index);
                      },
                    ),
                    const SettingsPage(),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Divider(
                  thickness: 0.3,
                  endIndent: 1,
                  indent: 0,
                  height: 1,
                  color: Colors.grey.withOpacity(0.4),
                ),
                Theme(
                  data: ThemeData(
                    canvasColor: Colors.white.withOpacity(0.5),
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
                          _allSettingsState.updateIndex(index),
                          if (index == 0)
                            {
                              recordAmplitudeEvent(
                                const WalletTabClicked(),
                              ),
                            }
                          else if (index == 1)
                            {
                              recordAmplitudeEvent(
                                const MarketTabClicked(),
                              ),
                              if (_timer == null || !_timer!.isActive)
                                {
                                  _timer =
                                      Timer(const Duration(seconds: 5), () {
                                    _marketPageStore.onRefresh();
                                  }),
                                },
                            }
                          else if (index == 2)
                            {
                              recordAmplitudeEvent(
                                const HistoryTabClicked(),
                              ),
                            }
                          else if (index == 3)
                            {
                              recordAmplitudeEvent(
                                const SettingsTabClicked(),
                              ),
                            },
                        ],
                        currentIndex: _allSettingsState.currentIndex,
                        backgroundColor: Colors.white,
                        elevation: 0,
                        type: BottomNavigationBarType.fixed,
                        selectedItemColor: Colors.black,
                        unselectedItemColor: const Color(0xFfB8BEC5),
                        items: <BottomNavigationBarItem>[
                          BottomNavigationBarItem(
                            icon: Assets.icons.walletIcon.image(
                              height: 32,
                              color: _allSettingsState.currentIndex == 0
                                  ? Colors.black
                                  : const Color(0xFfB8BEC5),
                            ),
                            label: 'Wallet',
                          ),
                          BottomNavigationBarItem(
                            icon: Padding(
                              padding: const EdgeInsets.only(right: 30, top: 8),
                              child: Assets.icons.market.image(
                                height: 23,
                                color: _allSettingsState.currentIndex == 1
                                    ? Colors.black
                                    : const Color(0xFfB8BEC5),
                              ),
                            ),
                            label: 'Markets            ',
                          ),
                          BottomNavigationBarItem(
                            icon: Padding(
                              padding: const EdgeInsets.only(left: 30, top: 5),
                              child: Assets.icons.history.image(
                                height: 28,
                                color: _allSettingsState.currentIndex == 2
                                    ? Colors.black
                                    : const Color(0xFfB8BEC5),
                              ),
                            ),
                            label: '             History',
                          ),
                          BottomNavigationBarItem(
                            icon: Assets.icons.pageInfo.image(
                              height: 32,
                              color: _allSettingsState.currentIndex == 3
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
                if (_walletProtectState.isBiometricsRunning ||
                    _walletProtectState.isNfcSessionStarted) {
                  return const SizedBox();
                }

                return Visibility(
                  visible: isInactive.value && appLocked.value,
                  child: const Background(),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Builder(
        builder: (_) {
          if (isInactive.value &&
              appLocked.value &&
              !_walletProtectState.isNfcSessionStarted) {
            return const SizedBox();
          }
          return ScaleTap(
            enableFeedback: false,
            onPressed: () async {
              final selectedCard = currentCard.value.card;
              final isBarList = currentCard.value.index == 1;
              final isCardActivated =
                  isCardWalletActivated(balanceStore: _balanceStore);
              final isBarActivated =
                  isBarWalletActivated(balanceStore: _balanceStore);
              if (selectedCard == null || _pageController.page != 0) {
                if (isBarList) {
                  await recordAmplitudeEvent(
                    AddNewPlusClicked(
                      source: _pageController.page == 0
                          ? 'Wallet'
                          : _pageController.page == 1
                              ? 'Market'
                              : _pageController.page == 2
                                  ? 'History'
                                  : 'Settings',
                    ),
                  );
                  isModalOpened.value = true;
                  await showModalBottomSheet(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Assets.icons.notch.image(
                              height: 4,
                            ),
                          ),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 20, top: 10),
                                child: Text(
                                  'Add new wallet',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: FontFamily.redHatBold,
                                    fontSize: 17,
                                    color: AppColors.primaryTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(18),
                          BarScanMethodsPage(
                            isAvailable: _nfcStore,
                          ).paddingHorizontal(20),
                          const Gap(40),
                        ],
                      );
                    },
                  );
                  isModalOpened.value = false;
                } else {
                  await recordAmplitudeEvent(
                    AddNewPlusClicked(
                      source: _pageController.page == 0 ? 'Wallet' : 'Settings',
                    ),
                  );
                  isModalOpened.value = true;
                  await showModalBottomSheet(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12),
                            child: Assets.icons.notch.image(
                              height: 4,
                            ),
                          ),
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 20,
                                  top: 10,
                                ),
                                child: Text(
                                  'Add new wallet',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontFamily: FontFamily.redHatBold,
                                    fontSize: 17,
                                    color: AppColors.primaryTextColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(18),
                          CardScanMethodsPage(
                            isAvailable: _nfcStore,
                          ).paddingHorizontal(20),
                          const Gap(40),
                        ],
                      );
                    },
                  );
                  isModalOpened.value = false;
                }
                return;
              }
              isModalOpened.value = true;
              await sendReceiveButtonModal(
                selectedCard: selectedCard,
                isBarList: isBarList,
                isCardActivated: isCardActivated,
                isBarActivated: isBarActivated,
                currentCard: currentCard,
                isModalOpened: isModalOpened,
                pageController: _pageController,
                settingsState: _settingsState,
                allSettingsState: _allSettingsState,
                tabController: tabController,
                context: context,
                state: state,
              ).then((value) => isModalOpened.value = false);
              isModalOpened.value = false;
              await recordAmplitudeEvent(
                TransactionsButtonClicked(
                  walletType: isBarList ? 'Bar' : 'Card',
                  walletAddress: currentCard.value.card!.address,
                  activated:
                      isBarList ? await isBarActivated : await isCardActivated,
                ),
              );
            },
            child: Observer(
              builder: (context) {
                return FloatingActionButton(
                  shape: const CircleBorder(),
                  elevation: 3,
                  backgroundColor: Colors.deepOrangeAccent.withOpacity(0.9),
                  onPressed: null,
                  child: AnimatedCrossFade(
                    duration: const Duration(milliseconds: 1),
                    crossFadeState: _allSettingsState.tabCurrentIndex == 0
                        ? CrossFadeState.showFirst
                        : CrossFadeState.showSecond,
                    firstChild: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 1),
                      crossFadeState: _allSettingsState.currentIndex != 0
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: AnimatedCrossFade(
                        duration: const Duration(milliseconds: 1),
                        crossFadeState: _allSettingsState.isInAddCard
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        firstChild: _balanceStore.cards.isEmpty
                            ? Assets.icons.plus.image(
                                color: Colors.white,
                                height: 32,
                              )
                            : Assets.icons.sendReceive.image(
                                color: Colors.white,
                                height: 32,
                              ),
                        secondChild: Assets.icons.plus.image(
                          color: Colors.white,
                          height: 32,
                        ),
                      ),
                      secondChild: Assets.icons.plus.image(
                        color: Colors.white,
                        height: 32,
                      ),
                    ),
                    secondChild: AnimatedCrossFade(
                      duration: const Duration(milliseconds: 1),
                      crossFadeState: _allSettingsState.currentIndex != 0
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      firstChild: AnimatedCrossFade(
                        duration: const Duration(milliseconds: 1),
                        crossFadeState: _allSettingsState.isInAddBar
                            ? CrossFadeState.showSecond
                            : CrossFadeState.showFirst,
                        firstChild: _balanceStore.bars.isEmpty
                            ? Assets.icons.plus.image(
                                color: Colors.white,
                                height: 32,
                              )
                            : Assets.icons.sendReceive.image(
                                color: Colors.white,
                                height: 32,
                              ),
                        secondChild: Assets.icons.plus.image(
                          color: Colors.white,
                          height: 32,
                        ),
                      ),
                      secondChild: Assets.icons.plus.image(
                        color: Colors.white,
                        height: 32,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
