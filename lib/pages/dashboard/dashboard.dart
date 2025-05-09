import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gaimon/gaimon.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../all_alert_dialogs/already_saved_wallet/already_saved_wallet.dart';
import '../../constants/card_record.dart';
import '../../extensions/context_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../modals/already_used_backup_card_modal/already_used_backup_card_modal.dart';
import '../../modals/buy_bitcoin_modal/buy_bitcoin_modal.dart';
import '../../modals/card_blocked_modal/card_blocked_modal.dart';
import '../../modals/primary_card_selection_modal/primary_card_selection_modal.dart';
import '../../modals/send_receive_modal/send_receive_modal.dart';
import '../../modals/tapped_backup_card_modal/tapped_backup_card_modal.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../models/amplitude_event/amplitude_event_part_one/amplitude_event.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../services/amplitude_service.dart';
import '../../services/cloud_firestore_service.dart';
import '../../services/ramp_service.dart';
import '../../store/all_settings_state/all_settings_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/history_page_store/history_page_store.dart';
import '../../store/market_page_store/market_page_store.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/deep_link_util.dart';
import '../../utils/page_controller_manager.dart';
import '../../utils/secure_storage_utils.dart';
import '../../utils/wallet_activation_status.dart';
import '../../widgets/send_receive_action_button/send_receive_action_button.dart';
import '../history_page/history_page.dart';
import '../market_page/market_page.dart';
import '../settings_page/settings_page.dart';
import '../splash_screen/background.dart';
import '../wallet_page/wallet_page.dart';

@RoutePage()
class DashboardPage extends HookWidget {
  const DashboardPage({super.key});

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  RampService get _rampService => GetIt.I<RampService>();

  @override
  Widget build(BuildContext context) {
    final deepLinkRes = useRef<String?>(null);
    final cardColorRes = useRef<String?>(null);
    final _settingsState = AllSettingsState();
    final isModalOpened = useState(false);
    final currentIndex = useState(0);
    final _nfcStore = useMemoized(AllSettingsState.new);
    final _allSettingsState = useMemoized(AllSettingsState.new);
    final pageController = useMemoized(PageControllerManager.new);
    final isPaused = useState(false);
    final isInactive = useState(false);
    final appLocked = useState(false);
    final resumed = useState(false);
    final _pageController = pageController.pageController;
    final _secureStorage = SecureStorageService();
    final tabController = useTabController(
      initialLength: 2,
      initialIndex: _historyPageStore.tabIndex == 0 ? 0 : 1,
    );
    final scrollController = useScrollController();

    final currentCard = useRef<CardRecord>(
      (
        card: _balanceStore.cards.isNotEmpty
            ? _balanceStore.cards.firstOrNull as AbstractCard?
            : _balanceStore.ethCards.isNotEmpty
                ? _balanceStore.ethCards.firstOrNull as AbstractCard?
                : null,
        index: 0,
      ),
    );

    Future<void> openModalBottomSheet() async {
      await recordAmplitudeEventPartTwo(const BuyBitcoinShown());
      await showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        context: context,
        builder: (_) {
          return const BuyBitcoinModal();
        },
      );
    }

    Future<void> initModalState() async {
      final prefs = await SharedPreferences.getInstance();
      final packageInfo = await PackageInfo.fromPlatform();
      await FirebaseMessaging.instance.getInitialMessage().then((message) async {
        if (message != null && message.data['screen'] == 'buy_bitcoin') {
          await Future.delayed(const Duration(milliseconds: 1000));
          if (context.height > 600) {
            await openModalBottomSheet();
          }
        }
      });

      FirebaseMessaging.onMessageOpenedApp.listen((message) async {
        if (message.data['screen'] == 'buy_bitcoin') {
          await Future.delayed(const Duration(milliseconds: 1000));
          if (appLocked.value) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              openModalBottomSheet();
            });
          } else if (!_walletProtectState.isModalOpened) {
            await openModalBottomSheet();
          }
        }
      });

      if (prefs.getBool('show_modal') == true || prefs.getString('package_info') != packageInfo.version.toString()) {
        await Future.delayed(const Duration(milliseconds: 600));
        await openModalBottomSheet();
        await prefs.setBool('show_modal', false);
        await prefs.setString('package_info', packageInfo.version.toString());
      }
    }

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
        if (appLocked.value && isInactive.value == true && isModalOpened.value) {
          await router.maybePop();
        }
        if (appLocked.value && isInactive.value == true && _walletProtectState.isModalOpened == true) {
          await router.maybePop();
        }
        appLocked.value = await _secureStorage.getIsPinCodeSet();

        if (isPaused.value &&
            router.current.name == DashboardRoute.name &&
            !_walletProtectState.isBiometricsRunning &&
            !_walletProtectState.isLinkOpened) {
          if (appLocked.value) {
            if (router.stackData.indexWhere((element) => element.name == PinCodeRoute.name).isNegative) {
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
                final cardDataFromDb = await getCardData(deepLinkRes.value.toString());
                final cardType = cardDataFromDb?.type ?? '';
                cardColorRes.value = cardDataFromDb?.color ?? '';
                final cardExists = _balanceStore.cards.any(
                  (element) => element.address == deepLinkRes.value.toString(),
                );
                if (!cardExists) {
                  if (cardDataFromDb?.lost != null && cardDataFromDb?.lost == true) {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      context: router.navigatorKey.currentContext!,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            20,
                          ),
                          topRight: Radius.circular(
                            20,
                          ),
                        ),
                      ),
                      builder: (context) {
                        return const CardBlockedModal();
                      },
                    );
                  } else {
                    if (cardDataFromDb?.backup != null &&
                        cardDataFromDb?.backup == true &&
                        _balanceStore.cards.isEmpty) {
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        context: router.navigatorKey.currentContext!,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(
                              20,
                            ),
                            topRight: Radius.circular(
                              20,
                            ),
                          ),
                        ),
                        builder: (context) {
                          return const BackupCardTapped();
                        },
                      );
                    } else if (cardDataFromDb?.backup != null &&
                        cardDataFromDb?.backup == true &&
                        _balanceStore.cards.isNotEmpty) {
                      if (cardDataFromDb?.backup != null &&
                          cardDataFromDb?.backup == true &&
                          _balanceStore.cards.isNotEmpty) {
                        await showModalBottomSheet(
                          isScrollControlled: true,
                          context: router.navigatorKey.currentContext!,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                20,
                              ),
                              topRight: Radius.circular(
                                20,
                              ),
                            ),
                          ),
                          builder: (context) {
                            return PrimaryCardSelectionModal(
                              backupWalletAddress: deepLinkRes.value ?? '',
                            );
                          },
                        );
                      }
                    } else {
                      if (cardType != 'BAR') {
                        await router.push(
                          CardConnectWithNfc(
                            receivedData: deepLinkRes.value,
                            cardColor: cardColorRes.value,
                            backupPack: cardDataFromDb?.backupPack ?? false,
                            backup: cardDataFromDb?.backup ?? false,
                            isOriginalNxp: true,
                            isActivated: cardDataFromDb?.activated,
                          ),
                        );
                      } else {
                        await router.push(
                          BarConnectWithNfc(
                            receivedData: deepLinkRes.value,
                            isActivated: cardDataFromDb?.activated ?? false,
                          ),
                        );
                      }
                    }

                    deepLinkRes.value = null;
                  }
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
        final streamSubscription = FlutterBranchSdk.listSession().listen(
          (data) async {
            deepLinkRes.value = onLinkPassed(data);
            final cardDataFromDb = await getCardData(deepLinkRes.value.toString());

            final backedUp = _balanceStore.backupCards.any(
              (element) => element.address == deepLinkRes.value.toString(),
            );
            if (backedUp) {
              await showModalBottomSheet(
                isScrollControlled: true,
                context: router.navigatorKey.currentContext!,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      20,
                    ),
                    topRight: Radius.circular(
                      20,
                    ),
                  ),
                ),
                builder: (context) {
                  return const AlreadyUsedBackupModal(walletAddress: '', pageController: null);
                },
              );
              return;
            }
            final cardType = cardDataFromDb?.type ?? '';

            cardColorRes.value = cardDataFromDb?.color ?? '';
            if (!appLocked.value && deepLinkRes.value != null && router.current.name != CardConnectRoute.name) {
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
                if (cardDataFromDb?.lost != null && cardDataFromDb?.lost == true) {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    context: router.navigatorKey.currentContext!,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          20,
                        ),
                        topRight: Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    builder: (context) {
                      return const CardBlockedModal();
                    },
                  );
                } else {
                  if (cardDataFromDb?.backup != null &&
                      cardDataFromDb?.backup == true &&
                      _balanceStore.cards.isNotEmpty) {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      context: router.navigatorKey.currentContext!,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            20,
                          ),
                          topRight: Radius.circular(
                            20,
                          ),
                        ),
                      ),
                      builder: (context) {
                        return PrimaryCardSelectionModal(
                          backupWalletAddress: deepLinkRes.value ?? '',
                        );
                      },
                    );
                  } else if (cardDataFromDb?.backup == true && _balanceStore.cards.isEmpty) {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      context: router.navigatorKey.currentContext!,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            20,
                          ),
                          topRight: Radius.circular(
                            20,
                          ),
                        ),
                      ),
                      builder: (context) {
                        return const BackupCardTapped();
                      },
                    );
                  } else {
                    if (cardType != 'BAR') {
                      await router.push(
                        CardConnectWithNfc(
                          receivedData: deepLinkRes.value,
                          cardColor: cardColorRes.value,
                          backupPack: cardDataFromDb?.backupPack ?? false,
                          backup: cardDataFromDb?.backup ?? false,
                          isOriginalNxp: true,
                          isActivated: cardDataFromDb?.activated,
                        ),
                      );
                    } else {
                      await router.push(
                        BarConnectWithNfc(
                          receivedData: deepLinkRes.value,
                          isActivated: cardDataFromDb?.activated ?? false,
                        ),
                      );
                    }
                  }
                }
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
                router.current.name != CardConnectRoute.name) {
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
                if (cardDataFromDb?.lost != null && cardDataFromDb?.lost == true) {
                  await showModalBottomSheet(
                    isScrollControlled: true,
                    context: router.navigatorKey.currentContext!,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          20,
                        ),
                        topRight: Radius.circular(
                          20,
                        ),
                      ),
                    ),
                    builder: (context) {
                      return const CardBlockedModal();
                    },
                  );
                } else {
                  if (cardDataFromDb?.backup != null && cardDataFromDb?.backup == true && _balanceStore.cards.isEmpty) {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      context: router.navigatorKey.currentContext!,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            20,
                          ),
                          topRight: Radius.circular(
                            20,
                          ),
                        ),
                      ),
                      builder: (context) {
                        return const BackupCardTapped();
                      },
                    );
                  } else if (cardDataFromDb?.backup != null &&
                      cardDataFromDb?.backup == true &&
                      _balanceStore.cards.isNotEmpty) {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      context: router.navigatorKey.currentContext!,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            20,
                          ),
                          topRight: Radius.circular(
                            20,
                          ),
                        ),
                      ),
                      builder: (context) {
                        return PrimaryCardSelectionModal(
                          backupWalletAddress: deepLinkRes.value ?? '',
                        );
                      },
                    );
                  } else {
                    if (cardType != 'BAR') {
                      await router.push(
                        CardConnectWithNfc(
                          receivedData: deepLinkRes.value,
                          cardColor: cardColorRes.value,
                          backupPack: cardDataFromDb?.backupPack ?? false,
                          backup: cardDataFromDb?.backup ?? false,
                          isOriginalNxp: true,
                          isActivated: cardDataFromDb?.activated,
                        ),
                      );
                    } else {
                      await router.push(
                        BarConnectWithNfc(
                          receivedData: deepLinkRes.value,
                          isActivated: cardDataFromDb?.activated ?? false,
                        ),
                      );
                    }
                  }
                }
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
        if (_balanceStore.cards.isNotEmpty || _balanceStore.bars.isNotEmpty) {
          initModalState();
        }
        return streamSubscription.cancel;
      },
      [],
    );

    final onOpenSendReceiveModal = useCallback(
      () async {
        final selectedCard = currentCard.value.card;

        final isBarList = currentCard.value.index == 1;

        dynamic isCardActivated;
        dynamic isBarActivated;

        if (selectedCard?.blockchain == 'ETH') {
          isCardActivated = isEthCardWalletActivated();
          isBarActivated = isBarWalletActivated();
        } else {
          isCardActivated = isCardWalletActivated();
          isBarActivated = isBarWalletActivated();
        }

        Gaimon.medium();

        return sendReceiveButtonModal(
          selectedCard: selectedCard!,
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
        );
      },
      [
        currentCard.value,
        isModalOpened,
      ],
    );

    final onRefreshed = useCallback(() async {
      await _marketPageStore.getMarketCap();
      await _marketPageStore.onRefresh();
      await recordAmplitudeEventPartTwo(
        const PullToRefresh(source: 'market'),
      );
    });

    Future<void> programmaticRefresh() async {
      if (scrollController.hasClients) {
        await scrollController.animateTo(
          -100,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
        await Future.delayed(const Duration(milliseconds: 300));
        await onRefreshed();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ReactionBuilder(
        builder: (_) => reaction((p0) => _walletProtectState.isBiometricsRunning, (p0) {
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
                      onOpenSendReceiveModal: onOpenSendReceiveModal,
                    ),
                    MarketPage(
                      pullToRefresh: onRefreshed,
                      scrollController: scrollController,
                    ),
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
                  color: Colors.grey.withValues(alpha: 0.4),
                ),
                Observer(
                  builder: (context) {
                    return Theme(
                      data: ThemeData(
                        canvasColor:
                            _allSettingsState.currentIndex == 1 ? Colors.white : Colors.white.withValues(alpha: 0.5),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                      child: Observer(
                        builder: (context) {
                          return Platform.isIOS
                              ? ClipRRect(
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                      sigmaX: _allSettingsState.currentIndex == 1 ? 0 : 8,
                                      sigmaY: _allSettingsState.currentIndex == 1 ? 0 : 8,
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
                                        _pageController.jumpToPage(index),
                                        _allSettingsState.updateIndex(index),
                                        if (index == 0)
                                          {
                                            recordAmplitudeEvent(
                                              const WalletTabClicked(),
                                            ),
                                            if (_balanceStore.cards.isNotEmpty)
                                              {
                                                _rampService.configuration.userAddress =
                                                    _balanceStore.cards[_historyPageStore.cardHistoryIndex].address,
                                              }
                                            else if (_balanceStore.bars.isNotEmpty)
                                              {
                                                _rampService.configuration.userAddress =
                                                    _balanceStore.bars[_historyPageStore.barHistoryIndex].address,
                                              },
                                          }
                                        else if (index == 1)
                                          {
                                            if (currentIndex.value == index && index == 1)
                                              {
                                                programmaticRefresh(),
                                              },
                                            currentIndex.value = index,
                                            recordAmplitudeEvent(
                                              const MarketTabClicked(),
                                            ),
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
                                      backgroundColor: _allSettingsState.currentIndex == 1
                                          ? Colors.white
                                          : Colors.white.withValues(alpha: 0.8),
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
                                            padding: const EdgeInsets.only(
                                              right: 30,
                                              top: 8,
                                            ),
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
                                            padding: const EdgeInsets.only(
                                              left: 30,
                                              top: 5,
                                            ),
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
                                    ),
                                  ),
                                )
                              : BottomNavigationBar(
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
                                    _pageController.jumpToPage(index),
                                    _allSettingsState.updateIndex(index),
                                    if (index == 0)
                                      {
                                        recordAmplitudeEvent(
                                          const WalletTabClicked(),
                                        ),
                                        if (_balanceStore.cards.isNotEmpty)
                                          {
                                            _rampService.configuration.userAddress =
                                                _balanceStore.cards[_historyPageStore.cardHistoryIndex].address,
                                          }
                                        else if (_balanceStore.bars.isNotEmpty)
                                          {
                                            _rampService.configuration.userAddress =
                                                _balanceStore.bars[_historyPageStore.barHistoryIndex].address,
                                          },
                                      }
                                    else if (index == 1)
                                      {
                                        if (currentIndex.value == index && index == 1)
                                          {
                                            programmaticRefresh(),
                                          },
                                        currentIndex.value = index,
                                        recordAmplitudeEvent(
                                          const MarketTabClicked(),
                                        ),
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
                                        padding: const EdgeInsets.only(
                                          right: 30,
                                          top: 8,
                                        ),
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
                                        padding: const EdgeInsets.only(
                                          left: 30,
                                          top: 5,
                                        ),
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
                    );
                  },
                ),
              ],
            ),
            Observer(
              builder: (_) {
                if (_walletProtectState.isBiometricsRunning || _walletProtectState.isNfcSessionStarted) {
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
      floatingActionButton: SendReceiveActionButton(
        isInactive: isInactive,
        appLocked: appLocked,
        walletProtectState: _walletProtectState,
        currentCard: currentCard,
        balanceStore: _balanceStore,
        pageController: _pageController,
        isModalOpened: isModalOpened,
        nfcStore: _nfcStore,
        onOpenSendReceiveModal: onOpenSendReceiveModal,
        allSettingsState: _allSettingsState,
      ),
    );
  }
}
