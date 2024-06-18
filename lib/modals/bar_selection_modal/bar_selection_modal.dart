import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';

import '../../constants/card_color.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../providers/screen_service.dart';
import '../../services/amplitude_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/history_page_store/history_page_store.dart';
import '../../store/market_page_store/market_page_store.dart';
import '../../utils/data_utils.dart';

class BarSelectionModal extends StatelessWidget {
  const BarSelectionModal({
    super.key,
    required BalanceStore balanceStore,
    required MarketPageStore marketPageStore,
    required HistoryPageStore historyPageStore,
  })  : _balanceStore = balanceStore,
        _marketPageStore = marketPageStore,
        _historyPageStore = historyPageStore;

  final BalanceStore _balanceStore;
  final MarketPageStore _marketPageStore;
  final HistoryPageStore _historyPageStore;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.91,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(12),
            Assets.icons.notch.image(height: 4),
            const Gap(20),
            const Row(
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
            const Gap(15),
            Expanded(
              flex: context.height > 667 ? 7 : 10,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Observer(
                      builder: (context) {
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: _balanceStore.bars.length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final bar = _balanceStore.bars[index];
                            final formattedAddress =
                                getSplitAddress(bar.address);
                            final data =
                                _marketPageStore.singleCoin?.result.first;
                            final myFormat = NumberFormat.decimalPatternDigits(
                              locale: 'en_us',
                              decimalDigits: 2,
                            );
                            return Observer(
                              builder: (context) {
                                return InkWell(
                                  onTap: () {
                                    _historyPageStore
                                      ..setBarHistoryIndex(index)
                                      ..setBarSelectedAddress(
                                        _balanceStore
                                            .bars[_historyPageStore
                                                .barHistoryIndex]
                                            .address,
                                      )
                                      ..getSingleBarHistory(
                                        address: _balanceStore
                                            .bars[_historyPageStore
                                                .barHistoryIndex]
                                            .address,
                                      );
                                    recordAmplitudeEventPartTwo(
                                      WalletSelected(
                                        walletType: 'bar',
                                        address: _historyPageStore
                                            .selectedBarAddress,
                                      ),
                                    );
                                    router.maybePop();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color:
                                          _historyPageStore.barHistoryIndex ==
                                                  index
                                              ? const Color(0xFFF7F7FA)
                                              : Colors.transparent,
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
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    bar.name,
                                                    style: const TextStyle(
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      fontSize: 15,
                                                      color: AppColors.primary,
                                                    ),
                                                  ),
                                                  Text(
                                                    formattedAddress,
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
                                            '\$${myFormat.format((bar.finalBalance ?? 0) / 100000000 * data!.price)}',
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
                          },
                        );
                      },
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
}
