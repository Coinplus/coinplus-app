import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../store/market_page_store/market_page_store.dart';
import '../../utils/number_formatter.dart';
import '../../widgets/loading_button/loading_button.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> with SingleTickerProviderStateMixin {
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
      ..isTextFieldVisible = false;
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
                            _animation.value * MediaQuery.of(context).size.width,
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
                            borderSide: const BorderSide(color: Colors.transparent),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: EdgeInsets.zero,
                          hintText: 'Search among Top ${_marketPageStore.searchedList.length} coins',
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
                          Container(
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
                          const Gap(5),
                          IconButton(
                            icon: Assets.icons.searchButton.image(
                              height: 20,
                            ),
                            onPressed: _marketPageStore.toggleTextFieldVisibility,
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
              },
            ),
            SliverAppBar(
              floating: true,
              snap: true,
              stretch: true,
              backgroundColor: Colors.white,
              elevation: 0,
              toolbarHeight: 100,
              systemOverlayStyle: const SystemUiOverlayStyle(
                systemNavigationBarColor: Colors.white,
                statusBarColor: Colors.transparent,
              ),
              title: Observer(
                builder: (context) {
                  final marketData = _marketPageStore.marketCap;
                  if (marketData != null) {
                    final formattedNumber = formatLargeNumber(marketData.marketCap.toInt());
                    final formattedVolume = formatLargeNumber(marketData.volume.toInt());
                    return Container(
                      height: 75,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFFEEEFF4),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: 3,
                            blurRadius: 10,
                            color: Color(0xFFF1F1FD),
                          ),
                        ],
                        color: const Color(0xFFF7F7FA),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: (context.width / 3) - 32,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Market cap',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: FontFamily.redHatMedium,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Gap(3),
                                  Text(
                                    '\$${formattedNumber.toString()}',
                                    style: const TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      if (marketData.marketCapChange > 0)
                                        Assets.icons.arrowDropUp.image(
                                          height: 20,
                                        )
                                      else
                                        Assets.icons.arrowDropDown.image(
                                          height: 20,
                                        ),
                                      const Gap(1),
                                      Text(
                                        '${marketData.marketCapChange.toStringAsFixed(2)}%',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: marketData.marketCapChange > 0 ? Colors.green : Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFEEEFF4),
                            ),
                          ),
                          SizedBox(
                            width: (context.width / 3) - 32,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 6),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    'Volume',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: FontFamily.redHatMedium,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Gap(3),
                                  Text(
                                    '\$${formattedVolume.toString()}',
                                    style: const TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (marketData.volumeChange > 0)
                                        Assets.icons.arrowDropUp.image(
                                          height: 20,
                                        )
                                      else
                                        Assets.icons.arrowDropDown.image(
                                          height: 20,
                                        ),
                                      const Gap(3),
                                      Text(
                                        '${marketData.volumeChange.toStringAsFixed(2)}%',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: marketData.volumeChange > 0 ? Colors.green : Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 80,
                            width: 1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xFFEEEFF4),
                            ),
                          ),
                          SizedBox(
                            width: (context.width / 3) - 32,
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    'BTC Dominance',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontFamily: FontFamily.redHatMedium,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Gap(3),
                                  Text(
                                    '${marketData.btcDominance.toString()} %',
                                    style: const TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      if (marketData.btcDominanceChange > 0)
                                        Assets.icons.arrowDropUp.image(
                                          height: 20,
                                        )
                                      else
                                        Assets.icons.arrowDropDown.image(
                                          height: 20,
                                        ),
                                      const Gap(3),
                                      Text(
                                        '${marketData.btcDominanceChange.toStringAsFixed(2)}%',
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: marketData.btcDominanceChange > 0 ? Colors.green : Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.9),
                    highlightColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        height: 75,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                    ),
                  );
                },
              ),
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
                      width: context.width - 155,
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
                          Gap(12.5),
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
            Observer(
              builder: (context) {
                if (_marketPageStore.filteredData.isEmpty) {
                  return SliverList.separated(
                    separatorBuilder: (_, __) {
                      return Divider(
                        endIndent: 10,
                        indent: 10,
                        color: Colors.grey.withOpacity(0.2),
                      );
                    },
                    itemCount: 200,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 15),
                        child: _buildShimmerItem(),
                      );
                    },
                  );
                } else {
                  return SliverList.separated(
                    itemCount: _marketPageStore.searchedList.isNotEmpty
                        ? _marketPageStore.searchedList.length +
                            (_marketPageStore.isLoading ? 1 : (_marketPageStore.isSearched ? 0 : 1))
                        : (_marketPageStore.filteredData.length <= _marketPageStore.searchedList.length
                            ? _marketPageStore.searchedList.length
                            : _marketPageStore.searchedList.length + 1),
                    separatorBuilder: (_, __) {
                      return Divider(
                        endIndent: 10,
                        indent: 10,
                        color: Colors.grey.withOpacity(0.2),
                      );
                    },
                    itemBuilder: (context, index) {
                      if (_marketPageStore.searchedList.isEmpty) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 26, vertical: 20),
                          child: Center(
                            child: Text(
                              'No coins found',
                              style: TextStyle(
                                fontFamily: FontFamily.redHatMedium,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        );
                      } else if (index == _marketPageStore.searchedList.length) {
                        if (_marketPageStore.isLoading) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: _buildShimmerItem(),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 26),
                            child: SizedBox(
                              height: 35,
                              child: LoadingButton(
                                onPressed: _marketPageStore.loadMoreCoins,
                                style: context.theme
                                    .buttonStyle(
                                      textStyle: const TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        color: AppColors.primaryTextColor,
                                        fontSize: 15,
                                      ),
                                    )
                                    .copyWith(
                                      backgroundColor: MaterialStateProperty.all(
                                        Colors.grey.withOpacity(0.2),
                                      ),
                                      padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 5)),
                                    ),
                                child: const Text(
                                  'Load more',
                                  style: TextStyle(fontFamily: FontFamily.redHatMedium, fontSize: 14),
                                ),
                              ).paddingHorizontal(120),
                            ),
                          );
                        }
                      } else {
                        final data = _marketPageStore.searchedList[index];
                        final formattedMarketCap = formatLargeNumber(data.marketCap.toInt());
                        return Padding(
                          key: ValueKey(data.rank),
                          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  child: Text(
                                    data.rank.toString(),
                                    style: const TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 15),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width - 174,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        height: 26,
                                        child: CachedNetworkImage(
                                          imageUrl: data.icon,
                                          placeholder: (context, url) => Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.grey.withOpacity(0.5),
                                            ),
                                            height: 26,
                                            width: 26,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.grey.withOpacity(0.3),
                                              child: Center(
                                                child: Text(
                                                  data.symbol,
                                                  style: const TextStyle(
                                                    fontFamily: FontFamily.redHatMedium,
                                                    fontSize: 7,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          errorWidget: (context, url, error) => const Icon(Icons.error),
                                        ),
                                      ),
                                      const SizedBox(width: 15),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            data.symbol,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontFamily: FontFamily.redHatMedium,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            '\$$formattedMarketCap',
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily: FontFamily.redHatMedium,
                                              color: AppColors.secondaryTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      if (data.priceChange1d > 0)
                                        Assets.icons.arrowDropUp.image(height: 30)
                                      else
                                        Assets.icons.arrowDropDown.image(height: 30),
                                      Text(
                                        '${data.priceChange1d.toStringAsFixed(2)}%',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: data.priceChange1d > 0 ? Colors.green : Colors.red,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                CryptoPriceFormatter(price: data.price),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  );
                }
              },
            ),
            const SliverToBoxAdapter(
              child: Gap(120),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShimmerItem() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SizedBox(
        child: Row(
          children: [
            Container(
              height: 13,
              width: 28,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: Colors.grey),
            ),
            const Gap(10),
            const CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 13,
            ),
            const Gap(16.5),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  height: 10,
                  width: 55,
                  margin: const EdgeInsets.only(bottom: 8),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  height: 10,
                  width: 25,
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  height: 13,
                  width: 65,
                  margin: const EdgeInsets.only(bottom: 8),
                ),
                const Gap(18),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey,
                  ),
                  height: 13,
                  width: 70,
                  margin: const EdgeInsets.only(bottom: 8),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
