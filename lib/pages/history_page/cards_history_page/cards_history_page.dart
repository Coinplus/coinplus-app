import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';

import '../../../extensions/elevated_button_extensions.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../services/amplitude_service.dart';
import '../../../utils/date_formatter.dart';
import '../../../widgets/loading_button/loading_button.dart';
import '../../../widgets/shimmers/history_page_shimmer.dart';
// import '../pending_transaction_widget/pending_transaction_widget.dart';
import 'card_history_list_state.dart';
import 'card_history_refresh_button.dart';

class CardsHistoryPage extends StatefulWidget {
  const CardsHistoryPage({
    super.key,
    required this.scrollController,
  });

  final ScrollController scrollController;

  @override
  State<CardsHistoryPage> createState() => _CardsHistoryPageState();
}

class _CardsHistoryPageState extends State<CardsHistoryPage>
    with TickerProviderStateMixin {
  final state = CardHistoryListState();

  late var _controller = AnimationController(vsync: this);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    if (state.historyPageStore.isCardRefreshing) {
      _controller.repeat();
    }
    if (state.balanceStore.cards.isNotEmpty) {
      state.loadCardWalletStatusFromStorage(
        state.balanceStore.cards[state.historyPageStore.cardHistoryIndex]
            .address,
      );
    }
    state.historyPageStore
      ..loadLastRefreshed()
      ..cardCurrentPage = 1;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (context) {
        return reaction((p0) => state.historyPageStore.isCardRefreshing,
            (isCardRefreshing) async {
          if (!isCardRefreshing) {
            _controller
              ..stop()
              ..reset();
            await state.loadCardWalletStatusFromStorage(
              state.balanceStore.cards[state.historyPageStore.cardHistoryIndex]
                  .address,
            );
          }
        });
      },
      child: state.balanceStore.cards.isEmpty
          ? Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  const Gap(148),
                  Lottie.asset(
                    height: 112,
                    width: 112,
                    'assets/lottie_animations/animated_logo.json',
                  ),
                  const Gap(32),
                  const Text(
                    "You don't have a connected card",
                    style: TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              controller: widget.scrollController,
              physics: const AlwaysScrollableScrollPhysics(),
              child: Stack(
                children: [
                  Observer(
                    builder: (context) {
                      return (state.historyPageStore.cardHistories[state
                                  .balanceStore
                                  .cards[
                                      state.historyPageStore.cardHistoryIndex]
                                  .address] ==
                              null
                          ? const Padding(
                              padding: EdgeInsets.all(8),
                              child: HistoryPageShimmer(),
                            )
                          : Observer(
                              builder: (context) {
                                if (state.historyPageStore.historyLoading ==
                                    true) {
                                  return const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: HistoryPageShimmer(),
                                  );
                                }
                                if (state.historyPageStore.cardsTransactions!
                                    .isEmpty) {
                                  return Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Column(
                                      children: [
                                        const Gap(148),
                                        Lottie.asset(
                                          height: 112,
                                          width: 112,
                                          'assets/lottie_animations/animated_logo.json',
                                        ),
                                        const Gap(32),
                                        const Column(
                                          children: [
                                            Center(
                                              child: Text(
                                                'No Transactions Yet',
                                                style: TextStyle(
                                                  fontFamily:
                                                      FontFamily.redHatMedium,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: AppColors.primary,
                                                ),
                                              ),
                                            ),
                                            Gap(10),
                                            Center(
                                              child: Text(
                                                'Make your first transaction to see your \nactivity here.',
                                                style: TextStyle(
                                                  fontFamily:
                                                      FontFamily.redHatMedium,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors.primary,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Gap(300),
                                      ],
                                    ),
                                  );
                                }
                                return Column(
                                  children: [
                                    // const PendingTransactionWidget(),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      controller: widget.scrollController,
                                      itemCount: state.historyPageStore
                                              .cardUniqueDates!.length +
                                          1,
                                      itemBuilder: (context, dateIndex) {
                                        if (dateIndex ==
                                            state.historyPageStore
                                                .cardUniqueDates?.length) {
                                          if (state.historyPageStore
                                                  .cardsTransactions!.length <=
                                              19) {
                                            return const SizedBox(height: 100);
                                          }
                                          return Observer(
                                            builder: (context) {
                                              return state.historyPageStore
                                                      .isLoading
                                                  ? const Padding(
                                                      padding:
                                                          EdgeInsets.all(8),
                                                      child:
                                                          HistoryPageShimmer(),
                                                    )
                                                  : Center(
                                                      child: Column(
                                                        children: [
                                                          const Gap(10),
                                                          LoadingButton(
                                                            style: context.theme
                                                                .buttonStyle(
                                                                  textStyle:
                                                                      const TextStyle(
                                                                    fontFamily:
                                                                        FontFamily
                                                                            .redHatMedium,
                                                                    color: AppColors
                                                                        .primaryTextColor,
                                                                    fontSize:
                                                                        15,
                                                                  ),
                                                                )
                                                                .copyWith(
                                                                  backgroundColor:
                                                                      WidgetStateProperty
                                                                          .all(
                                                                    Colors.grey
                                                                        .withOpacity(
                                                                      0.1,
                                                                    ),
                                                                  ),
                                                                  shape:
                                                                      const WidgetStatePropertyAll(
                                                                    RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .all(
                                                                        Radius
                                                                            .circular(
                                                                          15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  padding:
                                                                      WidgetStateProperty
                                                                          .all(
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                      vertical:
                                                                          5,
                                                                    ),
                                                                  ),
                                                                ),
                                                            onPressed: () {
                                                              state
                                                                  .historyPageStore
                                                                  .fetchCardNextPageTransactions(
                                                                address: state
                                                                    .historyPageStore
                                                                    .selectedCardAddress,
                                                              );
                                                              recordAmplitudeEventPartTwo(
                                                                const LoadTransactionClicked(),
                                                              );
                                                            },
                                                            child: const Text(
                                                              'Load More',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    FontFamily
                                                                        .redHatMedium,
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              ),
                                                            ),
                                                          ).paddingHorizontal(
                                                            150,
                                                          ),
                                                          const Gap(100),
                                                        ],
                                                      ),
                                                    );
                                            },
                                          );
                                        }
                                        final currentDate = state
                                            .historyPageStore
                                            .cardUniqueDates?[dateIndex];
                                        final transactionsOfDay = state
                                            .historyPageStore.cardsTransactions
                                            ?.where(
                                              (transaction) =>
                                                  formatDate(
                                                    transaction.date.toString(),
                                                  ) ==
                                                  currentDate,
                                            )
                                            .toList();
                                        return Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 29,
                                                vertical: 10,
                                              ),
                                              child: Text(
                                                currentDate!,
                                                style: const TextStyle(
                                                  fontFamily:
                                                      FontFamily.redHatMedium,
                                                  fontSize: 13,
                                                  color:
                                                      AppColors.textHintsColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 5,
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      spreadRadius: 2,
                                                      blurRadius: 10,
                                                      color: Colors.grey
                                                          .withOpacity(0.1),
                                                    ),
                                                  ],
                                                ),
                                                child: Card(
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      20,
                                                    ),
                                                  ),
                                                  clipBehavior: Clip.hardEdge,
                                                  child: ListView.separated(
                                                    separatorBuilder: (_, __) =>
                                                        Divider(
                                                      color: Colors.grey
                                                          .withOpacity(0.2),
                                                      height: 0,
                                                    ),
                                                    shrinkWrap: true,
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    itemCount:
                                                        transactionsOfDay!
                                                            .length,
                                                    itemBuilder:
                                                        (context, index) {
                                                      final transaction =
                                                          transactionsOfDay[
                                                              index];
                                                      final totalWorth =
                                                          transaction
                                                              .transactions?[0]
                                                              .items
                                                              .fold<double>(
                                                        0,
                                                        (previousValue, item) =>
                                                            previousValue +
                                                            item.totalWorth,
                                                      );
                                                      final myFormat = NumberFormat
                                                          .decimalPatternDigits(
                                                        locale: 'en_us',
                                                        decimalDigits: 2,
                                                      );
                                                      return GestureDetector(
                                                        onTap: () {
                                                          recordAmplitudeEventPartTwo(
                                                            const TransactionClicked(),
                                                          );
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                            vertical: 7,
                                                          ),
                                                          child: ScaleTap(
                                                            enableFeedback:
                                                                false,
                                                            scaleMinValue: 0.99,
                                                            onPressed: () {
                                                              showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .white,
                                                                shape:
                                                                    const RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                      20,
                                                                    ),
                                                                    topRight: Radius
                                                                        .circular(
                                                                      20,
                                                                    ),
                                                                  ),
                                                                ),
                                                                context:
                                                                    context,
                                                                builder: (_) {
                                                                  final formattedDate =
                                                                      formatDateString(
                                                                    transaction
                                                                        .date!,
                                                                  );
                                                                  return Padding(
                                                                    padding:
                                                                        const EdgeInsets
                                                                            .symmetric(
                                                                      vertical:
                                                                          12,
                                                                      horizontal:
                                                                          20,
                                                                    ),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Assets
                                                                            .icons
                                                                            .notch
                                                                            .image(
                                                                          height:
                                                                              4,
                                                                        ),
                                                                        const Gap(
                                                                          28,
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                10,
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            transaction.type.toString(),
                                                                            style:
                                                                                const TextStyle(
                                                                              fontFamily: FontFamily.redHatMedium,
                                                                              fontSize: 17,
                                                                              fontWeight: FontWeight.w600,
                                                                              color: AppColors.primary,
                                                                            ),
                                                                          ).expandedHorizontally(),
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                10,
                                                                          ),
                                                                          child:
                                                                              Text(
                                                                            formattedDate,
                                                                            style:
                                                                                const TextStyle(
                                                                              fontFamily: FontFamily.redHatMedium,
                                                                              color: Color(0xFF838995),
                                                                              fontSize: 12,
                                                                            ),
                                                                          ).expandedHorizontally(),
                                                                        ),
                                                                        const Gap(
                                                                          17,
                                                                        ),
                                                                        Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius:
                                                                                BorderRadius.circular(20),
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                spreadRadius: 5,
                                                                                blurRadius: 10,
                                                                                color: Colors.grey.withOpacity(0.1),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                const EdgeInsets.symmetric(
                                                                              horizontal: 12,
                                                                              vertical: 16,
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              children: [
                                                                                SizedBox(
                                                                                  height: 32,
                                                                                  width: 32,
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
                                                                                const Gap(10),
                                                                                Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      transaction.type != 'Sent' ? '+${transaction.coinData!.count.toStringAsFixed(8)} BTC' : '${transaction.coinData!.count.toStringAsFixed(8)} BTC',
                                                                                      style: TextStyle(
                                                                                        fontFamily: FontFamily.redHatMedium,
                                                                                        fontSize: 16,
                                                                                        color: transaction.type != 'Sent' ? Colors.green : Colors.red,
                                                                                        fontWeight: FontWeight.w700,
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          '\$${myFormat.format(totalWorth)}',
                                                                                          style: const TextStyle(
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontFamily: FontFamily.redHatMedium,
                                                                                            fontSize: 16,
                                                                                            color: Color(0xFF838995),
                                                                                          ),
                                                                                        ),
                                                                                        Text(
                                                                                          ' (1 BTC = \$${myFormat.format(
                                                                                            (totalWorth! / transaction.coinData!.count).abs(),
                                                                                          )})',
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
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        const Gap(
                                                                          24,
                                                                        ),
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                10,
                                                                          ),
                                                                          child:
                                                                              Column(
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  const Text(
                                                                                    'Total worth',
                                                                                    style: TextStyle(
                                                                                      fontFamily: FontFamily.redHatMedium,
                                                                                      fontSize: 14,
                                                                                      color: AppColors.primary,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    '\$${myFormat.format(totalWorth)}',
                                                                                    style: const TextStyle(
                                                                                      fontWeight: FontWeight.w700,
                                                                                      fontFamily: FontFamily.redHatMedium,
                                                                                      fontSize: 16,
                                                                                      color: AppColors.primary,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              const Divider(
                                                                                height: 30,
                                                                                thickness: 1,
                                                                                color: Color(0xFFEEEFF4),
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  const Text(
                                                                                    'Current value',
                                                                                    style: TextStyle(
                                                                                      fontFamily: FontFamily.redHatMedium,
                                                                                      fontSize: 14,
                                                                                      color: AppColors.primary,
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    '\$${myFormat.format(
                                                                                      transaction.profitLoss?.currentValue,
                                                                                    )}',
                                                                                    style: const TextStyle(
                                                                                      fontWeight: FontWeight.w700,
                                                                                      fontFamily: FontFamily.redHatMedium,
                                                                                      fontSize: 16,
                                                                                      color: AppColors.primary,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        const Gap(
                                                                          50,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: ListTile(
                                                              minLeadingWidth:
                                                                  5,
                                                              leading: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                  top: 12,
                                                                  bottom: 12,
                                                                ),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl: transaction
                                                                      .mainContent!
                                                                      .coinIcons
                                                                      .first,
                                                                  placeholder: (
                                                                    context,
                                                                    url,
                                                                  ) =>
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                        20,
                                                                      ),
                                                                      color: Colors
                                                                          .transparent,
                                                                    ),
                                                                    child:
                                                                        SizedBox(
                                                                      height:
                                                                          30,
                                                                      width: 30,
                                                                      child:
                                                                          CircularProgressIndicator(
                                                                        color: Colors
                                                                            .grey
                                                                            .withOpacity(
                                                                          0.5,
                                                                        ),
                                                                        strokeWidth:
                                                                            2,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  errorWidget: (
                                                                    context,
                                                                    url,
                                                                    error,
                                                                  ) =>
                                                                      const Icon(
                                                                    Icons.error,
                                                                  ),
                                                                ),
                                                              ),
                                                              title: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        transaction
                                                                            .type
                                                                            .toString(),
                                                                        style:
                                                                            const TextStyle(
                                                                          fontFamily:
                                                                              FontFamily.redHatMedium,
                                                                          fontSize:
                                                                              15,
                                                                          color:
                                                                              AppColors.primaryTextColor,
                                                                          fontWeight:
                                                                              FontWeight.w700,
                                                                        ),
                                                                      ),
                                                                      const SizedBox(
                                                                        width:
                                                                            2,
                                                                      ),
                                                                      if (transaction
                                                                              .type !=
                                                                          'Sent')
                                                                        Assets
                                                                            .icons
                                                                            .outbound
                                                                            .image(
                                                                          height:
                                                                              20,
                                                                        )
                                                                      else
                                                                        Assets
                                                                            .icons
                                                                            .outboundRed
                                                                            .image(
                                                                          height:
                                                                              20,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                  Observer(
                                                                    builder:
                                                                        (context) {
                                                                      return state
                                                                              .hasPerformedAction
                                                                          ? Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Text(
                                                                                  transaction.type != 'Sent' ? '***** BTC' : '***** BTC',
                                                                                  style: TextStyle(
                                                                                    fontFamily: FontFamily.redHatMedium,
                                                                                    fontSize: 16,
                                                                                    color: transaction.type != 'Sent' ? Colors.green : Colors.red,
                                                                                    fontWeight: FontWeight.w700,
                                                                                  ),
                                                                                ),
                                                                                const Text(
                                                                                  r'$*****',
                                                                                  style: TextStyle(
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontFamily: FontFamily.redHatMedium,
                                                                                    fontSize: 16,
                                                                                    color: Color(0xFF838995),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            )
                                                                          : Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                              children: [
                                                                                Text(
                                                                                  transaction.type != 'Sent' ? '+${transaction.coinData!.count.toStringAsFixed(8)} BTC' : '${transaction.coinData!.count.toStringAsFixed(8)} BTC',
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
                                                                            );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
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
                                  ],
                                );
                              },
                            ));
                    },
                  ),
                  CardHistoryRefreshButton(
                    controller: _controller,
                  ),
                ],
              ),
            ),
    );
  }
}
