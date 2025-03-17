import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../store/all_settings_state/all_settings_state.dart';
import '../../../store/market_page_store/market_page_store.dart';

class FavoriteCoin extends HookWidget {
  const FavoriteCoin({
    super.key,
    required this.pageController,
    required this.allSettingsState,
  });

  final PageController pageController;
  final AllSettingsState allSettingsState;

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 12, right: 12, bottom:  context.width > 360 ? 12 : 0),
            child: Observer(
              builder: (_) {
                final data = _marketPageStore.singleCoin?.result.first;
                final myFormat = NumberFormat.decimalPattern('en_us');
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: data == null
                      ? Row(
                          children: [
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withValues(alpha: 0.3),
                              highlightColor: Colors.white,
                              child: Assets.icons.bTCIcon.image(height: 24),
                            ),
                            const Gap(8),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withValues(alpha: 0.3),
                              highlightColor: Colors.white,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey,
                                ),
                                child: const Text(
                                  'Bitcoin',
                                  style: TextStyle(
                                    fontFamily: FontFamily.redHatMedium,
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            const Gap(8),
                            Shimmer.fromColors(
                              baseColor: Colors.grey.withValues(alpha: 0.3),
                              highlightColor: Colors.white,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey,
                                ),
                                child: Column(
                                  children: [
                                    const Gap(3),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: Colors.grey.withValues(alpha: 0.1),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4,
                                        vertical: 2,
                                      ),
                                      child: const Text(
                                        'BTC',
                                        style: TextStyle(
                                          fontFamily: FontFamily.redHatMedium,
                                          fontSize: 10,
                                          color: AppColors.textHintsColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Shimmer.fromColors(
                                  baseColor: Colors.grey.withValues(alpha: 0.3),
                                  highlightColor: Colors.white,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey,
                                    ),
                                    child: const Text(
                                      r'$ 43,831.61',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: FontFamily.redHatMedium,
                                        color: AppColors.primaryTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                                const Gap(4),
                                Shimmer.fromColors(
                                  baseColor: Colors.grey.withValues(alpha: 0.3),
                                  highlightColor: Colors.white,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.grey,
                                    ),
                                    child: const Text(
                                      r'$ 43,831.61     ',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: FontFamily.redHatMedium,
                                        color: AppColors.primaryTextColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Builder(
                          builder: (context) {
                            final formattedPrice = myFormat.format(data.price);
                            return Container(
                              decoration: const BoxDecoration(),
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 25,
                                    width: 25,
                                    child: CachedNetworkImage(
                                      imageUrl: data.icon,
                                    ),
                                  ),
                                  const Gap(8),
                                  Text(
                                    data.name,
                                    style: const TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Gap(8),
                                  Column(
                                    children: [
                                      const Gap(3),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(2),
                                          color: Colors.grey.withValues(alpha: 0.1),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4,
                                          vertical: 2,
                                        ),
                                        child: Text(
                                          data.symbol.toUpperCase(),
                                          style: const TextStyle(
                                            fontFamily: FontFamily.redHatMedium,
                                            fontSize: 10,
                                            color: AppColors.textHintsColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\$ ${formattedPrice.substring(0, min(formattedPrice.length, 9))}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: FontFamily.redHatMedium,
                                          color: AppColors.primaryTextColor,
                                        ),
                                      ),
                                      const Gap(4),
                                      Padding(
                                        padding: const EdgeInsets.all(3),
                                        child: Row(
                                          children: [
                                            Assets.icons.schedule.image(
                                              height: 18,
                                              color: AppColors.textHintsColor,
                                            ),
                                            const Gap(4),
                                            const Text(
                                              '24h',
                                              style: TextStyle(
                                                fontSize: 10,
                                                color: AppColors.textHintsColor,
                                                fontFamily: FontFamily.redHatBold,
                                              ),
                                            ),
                                            if (data.priceChange1d > 0)
                                              const Icon(
                                                Icons.arrow_drop_up,
                                                size: 25,
                                                color: Colors.green,
                                              )
                                            else
                                              const Icon(
                                                Icons.arrow_drop_down,
                                                size: 25,
                                                color: Colors.red,
                                              ),
                                            Text(
                                              '${data.priceChange1d.toStringAsFixed(2)} %',
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: data.priceChange1d > 0 ? Colors.green : Colors.red,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                );
              },
            ),
          ),
        ],
      ).paddingHorizontal(16),
    );
  }
}
