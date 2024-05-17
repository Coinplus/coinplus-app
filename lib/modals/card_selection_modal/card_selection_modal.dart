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

class CardSelectionModal extends StatelessWidget {
  const CardSelectionModal({
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.icons.notch.image(height: 4),
          const Gap(20),
          Observer(
            builder: (context) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: _balanceStore.cards.length,
                itemBuilder: (context, index) {
                  final card = _balanceStore.cards[index];
                  final formattedAddress = getSplitAddress(card.address);
                  final data = _marketPageStore.singleCoin?.result.first;
                  final myFormat = NumberFormat.decimalPatternDigits(
                    locale: 'en_us',
                    decimalDigits: 2,
                  );
                  return Observer(
                    builder: (context) {
                      return InkWell(
                        onTap: () {
                          _historyPageStore
                            ..setCardHistoryIndex(index)
                            ..setCardSelectedAddress(
                              _balanceStore
                                  .cards[_historyPageStore.cardHistoryIndex]
                                  .address,
                            )
                            ..getSingleCardHistory(
                              address: _historyPageStore.selectedCardAddress,
                            );
                          recordAmplitudeEventPartTwo(
                            WalletSelected(
                              walletType: 'card',
                              address: _historyPageStore.selectedCardAddress,
                            ),
                          );
                          router.maybePop();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: _historyPageStore.cardHistoryIndex == index
                                ? const Color(0xFFF7F7FA)
                                : Colors.transparent,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: card.color.image.image().image,
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
                                            fontFamily: FontFamily.redHatMedium,
                                            fontSize: 15,
                                            color: AppColors.primary,
                                          ),
                                        ),
                                        Text(
                                          formattedAddress,
                                          style: const TextStyle(
                                            fontFamily: FontFamily.redHatMedium,
                                            fontSize: 14,
                                            color: AppColors.textHintsColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(
                                  '\$${myFormat.format((card.finalBalance ?? 0) / 100000000 * data!.price)}',
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
                    },
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
