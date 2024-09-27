import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/market_page_store/market_page_store.dart';
import '../../../utils/number_formatter.dart';
import '../../../widgets/shimmers/market_page_shimmer.dart';

class FavoriteCoinsList extends StatelessWidget {
  const FavoriteCoinsList({super.key});

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (_marketPageStore.isLoadingFavorites) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_marketPageStore.favoriteCoinsList.isEmpty) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                const Gap(100),
                Lottie.asset(
                  height: 112,
                  width: 112,
                  'assets/lottie_animations/animated_logo.json',
                ),
                const Gap(45),
                const Text(
                  'Your favorite list is currently empty.',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
                const Gap(10),
                const Text(
                  'Start building your favorite list \nby clicking ☆ in the Coins Details page.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textHintsColor,
                  ),
                ),
              ],
            ),
          );
        }

        return Observer(
          builder: (context) {
            return ListView.separated(
              itemCount: _marketPageStore.favoriteCoinsList.length,
              separatorBuilder: (_, __) {
                return Divider(
                  endIndent: 10,
                  indent: 10,
                  color: Colors.grey.withOpacity(0.2),
                );
              },
              itemBuilder: (context, index) {
                return _marketPageStore.isLoadingFavorites
                    ? const MarketPageShimmer()
                    : AnimatedSwitcher(
                        duration: const Duration(milliseconds: 800),
                        child: Builder(
                          builder: (context) {
                            final data =
                                _marketPageStore.favoriteCoinsList[index];
                            final formattedMarketCap =
                                formatLargeNumber(data.marketCap.toInt());
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
                                            fontSize:
                                                data.rank < 2000 ? 12 : 10,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.55,
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              height: 26,
                                              child: CachedNetworkImage(
                                                imageUrl: data.icon,
                                                placeholder: (context, url) =>
                                                    Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      20,
                                                    ),
                                                    color: Colors.grey
                                                        .withOpacity(0.5),
                                                  ),
                                                  height: 26,
                                                  width: 26,
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.grey
                                                        .withOpacity(0.3),
                                                    child: Center(
                                                      child: Text(
                                                        data.symbol,
                                                        style: const TextStyle(
                                                          fontFamily: FontFamily
                                                              .redHatMedium,
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    data.symbol,
                                                    style: const TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  Text(
                                                    '\$$formattedMarketCap',
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      color: AppColors
                                                          .secondaryTextColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                              child: Row(
                                                children: [
                                                  if (data.priceChange1d > 0)
                                                    Assets.icons.arrowDropUp
                                                        .image(height: 5)
                                                  else
                                                    Assets.icons.arrowDropDown
                                                        .image(height: 5),
                                                  Text(
                                                    '${data.priceChange1d.toStringAsFixed(2)}%',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color:
                                                          data.priceChange1d > 0
                                                              ? Colors.green
                                                              : Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold,
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
      },
    );
  }
}
