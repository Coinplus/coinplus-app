import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../constants/card_color.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/market_page_store/market_page_store.dart';
import '../../utils/data_utils.dart';
import '../../utils/date_formatter.dart';
import '../../widgets/shimmers/history_dropdown_shimmer.dart';
import '../../widgets/shimmers/history_page_shimmer.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> with TickerProviderStateMixin {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  String? selectedValue;

  final _scrollController = ScrollController();

  late final _tabController = TabController(
    length: 2,
    vsync: this,
  );

  @override
  void initState() {
    super.initState();
    if (_balanceStore.cards.isNotEmpty) {
      selectedValue = _balanceStore.cards.first.address;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 140,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Column(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Observer(
                builder: (_) {
                  return _marketPageStore.singleCoin?.result == null
                      ? const HistoryDropdownShimmer()
                      : ScaleTap(
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
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Gap(10),
                                    Assets.icons.notch.image(height: 4),
                                    ListView.builder(
                                      itemCount: _balanceStore.cards.length,
                                      itemBuilder: (context, index) {
                                        return;
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: Observer(
                              builder: (_) {
                                final data = _marketPageStore.singleCoin?.result.first;
                                final myFormat = NumberFormat.decimalPatternDigits(
                                  locale: 'en_us',
                                  decimalDigits: 2,
                                );
                                final singleCard = _balanceStore.cards.first;
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
                                    Gap(context.width * 0.15),
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
      backgroundColor: Colors.white,
      body: RefreshIndicator(
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        color: Colors.black,
        onRefresh: () async {
          await HapticFeedback.mediumImpact();
          await _balanceStore.getHistory();
        },
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Observer(
            builder: (context) {
              return _balanceStore.historyLoading == true
                  ? const Padding(
                      padding: EdgeInsets.all(8),
                      child: HistoryPageShimmer(),
                    )
                  : Observer(
                      builder: (context) {
                        final transactions = _balanceStore.cardHistories[selectedValue]?.result;
                        if (transactions == null) {
                          return const Padding(
                            padding: EdgeInsets.all(8),
                            child: HistoryPageShimmer(),
                          );
                        }
                        final uniqueDates =
                            transactions.map((transaction) => formatDate(transaction.date.toString())).toSet().toList();
                        return ListView.builder(
                          shrinkWrap: true,
                          controller: _scrollController,
                          itemCount: uniqueDates.length + 1,
                          itemBuilder: (context, dateIndex) {
                            if (dateIndex == uniqueDates.length) {
                              return const SizedBox(
                                height: 100,
                              );
                            }
                            final currentDate = uniqueDates[dateIndex];
                            final transactionsOfDay = transactions
                                .where((transaction) => formatDate(transaction.date.toString()) == currentDate)
                                .toList();

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 29, vertical: 10),
                                  child: Text(
                                    currentDate,
                                    style: const TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      fontSize: 13,
                                      color: AppColors.textHintsColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 10,
                                          color: Colors.grey.withOpacity(0.1),
                                        ),
                                      ],
                                    ),
                                    child: Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      clipBehavior: Clip.hardEdge,
                                      child: ListView.separated(
                                        separatorBuilder: (_, __) => Divider(
                                          color: Colors.grey.withOpacity(0.2),
                                          height: 0,
                                        ),
                                        shrinkWrap: true,
                                        physics: const NeverScrollableScrollPhysics(),
                                        itemCount: transactionsOfDay.length,
                                        itemBuilder: (context, index) {
                                          final transaction = transactionsOfDay[index];
                                          final totalWorth = transaction.transactions?[0].items.fold<double>(
                                            0,
                                            (previousValue, item) => previousValue + item.totalWorth,
                                          );
                                          final myFormat = NumberFormat.decimalPatternDigits(
                                            locale: 'en_us',
                                            decimalDigits: 2,
                                          );
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 7),
                                            child: ListTile(
                                              minLeadingWidth: 5,
                                              leading: Padding(
                                                padding: const EdgeInsets.only(top: 12, bottom: 12),
                                                child: CachedNetworkImage(
                                                  imageUrl: transaction.mainContent!.coinIcons.first,
                                                  placeholder: (context, url) => Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(20),
                                                      color: Colors.transparent,
                                                    ),
                                                    child: SizedBox(
                                                      height: 30,
                                                      width: 30,
                                                      child: CircularProgressIndicator(
                                                        color: Colors.grey.withOpacity(0.5),
                                                        strokeWidth: 2,
                                                      ),
                                                    ),
                                                  ),
                                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                                ),
                                              ),
                                              title: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        transaction.type.toString(),
                                                        style: const TextStyle(
                                                          fontFamily: FontFamily.redHatMedium,
                                                          fontSize: 15,
                                                          color: AppColors.primaryTextColor,
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                      const SizedBox(width: 2),
                                                      if (transaction.type != 'Sent')
                                                        Assets.icons.outbound.image(height: 20)
                                                      else
                                                        Assets.icons.outboundRed.image(height: 20),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize: MainAxisSize.min,
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        transaction.type != 'Sent'
                                                            ? '+${transaction.coinData!.count.toStringAsFixed(8)} BTC'
                                                            : '${transaction.coinData!.count.toStringAsFixed(8)} BTC',
                                                        style: TextStyle(
                                                          fontFamily: FontFamily.redHatMedium,
                                                          fontSize: 16,
                                                          color: transaction.type != 'Sent' ? Colors.green : Colors.red,
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                      Text(
                                                        '\$${myFormat.format(totalWorth)}',
                                                        style: const TextStyle(
                                                          fontWeight: FontWeight.w500,
                                                          fontFamily: FontFamily.redHatMedium,
                                                          fontSize: 16,
                                                          color: Color(0xFF838995),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
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
                        );
                      },
                    );
            },
          ),
        ),
      ),
    );
  }
}
