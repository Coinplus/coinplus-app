// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HistoryPageStore on _HistoryPageStore, Store {
  Computed<List<TransactionItem>?>? _$cardsTransactionsComputed;

  @override
  List<TransactionItem>? get cardsTransactions =>
      (_$cardsTransactionsComputed ??= Computed<List<TransactionItem>?>(
              () => super.cardsTransactions,
              name: '_HistoryPageStore.cardsTransactions'))
          .value;
  Computed<List<TransactionItem>?>? _$barsTransactionsComputed;

  @override
  List<TransactionItem>? get barsTransactions => (_$barsTransactionsComputed ??=
          Computed<List<TransactionItem>?>(() => super.barsTransactions,
              name: '_HistoryPageStore.barsTransactions'))
      .value;
  Computed<List<String>?>? _$cardUniqueDatesComputed;

  @override
  List<String>? get cardUniqueDates => (_$cardUniqueDatesComputed ??=
          Computed<List<String>?>(() => super.cardUniqueDates,
              name: '_HistoryPageStore.cardUniqueDates'))
      .value;
  Computed<List<String>?>? _$barUniqueDatesComputed;

  @override
  List<String>? get barUniqueDates => (_$barUniqueDatesComputed ??=
          Computed<List<String>?>(() => super.barUniqueDates,
              name: '_HistoryPageStore.barUniqueDates'))
      .value;

  late final _$walletStatusAtom =
      Atom(name: '_HistoryPageStore.walletStatus', context: context);

  @override
  WalletStatusModel? get walletStatus {
    _$walletStatusAtom.reportRead();
    return super.walletStatus;
  }

  @override
  set walletStatus(WalletStatusModel? value) {
    _$walletStatusAtom.reportWrite(value, super.walletStatus, () {
      super.walletStatus = value;
    });
  }

  late final _$cardHistoryIndexAtom =
      Atom(name: '_HistoryPageStore.cardHistoryIndex', context: context);

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

  late final _$barHistoryIndexAtom =
      Atom(name: '_HistoryPageStore.barHistoryIndex', context: context);

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

  late final _$isLoadingAtom =
      Atom(name: '_HistoryPageStore.isLoading', context: context);

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

  late final _$selectedCardAddressAtom =
      Atom(name: '_HistoryPageStore.selectedCardAddress', context: context);

  @override
  String get selectedCardAddress {
    _$selectedCardAddressAtom.reportRead();
    return super.selectedCardAddress;
  }

  @override
  set selectedCardAddress(String value) {
    _$selectedCardAddressAtom.reportWrite(value, super.selectedCardAddress, () {
      super.selectedCardAddress = value;
    });
  }

  late final _$selectedBarAddressAtom =
      Atom(name: '_HistoryPageStore.selectedBarAddress', context: context);

  @override
  String get selectedBarAddress {
    _$selectedBarAddressAtom.reportRead();
    return super.selectedBarAddress;
  }

  @override
  set selectedBarAddress(String value) {
    _$selectedBarAddressAtom.reportWrite(value, super.selectedBarAddress, () {
      super.selectedBarAddress = value;
    });
  }

  late final _$cardHistoriesAtom =
      Atom(name: '_HistoryPageStore.cardHistories', context: context);

  @override
  ObservableMap<String, List<TransactionModel>> get cardHistories {
    _$cardHistoriesAtom.reportRead();
    return super.cardHistories;
  }

  @override
  set cardHistories(ObservableMap<String, List<TransactionModel>> value) {
    _$cardHistoriesAtom.reportWrite(value, super.cardHistories, () {
      super.cardHistories = value;
    });
  }

  late final _$barHistoriesAtom =
      Atom(name: '_HistoryPageStore.barHistories', context: context);

  @override
  ObservableMap<String, List<TransactionModel>> get barHistories {
    _$barHistoriesAtom.reportRead();
    return super.barHistories;
  }

  @override
  set barHistories(ObservableMap<String, List<TransactionModel>> value) {
    _$barHistoriesAtom.reportWrite(value, super.barHistories, () {
      super.barHistories = value;
    });
  }

  late final _$cardTransactionCacheAtom =
      Atom(name: '_HistoryPageStore.cardTransactionCache', context: context);

  @override
  ObservableMap<String, List<TransactionModel>> get cardTransactionCache {
    _$cardTransactionCacheAtom.reportRead();
    return super.cardTransactionCache;
  }

  @override
  set cardTransactionCache(
      ObservableMap<String, List<TransactionModel>> value) {
    _$cardTransactionCacheAtom.reportWrite(value, super.cardTransactionCache,
        () {
      super.cardTransactionCache = value;
    });
  }

  late final _$barTransactionCacheAtom =
      Atom(name: '_HistoryPageStore.barTransactionCache', context: context);

  @override
  ObservableMap<String, List<TransactionModel>> get barTransactionCache {
    _$barTransactionCacheAtom.reportRead();
    return super.barTransactionCache;
  }

  @override
  set barTransactionCache(ObservableMap<String, List<TransactionModel>> value) {
    _$barTransactionCacheAtom.reportWrite(value, super.barTransactionCache, () {
      super.barTransactionCache = value;
    });
  }

  late final _$cardActivationStatusAtom =
      Atom(name: '_HistoryPageStore.cardActivationStatus', context: context);

  @override
  ObservableMap<String, bool> get cardActivationStatus {
    _$cardActivationStatusAtom.reportRead();
    return super.cardActivationStatus;
  }

  @override
  set cardActivationStatus(ObservableMap<String, bool> value) {
    _$cardActivationStatusAtom.reportWrite(value, super.cardActivationStatus,
        () {
      super.cardActivationStatus = value;
    });
  }

  late final _$historyLoadingAtom =
      Atom(name: '_HistoryPageStore.historyLoading', context: context);

  @override
  ObservableMap<String, bool> get historyLoading {
    _$historyLoadingAtom.reportRead();
    return super.historyLoading;
  }

  @override
  set historyLoading(ObservableMap<String, bool> value) {
    _$historyLoadingAtom.reportWrite(value, super.historyLoading, () {
      super.historyLoading = value;
    });
  }

  late final _$barActivationStatusAtom =
      Atom(name: '_HistoryPageStore.barActivationStatus', context: context);

  @override
  ObservableMap<String, bool> get barActivationStatus {
    _$barActivationStatusAtom.reportRead();
    return super.barActivationStatus;
  }

  @override
  set barActivationStatus(ObservableMap<String, bool> value) {
    _$barActivationStatusAtom.reportWrite(value, super.barActivationStatus, () {
      super.barActivationStatus = value;
    });
  }

  late final _$disabledButtonsAtom =
      Atom(name: '_HistoryPageStore.disabledButtons', context: context);

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

  late final _$cardTransactionsAtom =
      Atom(name: '_HistoryPageStore.cardTransactions', context: context);

  @override
  List<TransactionModel> get cardTransactions {
    _$cardTransactionsAtom.reportRead();
    return super.cardTransactions;
  }

  @override
  set cardTransactions(List<TransactionModel> value) {
    _$cardTransactionsAtom.reportWrite(value, super.cardTransactions, () {
      super.cardTransactions = value;
    });
  }

  late final _$newFetchedDataAtom =
      Atom(name: '_HistoryPageStore.newFetchedData', context: context);

  @override
  List<TransactionModel> get newFetchedData {
    _$newFetchedDataAtom.reportRead();
    return super.newFetchedData;
  }

  @override
  set newFetchedData(List<TransactionModel> value) {
    _$newFetchedDataAtom.reportWrite(value, super.newFetchedData, () {
      super.newFetchedData = value;
    });
  }

  late final _$newFetchedBarDataAtom =
      Atom(name: '_HistoryPageStore.newFetchedBarData', context: context);

  @override
  List<TransactionModel> get newFetchedBarData {
    _$newFetchedBarDataAtom.reportRead();
    return super.newFetchedBarData;
  }

  @override
  set newFetchedBarData(List<TransactionModel> value) {
    _$newFetchedBarDataAtom.reportWrite(value, super.newFetchedBarData, () {
      super.newFetchedBarData = value;
    });
  }

  late final _$barTransactionsAtom =
      Atom(name: '_HistoryPageStore.barTransactions', context: context);

  @override
  List<TransactionModel> get barTransactions {
    _$barTransactionsAtom.reportRead();
    return super.barTransactions;
  }

  @override
  set barTransactions(List<TransactionModel> value) {
    _$barTransactionsAtom.reportWrite(value, super.barTransactions, () {
      super.barTransactions = value;
    });
  }

  late final _$lastRefreshedMapAtom =
      Atom(name: '_HistoryPageStore.lastRefreshedMap', context: context);

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

  late final _$isButtonDisabledAtom =
      Atom(name: '_HistoryPageStore.isButtonDisabled', context: context);

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

  late final _$isRefreshingAtom =
      Atom(name: '_HistoryPageStore.isRefreshing', context: context);

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

  late final _$cardCurrentPageAtom =
      Atom(name: '_HistoryPageStore.cardCurrentPage', context: context);

  @override
  int get cardCurrentPage {
    _$cardCurrentPageAtom.reportRead();
    return super.cardCurrentPage;
  }

  @override
  set cardCurrentPage(int value) {
    _$cardCurrentPageAtom.reportWrite(value, super.cardCurrentPage, () {
      super.cardCurrentPage = value;
    });
  }

  late final _$barCurrentPageAtom =
      Atom(name: '_HistoryPageStore.barCurrentPage', context: context);

  @override
  int get barCurrentPage {
    _$barCurrentPageAtom.reportRead();
    return super.barCurrentPage;
  }

  @override
  set barCurrentPage(int value) {
    _$barCurrentPageAtom.reportWrite(value, super.barCurrentPage, () {
      super.barCurrentPage = value;
    });
  }

  late final _$tabIndexAtom =
      Atom(name: '_HistoryPageStore.tabIndex', context: context);

  @override
  int get tabIndex {
    _$tabIndexAtom.reportRead();
    return super.tabIndex;
  }

  @override
  set tabIndex(int value) {
    _$tabIndexAtom.reportWrite(value, super.tabIndex, () {
      super.tabIndex = value;
    });
  }

  late final _$isCardRefreshingAtom =
      Atom(name: '_HistoryPageStore.isCardRefreshing', context: context);

  @override
  bool get isCardRefreshing {
    _$isCardRefreshingAtom.reportRead();
    return super.isCardRefreshing;
  }

  @override
  set isCardRefreshing(bool value) {
    _$isCardRefreshingAtom.reportWrite(value, super.isCardRefreshing, () {
      super.isCardRefreshing = value;
    });
  }

  late final _$isBarRefreshingAtom =
      Atom(name: '_HistoryPageStore.isBarRefreshing', context: context);

  @override
  bool get isBarRefreshing {
    _$isBarRefreshingAtom.reportRead();
    return super.isBarRefreshing;
  }

  @override
  set isBarRefreshing(bool value) {
    _$isBarRefreshingAtom.reportWrite(value, super.isBarRefreshing, () {
      super.isBarRefreshing = value;
    });
  }

  late final _$cardActivationIndexAtom =
      Atom(name: '_HistoryPageStore.cardActivationIndex', context: context);

  @override
  int get cardActivationIndex {
    _$cardActivationIndexAtom.reportRead();
    return super.cardActivationIndex;
  }

  @override
  set cardActivationIndex(int value) {
    _$cardActivationIndexAtom.reportWrite(value, super.cardActivationIndex, () {
      super.cardActivationIndex = value;
    });
  }

  late final _$barActivationIndexAtom =
      Atom(name: '_HistoryPageStore.barActivationIndex', context: context);

  @override
  int get barActivationIndex {
    _$barActivationIndexAtom.reportRead();
    return super.barActivationIndex;
  }

  @override
  set barActivationIndex(int value) {
    _$barActivationIndexAtom.reportWrite(value, super.barActivationIndex, () {
      super.barActivationIndex = value;
    });
  }

  late final _$setTabIndexAsyncAction =
      AsyncAction('_HistoryPageStore.setTabIndex', context: context);

  @override
  Future<void> setTabIndex(int value) {
    return _$setTabIndexAsyncAction.run(() => super.setTabIndex(value));
  }

  late final _$setRefreshingAsyncAction =
      AsyncAction('_HistoryPageStore.setRefreshing', context: context);

  @override
  Future<void> setRefreshing({required bool value}) {
    return _$setRefreshingAsyncAction
        .run(() => super.setRefreshing(value: value));
  }

  late final _$loadCardActivationStatusAsyncAction = AsyncAction(
      '_HistoryPageStore.loadCardActivationStatus',
      context: context);

  @override
  Future<void> loadCardActivationStatus(List<CardModel> cards) {
    return _$loadCardActivationStatusAsyncAction
        .run(() => super.loadCardActivationStatus(cards));
  }

  late final _$loadBarActivationStatusAsyncAction = AsyncAction(
      '_HistoryPageStore.loadBarActivationStatus',
      context: context);

  @override
  Future<void> loadBarActivationStatus(List<BarModel> bars) {
    return _$loadBarActivationStatusAsyncAction
        .run(() => super.loadBarActivationStatus(bars));
  }

  late final _$getSingleCardHistoryAsyncAction =
      AsyncAction('_HistoryPageStore.getSingleCardHistory', context: context);

  @override
  Future<void> getSingleCardHistory({required String address}) {
    return _$getSingleCardHistoryAsyncAction
        .run(() => super.getSingleCardHistory(address: address));
  }

  late final _$getSingleBarHistoryAsyncAction =
      AsyncAction('_HistoryPageStore.getSingleBarHistory', context: context);

  @override
  Future<void> getSingleBarHistory({required String address}) {
    return _$getSingleBarHistoryAsyncAction
        .run(() => super.getSingleBarHistory(address: address));
  }

  late final _$isCachedCardTransactionsAsyncAction = AsyncAction(
      '_HistoryPageStore.isCachedCardTransactions',
      context: context);

  @override
  Future<void> isCachedCardTransactions(String address) {
    return _$isCachedCardTransactionsAsyncAction
        .run(() => super.isCachedCardTransactions(address));
  }

  late final _$isCachedBarTransactionsAsyncAction = AsyncAction(
      '_HistoryPageStore.isCachedBarTransactions',
      context: context);

  @override
  Future<void> isCachedBarTransactions(String address) {
    return _$isCachedBarTransactionsAsyncAction
        .run(() => super.isCachedBarTransactions(address));
  }

  late final _$setCardActivationIndexAsyncAction =
      AsyncAction('_HistoryPageStore.setCardActivationIndex', context: context);

  @override
  Future<void> setCardActivationIndex({required int index}) {
    return _$setCardActivationIndexAsyncAction
        .run(() => super.setCardActivationIndex(index: index));
  }

  late final _$setBarActivationIndexAsyncAction =
      AsyncAction('_HistoryPageStore.setBarActivationIndex', context: context);

  @override
  Future<void> setBarActivationIndex({required int index}) {
    return _$setBarActivationIndexAsyncAction
        .run(() => super.setBarActivationIndex(index: index));
  }

  late final _$getWalletStatusAsyncAction =
      AsyncAction('_HistoryPageStore.getWalletStatus', context: context);

  @override
  Future<void> getWalletStatus({required String address}) {
    return _$getWalletStatusAsyncAction
        .run(() => super.getWalletStatus(address: address));
  }

  late final _$fetchCardNextPageTransactionsAsyncAction = AsyncAction(
      '_HistoryPageStore.fetchCardNextPageTransactions',
      context: context);

  @override
  Future<void> fetchCardNextPageTransactions({required String address}) {
    return _$fetchCardNextPageTransactionsAsyncAction
        .run(() => super.fetchCardNextPageTransactions(address: address));
  }

  late final _$fetchBarNextPageTransactionsAsyncAction = AsyncAction(
      '_HistoryPageStore.fetchBarNextPageTransactions',
      context: context);

  @override
  Future<void> fetchBarNextPageTransactions({required String address}) {
    return _$fetchBarNextPageTransactionsAsyncAction
        .run(() => super.fetchBarNextPageTransactions(address: address));
  }

  late final _$setCardHistoryIndexAsyncAction =
      AsyncAction('_HistoryPageStore.setCardHistoryIndex', context: context);

  @override
  Future<void> setCardHistoryIndex(int index) {
    return _$setCardHistoryIndexAsyncAction
        .run(() => super.setCardHistoryIndex(index));
  }

  late final _$setBarHistoryIndexAsyncAction =
      AsyncAction('_HistoryPageStore.setBarHistoryIndex', context: context);

  @override
  Future<void> setBarHistoryIndex(int index) {
    return _$setBarHistoryIndexAsyncAction
        .run(() => super.setBarHistoryIndex(index));
  }

  late final _$setCardSelectedAddressAsyncAction =
      AsyncAction('_HistoryPageStore.setCardSelectedAddress', context: context);

  @override
  Future<void> setCardSelectedAddress(String? value) {
    return _$setCardSelectedAddressAsyncAction
        .run(() => super.setCardSelectedAddress(value));
  }

  late final _$setBarSelectedAddressAsyncAction =
      AsyncAction('_HistoryPageStore.setBarSelectedAddress', context: context);

  @override
  Future<void> setBarSelectedAddress(String? value) {
    return _$setBarSelectedAddressAsyncAction
        .run(() => super.setBarSelectedAddress(value));
  }

  late final _$saveAndPatchCardAddressAsyncAction = AsyncAction(
      '_HistoryPageStore.saveAndPatchCardAddress',
      context: context);

  @override
  Future<void> saveAndPatchCardAddress(String address) {
    return _$saveAndPatchCardAddressAsyncAction
        .run(() => super.saveAndPatchCardAddress(address));
  }

  late final _$saveAndPatchBarAddressAsyncAction =
      AsyncAction('_HistoryPageStore.saveAndPatchBarAddress', context: context);

  @override
  Future<void> saveAndPatchBarAddress(String address) {
    return _$saveAndPatchBarAddressAsyncAction
        .run(() => super.saveAndPatchBarAddress(address));
  }

  late final _$cardRefreshAsyncAction =
      AsyncAction('_HistoryPageStore.cardRefresh', context: context);

  @override
  Future<void> cardRefresh(String cardAddress) {
    return _$cardRefreshAsyncAction.run(() => super.cardRefresh(cardAddress));
  }

  late final _$barRefreshAsyncAction =
      AsyncAction('_HistoryPageStore.barRefresh', context: context);

  @override
  Future<void> barRefresh(String cardAddress) {
    return _$barRefreshAsyncAction.run(() => super.barRefresh(cardAddress));
  }

  late final _$loadLastRefreshedAsyncAction =
      AsyncAction('_HistoryPageStore.loadLastRefreshed', context: context);

  @override
  Future<void> loadLastRefreshed() {
    return _$loadLastRefreshedAsyncAction.run(() => super.loadLastRefreshed());
  }

  late final _$deleteAddressFromHistoryMapAsyncAction = AsyncAction(
      '_HistoryPageStore.deleteAddressFromHistoryMap',
      context: context);

  @override
  Future<void> deleteAddressFromHistoryMap({required String address}) {
    return _$deleteAddressFromHistoryMapAsyncAction
        .run(() => super.deleteAddressFromHistoryMap(address: address));
  }

  late final _$_HistoryPageStoreActionController =
      ActionController(name: '_HistoryPageStore', context: context);

  @override
  void cacheCardTransaction(
      String address, List<TransactionModel> transactions) {
    final _$actionInfo = _$_HistoryPageStoreActionController.startAction(
        name: '_HistoryPageStore.cacheCardTransaction');
    try {
      return super.cacheCardTransaction(address, transactions);
    } finally {
      _$_HistoryPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void cacheBarTransaction(
      String address, List<TransactionModel> transactions) {
    final _$actionInfo = _$_HistoryPageStoreActionController.startAction(
        name: '_HistoryPageStore.cacheBarTransaction');
    try {
      return super.cacheBarTransaction(address, transactions);
    } finally {
      _$_HistoryPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<TransactionModel>? getCardCachedTransaction(String address) {
    final _$actionInfo = _$_HistoryPageStoreActionController.startAction(
        name: '_HistoryPageStore.getCardCachedTransaction');
    try {
      return super.getCardCachedTransaction(address);
    } finally {
      _$_HistoryPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<TransactionModel>? getBarCachedTransaction(String address) {
    final _$actionInfo = _$_HistoryPageStoreActionController.startAction(
        name: '_HistoryPageStore.getBarCachedTransaction');
    try {
      return super.getBarCachedTransaction(address);
    } finally {
      _$_HistoryPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCardActivationStatus(
      {required String address, required bool status}) {
    final _$actionInfo = _$_HistoryPageStoreActionController.startAction(
        name: '_HistoryPageStore.setCardActivationStatus');
    try {
      return super.setCardActivationStatus(address: address, status: status);
    } finally {
      _$_HistoryPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBarActivationStatus({required String address, required bool status}) {
    final _$actionInfo = _$_HistoryPageStoreActionController.startAction(
        name: '_HistoryPageStore.setBarActivationStatus');
    try {
      return super.setBarActivationStatus(address: address, status: status);
    } finally {
      _$_HistoryPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void makeInactive() {
    final _$actionInfo = _$_HistoryPageStoreActionController.startAction(
        name: '_HistoryPageStore.makeInactive');
    try {
      return super.makeInactive();
    } finally {
      _$_HistoryPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void makeActive() {
    final _$actionInfo = _$_HistoryPageStoreActionController.startAction(
        name: '_HistoryPageStore.makeActive');
    try {
      return super.makeActive();
    } finally {
      _$_HistoryPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
walletStatus: ${walletStatus},
cardHistoryIndex: ${cardHistoryIndex},
barHistoryIndex: ${barHistoryIndex},
isLoading: ${isLoading},
selectedCardAddress: ${selectedCardAddress},
selectedBarAddress: ${selectedBarAddress},
cardHistories: ${cardHistories},
barHistories: ${barHistories},
cardTransactionCache: ${cardTransactionCache},
barTransactionCache: ${barTransactionCache},
cardActivationStatus: ${cardActivationStatus},
historyLoading: ${historyLoading},
barActivationStatus: ${barActivationStatus},
disabledButtons: ${disabledButtons},
cardTransactions: ${cardTransactions},
newFetchedData: ${newFetchedData},
newFetchedBarData: ${newFetchedBarData},
barTransactions: ${barTransactions},
lastRefreshedMap: ${lastRefreshedMap},
isButtonDisabled: ${isButtonDisabled},
isRefreshing: ${isRefreshing},
cardCurrentPage: ${cardCurrentPage},
barCurrentPage: ${barCurrentPage},
tabIndex: ${tabIndex},
isCardRefreshing: ${isCardRefreshing},
isBarRefreshing: ${isBarRefreshing},
cardActivationIndex: ${cardActivationIndex},
barActivationIndex: ${barActivationIndex},
cardsTransactions: ${cardsTransactions},
barsTransactions: ${barsTransactions},
cardUniqueDates: ${cardUniqueDates},
barUniqueDates: ${barUniqueDates}
    ''';
  }
}
