// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryPageStore on _HistoryPageStore, Store {
  late final _$cardHistoryIndexAtom = Atom(name: '_HistoryPageStore.cardHistoryIndex', context: context);

  @override
  int get cardHistoryIndex {
    _$cardHistoryIndexAtom.reportRead();
    return super.cardHistoryIndex;
  }

  @override
  set cardHistoryIndex(int value) {
    _$cardHistoryIndexAtom.reportWrite(value, super.cardHistoryIndex, () {
      super.cardHistoryIndex = value;
    });
  }

  late final _$barHistoryIndexAtom = Atom(name: '_HistoryPageStore.barHistoryIndex', context: context);

  @override
  int get barHistoryIndex {
    _$barHistoryIndexAtom.reportRead();
    return super.barHistoryIndex;
  }

  @override
  set barHistoryIndex(int value) {
    _$barHistoryIndexAtom.reportWrite(value, super.barHistoryIndex, () {
      super.barHistoryIndex = value;
    });
  }

  late final _$cardSelectedAddressAtom = Atom(name: '_HistoryPageStore.cardSelectedAddress', context: context);

  @override
  String get cardSelectedAddress {
    _$cardSelectedAddressAtom.reportRead();
    return super.cardSelectedAddress;
  }

  @override
  set cardSelectedAddress(String value) {
    _$cardSelectedAddressAtom.reportWrite(value, super.cardSelectedAddress, () {
      super.cardSelectedAddress = value;
    });
  }

  late final _$barSelectedAddressAtom = Atom(name: '_HistoryPageStore.barSelectedAddress', context: context);

  @override
  String get barSelectedAddress {
    _$barSelectedAddressAtom.reportRead();
    return super.barSelectedAddress;
  }

  @override
  set barSelectedAddress(String value) {
    _$barSelectedAddressAtom.reportWrite(value, super.barSelectedAddress, () {
      super.barSelectedAddress = value;
    });
  }

  late final _$cardHistoriesAtom = Atom(name: '_HistoryPageStore.cardHistories', context: context);

  @override
  ObservableMap<String, TransactionModel?> get cardHistories {
    _$cardHistoriesAtom.reportRead();
    return super.cardHistories;
  }

  @override
  set cardHistories(ObservableMap<String, TransactionModel?> value) {
    _$cardHistoriesAtom.reportWrite(value, super.cardHistories, () {
      super.cardHistories = value;
    });
  }

  late final _$barHistoriesAtom = Atom(name: '_HistoryPageStore.barHistories', context: context);

  @override
  ObservableMap<String, TransactionModel?> get barHistories {
    _$barHistoriesAtom.reportRead();
    return super.barHistories;
  }

  @override
  set barHistories(ObservableMap<String, TransactionModel?> value) {
    _$barHistoriesAtom.reportWrite(value, super.barHistories, () {
      super.barHistories = value;
    });
  }

  late final _$historyLoadingAtom = Atom(name: '_HistoryPageStore.historyLoading', context: context);

  @override
  bool get historyLoading {
    _$historyLoadingAtom.reportRead();
    return super.historyLoading;
  }

  @override
  set historyLoading(bool value) {
    _$historyLoadingAtom.reportWrite(value, super.historyLoading, () {
      super.historyLoading = value;
    });
  }

  late final _$cardsTransactionCacheAtom = Atom(name: '_HistoryPageStore.cardsTransactionCache', context: context);

  @override
  ObservableMap<String, TransactionModel?> get cardsTransactionCache {
    _$cardsTransactionCacheAtom.reportRead();
    return super.cardsTransactionCache;
  }

  @override
  set cardsTransactionCache(ObservableMap<String, TransactionModel?> value) {
    _$cardsTransactionCacheAtom.reportWrite(value, super.cardsTransactionCache, () {
      super.cardsTransactionCache = value;
    });
  }

  late final _$barsTransactionCacheAtom = Atom(name: '_HistoryPageStore.barsTransactionCache', context: context);

  @override
  ObservableMap<String, TransactionModel?> get barsTransactionCache {
    _$barsTransactionCacheAtom.reportRead();
    return super.barsTransactionCache;
  }

  @override
  set barsTransactionCache(ObservableMap<String, TransactionModel?> value) {
    _$barsTransactionCacheAtom.reportWrite(value, super.barsTransactionCache, () {
      super.barsTransactionCache = value;
    });
  }

  late final _$disabledButtonsAtom = Atom(name: '_HistoryPageStore.disabledButtons', context: context);

  @override
  ObservableMap<String, bool> get disabledButtons {
    _$disabledButtonsAtom.reportRead();
    return super.disabledButtons;
  }

  @override
  set disabledButtons(ObservableMap<String, bool> value) {
    _$disabledButtonsAtom.reportWrite(value, super.disabledButtons, () {
      super.disabledButtons = value;
    });
  }

  late final _$cardTransactionsAtom = Atom(name: '_HistoryPageStore.cardTransactions', context: context);

  @override
  TransactionModel? get cardTransactions {
    _$cardTransactionsAtom.reportRead();
    return super.cardTransactions;
  }

  @override
  set cardTransactions(TransactionModel? value) {
    _$cardTransactionsAtom.reportWrite(value, super.cardTransactions, () {
      super.cardTransactions = value;
    });
  }

  late final _$barTransactionsAtom = Atom(name: '_HistoryPageStore.barTransactions', context: context);

  @override
  TransactionModel? get barTransactions {
    _$barTransactionsAtom.reportRead();
    return super.barTransactions;
  }

  @override
  set barTransactions(TransactionModel? value) {
    _$barTransactionsAtom.reportWrite(value, super.barTransactions, () {
      super.barTransactions = value;
    });
  }

  late final _$lastRefreshedMapAtom = Atom(name: '_HistoryPageStore.lastRefreshedMap', context: context);

  @override
  Map<String, String> get lastRefreshedMap {
    _$lastRefreshedMapAtom.reportRead();
    return super.lastRefreshedMap;
  }

  @override
  set lastRefreshedMap(Map<String, String> value) {
    _$lastRefreshedMapAtom.reportWrite(value, super.lastRefreshedMap, () {
      super.lastRefreshedMap = value;
    });
  }

  late final _$isButtonDisabledAtom = Atom(name: '_HistoryPageStore.isButtonDisabled', context: context);

  @override
  bool get isButtonDisabled {
    _$isButtonDisabledAtom.reportRead();
    return super.isButtonDisabled;
  }

  @override
  set isButtonDisabled(bool value) {
    _$isButtonDisabledAtom.reportWrite(value, super.isButtonDisabled, () {
      super.isButtonDisabled = value;
    });
  }

  late final _$isRefreshingAtom = Atom(name: '_HistoryPageStore.isRefreshing', context: context);

  @override
  bool get isRefreshing {
    _$isRefreshingAtom.reportRead();
    return super.isRefreshing;
  }

  @override
  set isRefreshing(bool value) {
    _$isRefreshingAtom.reportWrite(value, super.isRefreshing, () {
      super.isRefreshing = value;
    });
  }

  late final _$currentPageAtom = Atom(name: '_HistoryPageStore.currentPage', context: context);

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

  late final _$setRefreshingAsyncAction = AsyncAction('_HistoryPageStore.setRefreshing', context: context);

  @override
  Future<void> setRefreshing({required bool value}) {
    return _$setRefreshingAsyncAction.run(() => super.setRefreshing(value: value));
  }

  late final _$fetchNextPageTransactionsAsyncAction =
      AsyncAction('_HistoryPageStore.fetchNextPageTransactions', context: context);

  @override
  Future<void> fetchNextPageTransactions({required String address}) {
    return _$fetchNextPageTransactionsAsyncAction.run(() => super.fetchNextPageTransactions(address: address));
  }

  late final _$setCardHistoryIndexAsyncAction = AsyncAction('_HistoryPageStore.setCardHistoryIndex', context: context);

  @override
  Future<void> setCardHistoryIndex(int index) {
    return _$setCardHistoryIndexAsyncAction.run(() => super.setCardHistoryIndex(index));
  }

  late final _$setBarHistoryIndexAsyncAction = AsyncAction('_HistoryPageStore.setBarHistoryIndex', context: context);

  @override
  Future<void> setBarHistoryIndex(int index) {
    return _$setBarHistoryIndexAsyncAction.run(() => super.setBarHistoryIndex(index));
  }

  late final _$setCardSelectedAddressAsyncAction =
      AsyncAction('_HistoryPageStore.setCardSelectedAddress', context: context);

  @override
  Future<void> setCardSelectedAddress(String? value) {
    return _$setCardSelectedAddressAsyncAction.run(() => super.setCardSelectedAddress(value));
  }

  late final _$setBarSelectedAddressAsyncAction =
      AsyncAction('_HistoryPageStore.setBarSelectedAddress', context: context);

  @override
  Future<void> setBarSelectedAddress(String? value) {
    return _$setBarSelectedAddressAsyncAction.run(() => super.setBarSelectedAddress(value));
  }

  late final _$refreshAsyncAction = AsyncAction('_HistoryPageStore.refresh', context: context);

  @override
  Future<void> refresh(String cardAddress) {
    return _$refreshAsyncAction.run(() => super.refresh(cardAddress));
  }

  late final _$loadLastRefreshedAsyncAction = AsyncAction('_HistoryPageStore.loadLastRefreshed', context: context);

  @override
  Future<void> loadLastRefreshed() {
    return _$loadLastRefreshedAsyncAction.run(() => super.loadLastRefreshed());
  }

  late final _$_HistoryPageStoreActionController = ActionController(name: '_HistoryPageStore', context: context);

  @override
  void cacheCardsTransaction(String address, TransactionModel? transactions) {
    final _$actionInfo =
        _$_HistoryPageStoreActionController.startAction(name: '_HistoryPageStore.cacheCardsTransaction');
    try {
      return super.cacheCardsTransaction(address, transactions);
    } finally {
      _$_HistoryPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cacheBarsTransaction(String address, TransactionModel? transactions) {
    final _$actionInfo =
        _$_HistoryPageStoreActionController.startAction(name: '_HistoryPageStore.cacheBarsTransaction');
    try {
      return super.cacheBarsTransaction(address, transactions);
    } finally {
      _$_HistoryPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void makeInactive() {
    final _$actionInfo = _$_HistoryPageStoreActionController.startAction(name: '_HistoryPageStore.makeInactive');
    try {
      return super.makeInactive();
    } finally {
      _$_HistoryPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cardHistoryIndex: ${cardHistoryIndex},
barHistoryIndex: ${barHistoryIndex},
cardSelectedAddress: ${cardSelectedAddress},
barSelectedAddress: ${barSelectedAddress},
cardHistories: ${cardHistories},
barHistories: ${barHistories},
historyLoading: ${historyLoading},
cardsTransactionCache: ${cardsTransactionCache},
barsTransactionCache: ${barsTransactionCache},
disabledButtons: ${disabledButtons},
cardTransactions: ${cardTransactions},
barTransactions: ${barTransactions},
lastRefreshedMap: ${lastRefreshedMap},
isButtonDisabled: ${isButtonDisabled},
isRefreshing: ${isRefreshing},
currentPage: ${currentPage}
    ''';
  }
}
