import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../store/market_page_store/market_page_store.dart';
import '../../../widgets/custom_snack_bar/snack_bar.dart';
import '../../../widgets/custom_snack_bar/top_snack.dart';

class FavoriteCoin extends HookWidget {
  const FavoriteCoin({super.key});

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
            child: Observer(
              builder: (_) {
                final data = _marketPageStore.allCoins?.result
                    .firstWhereOrNull((coin) => coin.id == _marketPageStore.selectedCoin);
                if (data == null) {
                  return Row(
                    children: [
                      Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.3),
                        highlightColor: Colors.white,
                        child: Assets.icons.bTCIcon.image(height: 24),
                      ),
                      const Gap(8),
                      Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.3),
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
                        baseColor: Colors.grey.withOpacity(0.3),
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
                                  color: Colors.grey.withOpacity(0.1),
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
                            baseColor: Colors.grey.withOpacity(0.3),
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
                            baseColor: Colors.grey.withOpacity(0.3),
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
                  );
                } else {
                  final myFormat = NumberFormat.decimalPattern('en_us');
                  final formattedPrice = myFormat.format(data.price).toString();
                  return ScaleTap(
                    scaleMinValue: 0.98,
                    enableFeedback: false,
                    onPressed: () {
                      showModalBottomSheet(
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
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Assets.icons.notch.image(height: 4),
                                const Gap(20),
                                const Text(
                                  'Select Favorite Coin',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: FontFamily.redHatMedium,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary,
                                  ),
                                ).expandedHorizontally(),
                                const Gap(10),
                                Observer(
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        for (int index = 0; index < 4; index++)
                                          ScaleTap(
                                            enableFeedback: false,
                                            onPressed: () {
                                              _marketPageStore.setSelectedCoin(
                                                _marketPageStore.allCoins!.result[index].id,
                                              );
                                              router.pop();
                                              showTopSnackBar(
                                                displayDuration: const Duration(
                                                  milliseconds: 600,
                                                ),
                                                Overlay.of(context),
                                                CustomSnackBar.success(
                                                  backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
                                                  message: 'Favorite coin was changed',
                                                  textStyle: const TextStyle(
                                                    fontFamily: FontFamily.redHatMedium,
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: _marketPageStore.selectedCoin ==
                                                        _marketPageStore.allCoins!.result[index].id
                                                    ? Colors.grey.withOpacity(0.1) // Selected color
                                                    : Colors.transparent, // Transparent color
                                              ),
                                              child: ListTile(
                                                leading: SizedBox(
                                                  height: 35,
                                                  width: 35,
                                                  child: Image.network(
                                                    _marketPageStore.allCoins!.result[index].icon,
                                                  ),
                                                ),
                                                title: Text(
                                                  _marketPageStore.allCoins!.result[index].name,
                                                  style: const TextStyle(
                                                    fontFamily: FontFamily.redHatMedium,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  _marketPageStore.allCoins!.result[index].symbol.toUpperCase(),
                                                  style: const TextStyle(
                                                    fontFamily: FontFamily.redHatMedium,
                                                  ),
                                                ),
                                                trailing: Radio<String>(
                                                  value: _marketPageStore.allCoins!.result[index].id,
                                                  groupValue: _marketPageStore.selectedCoin,
                                                  onChanged: (value) {
                                                    _marketPageStore.setSelectedCoin(value!);
                                                    router.pop();
                                                    showTopSnackBar(
                                                      displayDuration: const Duration(
                                                        milliseconds: 600,
                                                      ),
                                                      Overlay.of(context),
                                                      CustomSnackBar.success(
                                                        backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
                                                        message: 'Favorite coin was changed',
                                                        textStyle: const TextStyle(
                                                          fontFamily: FontFamily.redHatMedium,
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    );
                                  },
                                ),
                                const Gap(30),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: const BoxDecoration(),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 25,
                            width: 25,
                            child: Image.network(data.icon),
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
                                  color: Colors.grey.withOpacity(0.1),
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
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ).paddingHorizontal(16),
    );
  }
}
