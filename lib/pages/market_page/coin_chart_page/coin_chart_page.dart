import 'dart:async';
import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gaimon/gaimon.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/chart_period_enum.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/coins_dto/coin_model.dart';
import '../../../store/market_page_store/market_page_store.dart';
import '../../../utils/number_formatter.dart';

@RoutePage()
class CoinChartPage extends StatefulWidget {
  const CoinChartPage({super.key, required this.data});

  final CoinResultModel? data;

  @override
  State<CoinChartPage> createState() => _CoinChartPageState();
}

class _CoinChartPageState extends State<CoinChartPage> {
  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  @override
  void initState() {
    super.initState();
    _marketPageStore
      ..getChartData(
        coinId: widget.data!.id,
        data: widget.data,
        period: '24h',
      )
      ..chartEnum = ChartEnum.ONE_DAY
      ..defaultPercentage(data: widget.data);
    timeStamp();
  }

  List<TouchedSpotIndicatorData?> customGetTouchedSpotIndicator(
    LineChartBarData barData,
    List<int> indicators,
  ) {
    return indicators.map((index) {
      return TouchedSpotIndicatorData(
        FlLine(
          color: widget.data!.symbol == 'BTC'
              ? const Color(0xFFf7931a)
              : widget.data!.symbol == 'ETH'
                  ? const Color(0xFF7588C8)
                  : widget.data!.symbol == 'USDT'
                      ? const Color(0xFF2ea07b)
                      : widget.data!.symbol == 'BNB'
                          ? const Color(0xFFF3BA2F)
                          : const Color(0xFFFD5340).withOpacity(0.7),
          strokeWidth: 1,
          dashArray: [1, 3],
        ),
        FlDotData(
          getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
            radius: 4,
            color: Colors.white,
            strokeWidth: 2,
            strokeColor: widget.data!.symbol == 'BTC'
                ? const Color(0xFFf7931a)
                : widget.data!.symbol == 'ETH'
                    ? const Color(0xFF7588C8)
                    : widget.data!.symbol == 'USDT'
                        ? const Color(0xFF2ea07b)
                        : widget.data!.symbol == 'BNB'
                            ? const Color(0xFFF3BA2F)
                            : const Color(0xFFFD5340).withOpacity(0.7),
          ),
        ),
      );
    }).toList();
  }

  Future<void> timeStamp() async {
    if (_marketPageStore.touchedXValue != null) {
      final dateTime = DateTime.fromMillisecondsSinceEpoch(
        _marketPageStore.touchedXValue!.toInt() * 1000,
      );
      final formatter = DateFormat("MMMM d, yyyy 'at' hh:mm:ss a");
      final formattedDateTime = formatter.format(dateTime.toLocal());
      _marketPageStore.setChartDateTime(dateTime: formattedDateTime);
    }
  }

  Future<void> priceChange({
    required List<List<num>> chartPoints,
    required FlSpot touchedSpot,
  }) async {
    if (chartPoints.isEmpty) {
      return;
    }
    final firstPrice = chartPoints[0][1];
    final touchedPrice = touchedSpot.y;
    final percentageChange = ((touchedPrice - firstPrice) / firstPrice) * 100;
    _marketPageStore.setPercents(percents: percentageChange);
  }

  Future<void> onRefresh() async {
    if (_marketPageStore.chartEnum == ChartEnum.ONE_DAY) {
      await _marketPageStore.getChartData(
        coinId: widget.data!.id,
        period: '24h',
        data: widget.data,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          '${widget.data?.name}/USD',
          style: const TextStyle(
            fontFamily: FontFamily.redHatMedium,
            color: AppColors.primary,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: Observer(
        builder: (context) {
          final chartPoints = _marketPageStore.chartData;
          final spots = chartPoints.map((data) {
            return FlSpot(data[0].toDouble(), data[1].toDouble());
          }).toList();
          return CustomScrollView(
            slivers: [
              CupertinoSliverRefreshControl(
                onRefresh: onRefresh,
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 20,
                                child: CachedNetworkImage(
                                  imageUrl: widget.data!.icon,
                                  placeholder: (context, url) => Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey.withOpacity(0.5),
                                    ),
                                    height: 20,
                                    width: 20,
                                    child: CircleAvatar(
                                      backgroundColor:
                                          Colors.grey.withOpacity(0.3),
                                      child: Center(
                                        child: Text(
                                          widget.data!.symbol,
                                          style: const TextStyle(
                                            fontFamily: FontFamily.redHatMedium,
                                            fontSize: 7,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  errorWidget: (
                                    context,
                                    url,
                                    error,
                                  ) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              const Gap(6),
                              Text(
                                widget.data!.name,
                                style: const TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  color: AppColors.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Gap(5),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  color: AppColors.silver,
                                ),
                                child: Text(
                                  '#${widget.data?.rank}',
                                  style: const TextStyle(
                                    fontFamily: FontFamily.redHatMedium,
                                    color: AppColors.textHintsColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              const Gap(5),
                              Observer(
                                builder: (context) {
                                  return !_marketPageStore.chartLoading
                                      ? Container(
                                          height: 26,
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: _marketPageStore
                                                        .priceChangeInPercents! >
                                                    0
                                                ? Colors.greenAccent
                                                : _marketPageStore
                                                            .priceChangeInPercents! ==
                                                        0
                                                    ? Colors.greenAccent
                                                    : Colors.red,
                                          ),
                                          child: Observer(
                                            builder: (context) {
                                              final priceChange =
                                                  _marketPageStore
                                                      .priceChangeInPercents
                                                      ?.toStringAsFixed(2);
                                              return Row(
                                                children: [
                                                  if (_marketPageStore
                                                          .priceChangeInPercents! >
                                                      0)
                                                    Assets.icons.arrowDropUp
                                                        .image(
                                                      height: 5,
                                                      color: Colors.white,
                                                    )
                                                  else if (_marketPageStore
                                                          .priceChangeInPercents! >
                                                      0)
                                                    Assets.icons.arrowDropDown
                                                        .image(
                                                      height: 5,
                                                      color: Colors.white,
                                                    )
                                                  else if (_marketPageStore
                                                          .priceChangeInPercents! ==
                                                      0)
                                                    Assets.icons.arrowDropUp
                                                        .image(
                                                      height: 5,
                                                      color: Colors.white,
                                                    )
                                                  else
                                                    Assets.icons.arrowDropDown
                                                        .image(
                                                      height: 5,
                                                      color: Colors.white,
                                                    ),
                                                  const Gap(5),
                                                  Text(
                                                    '$priceChange %',
                                                    style: const TextStyle(
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      fontSize: 13,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        )
                                      : const SizedBox();
                                },
                              ),
                            ],
                          ),
                          const Gap(5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Observer(
                                builder: (context) {
                                  return _marketPageStore.onChartTouch
                                      ? CryptoPriceFormatter(
                                          price: _marketPageStore.touchedYValue!
                                              .toDouble(),
                                          isChartPage: true,
                                        )
                                      : CryptoPriceFormatter(
                                          price: widget.data!.price,
                                          isChartPage: true,
                                        );
                                },
                              ),
                              Observer(
                                builder: (context) {
                                  return _marketPageStore.onChartTouch
                                      ? Text(
                                          _marketPageStore.chartDateTime,
                                          style: const TextStyle(
                                            fontFamily: FontFamily.redHatMedium,
                                            color: Colors.grey,
                                            fontSize: 12,
                                          ),
                                        )
                                      : const SizedBox();
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    if (_marketPageStore.chartLoading)
                      SizedBox(
                        height: 250,
                        child: SizedBox(
                          height: 40,
                          width: 40,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 105),
                            child: CircularProgressIndicator(
                              color: widget.data!.symbol == 'BTC'
                                  ? const Color(0xFFf7931a)
                                  : widget.data!.symbol == 'ETH'
                                      ? const Color(0xFF7588C8)
                                      : widget.data!.symbol == 'USDT'
                                          ? const Color(0xFF2ea07b)
                                          : widget.data!.symbol == 'BNB'
                                              ? const Color(0xFFF3BA2F)
                                              : const Color(0xFFFD5340)
                                                  .withOpacity(0.7),
                            ),
                          ),
                        ),
                      )
                    else
                      SizedBox(
                        height: 250,
                        child: Observer(
                          builder: (context) {
                            return LineChart(
                              LineChartData(
                                minX: spots.first.x,
                                maxX: spots.last.x,
                                minY: spots.map((spot) => spot.y).reduce(min),
                                maxY: spots.map((spot) => spot.y).reduce(max),
                                backgroundColor: Colors.white,
                                borderData: FlBorderData(
                                  border: Border.all(color: Colors.white),
                                ),
                                gridData: const FlGridData(
                                  drawHorizontalLine: false,
                                  drawVerticalLine: false,
                                ),
                                lineTouchData: LineTouchData(
                                  touchCallback: (event, touchResponse) {
                                    if (touchResponse != null &&
                                        touchResponse.lineBarSpots != null) {
                                      final FlSpot touchedSpot =
                                          touchResponse.lineBarSpots!.first;
                                      if (_marketPageStore.lastTouchedSpot ==
                                              null ||
                                          _marketPageStore.lastTouchedSpot!.x !=
                                              touchedSpot.x ||
                                          _marketPageStore.lastTouchedSpot!.y !=
                                              touchedSpot.y) {
                                        _marketPageStore.lastTouchedSpot =
                                            touchedSpot;
                                        Future.delayed(
                                          const Duration(),
                                          () async {
                                            await _marketPageStore
                                                .triggerHapticFeedback();
                                          },
                                        );
                                      }
                                      _marketPageStore
                                        ..chartTouched()
                                        ..setXValue(value: touchedSpot.x)
                                        ..setYValue(value: touchedSpot.y);
                                      priceChange(
                                        touchedSpot: touchedSpot,
                                        chartPoints: chartPoints,
                                      );
                                      timeStamp();
                                    } else {
                                      _marketPageStore
                                        ..chartUntouched()
                                        ..defaultPercentage(
                                          data: widget.data,
                                        );
                                    }
                                  },
                                  touchTooltipData: LineTouchTooltipData(
                                    tooltipBorder: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    getTooltipColor: (touchedSpot) {
                                      return Colors.transparent;
                                    },
                                    getTooltipItems: (touchedSpots) {
                                      return touchedSpots.map(
                                        (touchedSpot) {
                                          const textStyle = TextStyle(
                                            color: Colors.transparent,
                                          );
                                          return LineTooltipItem(
                                            spots[touchedSpot.spotIndex]
                                                .y
                                                .toStringAsFixed(2),
                                            textStyle,
                                          );
                                        },
                                      ).toList();
                                    },
                                  ),
                                  getTouchedSpotIndicator:
                                      customGetTouchedSpotIndicator,
                                  getTouchLineEnd: (_, __) => double.infinity,
                                ),
                                titlesData: const FlTitlesData(
                                  show: false,
                                  leftTitles: AxisTitles(),
                                ),
                                lineBarsData: [
                                  LineChartBarData(
                                    color: _marketPageStore.chartLoading
                                        ? Colors.transparent
                                        : widget.data!.symbol == 'BTC'
                                            ? const Color(0xFFf7931a)
                                            : widget.data!.symbol == 'ETH'
                                                ? const Color(0xFF7588C8)
                                                : widget.data!.symbol == 'USDT'
                                                    ? const Color(
                                                        0xFF2ea07b,
                                                      )
                                                    : widget.data!.symbol ==
                                                            'BNB'
                                                        ? const Color(
                                                            0xFFF3BA2F,
                                                          )
                                                        : const Color(
                                                            0xFFFD5340,
                                                          ).withOpacity(
                                                            0.7,
                                                          ),
                                    belowBarData: BarAreaData(
                                      color: Colors.grey,
                                      show: true,
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          if (widget.data!.symbol == 'BTC')
                                            const Color(0xFFf7931a)
                                          else
                                            widget.data!.symbol == 'ETH'
                                                ? const Color(0xFF7588C8)
                                                : widget.data!.symbol == 'USDT'
                                                    ? const Color(
                                                        0xFF2ea07b,
                                                      )
                                                    : widget.data!.symbol ==
                                                            'BNB'
                                                        ? const Color(
                                                            0xFFF3BA2F,
                                                          )
                                                        : const Color(
                                                            0xFFFD5340,
                                                          ).withOpacity(
                                                            0.7,
                                                          ),
                                          Colors.white,
                                        ],
                                      ),
                                    ),
                                    spots: spots,
                                    isCurved: _marketPageStore.chartEnum !=
                                        ChartEnum.ONE_MONTH,
                                    dotData: const FlDotData(
                                      show: false,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    const Gap(25),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ScaleTap(
                            enableFeedback: false,
                            onPressed: () {
                              Gaimon.light();
                              if (_marketPageStore.chartEnum !=
                                  ChartEnum.ONE_DAY) {
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
                              width: 38,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: _marketPageStore.chartEnum ==
                                        ChartEnum.ONE_DAY
                                    ? Colors.grey.withOpacity(0.2)
                                    : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  '1D',
                                  style: TextStyle(
                                    fontFamily: FontFamily.redHatMedium,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: _marketPageStore.chartEnum ==
                                            ChartEnum.ONE_DAY
                                        ? AppColors.primary
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ScaleTap(
                            enableFeedback: false,
                            onPressed: () {
                              Gaimon.light();
                              if (_marketPageStore.chartEnum !=
                                  ChartEnum.ONE_WEEK) {
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
                              width: 38,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: _marketPageStore.chartEnum ==
                                        ChartEnum.ONE_WEEK
                                    ? Colors.grey.withOpacity(0.2)
                                    : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  '1W',
                                  style: TextStyle(
                                    fontFamily: FontFamily.redHatMedium,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: _marketPageStore.chartEnum ==
                                            ChartEnum.ONE_WEEK
                                        ? AppColors.primary
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ScaleTap(
                            enableFeedback: false,
                            onPressed: () {
                              Gaimon.light();
                              if (_marketPageStore.chartEnum !=
                                  ChartEnum.ONE_MONTH) {
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
                              width: 38,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: _marketPageStore.chartEnum ==
                                        ChartEnum.ONE_MONTH
                                    ? Colors.grey.withOpacity(0.2)
                                    : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  '1M',
                                  style: TextStyle(
                                    fontFamily: FontFamily.redHatMedium,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: _marketPageStore.chartEnum ==
                                            ChartEnum.ONE_MONTH
                                        ? AppColors.primary
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ScaleTap(
                            enableFeedback: false,
                            onPressed: () {
                              Gaimon.light();
                              if (_marketPageStore.chartEnum !=
                                  ChartEnum.THREE_MONTHS) {
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
                              width: 38,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: _marketPageStore.chartEnum ==
                                        ChartEnum.THREE_MONTHS
                                    ? Colors.grey.withOpacity(0.2)
                                    : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  '3M',
                                  style: TextStyle(
                                    fontFamily: FontFamily.redHatMedium,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: _marketPageStore.chartEnum ==
                                            ChartEnum.THREE_MONTHS
                                        ? AppColors.primary
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ScaleTap(
                            enableFeedback: false,
                            onPressed: () {
                              Gaimon.light();
                              if (_marketPageStore.chartEnum !=
                                  ChartEnum.SIX_MONTHS) {
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
                              width: 38,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: _marketPageStore.chartEnum ==
                                        ChartEnum.SIX_MONTHS
                                    ? Colors.grey.withOpacity(0.2)
                                    : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  '6M',
                                  style: TextStyle(
                                    fontFamily: FontFamily.redHatMedium,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: _marketPageStore.chartEnum ==
                                            ChartEnum.SIX_MONTHS
                                        ? AppColors.primary
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ScaleTap(
                            enableFeedback: false,
                            onPressed: () {
                              Gaimon.light();
                              if (_marketPageStore.chartEnum !=
                                  ChartEnum.ONE_YEAR) {
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
                              width: 38,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: _marketPageStore.chartEnum ==
                                        ChartEnum.ONE_YEAR
                                    ? Colors.grey.withOpacity(0.2)
                                    : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  '1Y',
                                  style: TextStyle(
                                    fontFamily: FontFamily.redHatMedium,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: _marketPageStore.chartEnum ==
                                            ChartEnum.ONE_YEAR
                                        ? AppColors.primary
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          ScaleTap(
                            enableFeedback: false,
                            onPressed: () {
                              Gaimon.light();
                              if (_marketPageStore.chartEnum != ChartEnum.ALL) {
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
                              width: 38,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color:
                                    _marketPageStore.chartEnum == ChartEnum.ALL
                                        ? Colors.grey.withOpacity(0.2)
                                        : Colors.transparent,
                              ),
                              child: Center(
                                child: Text(
                                  'ALL',
                                  style: TextStyle(
                                    fontFamily: FontFamily.redHatMedium,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: _marketPageStore.chartEnum ==
                                            ChartEnum.ALL
                                        ? AppColors.primary
                                        : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}