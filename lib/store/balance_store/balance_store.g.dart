// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BalanceStore on _BalanceStore, Store {
  Computed<int?>? _$allCardsBalancesComputed;

  @override
  int? get allCardsBalances => (_$allCardsBalancesComputed ??= Computed<int?>(
          () => super.allCardsBalances,
          name: '_BalanceStore.allCardsBalances'))
      .value;
  Computed<num?>? _$btcPriceComputed;

  @override
  num? get btcPrice => (_$btcPriceComputed ??=
          Computed<num?>(() => super.btcPrice, name: '_BalanceStore.btcPrice'))
      .value;
  Computed<CoinModel?>? _$singleCoinComputed;

  @override
  CoinModel? get singleCoin =>
      (_$singleCoinComputed ??= Computed<CoinModel?>(() => super.singleCoin,
              name: '_BalanceStore.singleCoin'))
          .value;
  Computed<num>? _$cardBalanceComputed;

  @override
  num get cardBalance =>
      (_$cardBalanceComputed ??= Computed<num>(() => super.cardBalance,
              name: '_BalanceStore.cardBalance'))
          .value;
  Computed<num?>? _$barBalanceComputed;

  @override
  num? get barBalance =>
      (_$barBalanceComputed ??= Computed<num?>(() => super.barBalance,
              name: '_BalanceStore.barBalance'))
          .value;

  late final _$_cardsAtom =
      Atom(name: '_BalanceStore._cards', context: context);

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

  late final _$cardMapResultAtom =
      Atom(name: '_BalanceStore.cardMapResult', context: context);

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

  late final _$barMapResultAtom =
      Atom(name: '_BalanceStore.barMapResult', context: context);

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

  late final _$_selectedCardAtom =
      Atom(name: '_BalanceStore._selectedCard', context: context);

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

  late final _$_selectedBarAtom =
      Atom(name: '_BalanceStore._selectedBar', context: context);

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

  late final _$loadingsAtom =
      Atom(name: '_BalanceStore.loadings', context: context);

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

  late final _$balanceLoadingAtom =
      Atom(name: '_BalanceStore.balanceLoading', context: context);

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

  late final _$cardCurrentIndexAtom =
      Atom(name: '_BalanceStore.cardCurrentIndex', context: context);

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

  late final _$barCurrentIndexAtom =
      Atom(name: '_BalanceStore.barCurrentIndex', context: context);

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

  late final _$barActivationAtom =
      Atom(name: '_BalanceStore.barActivation', context: context);

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

  late final _$cardActivationAtom =
      Atom(name: '_BalanceStore.cardActivation', context: context);

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

  late final _$getCardsInfoAsyncAction =
      AsyncAction('_BalanceStore.getCardsInfo', context: context);

  @override
  Future<void> getCardsInfo() {
    return _$getCardsInfoAsyncAction.run(() => super.getCardsInfo());
  }

  late final _$getBarsInfoAsyncAction =
      AsyncAction('_BalanceStore.getBarsInfo', context: context);

  @override
  Future<void> getBarsInfo() {
    return _$getBarsInfoAsyncAction.run(() => super.getBarsInfo());
  }

  late final _$getSelectedCardAsyncAction =
      AsyncAction('_BalanceStore.getSelectedCard', context: context);

  @override
  Future<void> getSelectedCard(String address) {
    return _$getSelectedCardAsyncAction
        .run(() => super.getSelectedCard(address));
  }

  late final _$getSelectedBarAsyncAction =
      AsyncAction('_BalanceStore.getSelectedBar', context: context);

  @override
  Future<void> getSelectedBar(String address) {
    return _$getSelectedBarAsyncAction.run(() => super.getSelectedBar(address));
  }

  late final _$removeSelectedCardAsyncAction =
      AsyncAction('_BalanceStore.removeSelectedCard', context: context);

  @override
  Future<void> removeSelectedCard() {
    return _$removeSelectedCardAsyncAction
        .run(() => super.removeSelectedCard());
  }

  late final _$removeSelectedBarAsyncAction =
      AsyncAction('_BalanceStore.removeSelectedBar', context: context);

  @override
  Future<void> removeSelectedBar() {
    return _$removeSelectedBarAsyncAction.run(() => super.removeSelectedBar());
  }

  late final _$getCardAsyncAction =
      AsyncAction('_BalanceStore.getCard', context: context);

  @override
  Future<bool?> getCard(
      {required String? receivedData,
      required TextEditingController textEditingController}) {
    return _$getCardAsyncAction.run(() => super.getCard(
        receivedData: receivedData,
        textEditingController: textEditingController));
  }

  late final _$setCardCurrentIndexAsyncAction =
      AsyncAction('_BalanceStore.setCardCurrentIndex', context: context);

  @override
  Future<void> setCardCurrentIndex(int index) {
    return _$setCardCurrentIndexAsyncAction
        .run(() => super.setCardCurrentIndex(index));
  }

  late final _$setBarCurrentIndexAsyncAction =
      AsyncAction('_BalanceStore.setBarCurrentIndex', context: context);

  @override
  Future<void> setBarCurrentIndex(int index) {
    return _$setBarCurrentIndexAsyncAction
        .run(() => super.setBarCurrentIndex(index));
  }

  late final _$_BalanceStoreActionController =
      ActionController(name: '_BalanceStore', context: context);

  @override
  void changeBarIndexAndSave(
      {required int oldIndex,
      required String cardAddress,
      required int newIndex}) {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(
        name: '_BalanceStore.changeBarIndexAndSave');
    try {
      return super.changeBarIndexAndSave(
          oldIndex: oldIndex, cardAddress: cardAddress, newIndex: newIndex);
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCardColorAndSave(
      {required String cardAddress, required CardColor color}) {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(
        name: '_BalanceStore.changeCardColorAndSave');
    try {
      return super
          .changeCardColorAndSave(cardAddress: cardAddress, color: color);
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBarColorAndSave(
      {required String barAddress, required CardColor color}) {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(
        name: '_BalanceStore.changeBarColorAndSave');
    try {
      return super.changeBarColorAndSave(barAddress: barAddress, color: color);
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCardNameAndSave(
      {required String cardAddress, required String newName}) {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(
        name: '_BalanceStore.changeCardNameAndSave');
    try {
      return super
          .changeCardNameAndSave(cardAddress: cardAddress, newName: newName);
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeBarNameAndSave(
      {required String barAddress, required String newName}) {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(
        name: '_BalanceStore.changeBarNameAndSave');
    try {
      return super
          .changeBarNameAndSave(barAddress: barAddress, newName: newName);
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void activateBar() {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(
        name: '_BalanceStore.activateBar');
    try {
      return super.activateBar();
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void activateCard() {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(
        name: '_BalanceStore.activateCard');
    try {
      return super.activateCard();
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reActivateBar() {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(
        name: '_BalanceStore.reActivateBar');
    try {
      return super.reActivateBar();
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reActivateCard() {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(
        name: '_BalanceStore.reActivateCard');
    try {
      return super.reActivateCard();
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cardMapResult: ${cardMapResult},
barMapResult: ${barMapResult},
loadings: ${loadings},
balanceLoading: ${balanceLoading},
cardCurrentIndex: ${cardCurrentIndex},
barCurrentIndex: ${barCurrentIndex},
barActivation: ${barActivation},
cardActivation: ${cardActivation},
allCardsBalances: ${allCardsBalances},
btcPrice: ${btcPrice},
singleCoin: ${singleCoin},
cardBalance: ${cardBalance},
barBalance: ${barBalance}
    ''';
  }
}
