import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../constants/card_color.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/bar_model/bar_model.dart';
import '../../models/card_model/card_model.dart';
import '../../providers/screen_service.dart';
import '../../services/ramp_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../utils/data_utils.dart';

class CardSelectDropdown extends StatelessWidget {
  const CardSelectDropdown({super.key});

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  RampService get _rampService => GetIt.I<RampService>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.91,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(12),
          Assets.icons.notch.image(height: 4),
          const Gap(20),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text(
                  'Select wallet',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          const Gap(20),
          Expanded(
            flex: context.height > 667 ? 7 : 10,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Observer(
                      builder: (context) {
                        final items = [
                          ..._balanceStore.cards,
                          ..._balanceStore.bars,
                        ];
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            if (item is CardModel) {
                              final card = item;
                              final formattedCardAddress =
                                  getSplitAddress(card.address);
                              final data = _balanceStore.btcPrice;
                              final myFormat =
                                  NumberFormat.decimalPatternDigits(
                                locale: 'en_us',
                                decimalDigits: 2,
                              );

                              return InkWell(
                                onTap: () async {
                                  await router.maybePop();
                                  _rampService
                                    ..configuration.userAddress = card.address
                                    ..presentRamp();
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.transparent,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: 30,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: card.color.image
                                                      .image()
                                                      .image,
                                                ),
                                              ),
                                            ),
                                            const Gap(12),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  card.name,
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        FontFamily.redHatMedium,
                                                    fontSize: 15,
                                                    color: AppColors.primary,
                                                  ),
                                                ),
                                                Text(
                                                  formattedCardAddress,
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        FontFamily.redHatMedium,
                                                    fontSize: 14,
                                                    color: AppColors
                                                        .textHintsColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '\$${myFormat.format((card.finalBalance ?? 0) / 100000000 * data!)}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontFamily: FontFamily.redHatMedium,
                                            color: AppColors.textHintsColor,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              final bar = item as BarModel;
                              final formattedBarAddress =
                                  getSplitAddress(bar.address);
                              final data = _balanceStore.btcPrice;
                              final myFormat =
                                  NumberFormat.decimalPatternDigits(
                                locale: 'en_us',
                                decimalDigits: 2,
                              );

                              return Observer(
                                builder: (context) {
                                  return InkWell(
                                    onTap: () async {
                                      await router.maybePop();
                                      _rampService.configuration.userAddress =
                                          bar.address;
                                      _rampService.presentRamp();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.transparent,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  width: 30,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: bar.color.image
                                                          .image()
                                                          .image,
                                                    ),
                                                  ),
                                                ),
                                                const Gap(12),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      bar.name,
                                                      style: const TextStyle(
                                                        fontFamily: FontFamily
                                                            .redHatMedium,
                                                        fontSize: 15,
                                                        color:
                                                            AppColors.primary,
                                                      ),
                                                    ),
                                                    Text(
                                                      formattedBarAddress,
                                                      style: const TextStyle(
                                                        fontFamily: FontFamily
                                                            .redHatMedium,
                                                        fontSize: 14,
                                                        color: AppColors
                                                            .textHintsColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '\$${myFormat.format((bar.finalBalance ?? 0) / 100000000 * data!)}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily:
                                                    FontFamily.redHatMedium,
                                                color: AppColors.textHintsColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
