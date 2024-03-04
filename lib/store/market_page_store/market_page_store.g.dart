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
          Computed<List<CoinResultModel>>(() => super.searchedList, name: '_MarketPageStore.searchedList'))
      .value;

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

  late final _$filteredDataAtom = Atom(name: '_MarketPageStore.filteredData', context: context);

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

  late final _$currentPageAtom = Atom(name: '_MarketPageStore.currentPage', context: context);

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

  late final _$displayedItemCountAtom = Atom(name: '_MarketPageStore.displayedItemCount', context: context);

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

  late final _$totalItemCountAtom = Atom(name: '_MarketPageStore.totalItemCount', context: context);

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

  late final _$hasErrorAtom = Atom(name: '_MarketPageStore.hasError', context: context);

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

  late final _$shouldShowUpButtonAtom = Atom(name: '_MarketPageStore.shouldShowUpButton', context: context);

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

  late final _$isSearchVisibleAtom = Atom(name: '_MarketPageStore.isSearchVisible', context: context);

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

  late final _$isTextFieldVisibleAtom = Atom(name: '_MarketPageStore.isTextFieldVisible', context: context);

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

  late final _$isLoadingAtom = Atom(name: '_MarketPageStore.isLoading', context: context);

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

  late final _$isSearchedAtom = Atom(name: '_MarketPageStore.isSearched', context: context);

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

  late final _$allCoinsAtom = Atom(name: '_MarketPageStore.allCoins', context: context);

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

  late final _$singleCoinAtom = Atom(name: '_MarketPageStore.singleCoin', context: context);

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

  late final _$makeInvisibleAsyncAction = AsyncAction('_MarketPageStore.makeInvisible', context: context);

  @override
  Future<void> makeInvisible() {
    return _$makeInvisibleAsyncAction.run(() => super.makeInvisible());
  }

  late final _$setSearchTextAsyncAction = AsyncAction('_MarketPageStore.setSearchText', context: context);

  @override
  Future<void> setSearchText(String val) {
    return _$setSearchTextAsyncAction.run(() => super.setSearchText(val));
  }

  late final _$resetSearchAsyncAction = AsyncAction('_MarketPageStore.resetSearch', context: context);

  @override
  Future<void> resetSearch() {
    return _$resetSearchAsyncAction.run(() => super.resetSearch());
  }

  late final _$loadCoinsAsyncAction = AsyncAction('_MarketPageStore.loadCoins', context: context);

  @override
  Future<void> loadCoins({bool resetPage = false}) {
    return _$loadCoinsAsyncAction.run(() => super.loadCoins(resetPage: resetPage));
  }

  late final _$loadMoreCoinsAsyncAction = AsyncAction('_MarketPageStore.loadMoreCoins', context: context);

  @override
  Future<void> loadMoreCoins() {
    return _$loadMoreCoinsAsyncAction.run(() => super.loadMoreCoins());
  }

  late final _$toggleShouldShowUpButtonAsyncAction =
      AsyncAction('_MarketPageStore.toggleShouldShowUpButton', context: context);

  @override
  Future<void> toggleShouldShowUpButton({bool shouldShowUpButton = false}) {
    return _$toggleShouldShowUpButtonAsyncAction
        .run(() => super.toggleShouldShowUpButton(shouldShowUpButton: shouldShowUpButton));
  }

  late final _$_MarketPageStoreActionController = ActionController(name: '_MarketPageStore', context: context);

  @override
  void initAnimationController(TickerProvider vsync) {
    final _$actionInfo =
        _$_MarketPageStoreActionController.startAction(name: '_MarketPageStore.initAnimationController');
    try {
      return super.initAnimationController(vsync);
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleTextFieldVisibility() {
    final _$actionInfo =
        _$_MarketPageStoreActionController.startAction(name: '_MarketPageStore.toggleTextFieldVisibility');
    try {
      return super.toggleTextFieldVisibility();
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void handleError(String errorMessage) {
    final _$actionInfo = _$_MarketPageStoreActionController.startAction(name: '_MarketPageStore.handleError');
    try {
      return super.handleError(errorMessage);
    } finally {
      _$_MarketPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
q: ${q},
filteredData: ${filteredData},
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
searchedList: ${searchedList}
    ''';
  }
}
