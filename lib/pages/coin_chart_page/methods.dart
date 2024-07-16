import 'package:fl_chart/fl_chart.dart';

import '../../../constants/chart_period_enum.dart';
import '../../../models/coins_dto/coin_model.dart';
import '../../../store/market_page_store/market_page_store.dart';
import '../../../utils/date_formatter.dart';

Future<void> timeStamp({
  required MarketPageStore marketPageStore,
}) async {
  if (marketPageStore.touchedXValue != null) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(
      marketPageStore.touchedXValue!.toInt() * 1000,
    );
    final formatter = priceChangeDateFormatter(dateTime.toString());
    marketPageStore.setChartDateTime(dateTime: formatter);
  }
}

Future<void> priceChange({
  required List<List<num>> chartPoints,
  required FlSpot touchedSpot,
  required MarketPageStore marketPageStore,
}) async {
  if (chartPoints.isEmpty) {
    return;
  }
  final firstPrice = chartPoints[0][1];
  final touchedPrice = touchedSpot.y;
  final percentageChange = ((touchedPrice - firstPrice) / firstPrice) * 100;
  marketPageStore.setPercents(percents: percentageChange);
}

Future<void> onRefresh({
  required MarketPageStore marketPageStore,
  required CoinResultModel data,
}) async {
  if (marketPageStore.chartEnum == ChartEnum.ONE_DAY) {
    await marketPageStore.getChartData(
      coinId: data.id,
      period: '24h',
      data: data,
    );
  }
}
