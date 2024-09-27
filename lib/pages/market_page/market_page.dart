import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../services/amplitude_service.dart';
import '../../store/market_page_store/market_page_store.dart';
import 'coins_data/coins_list_widget.dart';
import 'market_data/favorite_coins_list.dart';
import 'market_data/market_data.dart';
import 'market_data/overview_widget.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({
    super.key,
    required this.pullToRefresh,
    required this.scrollController,
  });

  final Future<void> Function()? pullToRefresh;
  final ScrollController scrollController;

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> with TickerProviderStateMixin {
  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  final _textController = TextEditingController();

  late TabController _tabController;

  ScrollController? nestedScrollController;

  final ScrollController _mainScrollController = ScrollController();
  final ScrollController _secondScrollController = ScrollController();

  final _showOffset = 40;
  late Animation<double> _animation;

  void _handleSecondScroll() {
    if (_secondScrollController.offset > 50 && !_marketPageStore.isCollapsed) {
      _mainScrollController.animateTo(
        100,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
      _marketPageStore.collapseWidget();
    } else if (_secondScrollController.offset <= 50 &&
        _marketPageStore.isCollapsed) {
      _mainScrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linear,
      );
      _marketPageStore.expandWidget();
    }
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _secondScrollController.addListener(_handleSecondScroll);
    _marketPageStore
      ..loadFavoriteCoins()
      ..isSearchVisible = false
      ..isTextFieldVisible = false
      ..getMarketCap()
      ..loadCoins();
    _secondScrollController.addListener(() {
      _marketPageStore.toggleShouldShowUpButton(
        shouldShowUpButton: _secondScrollController.offset > _showOffset,
      );
    });
    _tabController.addListener(() {
      if (_tabController.index != 0) {
        _marketPageStore.toggleShouldShowUpButton();
      }
    });
    _marketPageStore.initAnimationController(this);
    _animation = Tween<double>(begin: -1, end: 0).animate(
      CurvedAnimation(
        parent: _marketPageStore.animationController!,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Observer(
        builder: (_) {
          return Align(
            alignment: const Alignment(1, 0.85),
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 300),
              opacity: _marketPageStore.shouldShowUpButton
                  ? _marketPageStore.searchedList.isEmpty
                      ? 0
                      : _marketPageStore.focusNode.hasFocus
                          ? 0
                          : 1
                  : 0,
              child: FloatingActionButton(
                elevation: 0,
                heroTag: 'Scroll Up',
                splashColor: Colors.white,
                focusElevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.withOpacity(0.6)),
                  borderRadius: BorderRadius.circular(100),
                ),
                mini: true,
                onPressed: () {
                  _secondScrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                  );
                  recordAmplitudeEventPartTwo(const GoUpClicked());
                },
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.black,
                ),
              ),
            ),
          );
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Observer(
          builder: (context) {
            return _marketPageStore.isSearchVisible
                ? SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: 40,
                    child: AnimatedBuilder(
                      animation: _marketPageStore.animationController!,
                      builder: (context, child) {
                        return Transform(
                          transform: Matrix4.translationValues(
                            _animation.value *
                                MediaQuery.of(context).size.width,
                            0,
                            0,
                          ),
                          child: child,
                        );
                      },
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        autocorrect: false,
                        controller: _textController,
                        focusNode: _marketPageStore.focusNode,
                        onChanged: (val) {
                          _marketPageStore.setSearchText(val);
                        },
                        onEditingComplete: () {
                          recordAmplitudeEventPartTwo(
                            CoinSearched(coinName: _textController.text),
                          );
                          _marketPageStore.focusNode.unfocus();
                        },
                        decoration: InputDecoration(
                          filled: true,
                          prefixIconColor: Colors.grey.withOpacity(0.5),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blueAccent,
                            ),
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.zero,
                          hintText:
                              'Search among Top ${_marketPageStore.searchedList.length} coins',
                          hintStyle: TextStyle(
                            fontFamily: FontFamily.redHatLight,
                            color: AppColors.primaryTextColor.withOpacity(0.5),
                            fontSize: 14,
                          ),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          suffixIcon: _textController.text.isNotEmpty
                              ? IconButton(
                                  splashRadius: 15,
                                  onPressed: () {
                                    _marketPageStore.setSearchText('');
                                    _textController.clear();
                                  },
                                  icon: const Icon(
                                    Icons.close,
                                    color: Colors.grey,
                                  ),
                                )
                              : const SizedBox(),
                          fillColor: Colors.grey.withOpacity(0.1),
                        ),
                      ),
                    ),
                  )
                : const Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Markets',
                          style: TextStyle(
                            fontSize: 28,
                            fontFamily: FontFamily.redHatMedium,
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
          },
        ),
        actions: [
          Observer(
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: !_marketPageStore.isTextFieldVisible
                    ? Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              recordAmplitudeEventPartTwo(const FiatCliked());
                            },
                            child: Container(
                              height: 26,
                              width: 57,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: const Color(0xFF007AFF),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Assets.icons.formkitUsdc.image(height: 16),
                                  const Gap(2),
                                  const Text(
                                    'USD',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: FontFamily.redHatMedium,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(5),
                          IconButton(
                            icon: Assets.icons.searchButton.image(
                              height: 20,
                            ),
                            onPressed: () {
                              _marketPageStore.toggleTextFieldVisibility();
                              recordAmplitudeEventPartTwo(
                                const CoinSearchClicked(),
                              );
                            },
                          ),
                        ],
                      )
                    : TextButton(
                        onPressed: () async {
                          _marketPageStore.toggleTextFieldVisibility();
                          await _marketPageStore.resetSearch();
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 15,
                          ),
                        ),
                      ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is ScrollStartNotification) {
            FocusScope.of(context).unfocus();
          }
          return true;
        },
        child: CustomScrollView(
          controller: _mainScrollController,
          slivers: [
            const SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.white,
              elevation: 0,
              toolbarHeight: 90,
              systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.white,
                statusBarColor: Colors.transparent,
              ),
              title: MarketDataWidget(),
            ),
            SliverAppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              pinned: true,
              toolbarHeight: 0,
              systemOverlayStyle: const SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.white,
                statusBarColor: Colors.transparent,
              ),
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: AppColors.primaryButtonColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
                tabAlignment: TabAlignment.fill,
                tabs: const [
                  Tab(text: 'Coins List'),
                  Tab(text: 'Overview'),
                  Tab(text: 'Favorites'),
                ],
                labelStyle: const TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  color: AppColors.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelColor: const Color(0xFF838995),
                splashFactory: NoSplash.splashFactory,
              ),
            ),
            const SliverToBoxAdapter(
              child: Gap(10),
            ),
            SliverFillRemaining(
              child: TabBarView(
                controller: _tabController,
                children: [
                  CoinsListWidget(
                    pullToRefresh: widget.pullToRefresh,
                    secondScrollController: _secondScrollController,
                  ),
                  const OverviewWidget(),
                  const FavoriteCoinsList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
