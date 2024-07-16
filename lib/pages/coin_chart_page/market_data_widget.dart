import 'package:flutter/material.dart';

import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../utils/number_formatter.dart';
import 'coin_chart_page.dart';

class MarketCapData extends StatelessWidget {
  const MarketCapData({
    super.key,
    required this.widget,
  });

  final CoinChartPage widget;

  @override
  Widget build(BuildContext context) {
    final formattedMarketCap =
        formatNumberToBillions(widget.data!.marketCap.toDouble());
    final formattedVolume =
        formatNumberToBillions(widget.data!.volume.toDouble());
    final formattedAvailableSupply = formatNumberBillions(
      widget.data!.availableSupply.toDouble(),
    );
    final formattedTotalSupply = formatNumberBillions(
      widget.data!.totalSupply.toDouble(),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Card(
        color: const Color(0xFFF7F7FA),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            ListTile(
              minLeadingWidth: 10,
              title: Text(
                'Market Cap',
                style: TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  fontSize: 13,
                  color: AppColors.textHintsColor.withOpacity(0.8),
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Text(
                formattedMarketCap,
                style: TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  color: AppColors.primary.withOpacity(0.8),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Divider(
              height: 1,
              indent: 5,
              endIndent: 5,
              thickness: 1,
              color: Colors.grey.withOpacity(0.1),
            ),
            ListTile(
              minLeadingWidth: 10,
              title: Text(
                '24h Volume',
                style: TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  fontSize: 13,
                  color: AppColors.textHintsColor.withOpacity(0.8),
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Text(
                formattedVolume,
                style: TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  color: AppColors.primary.withOpacity(0.8),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Divider(
              height: 1,
              indent: 5,
              endIndent: 5,
              thickness: 1,
              color: Colors.grey.withOpacity(0.1),
            ),
            ListTile(
              minLeadingWidth: 10,
              title: Text(
                'Available Supply',
                style: TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  fontSize: 13,
                  color: AppColors.textHintsColor.withOpacity(0.8),
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Text(
                '$formattedAvailableSupply coins',
                style: TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  color: AppColors.primary.withOpacity(0.8),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Divider(
              height: 1,
              indent: 5,
              endIndent: 5,
              thickness: 1,
              color: Colors.grey.withOpacity(0.1),
            ),
            ListTile(
              minLeadingWidth: 10,
              title: Text(
                'Total Supply',
                style: TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  fontSize: 13,
                  color: AppColors.textHintsColor.withOpacity(0.8),
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: Text(
                '$formattedTotalSupply coins',
                style: TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  color: AppColors.primary.withOpacity(0.8),
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
