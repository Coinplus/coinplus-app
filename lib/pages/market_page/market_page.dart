import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../services/amplitude_service.dart';
import '../../store/market_page_store/market_page_store.dart';
import 'coins_data/coins_data.dart';
import 'market_data/market_data.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage>
    with SingleTickerProviderStateMixin {
  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  final _textController = TextEditingController();

  final _scrollController = ScrollController();
  final _showOffset = 40;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _marketPageStore
      ..isSearchVisible = false
      ..isTextFieldVisible = false
      ..getMarketCap()
      ..loadCoins();
    _scrollController.addListener(() {
      _marketPageStore.toggleShouldShowUpButton(
        shouldShowUpButton: _scrollController.offset > _showOffset,
      );
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
                splashColor: Colors.grey.withOpacity(0.5),
                focusElevation: 0,
                mini: true,
                onPressed: () {
                  _scrollController.animateTo(
                    0,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.fastOutSlowIn,
                  );
                  recordAmplitudeEventPartTwo(const GoUpClicked());
                },
                backgroundColor: Colors.grey.withOpacity(0.5),
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
                          'All coins',
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
          controller: _scrollController,
          slivers: [
            CupertinoSliverRefreshControl(
              onRefresh: () async {
                await HapticFeedback.mediumImpact();
                await _marketPageStore.getMarketCap();
                await _marketPageStore.onRefresh();
                await recordAmplitudeEventPartTwo(
                  const PullToRefresh(source: 'market'),
                );
              },
            ),
            const SliverAppBar(
              floating: true,
              snap: true,
              stretch: true,
              backgroundColor: Colors.white,
              elevation: 0,
              toolbarHeight: 100,
              systemOverlayStyle: SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.white,
                statusBarColor: Colors.transparent,
              ),
              title: MarketDataWidget(),
            ),
            SliverAppBar(
              backgroundColor: Colors.white,
              pinned: true,
              elevation: 0,
              toolbarHeight: 20,
              title: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: context.width - 185,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '#',
                            style: TextStyle(
                              color: Color(0xFF838995),
                              fontFamily: FontFamily.redHatMedium,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Gap(20),
                          Text(
                            'Market cap',
                            style: TextStyle(
                              color: Color(0xFF838995),
                              fontFamily: FontFamily.redHatMedium,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          Text(
                            '24h %',
                            style: TextStyle(
                              color: Color(0xFF838995),
                              fontFamily: FontFamily.redHatMedium,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      'Price',
                      style: TextStyle(
                        color: Color(0xFF838995),
                        fontFamily: FontFamily.redHatMedium,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const CoinsDataWidget(),
            const SliverToBoxAdapter(
              child: Gap(120),
            ),
          ],
        ),
      ),
    );
  }
}
