// ignore_for_file: cascade_invocations

import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../constants/chart_period_enum.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/coins_dto/coin_model.dart';
import '../../../store/market_page_store/market_page_store.dart';
import '../../../utils/number_formatter.dart';
import 'methods.dart';

class ChartWidget extends HookWidget {
  const ChartWidget({
    super.key,
    required this.marketPageStore,
    required this.data,
  });

  final MarketPageStore? marketPageStore;

  final CoinResultModel? data;

  @override
  Widget build(BuildContext context) {
    List<TouchedSpotIndicatorData?> customGetTouchedSpotIndicator(
      LineChartBarData barData,
      List<int> indicators,
    ) {
      return indicators.map((index) {
        return TouchedSpotIndicatorData(
          FlLine(
            color: data!.symbol == 'BTC'
                ? const Color(0xFFf7931a)
                : data!.symbol == 'ETH'
                    ? const Color(0xFF7588C8)
                    : data!.symbol == 'USDT'
                        ? const Color(0xFF2ea07b)
                        : data!.symbol == 'BNB'
                            ? const Color(0xFFF3BA2F)
                            : data!.symbol == 'SOL'
                                ? const Color(0xFF9945FF)
                                : data!.symbol == 'USDC'
                                    ? const Color(0xFF2775ca)
                                    : data!.symbol == 'STETH'
                                        ? const Color(0xFF749EED)
                                        : data!.symbol == 'XRP'
                                            ? const Color(
                                                0xFF2f2c56,
                                              )
                                            : data!.symbol == 'TON'
                                                ? const Color(
                                                    0xFF3887E6,
                                                  )
                                                : data!.symbol == 'DOGE'
                                                    ? const Color(
                                                        0xFFe1b303,
                                                      )
                                                    : const Color(
                                                        0xFFFD5340,
                                                      ).withOpacity(
                                                        0.7,
                                                      ),
            strokeWidth: 1,
            dashArray: [1, 3],
          ),
          FlDotData(
            getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
              radius: 4,
              color: Colors.transparent,
              strokeWidth: 2,
              strokeColor: data!.symbol == 'BTC'
                  ? const Color(0xFFf7931a)
                  : data!.symbol == 'ETH'
                      ? const Color(0xFF7588C8)
                      : data!.symbol == 'USDT'
                          ? const Color(0xFF2ea07b)
                          : data!.symbol == 'BNB'
                              ? const Color(0xFFF3BA2F)
                              : data!.symbol == 'SOL'
                                  ? const Color(0xFF9945FF)
                                  : data!.symbol == 'USDC'
                                      ? const Color(0xFF2775ca)
                                      : data!.symbol == 'STETH'
                                          ? const Color(0xFF749EED)
                                          : data!.symbol == 'XRP'
                                              ? const Color(
                                                  0xFF2f2c56,
                                                )
                                              : data!.symbol == 'TON'
                                                  ? const Color(
                                                      0xFF3887E6,
                                                    )
                                                  : data!.symbol == 'DOGE'
                                                      ? const Color(
                                                          0xFFe1b303,
                                                        )
                                                      : const Color(
                                                          0xFFFD5340,
                                                        ).withOpacity(
                                                          0.7,
                                                        ),
            ),
          ),
        );
      }).toList();
    }

    final chartPoints = marketPageStore!.chartData;
    final spots = chartPoints.map((data) {
      return FlSpot(data[0].toDouble(), data[1].toDouble());
    }).toList();
    return SizedBox(
      height: 250,
      child: Observer(
        builder: (context) {
          final highestPoint = spots.reduce(
            (curr, next) => curr.y > next.y ? curr : next,
          );
          final lowestPoint = spots.reduce(
            (curr, next) => curr.y < next.y ? curr : next,
          );
          return Stack(
            children: [
              LineChart(
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
                      if (touchResponse != null && touchResponse.lineBarSpots != null) {
                        final FlSpot touchedSpot = touchResponse.lineBarSpots!.first;
                        if (marketPageStore?.lastTouchedSpot == null ||
                            marketPageStore?.lastTouchedSpot!.x != touchedSpot.x ||
                            marketPageStore?.lastTouchedSpot!.y != touchedSpot.y) {
                          marketPageStore?.lastTouchedSpot = touchedSpot;
                          Future.delayed(
                            const Duration(),
                            () async {
                              await marketPageStore?.triggerHapticFeedback();
                            },
                          );
                        }
                        marketPageStore
                          ?..chartTouched()
                          ..setXValue(value: touchedSpot.x)
                          ..setYValue(value: touchedSpot.y);
                        priceChange(
                          touchedSpot: touchedSpot,
                          chartPoints: chartPoints,
                          marketPageStore: marketPageStore!,
                        );
                        timeStamp(marketPageStore: marketPageStore!);
                      } else {
                        marketPageStore
                          ?..chartUntouched()
                          ..defaultPercentage(
                            data: data,
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
                              spots[touchedSpot.spotIndex].y.toStringAsFixed(2),
                              textStyle,
                            );
                          },
                        ).toList();
                      },
                    ),
                    getTouchedSpotIndicator: customGetTouchedSpotIndicator,
                    getTouchLineEnd: (_, __) => double.infinity,
                  ),
                  titlesData: const FlTitlesData(
                    show: false,
                    leftTitles: AxisTitles(),
                  ),
                  extraLinesData: ExtraLinesData(
                    horizontalLines: [
                      HorizontalLine(
                        dashArray: [1, 4],
                        y: highestPoint.y,
                        color: Colors.grey,
                        strokeWidth: 1,
                        label: HorizontalLineLabel(
                          show: true,
                          alignment: Alignment.topRight,
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 12,
                            fontFamily: FontFamily.redHatMedium,
                          ),
                          labelResolver: (line) => '\$${priceFormatter.format(highestPoint.y)}',
                        ),
                      ),
                      HorizontalLine(
                        y: lowestPoint.y,
                        color: Colors.grey,
                        strokeWidth: 1,
                        dashArray: [1, 4],
                        label: HorizontalLineLabel(
                          show: true,
                          alignment: Alignment.bottomRight,
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontFamily: FontFamily.redHatMedium,
                          ),
                          labelResolver: (line) => '\$${priceFormatter.format(lowestPoint.y)}',
                        ),
                      ),
                    ],
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      dotData: FlDotData(
                        getDotPainter: (spot, percent, barData, index) {
                          if (spot == highestPoint || spot == lowestPoint) {
                            return FlDotCirclePainter(
                              radius: 3,
                              color: data!.symbol == 'BTC'
                                  ? const Color(0xFFf7931a)
                                  : data!.symbol == 'ETH'
                                      ? const Color(0xFF7588C8)
                                      : data!.symbol == 'USDT'
                                          ? const Color(
                                              0xFF2ea07b,
                                            )
                                          : data!.symbol == 'BNB'
                                              ? const Color(
                                                  0xFFF3BA2F,
                                                )
                                              : data!.symbol == 'SOL'
                                                  ? const Color(
                                                      0xFF9945FF,
                                                    )
                                                  : data!.symbol == 'USDC'
                                                      ? const Color(
                                                          0xFF2775ca,
                                                        )
                                                      : data!.symbol == 'STETH'
                                                          ? const Color(
                                                              0xFF749EED,
                                                            )
                                                          : data!.symbol == 'XRP'
                                                              ? const Color(
                                                                  0xFF2f2c56,
                                                                )
                                                              : data!.symbol == 'TON'
                                                                  ? const Color(
                                                                      0xFF3887E6,
                                                                    )
                                                                  : data!.symbol == 'DOGE'
                                                                      ? const Color(
                                                                          0xFFe1b303,
                                                                        )
                                                                      : const Color(
                                                                          0xFFFD5340,
                                                                        ).withOpacity(
                                                                          0.7,
                                                                        ),
                              strokeWidth: 2,
                              strokeColor: Colors.transparent,
                            );
                          }
                          return FlDotCirclePainter(
                            radius: 0,
                            color: Colors.transparent,
                            strokeWidth: 2,
                            strokeColor: Colors.transparent,
                          );
                        },
                      ),
                      color: marketPageStore!.chartLoading
                          ? Colors.transparent
                          : data!.symbol == 'BTC'
                              ? const Color(0xFFf7931a)
                              : data!.symbol == 'ETH'
                                  ? const Color(0xFF7588C8)
                                  : data!.symbol == 'USDT'
                                      ? const Color(0xFF2ea07b)
                                      : data!.symbol == 'BNB'
                                          ? const Color(
                                              0xFFF3BA2F,
                                            )
                                          : data!.symbol == 'SOL'
                                              ? const Color(
                                                  0xFF9945FF,
                                                )
                                              : data!.symbol == 'USDC'
                                                  ? const Color(
                                                      0xFF2775ca,
                                                    )
                                                  : data!.symbol == 'STETH'
                                                      ? const Color(
                                                          0xFF749EED,
                                                        )
                                                      : data!.symbol == 'XRP'
                                                          ? const Color(
                                                              0xFF2f2c56,
                                                            )
                                                          : data!.symbol == 'TON'
                                                              ? const Color(
                                                                  0xFF3887E6,
                                                                )
                                                              : data!.symbol == 'DOGE'
                                                                  ? const Color(
                                                                      0xFFe1b303,
                                                                    )
                                                                  : const Color(
                                                                      0xFFFD5340,
                                                                    ).withOpacity(
                                                                      0.7,
                                                                    ),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            if (data!.symbol == 'BTC')
                              const Color(0xFFf7931a)
                            else
                              data!.symbol == 'BTC'
                                  ? const Color(0xFFf7931a)
                                  : data!.symbol == 'ETH'
                                      ? const Color(0xFF7588C8)
                                      : data!.symbol == 'USDT'
                                          ? const Color(
                                              0xFF2ea07b,
                                            )
                                          : data!.symbol == 'BNB'
                                              ? const Color(
                                                  0xFFF3BA2F,
                                                )
                                              : data!.symbol == 'SOL'
                                                  ? const Color(
                                                      0xFF9945FF,
                                                    )
                                                  : data!.symbol == 'USDC'
                                                      ? const Color(
                                                          0xFF2775ca,
                                                        )
                                                      : data!.symbol == 'STETH'
                                                          ? const Color(
                                                              0xFF749EED,
                                                            )
                                                          : data!.symbol == 'XRP'
                                                              ? const Color(
                                                                  0xFF2f2c56,
                                                                )
                                                              : data!.symbol == 'TON'
                                                                  ? const Color(
                                                                      0xFF3887E6,
                                                                    )
                                                                  : data!.symbol == 'DOGE'
                                                                      ? const Color(
                                                                          0xFFe1b303,
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
                      isCurved: marketPageStore?.chartEnum != ChartEnum.ONE_MONTH,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Assets.icons.coinplusLogoBlack.image(
                  height: 20,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
