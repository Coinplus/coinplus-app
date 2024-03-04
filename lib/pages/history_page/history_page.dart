import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../constants/card_color.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/history_page_store/history_page_store.dart';
import '../../store/market_page_store/market_page_store.dart';
import '../../utils/data_utils.dart';
import '../../widgets/shimmers/history_dropdown_shimmer.dart';
import 'bars_history_page/bars_history_page.dart';
import 'cards_history_page/cards_history_page.dart';

class HistoryPage extends HookWidget {
  const HistoryPage({super.key});

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  @override
  Widget build(BuildContext context) {
    final _scrollController = useScrollController();

    late final _tabController = useTabController(
      initialLength: 2,
    );

    useEffect(() {
      if (_balanceStore.cards.isNotEmpty) {
        _historyPageStore
          ..cardSelectedAddress = _balanceStore.cards.first.address
          ..setCardSelectedAddress(_balanceStore.cards[_historyPageStore.cardHistoryIndex].address)
          ..getSingleCardHistory(
            address: _balanceStore.cards[_historyPageStore.cardHistoryIndex].address,
          );
      }

      if (_balanceStore.bars.isNotEmpty) {
        _historyPageStore
          ..barSelectedAddress = _balanceStore.bars.first.address
          ..setBarSelectedAddress(_balanceStore.bars[_historyPageStore.barHistoryIndex].address)
          ..getSingleBarHistory(
            address: _balanceStore.bars[_historyPageStore.barHistoryIndex].address,
          );
      }

      if (_balanceStore.cards.isEmpty && _balanceStore.bars.isNotEmpty) {
        _tabController.animateTo(1);
      }
      return null;
    });

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'History',
                    style: TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  height: 40,
                  width: 128,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 5,
                        spreadRadius: 1,
                        color: Colors.grey.withOpacity(0.4),
                      ),
                    ],
                  ),
                  child: DefaultTabController(
                    length: 2,
                    child: SegmentedTabControl(
                      textStyle: const TextStyle(
                        fontFamily: FontFamily.redHatSemiBold,
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                      splashColor: Colors.transparent,
                      controller: _tabController,
                      indicatorColor: Colors.grey.withOpacity(0.1),
                      tabs: const [
                        SegmentTab(
                          backgroundColor: Colors.white,
                          label: 'Card',
                          textColor: Colors.grey,
                          splashColor: Colors.transparent,
                          selectedTextColor: AppColors.primaryTextColor,
                        ),
                        SegmentTab(
                          backgroundColor: Colors.white,
                          label: 'Bar',
                          textColor: Colors.grey,
                          splashColor: Colors.transparent,
                          selectedTextColor: AppColors.primaryTextColor,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Gap(18),
            SizedBox(
              height: 60,
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  if (_balanceStore.cards.isEmpty)
                    const SizedBox()
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Observer(
                        builder: (_) {
                          return _marketPageStore.singleCoin?.result == null
                              ? const HistoryDropdownShimmer()
                              : ScaleTap(
                                  onPressed: _balanceStore.cards.length > 1
                                      ? () {
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
                                                                        address: _balanceStore
                                                                            .cards[_historyPageStore.cardHistoryIndex]
                                                                            .address,
                                                                      );
                                                                    router.pop();
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
                                                                                    image:
                                                                                        card.color.image.image().image,
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
                                                                                    formattedAddress,
                                                                                    style: const TextStyle(
                                                                                      fontFamily:
                                                                                          FontFamily.redHatMedium,
                                                                                      fontSize: 14,
                                                                                      color: AppColors.textHintsColor,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Text(
                                                                            '\$${myFormat.format((card.data!.balance - card.data!.spentTxoSum) / 100000000 * data!.price)}',
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
                                            },
                                          );
                                        }
                                      : null,
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                    child: Observer(
                                      builder: (_) {
                                        final data = _marketPageStore.singleCoin?.result.first;
                                        final myFormat = NumberFormat.decimalPatternDigits(
                                          locale: 'en_us',
                                          decimalDigits: 2,
                                        );
                                        final singleCard = _balanceStore.cards[_historyPageStore.cardHistoryIndex];
                                        final formattedAddress = getSplitAddress(singleCard.address);

                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(image: singleCard.color.image.image().image),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 10,
                                                        spreadRadius: 5,
                                                        color: Colors.grey.withOpacity(0.2),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Gap(10),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      singleCard.name,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: FontFamily.redHatMedium,
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
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '\$${myFormat.format((singleCard.data!.balance - singleCard.data!.spentTxoSum) / 100000000 * data!.price)}',
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: FontFamily.redHatMedium,
                                                    color: AppColors.textHintsColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                if (_balanceStore.cards.length > 1)
                                                  const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColors.textHintsColor,
                                                  ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                );
                        },
                      ),
                    ),
                  if (_balanceStore.bars.isEmpty)
                    const SizedBox()
                  else
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Observer(
                        builder: (_) {
                          return _marketPageStore.singleCoin?.result == null
                              ? const HistoryDropdownShimmer()
                              : ScaleTap(
                                  onPressed: _balanceStore.bars.length > 1
                                      ? () {
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
                                                    Observer(
                                                      builder: (context) {
                                                        return ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: _balanceStore.bars.length,
                                                          itemBuilder: (context, index) {
                                                            final bar = _balanceStore.bars[index];
                                                            final formattedAddress = getSplitAddress(bar.address);
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
                                                                      ..setBarHistoryIndex(index)
                                                                      ..setBarSelectedAddress(
                                                                        _balanceStore
                                                                            .bars[_historyPageStore.barHistoryIndex]
                                                                            .address,
                                                                      )
                                                                      ..getSingleBarHistory(
                                                                        address: _balanceStore
                                                                            .bars[_historyPageStore.barHistoryIndex]
                                                                            .address,
                                                                      );
                                                                    router.pop();
                                                                  },
                                                                  child: Container(
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(8),
                                                                      color: _historyPageStore.barHistoryIndex == index
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
                                                                                    image:
                                                                                        bar.color.image.image().image,
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
                                                                                      fontFamily:
                                                                                          FontFamily.redHatMedium,
                                                                                      fontSize: 15,
                                                                                      color: AppColors.primary,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    formattedAddress,
                                                                                    style: const TextStyle(
                                                                                      fontFamily:
                                                                                          FontFamily.redHatMedium,
                                                                                      fontSize: 14,
                                                                                      color: AppColors.textHintsColor,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Text(
                                                                            '\$${myFormat.format((bar.data!.balance - bar.data!.spentTxoSum) / 100000000 * data!.price)}',
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
                                            },
                                          );
                                        }
                                      : null,
                                  child: Container(
                                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                                    child: Observer(
                                      builder: (_) {
                                        final data = _marketPageStore.singleCoin?.result.first;
                                        final myFormat = NumberFormat.decimalPatternDigits(
                                          locale: 'en_us',
                                          decimalDigits: 2,
                                        );
                                        final singleCard = _balanceStore.bars[_historyPageStore.barHistoryIndex];
                                        final formattedAddress = getSplitAddress(singleCard.address);

                                        return Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 25,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(image: singleCard.color.image.image().image),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 10,
                                                        spreadRadius: 5,
                                                        color: Colors.grey.withOpacity(0.2),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Gap(10),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Text(
                                                      singleCard.name,
                                                      style: const TextStyle(
                                                        fontSize: 15,
                                                        fontFamily: FontFamily.redHatMedium,
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
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Text(
                                                  '\$${myFormat.format((singleCard.data!.balance - singleCard.data!.spentTxoSum) / 100000000 * data!.price)}',
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: FontFamily.redHatMedium,
                                                    color: AppColors.textHintsColor,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                if (_balanceStore.bars.length > 1)
                                                  const Icon(
                                                    Icons.keyboard_arrow_down,
                                                    color: AppColors.textHintsColor,
                                                  ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                );
                        },
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          CardsHistoryPage(
            balanceStore: _balanceStore,
            historyPageStore: _historyPageStore,
            scrollController: _scrollController,
          ),
          BarsHistoryPage(
            balanceStore: _balanceStore,
            historyPageStore: _historyPageStore,
            scrollController: _scrollController,
          ),
        ],
      ),
    );
  }
}
