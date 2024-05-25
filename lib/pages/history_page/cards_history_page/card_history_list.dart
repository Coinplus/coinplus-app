import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';

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
import '../pending_transaction_widget/pending_transaction_widget.dart';
import 'card_history_list_state.dart';
import 'transaction_history_info_modal.dart';

class CardHistoryList extends StatelessWidget {
  const CardHistoryList({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final state = CardHistoryListState();
    return Column(
      children: [
        const PendingTransactionWidget(),
        ListView.builder(
          shrinkWrap: true,
          controller: scrollController,
          itemCount: state.historyPageStore.cardUniqueDates!.length + 1,
          itemBuilder: (context, dateIndex) {
            if (dateIndex == state.historyPageStore.cardUniqueDates?.length) {
              if (state.historyPageStore.cardsTransactions!.length <= 19) {
                return const SizedBox(height: 100);
              }
              return Observer(
                builder: (context) {
                  return state.historyPageStore.isLoading
                      ? const Padding(
                          padding: EdgeInsets.all(8),
                          child: HistoryPageShimmer(),
                        )
                      : Center(
                          child: Column(
                            children: [
                              const Gap(10),
                              LoadingButton(
                                style: context.theme
                                    .buttonStyle(
                                      textStyle: const TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        color: AppColors.primaryTextColor,
                                        fontSize: 15,
                                      ),
                                    )
                                    .copyWith(
                                      backgroundColor: WidgetStateProperty.all(
                                        Colors.grey.withOpacity(
                                          0.1,
                                        ),
                                      ),
                                      shape: const WidgetStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      padding: WidgetStateProperty.all(
                                        const EdgeInsets.symmetric(
                                          vertical: 5,
                                        ),
                                      ),
                                    ),
                                onPressed: () {
                                  state.getNextPageTransactions();
                                  recordAmplitudeEventPartTwo(
                                    const LoadTransactionClicked(),
                                  );
                                },
                                child: const Text(
                                  'Load More',
                                  style: TextStyle(
                                    fontFamily: FontFamily.redHatMedium,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
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
            final currentDate =
                state.historyPageStore.cardUniqueDates?[dateIndex];
            final transactionsOfDay = state.historyPageStore.cardsTransactions
                ?.where(
                  (transaction) =>
                      formatDate(
                        transaction.date.toString(),
                      ) ==
                      currentDate,
                )
                .toList();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 29,
                    vertical: 10,
                  ),
                  child: Text(
                    currentDate!,
                    style: const TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 13,
                      color: AppColors.textHintsColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 5,
                  ),
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
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: ListView.separated(
                        separatorBuilder: (_, __) => Divider(
                          color: Colors.grey.withOpacity(0.2),
                          height: 0,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: transactionsOfDay!.length,
                        itemBuilder: (context, index) {
                          final transaction = transactionsOfDay[index];
                          final totalWorth =
                              transaction.transactions?[0].items.fold<double>(
                            0,
                            (previousValue, item) =>
                                previousValue + item.totalWorth,
                          );
                          final myFormat = NumberFormat.decimalPatternDigits(
                            locale: 'en_us',
                            decimalDigits: 2,
                          );
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 7,
                            ),
                            child: ScaleTap(
                              enableFeedback: false,
                              scaleMinValue: 0.99,
                              onPressed: () {
                                recordAmplitudeEventPartTwo(
                                  const TransactionClicked(),
                                );
                                showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(
                                        20,
                                      ),
                                      topRight: Radius.circular(
                                        20,
                                      ),
                                    ),
                                  ),
                                  context: context,
                                  builder: (_) {
                                    return HistoryInfoModal(
                                      transaction: transaction,
                                    );
                                  },
                                );
                              },
                              child: ListTile(
                                minLeadingWidth: 5,
                                leading: Padding(
                                  padding: const EdgeInsets.only(
                                    top: 12,
                                    bottom: 12,
                                  ),
                                  child: CachedNetworkImage(
                                    imageUrl: transaction
                                        .mainContent!.coinIcons.first,
                                    placeholder: (
                                      context,
                                      url,
                                    ) =>
                                        Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                          20,
                                        ),
                                        color: Colors.transparent,
                                      ),
                                      child: SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: CircularProgressIndicator(
                                          color: Colors.grey.withOpacity(
                                            0.5,
                                          ),
                                          strokeWidth: 2,
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
                                      MainAxisAlignment.spaceBetween,
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
                                        const SizedBox(
                                          width: 2,
                                        ),
                                        if (transaction.type != 'Sent')
                                          Assets.icons.outbound.image(
                                            height: 20,
                                          )
                                        else
                                          Assets.icons.outboundRed.image(
                                            height: 20,
                                          ),
                                      ],
                                    ),
                                    Observer(
                                      builder: (context) {
                                        return state.hasPerformedAction
                                            ? Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    transaction.type != 'Sent'
                                                        ? '***** BTC'
                                                        : '***** BTC',
                                                    style: TextStyle(
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      fontSize: 16,
                                                      color: transaction.type !=
                                                              'Sent'
                                                          ? Colors.green
                                                          : Colors.red,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  const Text(
                                                    r'$*****',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      fontSize: 16,
                                                      color: Color(0xFF838995),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    transaction.type != 'Sent'
                                                        ? '+${transaction.coinData!.count.toStringAsFixed(8)} BTC'
                                                        : '${transaction.coinData!.count.toStringAsFixed(8)} BTC',
                                                    style: TextStyle(
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      fontSize: 16,
                                                      color: transaction.type !=
                                                              'Sent'
                                                          ? Colors.green
                                                          : Colors.red,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                  Text(
                                                    '\$${myFormat.format(totalWorth)}',
                                                    style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
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
  }
}
