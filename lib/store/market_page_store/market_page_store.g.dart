// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MarketPageStore on _MarketPageStore, Store {
  Computed<List<CoinResultModel>>? _$searchedListComputed;

  @override
  List<CoinResultModel> get searchedList => (_$searchedListComputed ??=
          Computed<List<CoinResultModel>>(() => super.searchedList,
              name: '_MarketPageStore.searchedList'))
      .value;

  late final _$_marketCapAtom =
      Atom(name: '_MarketPageStore._marketCap', context: context);

  MarketCapDto? get marketCap {
    _$_marketCapAtom.reportRead();
    return super._marketCap;
  }

  @override
  MarketCapDto? get _marketCap => marketCap;

  @override
  set _marketCap(MarketCapDto? value) {
    _$_marketCapAtom.reportWrite(value, super._marketCap, () {
      super._marketCap = value;
    });
  }

  late final _$qAtom = Atom(name: '_MarketPageStore.q', context: context);

  @override
  String get q {
    _$qAtom.reportRead();
    return super.q;
  }

  @override
  set q(String value) {
    _$qAtom.reportWrite(value, super.q, () {
      super.q = value;
    });
  }

  late final _$filteredDataAtom =
      Atom(name: '_MarketPageStore.filteredData', context: context);

  @override
  List<CoinResultModel> get filteredData {
    _$filteredDataAtom.reportRead();
    return super.filteredData;
  }

  @override
  set filteredData(List<CoinResultModel> value) {
    _$filteredDataAtom.reportWrite(value, super.filteredData, () {
      super.filteredData = value;
    });
  }

  late final _$favoriteCoinModelAtom =
      Atom(name: '_MarketPageStore.favoriteCoinModel', context: context);

  @override
  UniqueCoinModel? get favoriteCoinModel {
    _$favoriteCoinModelAtom.reportRead();
    return super.favoriteCoinModel;
  }

  @override
  set favoriteCoinModel(UniqueCoinModel? value) {
    _$favoriteCoinModelAtom.reportWrite(value, super.favoriteCoinModel, () {
      super.favoriteCoinModel = value;
    });
  }

  late final _$currentPageAtom =
      Atom(name: '_MarketPageStore.currentPage', context: context);

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  late final _$displayedItemCountAtom =
      Atom(name: '_MarketPageStore.displayedItemCount', context: context);

  @override
  int get displayedItemCount {
    _$displayedItemCountAtom.reportRead();
    return super.displayedItemCount;
  }

  @override
  set displayedItemCount(int value) {
    _$displayedItemCountAtom.reportWrite(value, super.displayedItemCount, () {
      super.displayedItemCount = value;
    });
  }

  late final _$totalItemCountAtom =
      Atom(name: '_MarketPageStore.totalItemCount', context: context);

  @override
  int get totalItemCount {
    _$totalItemCountAtom.reportRead();
    return super.totalItemCount;
  }

  @override
  set totalItemCount(int value) {
    _$totalItemCountAtom.reportWrite(value, super.totalItemCount, () {
      super.totalItemCount = value;
    });
  }

  late final _$hasErrorAtom =
      Atom(name: '_MarketPageStore.hasError', context: context);

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$shouldShowUpButtonAtom =
      Atom(name: '_MarketPageStore.shouldShowUpButton', context: context);

  @override
  bool get shouldShowUpButton {
    _$shouldShowUpButtonAtom.reportRead();
    return super.shouldShowUpButton;
  }

  @override
  set shouldShowUpButton(bool value) {
    _$shouldShowUpButtonAtom.reportWrite(value, super.shouldShowUpButton, () {
      super.shouldShowUpButton = value;
    });
  }

  late final _$isSearchVisibleAtom =
      Atom(name: '_MarketPageStore.isSearchVisible', context: context);

  @override
  bool get isSearchVisible {
    _$isSearchVisibleAtom.reportRead();
    return super.isSearchVisible;
  }

  @override
  set isSearchVisible(bool value) {
    _$isSearchVisibleAtom.reportWrite(value, super.isSearchVisible, () {
      super.isSearchVisible = value;
    });
  }

  late final _$isTextFieldVisibleAtom =
      Atom(name: '_MarketPageStore.isTextFieldVisible', context: context);

  @override
  bool get isTextFieldVisible {
    _$isTextFieldVisibleAtom.reportRead();
    return super.isTextFieldVisible;
  }

  @override
  set isTextFieldVisible(bool value) {
    _$isTextFieldVisibleAtom.reportWrite(value, super.isTextFieldVisible, () {
      super.isTextFieldVisible = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_MarketPageStore.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$isSearchedAtom =
      Atom(name: '_MarketPageStore.isSearched', context: context);

  @override
  bool get isSearched {
    _$isSearchedAtom.reportRead();
    return super.isSearched;
  }

  @override
  set isSearched(bool value) {
    _$isSearchedAtom.reportWrite(value, super.isSearched, () {
      super.isSearched = value;
    });
  }

  late final _$allCoinsAtom =
      Atom(name: '_MarketPageStore.allCoins', context: context);

  @override
  CoinModel? get allCoins {
    _$allCoinsAtom.reportRead();
    return super.allCoins;
  }

  @override
  set allCoins(CoinModel? value) {
    _$allCoinsAtom.reportWrite(value, super.allCoins, () {
      super.allCoins = value;
    });
  }

  late final _$singleCoinAtom =
      Atom(name: '_MarketPageStore.singleCoin', context: context);

  @override
  CoinModel? get singleCoin {
    _$singleCoinAtom.reportRead();
    return super.singleCoin;
  }

  @override
  set singleCoin(CoinModel? value) {
    _$singleCoinAtom.reportWrite(value, super.singleCoin, () {
      super.singleCoin = value;
    });
  }

  late final _$chartDataAtom =
      Atom(name: '_MarketPageStore.chartData', context: context);

  @override
  List<List<num>> get chartData {
    _$chartDataAtom.reportRead();
    return super.chartData;
  }

  @override
  set chartData(List<List<num>> value) {
    _$chartDataAtom.reportWrite(value, super.chartData, () {
      super.chartData = value;
    });
  }

  late final _$chartEnumAtom =
      Atom(name: '_MarketPageStore.chartEnum', context: context);

  @override
  ChartEnum get chartEnum {
    _$chartEnumAtom.reportRead();
    return super.chartEnum;
  }

  @override
  set chartEnum(ChartEnum value) {
    _$chartEnumAtom.reportWrite(value, super.chartEnum, () {
      super.chartEnum = value;
    });
  }

  late final _$chartLoadingAtom =
      Atom(name: '_MarketPageStore.chartLoading', context: context);

  @override
  bool get chartLoading {
    _$chartLoadingAtom.reportRead();
    return super.chartLoading;
  }

  @override
  set chartLoading(bool value) {
    _$chartLoadingAtom.reportWrite(value, super.chartLoading, () {
      super.chartLoading = value;
    });
  }

  late final _$touchedXValueAtom =
      Atom(name: '_MarketPageStore.touchedXValue', context: context);

  @override
  double? get touchedXValue {
    _$touchedXValueAtom.reportRead();
    return super.touchedXValue;
  }

  @override
  set touchedXValue(double? value) {
    _$touchedXValueAtom.reportWrite(value, super.touchedXValue, () {
      super.touchedXValue = value;
    });
  }

  late final _$touchedYValueAtom =
      Atom(name: '_MarketPageStore.touchedYValue', context: context);

  @override
  double? get touchedYValue {
    _$touchedYValueAtom.reportRead();
    return super.touchedYValue;
  }

  @override
  set touchedYValue(double? value) {
    _$touchedYValueAtom.reportWrite(value, super.touchedYValue, () {
      super.touchedYValue = value;
    });
  }

  late final _$chartDateTimeAtom =
      Atom(name: '_MarketPageStore.chartDateTime', context: context);

  @override
  String get chartDateTime {
    _$chartDateTimeAtom.reportRead();
    return super.chartDateTime;
  }

  @override
  set chartDateTime(String value) {
    _$chartDateTimeAtom.reportWrite(value, super.chartDateTime, () {
      super.chartDateTime = value;
    });
  }

  late final _$onChartTouchAtom =
      Atom(name: '_MarketPageStore.onChartTouch', context: context);

  @override
  bool get onChartTouch {
    _$onChartTouchAtom.reportRead();
    return super.onChartTouch;
  }

  @override
  set onChartTouch(bool value) {
    _$onChartTouchAtom.reportWrite(value, super.onChartTouch, () {
      super.onChartTouch = value;
    });
  }

  late final _$priceChangeInPercentsAtom =
      Atom(name: '_MarketPageStore.priceChangeInPercents', context: context);

  @override
  double? get priceChangeInPercents {
    _$priceChangeInPercentsAtom.reportRead();
    return super.priceChangeInPercents;
  }

  @override
  set priceChangeInPercents(double? value) {
    _$priceChangeInPercentsAtom.reportWrite(value, super.priceChangeInPercents,
        () {
      super.priceChangeInPercents = value;
    });
  }

  late final _$lastTouchedSpotAtom =
      Atom(name: '_MarketPageStore.lastTouchedSpot', context: context);

  @override
  FlSpot? get lastTouchedSpot {
    _$lastTouchedSpotAtom.reportRead();
    return super.lastTouchedSpot;
  }

  @override
  set lastTouchedSpot(FlSpot? value) {
    _$lastTouchedSpotAtom.reportWrite(value, super.lastTouchedSpot, () {
      super.lastTouchedSpot = value;
    });
  }

  late final _$hapticDebounceTimerAtom =
      Atom(name: '_MarketPageStore.hapticDebounceTimer', context: context);

  @override
  Timer? get hapticDebounceTimer {
    _$hapticDebounceTimerAtom.reportRead();
    return super.hapticDebounceTimer;
  }

  @override
  set hapticDebounceTimer(Timer? value) {
    _$hapticDebounceTimerAtom.reportWrite(value, super.hapticDebounceTimer, () {
      super.hapticDebounceTimer = value;
    });
  }

  late final _$isHapticFeedbackActiveAtom =
      Atom(name: '_MarketPageStore.isHapticFeedbackActive', context: context);

  @override
  bool get isHapticFeedbackActive {
    _$isHapticFeedbackActiveAtom.reportRead();
    return super.isHapticFeedbackActive;
  }

  @override
  set isHapticFeedbackActive(bool value) {
    _$isHapticFeedbackActiveAtom
        .reportWrite(value, super.isHapticFeedbackActive, () {
      super.isHapticFeedbackActive = value;
    });
  }

  late final _$isCollapsedAtom =
      Atom(name: '_MarketPageStore.isCollapsed', context: context);

  @override
  bool get isCollapsed {
    _$isCollapsedAtom.reportRead();
    return super.isCollapsed;
  }

  @override
  set isCollapsed(bool value) {
    _$isCollapsedAtom.reportWrite(value, super.isCollapsed, () {
      super.isCollapsed = value;
    });
  }

  late final _$isLoadingFavoritesAtom =
      Atom(name: '_MarketPageStore.isLoadingFavorites', context: context);

  @override
  bool get isLoadingFavorites {
    _$isLoadingFavoritesAtom.reportRead();
    return super.isLoadingFavorites;
  }

  @override
  set isLoadingFavorites(bool value) {
    _$isLoadingFavoritesAtom.reportWrite(value, super.isLoadingFavorites, () {
      super.isLoadingFavorites = value;
    });
  }

  late final _$isFavoriteAtom =
      Atom(name: '_MarketPageStore.isFavorite', context: context);

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  late final _$favoriteCoinsListAtom =
      Atom(name: '_MarketPageStore.favoriteCoinsList', context: context);

  @override
  ObservableList<CoinResultModel> get favoriteCoinsList {
    _$favoriteCoinsListAtom.reportRead();
    return super.favoriteCoinsList;
  }

  @override
  set favoriteCoinsList(ObservableList<CoinResultModel> value) {
    _$favoriteCoinsListAtom.reportWrite(value, super.favoriteCoinsList, () {
      super.favoriteCoinsList = value;
    });
  }

  late final _$getFavoriteCoinsAsyncAction =
      AsyncAction('_MarketPageStore.getFavoriteCoins', context: context);

  @override
  Future<void> getFavoriteCoins({required String coinId}) {
    return _$getFavoriteCoinsAsyncAction
        .run(() => super.getFavoriteCoins(coinId: coinId));
  }

  late final _$checkIfFavoriteAsyncAction =
      AsyncAction('_MarketPageStore.checkIfFavorite', context: context);

  @override
  Future<void> checkIfFavorite(String coinId) {
    return _$checkIfFavoriteAsyncAction
        .run(() => super.checkIfFavorite(coinId));
  }

  late final _$toggleFavoriteAsyncAction =
      AsyncAction('_MarketPageStore.toggleFavorite', context: context);

  @override
  Future<void> toggleFavorite(
      {required String coinId,
      required BuildContext context,
      required String coinName}) {
    return _$toggleFavoriteAsyncAction.run(() => super
        .toggleFavorite(coinId: coinId, context: context, coinName: coinName));
  }

  late final _$addToFavoritesAsyncAction =
      AsyncAction('_MarketPageStore.addToFavorites', context: context);

  @override
  Future<void> addToFavorites(String coinId) {
    return _$addToFavoritesAsyncAction.run(() => super.addToFavorites(coinId));
  }

  late final _$removeFromFavoritesAsyncAction =
      AsyncAction('_MarketPageStore.removeFromFavorites', context: context);

  @override
  Future<void> removeFromFavorites(String coinId) {
    return _$removeFromFavoritesAsyncAction
        .run(() => super.removeFromFavorites(coinId));
  }

  late final _$loadFavoriteCoinsAsyncAction =
      AsyncAction('_MarketPageStore.loadFavoriteCoins', context: context);

  @override
  Future<void> loadFavoriteCoins() {
    return _$loadFavoriteCoinsAsyncAction.run(() => super.loadFavoriteCoins());
  }

  late final _$triggerHapticFeedbackAsyncAction =
      AsyncAction('_MarketPageStore.triggerHapticFeedback', context: context);

  @override
  Future<void> triggerHapticFeedback() {
    return _$triggerHapticFeedbackAsyncAction
        .run(() => super.triggerHapticFeedback());
  }

  late final _$collapseWidgetAsyncAction =
      AsyncAction('_MarketPageStore.collapseWidget', context: context);

  @override
  Future<void> collapseWidget() {
    return _$collapseWidgetAsyncAction.run(() => super.collapseWidget());
  }

  late final _$expandWidgetAsyncAction =
      AsyncAction('_MarketPageStore.expandWidget', context: context);

  @override
  Future<void> expandWidget() {
    return _$expandWidgetAsyncAction.run(() => super.expandWidget());
  }

  late final _$defaultPercentageAsyncAction =
      AsyncAction('_MarketPageStore.defaultPercentage', context: context);

  @override
  Future<void> defaultPercentage({required CoinResultModel? data}) {
    return _$defaultPercentageAsyncAction
        .run(() => super.defaultPercentage(data: data));
  }

  late final _$makeInvisibleAsyncAction =
      AsyncAction('_MarketPageStore.makeInvisible', context: context);

  @override
  Future<void> makeInvisible() {
    return _$makeInvisibleAsyncAction.run(() => super.makeInvisible());
  }

  late final _$setSearchTextAsyncAction =
      AsyncAction('_MarketPageStore.setSearchText', context: context);

  @override
  Future<void> setSearchText(String val) {
    return _$setSearchTextAsyncAction.run(() => super.setSearchText(val));
  }

  late final _$resetSearchAsyncAction =
      AsyncAction('_MarketPageStore.resetSearch', context: context);

  @override
  Future<void> resetSearch() {
    return _$resetSearchAsyncAction.run(() => super.resetSearch());
  }

  late final _$loadCoinsAsyncAction =
      AsyncAction('_MarketPageStore.loadCoins', context: context);

  @override
  Future<void> loadCoins({bool resetPage = false}) {
    return _$loadCoinsAsyncAction
        .run(() => super.loadCoins(resetPage: resetPage));
  }

  late final _$loadMoreCoinsAsyncAction =
      AsyncAction('_MarketPageStore.loadMoreCoins', context: context);

  @override
  Future<void> loadMoreCoins() {
    return _$loadMoreCoinsAsyncAction.run(() => super.loadMoreCoins());
  }

  late final _$toggleShouldShowUpButtonAsyncAction = AsyncAction(
      '_MarketPageStore.toggleShouldShowUpButton',
      context: context);

  @override
  Future<void> toggleShouldShowUpButton({bool shouldShowUpButton = false}) {
    return _$toggleShouldShowUpButtonAsyncAction.run(() =>
        super.toggleShouldShowUpButton(shouldShowUpButton: shouldShowUpButton));
  }

  late final _$_MarketPageStoreActionController =
      ActionController(name: '_MarketPageStore', context: context);

  @override
  void setChartData(List<List<num>> data) {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.setChartData');
    try {
      return super.setChartData(data);
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void chartTouched() {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.chartTouched');
    try {
      return super.chartTouched();
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void chartUntouched() {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.chartUntouched');
    try {
      return super.chartUntouched();
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setChartDateTime({required String dateTime}) {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.setChartDateTime');
    try {
      return super.setChartDateTime(dateTime: dateTime);
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setXValue({required double value}) {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.setXValue');
    try {
      return super.setXValue(value: value);
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setYValue({required double value}) {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.setYValue');
    try {
      return super.setYValue(value: value);
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPercents({required double percents}) {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.setPercents');
    try {
      return super.setPercents(percents: percents);
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetPercents() {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.resetPercents');
    try {
      return super.resetPercents();
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void initAnimationController(TickerProvider vsync) {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.initAnimationController');
    try {
      return super.initAnimationController(vsync);
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTextFieldVisibility() {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.toggleTextFieldVisibility');
    try {
      return super.toggleTextFieldVisibility();
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleError(String errorMessage) {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.handleError');
    try {
      return super.handleError(errorMessage);
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onOneDaySelect() {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.onOneDaySelect');
    try {
      return super.onOneDaySelect();
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onOneWeekSelect() {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.onOneWeekSelect');
    try {
      return super.onOneWeekSelect();
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onOneMonthSelect() {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.onOneMonthSelect');
    try {
      return super.onOneMonthSelect();
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onThreeMonthsSelect() {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.onThreeMonthsSelect');
    try {
      return super.onThreeMonthsSelect();
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onSixMonthsSelect() {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.onSixMonthsSelect');
    try {
      return super.onSixMonthsSelect();
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onOneYearSelect() {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.onOneYearSelect');
    try {
      return super.onOneYearSelect();
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onAllSelect() {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(
        name: '_MarketPageStore.onAllSelect');
    try {
      return super.onAllSelect();
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
q: ${q},
filteredData: ${filteredData},
favoriteCoinModel: ${favoriteCoinModel},
currentPage: ${currentPage},
displayedItemCount: ${displayedItemCount},
totalItemCount: ${totalItemCount},
hasError: ${hasError},
shouldShowUpButton: ${shouldShowUpButton},
isSearchVisible: ${isSearchVisible},
isTextFieldVisible: ${isTextFieldVisible},
isLoading: ${isLoading},
isSearched: ${isSearched},
allCoins: ${allCoins},
singleCoin: ${singleCoin},
chartData: ${chartData},
chartEnum: ${chartEnum},
chartLoading: ${chartLoading},
touchedXValue: ${touchedXValue},
touchedYValue: ${touchedYValue},
chartDateTime: ${chartDateTime},
onChartTouch: ${onChartTouch},
priceChangeInPercents: ${priceChangeInPercents},
lastTouchedSpot: ${lastTouchedSpot},
hapticDebounceTimer: ${hapticDebounceTimer},
isHapticFeedbackActive: ${isHapticFeedbackActive},
isCollapsed: ${isCollapsed},
isLoadingFavorites: ${isLoadingFavorites},
isFavorite: ${isFavorite},
favoriteCoinsList: ${favoriteCoinsList},
searchedList: ${searchedList}
    ''';
  }
}
