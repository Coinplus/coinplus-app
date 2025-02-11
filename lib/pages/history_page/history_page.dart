import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../constants/card_color.dart';
import '../../constants/card_record.dart';
import '../../extensions/extensions.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../modals/bar_selection_modal/bar_selection_modal.dart';
import '../../modals/card_selection_modal/card_selection_modal.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../services/amplitude_service.dart';
import '../../services/ramp_service.dart';
import '../../store/accelerometer_store/accelerometer_store.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/history_page_store/history_page_store.dart';
import '../../store/market_page_store/market_page_store.dart';
import '../../utils/data_utils.dart';
import '../../widgets/card_and_bar_tab/card_and_bar_tab.dart';
import '../../widgets/shimmers/history_dropdown_shimmer.dart';
import '../wallet_page/tab_controller_listener/tab_controller_listener.dart';
import 'bars_history_tab/bars_history_page.dart';
import 'cards_history_tab/cards_history_page.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({
    super.key,
    required this.onChangeCard,
  });

  final CardChangeCallBack onChangeCard;

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with TickerProviderStateMixin {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  AccelerometerStore get _accelerometerStore => GetIt.I<AccelerometerStore>();

  RampService get _rampService => GetIt.I<RampService>();

  final _scrollController = ScrollController();
  late final _tabController = TabController(
    length: 2,
    initialIndex: _historyPageStore.tabIndex == 0 ? 0 : 1,
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    tabControllerListener(
      balanceStore: _balanceStore,
      barCarouselIndex: barCarouselIndex,
      cardCarouselIndex: cardCarouselIndex,
      historyPageStore: _historyPageStore,
      onChangeCard: widget.onChangeCard,
      rampService: _rampService,
      tabController: _tabController,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
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
                ReactionBuilder(
                  builder: (context) {
                    return reaction(
                      (p0) => _historyPageStore.tabIndex,
                      (p1) => _tabController.animateTo(p1),
                    );
                  },
                  child: CardAndBarTab(
                    tabController: _tabController,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: [
                if (_balanceStore.cards.isEmpty)
                  const SizedBox()
                else
                  Observer(
                    builder: (_) {
                      return _marketPageStore.singleCoin?.result == null
                          ? const Padding(
                              padding: EdgeInsets.only(left: 28, right: 28, top: 14),
                              child: HistoryDropdownShimmer(),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 28),
                              child: ScaleTap(
                                enableFeedback: false,
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
                                            return CardSelectionModal(
                                              balanceStore: _balanceStore,
                                              marketPageStore: _marketPageStore,
                                              historyPageStore: _historyPageStore,
                                            );
                                          },
                                        );
                                        recordAmplitudeEventPartTwo(
                                          const SelectWalletClicked(
                                            walletType: 'card',
                                          ),
                                        );
                                      }
                                    : null,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
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
                                                  image: DecorationImage(
                                                    image: singleCard.color.image.image().image,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 10,
                                                      spreadRadius: 5,
                                                      color: Colors.grey.withValues(alpha: 0.2),
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
                                              Observer(
                                                builder: (context) {
                                                  return _accelerometerStore.hasPerformedAction
                                                      ? Text(
                                                          r'$*****',
                                                          style: TextStyle(
                                                            fontSize:
                                                                singleCard.finalBalance.toString().length > 9 ? 17 : 20,
                                                            fontFamily: FontFamily.redHatMedium,
                                                            color: AppColors.textHintsColor,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                        )
                                                      : Text(
                                                          '\$${myFormat.format((singleCard.finalBalance ?? 0) / 100000000 * data!.price)}',
                                                          style: TextStyle(
                                                            fontSize:
                                                                singleCard.finalBalance.toString().length > 9 ? 17 : 20,
                                                            fontFamily: FontFamily.redHatMedium,
                                                            color: AppColors.textHintsColor,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                        );
                                                },
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
                              ),
                            );
                    },
                  ),
                if (_balanceStore.bars.isEmpty)
                  const SizedBox()
                else
                  Observer(
                    builder: (_) {
                      return _marketPageStore.singleCoin?.result == null
                          ? const Padding(
                              padding: EdgeInsets.only(left: 28, right: 28, top: 14),
                              child: HistoryDropdownShimmer(),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 28),
                              child: ScaleTap(
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
                                            return BarSelectionModal(
                                              balanceStore: _balanceStore,
                                              marketPageStore: _marketPageStore,
                                              historyPageStore: _historyPageStore,
                                            );
                                          },
                                        );
                                        recordAmplitudeEventPartTwo(
                                          const SelectWalletClicked(
                                            walletType: 'bar',
                                          ),
                                        );
                                      }
                                    : null,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
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
                                                  image: DecorationImage(
                                                    image: singleCard.color.image.image().image,
                                                  ),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      blurRadius: 10,
                                                      spreadRadius: 5,
                                                      color: Colors.grey.withValues(alpha: 0.2),
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
                                              Observer(
                                                builder: (context) {
                                                  return _accelerometerStore.hasPerformedAction
                                                      ? Text(
                                                          r'$*****',
                                                          style: TextStyle(
                                                            fontSize:
                                                                singleCard.finalBalance.toString().length > 9 ? 17 : 20,
                                                            fontFamily: FontFamily.redHatMedium,
                                                            color: AppColors.textHintsColor,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                        )
                                                      : Text(
                                                          '\$${myFormat.format((singleCard.finalBalance ?? 0) / 100000000 * data!.price)}',
                                                          style: TextStyle(
                                                            fontSize:
                                                                singleCard.finalBalance.toString().length > 9 ? 17 : 20,
                                                            fontFamily: FontFamily.redHatMedium,
                                                            color: AppColors.textHintsColor,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                        );
                                                },
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
                              ),
                            );
                    },
                  ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                CardsHistoryPage(
                  scrollController: _scrollController,
                ),
                BarsHistoryPage(
                  balanceStore: _balanceStore,
                  scrollController: _scrollController,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
