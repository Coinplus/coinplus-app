import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../constants/card_record.dart';
import '../../extensions/extensions.dart';
import '../../services/ramp_service.dart';
import '../../store/all_settings_state/all_settings_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/history_page_store/history_page_store.dart';
import '../../store/market_page_store/market_page_store.dart';
import '../../utils/card_nfc_session.dart';
import '../../utils/header_custom_paint.dart';
import '../../widgets/card_and_bar_tab/card_and_bar_tab.dart';
import '../send_page/send_to/send_to_state.dart';
import '../splash_screen/splash_screen.dart';
import 'bar_list/bar_list.dart';
import 'card_list/card_list.dart';
import 'favorite_coin/favorite_coin.dart';
import 'tab_controller_listener/tab_controller_listener.dart';
import 'total_balance/total_balance.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({
    super.key,
    required this.onChangeCard,
    required this.pageController,
    required this.allSettingsState,
    required this.state,
    this.onOpenSendReceiveModal,
  });

  final CardChangeCallBack onChangeCard;
  final PageController pageController;
  final AllSettingsState allSettingsState;
  final SendToState state;
  final Future<void> Function()? onOpenSendReceiveModal;

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> with TickerProviderStateMixin {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  RampService get _rampService => GetIt.I<RampService>();

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  ScrollController controller = ScrollController();

  int cardCarouselIndex = 0;
  int barCarouselIndex = 0;
  late final _tabController = TabController(
    length: 2,
    vsync: this,
  );
  bool isCardScrolledUp = false;

  @override
  void initState() {
    super.initState();
    setWalletShown();
    controller.addListener(() async {
      if (widget.onOpenSendReceiveModal == null) {
        return;
      }
      if (controller.offset >= 100 && !isCardScrolledUp) {
        isCardScrolledUp = true;
        await widget.onOpenSendReceiveModal?.call();
        isCardScrolledUp = false;
      }
    });

    if (_balanceStore.cards.isNotEmpty) {
      _balanceStore.getCardsInfo();
    }
    if (_balanceStore.bars.isNotEmpty) {
      _balanceStore.getBarsInfo();
    }
    _rampService.configureRamp(
      address: _balanceStore.cards.isNotEmpty
          ? _balanceStore.cards[_balanceStore.cardCurrentIndex].address
          : _balanceStore.bars.isNotEmpty
              ? _balanceStore.bars[_balanceStore.barCurrentIndex].address
              : '',
    );
    tabControllerListener(
      balanceStore: _balanceStore,
      barCarouselIndex: barCarouselIndex,
      cardCarouselIndex: cardCarouselIndex,
      historyPageStore: _historyPageStore,
      onChangeCard: widget.onChangeCard,
      rampService: _rampService,
      state: widget.state,
      tabController: _tabController,
    );
    if (_balanceStore.cards.isEmpty && _balanceStore.bars.isNotEmpty) {
      _tabController.animateTo(1);
    }
    if (_balanceStore.cards.isNotEmpty && _balanceStore.bars.isEmpty) {
      _tabController.animateTo(0);
    }
    if (Platform.isAndroid) {
      nfcStop();
    }
  }

  @override
  Widget build(BuildContext context) {
    _historyPageStore.setTabIndex(0);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 130,
        flexibleSpace: Stack(
          children: [
            CustomPaint(
              size: Size(
                context.height,
                (context.height > 667
                        ? context.height * 0.205
                        : context.height * 0.2)
                    .toDouble(),
              ),
              painter: HeaderCustomPainter(),
            ),
            Positioned(
              bottom: context.height > 667 ? 6 : 0,
              right: context.height < 932
                  ? context.height * 0.017
                  : context.height * 0.025,
              child: CardAndBarTab(tabController: _tabController),
            ),
            const Positioned(
              bottom: 14,
              left: 14,
              child: TotalBalance(),
            ),
          ],
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white.withOpacity(0.95),
      body: ReactionBuilder(
        builder: (context) {
          return reaction(
            (_) => _balanceStore.cardActivation,
            (status) {
              if (status == true) {
                _tabController.animateTo(0);
              }
            },
          );
        },
        child: ReactionBuilder(
          builder: (context) {
            return reaction(
              (_) => _balanceStore.barActivation,
              (status) {
                if (status == true) {
                  _tabController.animateTo(1);
                }
              },
            );
          },
          child: ReactionBuilder(
            builder: (_) {
              return reaction(
                (_) => _balanceStore.bars.length,
                (length) {
                  if (length > _balanceStore.barCurrentIndex) {
                    _tabController.animateTo(1);
                  }
                },
              );
            },
            child: ReactionBuilder(
              builder: (context) {
                return reaction(
                  (_) => _balanceStore.cards.length,
                  (length) {
                    if (length > _balanceStore.cardCurrentIndex) {
                      _tabController.animateTo(0);
                    }
                  },
                );
              },
              child: RefreshIndicator(
                displacement: 50,
                triggerMode: RefreshIndicatorTriggerMode.anywhere,
                color: Colors.black,
                onRefresh: () async {
                  await HapticFeedback.mediumImpact();
                  await _marketPageStore.getSingleCoin();
                  unawaited(_balanceStore.getCardsInfo());
                  unawaited(_balanceStore.getBarsInfo());
                },
                child: CustomScrollView(
                  controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    SliverFillRemaining(
                      child: Column(
                        children: [
                          if (context.height > 667)
                            const Gap(15)
                          else
                            const SizedBox(),
                          Expanded(
                            flex: context.height > 667 ? 7 : 10,
                            child: TabBarView(
                              physics: const NeverScrollableScrollPhysics(),
                              controller: _tabController,
                              children: [
                                CardList(
                                  onCardSelected: (card) => widget.onChangeCard(
                                    (card: card, index: 0),
                                  ),
                                  onCarouselScroll: (val) =>
                                      cardCarouselIndex = val,
                                  tabController: _tabController,
                                  state: widget.state,
                                ),
                                BarList(
                                  onCardSelected: (card) => widget.onChangeCard(
                                    (card: card, index: 1),
                                  ),
                                  onCarouselScroll: (val) =>
                                      barCarouselIndex = val,
                                  tabController: _tabController,
                                  state: widget.state,
                                ),
                              ],
                            ),
                          ),
                          // Current price(btc)
                          if (context.height > 667)
                            FavoriteCoin(
                              pageController: widget.pageController,
                              allSettingsState: widget.allSettingsState,
                            )
                          else
                            const SizedBox(),
                          const Spacer(),
                          const Gap(30),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
