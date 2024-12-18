import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../store/market_page_store/market_page_store.dart';
import '../../../utils/number_formatter.dart';
import 'coin_chart_page.dart';

class CoinNameAndPrice extends StatelessWidget {
  const CoinNameAndPrice({
    super.key,
    required this.widget,
    required MarketPageStore marketPageStore,
  }) : _marketPageStore = marketPageStore;

  final CoinChartPage widget;
  final MarketPageStore _marketPageStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 20,
                    child: CachedNetworkImage(
                      imageUrl: widget.data!.icon,
                      placeholder: (context, url) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey.withValues(alpha: 0.5),
                        ),
                        height: 20,
                        width: 20,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey.withValues(alpha: 0.3),
                          child: Center(
                            child: Text(
                              widget.data!.symbol,
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
                  const Gap(6),
                  Text(
                    widget.data!.name,
                    style: const TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      color: AppColors.primary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: AppColors.silver,
                    ),
                    child: Text(
                      '#${widget.data?.rank}',
                      style: const TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        color: AppColors.textHintsColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Gap(5),
                  Observer(
                    builder: (context) {
                      return !_marketPageStore.chartLoading
                          ? Container(
                              height: 26,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: _marketPageStore.priceChangeInPercents! > 0
                                    ? Colors.greenAccent
                                    : _marketPageStore.priceChangeInPercents! == 0
                                        ? Colors.greenAccent
                                        : Colors.red,
                              ),
                              child: Observer(
                                builder: (context) {
                                  final priceChange = _marketPageStore.priceChangeInPercents?.toStringAsFixed(2);
                                  return Row(
                                    children: [
                                      if (_marketPageStore.priceChangeInPercents! > 0)
                                        Assets.icons.arrowDropUp.image(
                                          height: 5,
                                          color: Colors.white,
                                        )
                                      else if (_marketPageStore.priceChangeInPercents! > 0)
                                        Assets.icons.arrowDropDown.image(
                                          height: 5,
                                          color: Colors.white,
                                        )
                                      else if (_marketPageStore.priceChangeInPercents! == 0)
                                        Assets.icons.arrowDropUp.image(
                                          height: 5,
                                          color: Colors.white,
                                        )
                                      else
                                        Assets.icons.arrowDropDown.image(
                                          height: 5,
                                          color: Colors.white,
                                        ),
                                      const Gap(5),
                                      Text(
                                        '$priceChange %',
                                        style: const TextStyle(
                                          fontFamily: FontFamily.redHatMedium,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            )
                          : const SizedBox();
                    },
                  ),
                ],
              ),
              const Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Observer(
                    builder: (context) {
                      return _marketPageStore.onChartTouch
                          ? CryptoPriceFormatter(
                              price: _marketPageStore.touchedYValue!.toDouble(),
                              isChartPage: true,
                            )
                          : CryptoPriceFormatter(
                              price: widget.data!.price,
                              isChartPage: true,
                            );
                    },
                  ),
                  Observer(
                    builder: (context) {
                      return _marketPageStore.onChartTouch
                          ? Text(
                              _marketPageStore.chartDateTime,
                              style: const TextStyle(
                                fontFamily: FontFamily.redHatMedium,
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            )
                          : const SizedBox();
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
