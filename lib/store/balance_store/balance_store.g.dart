// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BalanceStore on _BalanceStore, Store {
  Computed<num?>? _$btcPriceComputed;

  @override
  num? get btcPrice =>
      (_$btcPriceComputed ??= Computed<num?>(() => super.btcPrice, name: '_BalanceStore.btcPrice')).value;
  Computed<num?>? _$ethPriceComputed;

  @override
  num? get ethPrice =>
      (_$ethPriceComputed ??= Computed<num?>(() => super.ethPrice, name: '_BalanceStore.ethPrice')).value;
  Computed<num>? _$allCardsBalancesComputed;

  @override
  num get allCardsBalances => (_$allCardsBalancesComputed ??=
          Computed<num>(() => super.allCardsBalances, name: '_BalanceStore.allCardsBalances'))
      .value;
  Computed<num>? _$allEthCardsBalancesComputed;

  @override
  num get allEthCardsBalances => (_$allEthCardsBalancesComputed ??=
          Computed<num>(() => super.allEthCardsBalances, name: '_BalanceStore.allEthCardsBalances'))
      .value;
  Computed<CoinModel?>? _$singleCoinComputed;

  @override
  CoinModel? get singleCoin =>
      (_$singleCoinComputed ??= Computed<CoinModel?>(() => super.singleCoin, name: '_BalanceStore.singleCoin')).value;
  Computed<num>? _$cardBalanceComputed;

  @override
  num get cardBalance =>
      (_$cardBalanceComputed ??= Computed<num>(() => super.cardBalance, name: '_BalanceStore.cardBalance')).value;
  Computed<num>? _$backupCardBalanceComputed;

  @override
  num get backupCardBalance => (_$backupCardBalanceComputed ??=
          Computed<num>(() => super.backupCardBalance, name: '_BalanceStore.backupCardBalance'))
      .value;
  Computed<num?>? _$barBalanceComputed;

  @override
  num? get barBalance =>
      (_$barBalanceComputed ??= Computed<num?>(() => super.barBalance, name: '_BalanceStore.barBalance')).value;
  Computed<List<Object>>? _$allCardsComputed;

  @override
  List<Object> get allCards =>
      (_$allCardsComputed ??= Computed<List<Object>>(() => super.allCards, name: '_BalanceStore.allCards')).value;

  late final _$_cardsAtom = Atom(name: '_BalanceStore._cards', context: context);

  ObservableList<CardModel> get cards {
    _$_cardsAtom.reportRead();
    return super._cards;
  }

  @override
  ObservableList<CardModel> get _cards => cards;

  @override
  set _cards(ObservableList<CardModel> value) {
    _$_cardsAtom.reportWrite(value, super._cards, () {
      super._cards = value;
    });
  }

  late final _$_backupCardsAtom = Atom(name: '_BalanceStore._backupCards', context: context);

  ObservableList<CardModel> get backupCards {
    _$_backupCardsAtom.reportRead();
    return super._backupCards;
  }

  @override
  ObservableList<CardModel> get _backupCards => backupCards;

  @override
  set _backupCards(ObservableList<CardModel> value) {
    _$_backupCardsAtom.reportWrite(value, super._backupCards, () {
      super._backupCards = value;
    });
  }

  late final _$_ethCardsAtom = Atom(name: '_BalanceStore._ethCards', context: context);

  ObservableList<EthCardModel> get ethCards {
    _$_ethCardsAtom.reportRead();
    return super._ethCards;
  }

  @override
  ObservableList<EthCardModel> get _ethCards => ethCards;

  @override
  set _ethCards(ObservableList<EthCardModel> value) {
    _$_ethCardsAtom.reportWrite(value, super._ethCards, () {
      super._ethCards = value;
    });
  }

  late final _$_barsAtom = Atom(name: '_BalanceStore._bars', context: context);

  ObservableList<BarModel> get bars {
    _$_barsAtom.reportRead();
    return super._bars;
  }

  @override
  ObservableList<BarModel> get _bars => bars;

  @override
  set _bars(ObservableList<BarModel> value) {
    _$_barsAtom.reportWrite(value, super._bars, () {
      super._bars = value;
    });
  }

  late final _$cardMapResultAtom = Atom(name: '_BalanceStore.cardMapResult', context: context);

  @override
  MapResult? get cardMapResult {
    _$cardMapResultAtom.reportRead();
    return super.cardMapResult;
  }

  @override
  set cardMapResult(MapResult? value) {
    _$cardMapResultAtom.reportWrite(value, super.cardMapResult, () {
      super.cardMapResult = value;
    });
  }

  late final _$listResultAtom = Atom(name: '_BalanceStore.listResult', context: context);

  @override
  List<dynamic>? get listResult {
    _$listResultAtom.reportRead();
    return super.listResult;
  }

  @override
  set listResult(List<dynamic>? value) {
    _$listResultAtom.reportWrite(value, super.listResult, () {
      super.listResult = value;
    });
  }

  late final _$barMapResultAtom = Atom(name: '_BalanceStore.barMapResult', context: context);

  @override
  MapResult? get barMapResult {
    _$barMapResultAtom.reportRead();
    return super.barMapResult;
  }

  @override
  set barMapResult(MapResult? value) {
    _$barMapResultAtom.reportWrite(value, super.barMapResult, () {
      super.barMapResult = value;
    });
  }

  late final _$_selectedCardAtom = Atom(name: '_BalanceStore._selectedCard', context: context);

  CardModel? get selectedCard {
    _$_selectedCardAtom.reportRead();
    return super._selectedCard;
  }

  @override
  CardModel? get _selectedCard => selectedCard;

  @override
  set _selectedCard(CardModel? value) {
    _$_selectedCardAtom.reportWrite(value, super._selectedCard, () {
      super._selectedCard = value;
    });
  }

  late final _$_selectedBackupCardAtom = Atom(name: '_BalanceStore._selectedBackupCard', context: context);

  CardModel? get selectedBackupCard {
    _$_selectedBackupCardAtom.reportRead();
    return super._selectedBackupCard;
  }

  @override
  CardModel? get _selectedBackupCard => selectedBackupCard;

  @override
  set _selectedBackupCard(CardModel? value) {
    _$_selectedBackupCardAtom.reportWrite(value, super._selectedBackupCard, () {
      super._selectedBackupCard = value;
    });
  }

  late final _$_selectedEthCardAtom = Atom(name: '_BalanceStore._selectedEthCard', context: context);

  EthCardModel? get selectedEthCard {
    _$_selectedEthCardAtom.reportRead();
    return super._selectedEthCard;
  }

  @override
  EthCardModel? get _selectedEthCard => selectedEthCard;

  @override
  set _selectedEthCard(EthCardModel? value) {
    _$_selectedEthCardAtom.reportWrite(value, super._selectedEthCard, () {
      super._selectedEthCard = value;
    });
  }

  late final _$_selectedBarAtom = Atom(name: '_BalanceStore._selectedBar', context: context);

  BarModel? get selectedBar {
    _$_selectedBarAtom.reportRead();
    return super._selectedBar;
  }

  @override
  BarModel? get _selectedBar => selectedBar;

  @override
  set _selectedBar(BarModel? value) {
    _$_selectedBarAtom.reportWrite(value, super._selectedBar, () {
      super._selectedBar = value;
    });
  }

  late final _$loadingsAtom = Atom(name: '_BalanceStore.loadings', context: context);

  @override
  ObservableMap<String, bool> get loadings {
    _$loadingsAtom.reportRead();
    return super.loadings;
  }

  @override
  set loadings(ObservableMap<String, bool> value) {
    _$loadingsAtom.reportWrite(value, super.loadings, () {
      super.loadings = value;
    });
  }

  late final _$balanceLoadingAtom = Atom(name: '_BalanceStore.balanceLoading', context: context);

  @override
  bool get balanceLoading {
    _$balanceLoadingAtom.reportRead();
    return super.balanceLoading;
  }

  @override
  set balanceLoading(bool value) {
    _$balanceLoadingAtom.reportWrite(value, super.balanceLoading, () {
      super.balanceLoading = value;
    });
  }

  late final _$cardCurrentIndexAtom = Atom(name: '_BalanceStore.cardCurrentIndex', context: context);

  @override
  int get cardCurrentIndex {
    _$cardCurrentIndexAtom.reportRead();
    return super.cardCurrentIndex;
  }

  @override
  set cardCurrentIndex(int value) {
    _$cardCurrentIndexAtom.reportWrite(value, super.cardCurrentIndex, () {
      super.cardCurrentIndex = value;
    });
  }

  late final _$barCurrentIndexAtom = Atom(name: '_BalanceStore.barCurrentIndex', context: context);

  @override
  int get barCurrentIndex {
    _$barCurrentIndexAtom.reportRead();
    return super.barCurrentIndex;
  }

  @override
  set barCurrentIndex(int value) {
    _$barCurrentIndexAtom.reportWrite(value, super.barCurrentIndex, () {
      super.barCurrentIndex = value;
    });
  }

  late final _$barActivationAtom = Atom(name: '_BalanceStore.barActivation', context: context);

  @override
  bool get barActivation {
    _$barActivationAtom.reportRead();
    return super.barActivation;
  }

  @override
  set barActivation(bool value) {
    _$barActivationAtom.reportWrite(value, super.barActivation, () {
      super.barActivation = value;
    });
  }

  late final _$cardActivationAtom = Atom(name: '_BalanceStore.cardActivation', context: context);

  @override
  bool get cardActivation {
    _$cardActivationAtom.reportRead();
    return super.cardActivation;
  }

  @override
  set cardActivation(bool value) {
    _$cardActivationAtom.reportWrite(value, super.cardActivation, () {
      super.cardActivation = value;
    });
  }

  late final _$inAppWebViewLoadingAtom = Atom(name: '_BalanceStore.inAppWebViewLoading', context: context);

  @override
  bool get inAppWebViewLoading {
    _$inAppWebViewLoadingAtom.reportRead();
    return super.inAppWebViewLoading;
  }

  @override
  set inAppWebViewLoading(bool value) {
    _$inAppWebViewLoadingAtom.reportWrite(value, super.inAppWebViewLoading, () {
      super.inAppWebViewLoading = value;
    });
  }

  late final _$cardIndicatorIndexAtom = Atom(name: '_BalanceStore.cardIndicatorIndex', context: context);

  @override
  int get cardIndicatorIndex {
    _$cardIndicatorIndexAtom.reportRead();
    return super.cardIndicatorIndex;
  }

  @override
  set cardIndicatorIndex(int value) {
    _$cardIndicatorIndexAtom.reportWrite(value, super.cardIndicatorIndex, () {
      super.cardIndicatorIndex = value;
    });
  }

  late final _$isCardIndicatorTappedAtom = Atom(name: '_BalanceStore.isCardIndicatorTapped', context: context);

  @override
  bool get isCardIndicatorTapped {
    _$isCardIndicatorTappedAtom.reportRead();
    return super.isCardIndicatorTapped;
  }

  @override
  set isCardIndicatorTapped(bool value) {
    _$isCardIndicatorTappedAtom.reportWrite(value, super.isCardIndicatorTapped, () {
      super.isCardIndicatorTapped = value;
    });
  }

  late final _$chainTypeAtom = Atom(name: '_BalanceStore.chainType', context: context);

  @override
  BlockchainType get chainType {
    _$chainTypeAtom.reportRead();
    return super.chainType;
  }

  @override
  set chainType(BlockchainType value) {
    _$chainTypeAtom.reportWrite(value, super.chainType, () {
      super.chainType = value;
    });
  }

  late final _$mainWalletAddressAtom = Atom(name: '_BalanceStore.mainWalletAddress', context: context);

  @override
  String get mainWalletAddress {
    _$mainWalletAddressAtom.reportRead();
    return super.mainWalletAddress;
  }

  @override
  set mainWalletAddress(String value) {
    _$mainWalletAddressAtom.reportWrite(value, super.mainWalletAddress, () {
      super.mainWalletAddress = value;
    });
  }

  late final _$backupSingleCardAtom = Atom(name: '_BalanceStore.backupSingleCard', context: context);

  @override
  CardModel? get backupSingleCard {
    _$backupSingleCardAtom.reportRead();
    return super.backupSingleCard;
  }

  @override
  set backupSingleCard(CardModel? value) {
    _$backupSingleCardAtom.reportWrite(value, super.backupSingleCard, () {
      super.backupSingleCard = value;
    });
  }

  late final _$backupCardLoadingAtom = Atom(name: '_BalanceStore.backupCardLoading', context: context);

  @override
  bool get backupCardLoading {
    _$backupCardLoadingAtom.reportRead();
    return super.backupCardLoading;
  }

  @override
  set backupCardLoading(bool value) {
    _$backupCardLoadingAtom.reportWrite(value, super.backupCardLoading, () {
      super.backupCardLoading = value;
    });
  }

  late final _$hasBackUpAtom = Atom(name: '_BalanceStore.hasBackUp', context: context);

  @override
  bool? get hasBackUp {
    _$hasBackUpAtom.reportRead();
    return super.hasBackUp;
  }

  @override
  set hasBackUp(bool? value) {
    _$hasBackUpAtom.reportWrite(value, super.hasBackUp, () {
      super.hasBackUp = value;
    });
  }

  late final _$fetchHasBackUpAsyncAction = AsyncAction('_BalanceStore.fetchHasBackUp', context: context);

  @override
  Future<void> fetchHasBackUp(String address) {
    return _$fetchHasBackUpAsyncAction.run(() => super.fetchHasBackUp(address));
  }

  late final _$loadBackupCardAsyncAction = AsyncAction('_BalanceStore.loadBackupCard', context: context);

  @override
  Future<void> loadBackupCard(String mainCardAddress) {
    return _$loadBackupCardAsyncAction.run(() => super.loadBackupCard(mainCardAddress));
  }

  late final _$getCardsInfoAsyncAction = AsyncAction('_BalanceStore.getCardsInfo', context: context);

  @override
  Future<void> getCardsInfo() {
    return _$getCardsInfoAsyncAction.run(() => super.getCardsInfo());
  }

  late final _$getBarsInfoAsyncAction = AsyncAction('_BalanceStore.getBarsInfo', context: context);

  @override
  Future<void> getBarsInfo() {
    return _$getBarsInfoAsyncAction.run(() => super.getBarsInfo());
  }

  late final _$getEthCardAsyncAction = AsyncAction('_BalanceStore.getEthCard', context: context);

  @override
  Future<EthCardModel> getEthCard({required int index}) {
    return _$getEthCardAsyncAction.run(() => super.getEthCard(index: index));
  }

  late final _$getEthCardsInfoAsyncAction = AsyncAction('_BalanceStore.getEthCardsInfo', context: context);

  @override
  Future<void> getEthCardsInfo() {
    return _$getEthCardsInfoAsyncAction.run(() => super.getEthCardsInfo());
  }

  late final _$getBackupCardsInfoAsyncAction = AsyncAction('_BalanceStore.getBackupCardsInfo', context: context);

  @override
  Future<void> getBackupCardsInfo() {
    return _$getBackupCardsInfoAsyncAction.run(() => super.getBackupCardsInfo());
  }

  late final _$updateCardIndicatorIndexAsyncAction =
      AsyncAction('_BalanceStore.updateCardIndicatorIndex', context: context);

  @override
  Future<void> updateCardIndicatorIndex(int index) {
    return _$updateCardIndicatorIndexAsyncAction.run(() => super.updateCardIndicatorIndex(index));
  }

  late final _$cardIndicatorTapStatusAsyncAction =
      AsyncAction('_BalanceStore.cardIndicatorTapStatus', context: context);

  @override
  Future<void> cardIndicatorTapStatus({required bool status}) {
    return _$cardIndicatorTapStatusAsyncAction.run(() => super.cardIndicatorTapStatus(status: status));
  }

  late final _$getSelectedCardAsyncAction = AsyncAction('_BalanceStore.getSelectedCard', context: context);

  @override
  Future<void> getSelectedCard(String address) {
    return _$getSelectedCardAsyncAction.run(() => super.getSelectedCard(address));
  }

  late final _$getSelectedBackupCardAsyncAction = AsyncAction('_BalanceStore.getSelectedBackupCard', context: context);

  @override
  Future<void> getSelectedBackupCard(String address) {
    return _$getSelectedBackupCardAsyncAction.run(() => super.getSelectedBackupCard(address));
  }

  late final _$getSelectedBarAsyncAction = AsyncAction('_BalanceStore.getSelectedBar', context: context);

  @override
  Future<void> getSelectedBar(String address) {
    return _$getSelectedBarAsyncAction.run(() => super.getSelectedBar(address));
  }

  late final _$removeSelectedCardAsyncAction = AsyncAction('_BalanceStore.removeSelectedCard', context: context);

  @override
  Future<void> removeSelectedCard({required String address}) {
    return _$removeSelectedCardAsyncAction.run(() => super.removeSelectedCard(address: address));
  }

  late final _$removeSelectedBackupCardAsyncAction =
      AsyncAction('_BalanceStore.removeSelectedBackupCard', context: context);

  @override
  Future<void> removeSelectedBackupCard({required String address}) {
    return _$removeSelectedBackupCardAsyncAction.run(() => super.removeSelectedBackupCard(address: address));
  }

  late final _$replaceMainCardWithBackupAsyncAction =
      AsyncAction('_BalanceStore.replaceMainCardWithBackup', context: context);

  @override
  Future<void> replaceMainCardWithBackup({required String mainCardAddress, required CardModel? backedUpCard}) {
    return _$replaceMainCardWithBackupAsyncAction
        .run(() => super.replaceMainCardWithBackup(mainCardAddress: mainCardAddress, backedUpCard: backedUpCard));
  }

  late final _$removeSelectedEthCardAsyncAction = AsyncAction('_BalanceStore.removeSelectedEthCard', context: context);

  @override
  Future<void> removeSelectedEthCard() {
    return _$removeSelectedEthCardAsyncAction.run(() => super.removeSelectedEthCard());
  }

  late final _$removeSelectedBarAsyncAction = AsyncAction('_BalanceStore.removeSelectedBar', context: context);

  @override
  Future<void> removeSelectedBar() {
    return _$removeSelectedBarAsyncAction.run(() => super.removeSelectedBar());
  }

  late final _$getCardAsyncAction = AsyncAction('_BalanceStore.getCard', context: context);

  @override
  Future<bool?> getCard({required String? receivedData, required TextEditingController textEditingController}) {
    return _$getCardAsyncAction
        .run(() => super.getCard(receivedData: receivedData, textEditingController: textEditingController));
  }

  late final _$setCardCurrentIndexAsyncAction = AsyncAction('_BalanceStore.setCardCurrentIndex', context: context);

  @override
  Future<void> setCardCurrentIndex(int index) {
    return _$setCardCurrentIndexAsyncAction.run(() => super.setCardCurrentIndex(index));
  }

  late final _$setBarCurrentIndexAsyncAction = AsyncAction('_BalanceStore.setBarCurrentIndex', context: context);

  @override
  Future<void> setBarCurrentIndex(int index) {
    return _$setBarCurrentIndexAsyncAction.run(() => super.setBarCurrentIndex(index));
  }

  late final _$setMainWalletAddressAsyncAction = AsyncAction('_BalanceStore.setMainWalletAddress', context: context);

  @override
  Future<void> setMainWalletAddress({required String walletAddress}) {
    return _$setMainWalletAddressAsyncAction.run(() => super.setMainWalletAddress(walletAddress: walletAddress));
  }

  late final _$setChainTypeAsyncAction = AsyncAction('_BalanceStore.setChainType', context: context);

  @override
  Future<void> setChainType({required BlockchainType blockchain}) {
    return _$setChainTypeAsyncAction.run(() => super.setChainType(blockchain: blockchain));
  }

  late final _$_BalanceStoreActionController = ActionController(name: '_BalanceStore', context: context);

  @override
  void changeBarIndexAndSave({required int oldIndex, required String cardAddress, required int newIndex}) {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(name: '_BalanceStore.changeBarIndexAndSave');
    try {
      return super.changeBarIndexAndSave(oldIndex: oldIndex, cardAddress: cardAddress, newIndex: newIndex);
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCardColorAndSave({required String cardAddress, required CardColor color}) {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(name: '_BalanceStore.changeCardColorAndSave');
    try {
      return super.changeCardColorAndSave(cardAddress: cardAddress, color: color);
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCardBackupStatusAndSave({required String cardAddress, required bool hasBackedUp}) {
    final _$actionInfo =
        _$_BalanceStoreActionController.startAction(name: '_BalanceStore.changeCardBackupStatusAndSave');
    try {
      return super.changeCardBackupStatusAndSave(cardAddress: cardAddress, hasBackedUp: hasBackedUp);
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEthCardColorAndSave({required String cardAddress, required CardColor color}) {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(name: '_BalanceStore.changeEthCardColorAndSave');
    try {
      return super.changeEthCardColorAndSave(cardAddress: cardAddress, color: color);
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBarColorAndSave({required String barAddress, required CardColor color}) {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(name: '_BalanceStore.changeBarColorAndSave');
    try {
      return super.changeBarColorAndSave(barAddress: barAddress, color: color);
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCardNameAndSave({required String cardAddress, required String newName}) {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(name: '_BalanceStore.changeCardNameAndSave');
    try {
      return super.changeCardNameAndSave(cardAddress: cardAddress, newName: newName);
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeEthCardNameAndSave({required String cardAddress, required String newName}) {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(name: '_BalanceStore.changeEthCardNameAndSave');
    try {
      return super.changeEthCardNameAndSave(cardAddress: cardAddress, newName: newName);
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBarNameAndSave({required String barAddress, required String newName}) {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(name: '_BalanceStore.changeBarNameAndSave');
    try {
      return super.changeBarNameAndSave(barAddress: barAddress, newName: newName);
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void activateBar() {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(name: '_BalanceStore.activateBar');
    try {
      return super.activateBar();
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void activateCard() {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(name: '_BalanceStore.activateCard');
    try {
      return super.activateCard();
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reActivateBar() {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(name: '_BalanceStore.reActivateBar');
    try {
      return super.reActivateBar();
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reActivateCard() {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(name: '_BalanceStore.reActivateCard');
    try {
      return super.reActivateCard();
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void webViewStartLoading() {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(name: '_BalanceStore.webViewStartLoading');
    try {
      return super.webViewStartLoading();
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void webViewStopLoading() {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(name: '_BalanceStore.webViewStopLoading');
    try {
      return super.webViewStopLoading();
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cardMapResult: ${cardMapResult},
listResult: ${listResult},
barMapResult: ${barMapResult},
loadings: ${loadings},
balanceLoading: ${balanceLoading},
cardCurrentIndex: ${cardCurrentIndex},
barCurrentIndex: ${barCurrentIndex},
barActivation: ${barActivation},
cardActivation: ${cardActivation},
inAppWebViewLoading: ${inAppWebViewLoading},
cardIndicatorIndex: ${cardIndicatorIndex},
isCardIndicatorTapped: ${isCardIndicatorTapped},
chainType: ${chainType},
mainWalletAddress: ${mainWalletAddress},
backupSingleCard: ${backupSingleCard},
backupCardLoading: ${backupCardLoading},
hasBackUp: ${hasBackUp},
btcPrice: ${btcPrice},
ethPrice: ${ethPrice},
allCardsBalances: ${allCardsBalances},
allEthCardsBalances: ${allEthCardsBalances},
singleCoin: ${singleCoin},
cardBalance: ${cardBalance},
backupCardBalance: ${backupCardBalance},
barBalance: ${barBalance},
allCards: ${allCards}
    ''';
  }
}
