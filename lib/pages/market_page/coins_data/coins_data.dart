import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:get_it/get_it.dart';

import '../../../extensions/elevated_button_extensions.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/market_page_store/market_page_store.dart';
import '../../../utils/number_formatter.dart';
import '../../../widgets/loading_button/loading_button.dart';
import '../../../widgets/shimmers/market_page_shimmer.dart';

class CoinsDataWidget extends StatelessWidget {
  const CoinsDataWidget({super.key});

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return SliverList.separated(
          itemCount: _marketPageStore.filteredData.isEmpty
              ? 200
              : _marketPageStore.searchedList.isNotEmpty
                  ? _marketPageStore.searchedList.length +
                      (_marketPageStore.isLoading ? 1 : (_marketPageStore.isSearched ? 0 : 1))
                  : (_marketPageStore.filteredData.length <= _marketPageStore.searchedList.length
                      ? _marketPageStore.searchedList.length
                      : _marketPageStore.searchedList.length + 1),
          separatorBuilder: (_, __) {
            return Divider(
              endIndent: 10,
              indent: 10,
              color: Colors.grey.withValues(alpha: 0.2),
            );
          },
          itemBuilder: (context, index) {
            return AnimatedSwitcher(
              duration: const Duration(milliseconds: 800),
              child: _marketPageStore.filteredData.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(15),
                      child: MarketPageShimmer(),
                    )
                  : _marketPageStore.searchedList.isEmpty
                      ? const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 26,
                            vertical: 20,
                          ),
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
                        )
                      : index == _marketPageStore.searchedList.length
                          ? AnimatedSwitcher(
                              duration: const Duration(milliseconds: 600),
                              child: _marketPageStore.isLoading
                                  ? const Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 15),
                                      child: MarketPageShimmer(),
                                    )
                                  : Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 26,
                                      ),
                                      child: SizedBox(
                                        height: 35,
                                        child: LoadingButton(
                                          onPressed: () {
                                            _marketPageStore.loadMoreCoins();
                                            recordAmplitudeEventPartTwo(
                                              const LoadCoinsClicked(),
                                            );
                                          },
                                          style: context.theme
                                              .buttonStyle(
                                                textStyle: const TextStyle(
                                                  fontFamily: FontFamily.redHatMedium,
                                                  color: AppColors.primaryTextColor,
                                                  fontSize: 15,
                                                ),
                                              )
                                              .copyWith(
                                                backgroundColor: WidgetStateProperty.all(
                                                  Colors.grey.withValues(alpha: 0.1),
                                                ),
                                                shape: const WidgetStatePropertyAll(
                                                  RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.all(
                                                      Radius.circular(15),
                                                    ),
                                                  ),
                                                ),
                                                padding: WidgetStateProperty.all(
                                                  const EdgeInsets.symmetric(
                                                    vertical: 5,
                                                  ),
                                                ),
                                              ),
                                          child: const Text(
                                            'Load more',
                                            style: TextStyle(
                                              fontFamily: FontFamily.redHatMedium,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ).paddingHorizontal(120),
                                      ),
                                    ),
                            )
                          : Builder(
                              builder: (context) {
                                final data = _marketPageStore.searchedList[index];
                                final formattedMarketCap = formatLargeNumber(data.marketCap.toInt());
                                return ScaleTap(
                                  scaleMinValue: 0.99,
                                  enableFeedback: false,
                                  onPressed: () {
                                    router.push(CoinChartRoute(data: data));
                                    recordAmplitudeEventPartTwo(
                                      CoinClicked(coinName: data.symbol),
                                    );
                                  },
                                  child: Padding(
                                    key: ValueKey(data.rank),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 25,
                                      vertical: 5,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            width: 30,
                                            child: Text(
                                              data.rank.toString(),
                                              style: TextStyle(
                                                fontFamily: FontFamily.redHatMedium,
                                                fontSize: data.rank < 2000 ? 12 : 10,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context).size.width * 0.55,
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: 26,
                                                  child: CachedNetworkImage(
                                                    imageUrl: data.icon,
                                                    placeholder: (context, url) => Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(20),
                                                        color: Colors.grey.withValues(alpha: 0.5),
                                                      ),
                                                      height: 26,
                                                      width: 26,
                                                      child: CircleAvatar(
                                                        backgroundColor: Colors.grey.withValues(alpha: 0.3),
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
                                                    errorWidget: (
                                                      context,
                                                      url,
                                                      error,
                                                    ) =>
                                                        const Icon(Icons.error),
                                                  ),
                                                ),
                                                const SizedBox(width: 15),
                                                Expanded(
                                                  child: Column(
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
                                                ),
                                                Flexible(
                                                  child: Row(
                                                    children: [
                                                      if (data.priceChange1d > 0)
                                                        Assets.icons.arrowDropUp.image(height: 5)
                                                      else
                                                        Assets.icons.arrowDropDown.image(height: 5),
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
                                              ],
                                            ),
                                          ),
                                          const Spacer(),
                                          CryptoPriceFormatter(
                                            price: data.price,
                                            isChartPage: false,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
            );
          },
        );
      },
    );
  }
}
