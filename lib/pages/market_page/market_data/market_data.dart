import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

import '../../../extensions/context_extension.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../store/market_page_store/market_page_store.dart';
import '../../../utils/number_formatter.dart';

class MarketDataWidget extends StatelessWidget {
  const MarketDataWidget({super.key});

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final marketData = _marketPageStore.marketCap;
        if (marketData != null) {
          final formattedNumber =
              formatLargeNumber(marketData.marketCap.toInt());
          final formattedVolume = formatLargeNumber(marketData.volume.toInt());

          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Container(
              key: const ValueKey<int>(1),
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
                                  height: 5,
                                )
                              else
                                Assets.icons.arrowDropDown.image(
                                  height: 5,
                                ),
                              const Gap(1),
                              Text(
                                '${marketData.marketCapChange.toStringAsFixed(2)}%',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: marketData.marketCapChange > 0
                                      ? Colors.green
                                      : Colors.red,
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
                                  height: 5,
                                )
                              else
                                Assets.icons.arrowDropDown.image(
                                  height: 5,
                                ),
                              const Gap(3),
                              Text(
                                '${marketData.volumeChange.toStringAsFixed(2)}%',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: marketData.volumeChange > 0
                                      ? Colors.green
                                      : Colors.red,
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
                                  height: 5,
                                )
                              else
                                Assets.icons.arrowDropDown.image(
                                  height: 5,
                                ),
                              const Gap(3),
                              Text(
                                '${marketData.btcDominanceChange.toStringAsFixed(2)}%',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: marketData.btcDominanceChange > 0
                                      ? Colors.green
                                      : Colors.red,
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
            ),
          );
        }
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: Container(
            key: const ValueKey<int>(0),
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
                        const Gap(7),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 15,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const Gap(6),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 10,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey,
                            ),
                          ),
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
                        const Gap(7),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 15,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const Gap(6),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 10,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey,
                            ),
                          ),
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
                            fontSize: 12,
                            fontFamily: FontFamily.redHatMedium,
                            color: Colors.grey,
                          ),
                        ),
                        const Gap(7),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 15,
                            width: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        const Gap(6),
                        Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                            height: 10,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
