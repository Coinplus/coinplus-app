import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gaimon/gaimon.dart';

import '../../../constants/chart_period_enum.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../store/market_page_store/market_page_store.dart';
import 'coin_chart_page.dart';

class PeriodSelectionTab extends StatelessWidget {
  const PeriodSelectionTab({
    super.key,
    required MarketPageStore marketPageStore,
    required this.widget,
  }) : _marketPageStore = marketPageStore;

  final MarketPageStore _marketPageStore;
  final CoinChartPage widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ScaleTap(
            enableFeedback: false,
            onPressed: () {
              Gaimon.light();
              if (_marketPageStore.chartEnum != ChartEnum.ONE_DAY) {
                _marketPageStore.chartData.clear();
                _marketPageStore
                  ..getChartData(
                    coinId: widget.data!.id,
                    data: widget.data,
                    period: '24h',
                  )
                  ..defaultPercentage(data: widget.data);
              }
              _marketPageStore.onOneDaySelect();
            },
            child: Container(
              width: 48,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _marketPageStore.chartEnum == ChartEnum.ONE_DAY
                    ? Colors.grey.withValues(alpha: 0.2)
                    : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  '1D',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: _marketPageStore.chartEnum == ChartEnum.ONE_DAY ? AppColors.primary : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          ScaleTap(
            enableFeedback: false,
            onPressed: () {
              Gaimon.light();
              if (_marketPageStore.chartEnum != ChartEnum.ONE_WEEK && !_marketPageStore.chartLoading) {
                _marketPageStore.chartData.clear();
                _marketPageStore
                  ..getChartData(
                    coinId: widget.data!.id,
                    data: widget.data,
                    period: '1w',
                  )
                  ..defaultPercentage(data: widget.data);
              }
              _marketPageStore.onOneWeekSelect();
            },
            child: Container(
              width: 48,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _marketPageStore.chartEnum == ChartEnum.ONE_WEEK
                    ? Colors.grey.withValues(alpha: 0.2)
                    : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  '1W',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: _marketPageStore.chartEnum == ChartEnum.ONE_WEEK ? AppColors.primary : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          ScaleTap(
            enableFeedback: false,
            onPressed: () {
              Gaimon.light();
              if (_marketPageStore.chartEnum != ChartEnum.ONE_MONTH && !_marketPageStore.chartLoading) {
                _marketPageStore.chartData.clear();
                _marketPageStore
                  ..getChartData(
                    coinId: widget.data!.id,
                    data: widget.data,
                    period: '1m',
                  )
                  ..defaultPercentage(data: widget.data);
              }
              _marketPageStore.onOneMonthSelect();
            },
            child: Container(
              width: 48,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _marketPageStore.chartEnum == ChartEnum.ONE_MONTH
                    ? Colors.grey.withValues(alpha: 0.2)
                    : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  '1M',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: _marketPageStore.chartEnum == ChartEnum.ONE_MONTH ? AppColors.primary : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          ScaleTap(
            enableFeedback: false,
            onPressed: () {
              Gaimon.light();
              if (_marketPageStore.chartEnum != ChartEnum.THREE_MONTHS && !_marketPageStore.chartLoading) {
                _marketPageStore.chartData.clear();
                _marketPageStore
                  ..getChartData(
                    coinId: widget.data!.id,
                    data: widget.data,
                    period: '3m',
                  )
                  ..defaultPercentage(data: widget.data);
              }
              _marketPageStore.onThreeMonthsSelect();
            },
            child: Container(
              width: 48,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _marketPageStore.chartEnum == ChartEnum.THREE_MONTHS
                    ? Colors.grey.withValues(alpha: 0.2)
                    : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  '3M',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: _marketPageStore.chartEnum == ChartEnum.THREE_MONTHS ? AppColors.primary : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          ScaleTap(
            enableFeedback: false,
            onPressed: () {
              Gaimon.light();
              if (_marketPageStore.chartEnum != ChartEnum.SIX_MONTHS && !_marketPageStore.chartLoading) {
                _marketPageStore.chartData.clear();
                _marketPageStore
                  ..getChartData(
                    coinId: widget.data!.id,
                    data: widget.data,
                    period: '6m',
                  )
                  ..defaultPercentage(data: widget.data);
              }
              _marketPageStore.onSixMonthsSelect();
            },
            child: Container(
              width: 48,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _marketPageStore.chartEnum == ChartEnum.SIX_MONTHS
                    ? Colors.grey.withValues(alpha: 0.2)
                    : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  '6M',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: _marketPageStore.chartEnum == ChartEnum.SIX_MONTHS ? AppColors.primary : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          ScaleTap(
            enableFeedback: false,
            onPressed: () {
              Gaimon.light();
              if (_marketPageStore.chartEnum != ChartEnum.ONE_YEAR && !_marketPageStore.chartLoading) {
                _marketPageStore.chartData.clear();
                _marketPageStore
                  ..getChartData(
                    coinId: widget.data!.id,
                    data: widget.data,
                    period: '1y',
                  )
                  ..defaultPercentage(data: widget.data);
              }
              _marketPageStore.onOneYearSelect();
            },
            child: Container(
              width: 48,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _marketPageStore.chartEnum == ChartEnum.ONE_YEAR
                    ? Colors.grey.withValues(alpha: 0.2)
                    : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  '1Y',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: _marketPageStore.chartEnum == ChartEnum.ONE_YEAR ? AppColors.primary : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          ScaleTap(
            enableFeedback: false,
            onPressed: () {
              Gaimon.light();
              if (_marketPageStore.chartEnum != ChartEnum.ALL && !_marketPageStore.chartLoading) {
                _marketPageStore.chartData.clear();
                _marketPageStore
                  ..getChartData(
                    coinId: widget.data!.id,
                    data: widget.data,
                    period: 'all',
                  )
                  ..defaultPercentage(data: widget.data);
              }
              _marketPageStore.onAllSelect();
            },
            child: Container(
              width: 48,
              height: 28,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: _marketPageStore.chartEnum == ChartEnum.ALL
                    ? Colors.grey.withValues(alpha: 0.2)
                    : Colors.transparent,
              ),
              child: Center(
                child: Text(
                  'ALL',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: _marketPageStore.chartEnum == ChartEnum.ALL ? AppColors.primary : Colors.grey,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
