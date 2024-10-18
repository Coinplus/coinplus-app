import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/history_model/transaction_model.dart';
import '../../../utils/date_formatter.dart';

class HistoryInfoModal extends StatelessWidget {
  const HistoryInfoModal({super.key, required this.transaction});

  final TransactionItem transaction;

  @override
  Widget build(BuildContext context) {
    final myFormat = NumberFormat.decimalPatternDigits(
      locale: 'en_us',
      decimalDigits: 2,
    );
    final formattedDate = formatDateString(
      transaction.date!,
    );
    final totalWorth = transaction.transactions?[0].items.fold<double>(
      0,
      (previousValue, item) => previousValue + item.totalWorth,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 20,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Assets.icons.notch.image(
            height: 4,
          ),
          const Gap(
            28,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              transaction.type.toString(),
              style: const TextStyle(
                fontFamily: FontFamily.redHatMedium,
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ).expandedHorizontally(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Text(
              formattedDate,
              style: const TextStyle(
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
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 5,
                  blurRadius: 10,
                  color: Colors.grey.withOpacity(0.1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 16,
              ),
              child: Row(
                children: [
                  SizedBox(
                    height: 32,
                    width: 32,
                    child: CachedNetworkImage(
                      imageUrl: transaction.mainContent!.coinIcons.first,
                      placeholder: (context, url) => Container(
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
                  const Gap(10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Row(
                        children: [
                          Text(
                            '\$${myFormat.format(totalWorth)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamily.redHatMedium,
                              fontSize: 16,
                              color: Color(
                                0xFF838995,
                              ),
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
                              color: Color(
                                0xFF838995,
                              ),
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
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
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
  }
}
