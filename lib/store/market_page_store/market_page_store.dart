import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_interceptor_plus/dio_interceptor_plus.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:haptic_feedback/haptic_feedback.dart';
import 'package:mobx/mobx.dart';

import '../../constants/chart_period_enum.dart';
import '../../http/interceptors/api_keys.dart';
import '../../http/repositories/coins_repo.dart';
import '../../models/coins_dto/coin_model.dart';
import '../../models/market_cap_dto/market_cap_dto.dart';

part 'market_page_store.g.dart';

class MarketPageStore = _MarketPageStore with _$MarketPageStore;

abstract class _MarketPageStore with Store {
  _MarketPageStore() {
    getSingleCoin();
  }

  @readonly
  MarketCapDto? _marketCap;

  @observable
  String q = '';

  @observable
  List<CoinResultModel> filteredData = <CoinResultModel>[];

  @observable
  int currentPage = 1;

  @observable
  int displayedItemCount = 0;

  @observable
  int totalItemCount = 0;

  @observable
  bool hasError = false;
  @observable
  bool shouldShowUpButton = false;

  @observable
  bool isSearchVisible = false;

  @observable
  bool isTextFieldVisible = false;

  @observable
  bool isLoading = false;

  @observable
  bool isSearched = false;

  @observable
  CoinModel? allCoins;

  @observable
  CoinModel? singleCoin;

  @observable
  List<List<num>> chartData = [];

  @observable
  ChartEnum chartEnum = ChartEnum.ONE_DAY;

  @observable
  bool chartLoading = false;

  @observable
  double? touchedXValue;

  @observable
  double? touchedYValue;

  @observable
  String chartDateTime = '';

  @observable
  bool onChartTouch = false;

  @observable
  double? priceChangeInPercents = 0;

  @observable
  FlSpot? lastTouchedSpot;

  @observable
  Timer? hapticDebounceTimer;

  @observable
  bool isHapticFeedbackActive = false;

  @action
  Future<void> triggerHapticFeedback() async {
    if (isHapticFeedbackActive) {
      return;
    }
    isHapticFeedbackActive = true;
    if (Platform.isIOS) {
      await Haptics.vibrate(HapticsType.light);
    }
    hapticDebounceTimer?.cancel();
    hapticDebounceTimer = Timer(const Duration(), () {
      isHapticFeedbackActive = false;
    });
  }

  @action
  void setChartData(List<List<num>> data) {
    chartData
      ..clear()
      ..addAll(data);
  }

  @action
  void chartTouched() {
    onChartTouch = true;
  }

  @action
  void chartUntouched() {
    onChartTouch = false;
  }

  @action
  void setChartDateTime({required String dateTime}) {
    chartDateTime = dateTime;
  }

  @action
  void setXValue({required double value}) {
    touchedXValue = value;
  }

  @action
  void setYValue({required double value}) {
    touchedYValue = value;
  }

  @action
  void setPercents({required double percents}) {
    priceChangeInPercents = percents;
  }

  @action
  void resetPercents() {
    priceChangeInPercents = 0;
  }

  AnimationController? animationController;

  FocusNode focusNode = FocusNode();

  Future<void> getMarketCap() async {
    _marketCap = await coinStatsRepo.getMarketCap();
  }

  Future<void> getOtherCoins({required int pageNumber}) async {
    allCoins = await coinStatsRepo.getAllCoins(page: pageNumber, limit: 100);
  }

  Future<void> getSingleCoin() async {
    singleCoin = await coinStatsRepo.getAllCoins(page: 1, limit: 1);
  }

  Future<void> getChartData({
    required String coinId,
    required String period,
    required CoinResultModel? data,
  }) async {
    final dio = Dio();
    dio.interceptors.add(LoggingInterceptor());
    chartLoading = true;
    try {
      final response = await dio.get(
        'https://openapiv1.coinstats.app/coins/$coinId/charts?period=$period',
        options: Options(
          headers: {
            'X-API-KEY': coinStatsApiKey,
          },
        ),
      );

      if (response.statusCode == 200) {
        final chartData = (response.data as List<dynamic>)
            .map(
              (item) => (item as List<dynamic>)
                  .map((numItem) => numItem as num)
                  .toList(),
            )
            .toList();
        setChartData(chartData);
      } else {
        debugPrint('Error: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error: $e');
    } finally {
      chartLoading = false;
      await defaultPercentage(data: data);
    }
  }

  @action
  Future<void> defaultPercentage({required CoinResultModel? data}) async {
    if (chartData.isNotEmpty && data != null) {
      final firstPrice = chartData[0][1];
      final currentPrice = data.price;
      final percentageChange = ((currentPrice - firstPrice) / firstPrice) * 100;
      setPercents(percents: percentageChange);
    }
  }

  @action
  void initAnimationController(TickerProvider vsync) {
    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );
  }

  @action
  void toggleTextFieldVisibility() {
    isTextFieldVisible = !isTextFieldVisible;
    if (isTextFieldVisible) {
      isSearchVisible = !isSearchVisible;
      focusNode.requestFocus();
      animationController?.forward();
    } else {
      animationController?.reverse();
      focusNode.unfocus();
      makeInvisible();
    }
  }

  @action
  Future<void> makeInvisible() async {
    await Future.delayed(const Duration(milliseconds: 200));
    isSearchVisible = !isSearchVisible;
  }

  @computed
  List<CoinResultModel> get searchedList => filteredData
      .where(
        (element) =>
            element.name.toLowerCase().contains(q.trim().toLowerCase()) ||
            element.symbol.toLowerCase().contains(q.trim().toLowerCase()),
      )
      .toList();

  @action
  Future<void> setSearchText(String val) async {
    isSearched = true;
    q = val;
  }

  @action
  Future<void> resetSearch() async {
    q = '';
    isSearched = false;
  }

  @action
  Future<void> loadCoins({bool resetPage = false}) async {
    try {
      isLoading = true;
      hasError = false;
      if (resetPage) {
        currentPage = 1;
      }
      await getOtherCoins(pageNumber: currentPage);
      totalItemCount = allCoins!.meta.itemCount;
      displayedItemCount = allCoins!.result.length;
      filteredData = ObservableList.of(allCoins!.result);
    } catch (e) {
      handleError(e.toString());
    } finally {
      isLoading = false;
    }
  }

  Future<void> onRefresh() async {
    await loadCoins(resetPage: true);
  }

  @action
  Future<void> loadMoreCoins() async {
    if (displayedItemCount >= totalItemCount) {
      return;
    }
    try {
      isSearched = false;
      isLoading = true;
      hasError = false;

      currentPage++;
      await getOtherCoins(pageNumber: currentPage);

      if (allCoins != null) {
        final newCoinsCount = allCoins!.result.length;
        if (newCoinsCount > 0) {
          totalItemCount = allCoins!.meta.itemCount;
          displayedItemCount += newCoinsCount;
          filteredData.addAll(allCoins!.result);
        }
      }
    } catch (e) {
      handleError(e.toString());
    } finally {
      isLoading = false;
    }
  }

  @action
  void handleError(String errorMessage) {
    hasError = true;
    if (kDebugMode) {
      print('Error: $errorMessage');
    }
  }

  @action
  Future<void> toggleShouldShowUpButton({
    bool shouldShowUpButton = false,
  }) async {
    this.shouldShowUpButton = shouldShowUpButton;
  }

  @action
  void onOneDaySelect() {
    chartEnum = ChartEnum.ONE_DAY;
  }

  @action
  void onOneWeekSelect() {
    chartEnum = ChartEnum.ONE_WEEK;
  }

  @action
  void onOneMonthSelect() {
    chartEnum = ChartEnum.ONE_MONTH;
  }

  @action
  void onThreeMonthsSelect() {
    chartEnum = ChartEnum.THREE_MONTHS;
  }

  @action
  void onSixMonthsSelect() {
    chartEnum = ChartEnum.SIX_MONTHS;
  }

  @action
  void onOneYearSelect() {
    chartEnum = ChartEnum.ONE_YEAR;
  }

  @action
  void onAllSelect() {
    chartEnum = ChartEnum.ALL;
  }
}
