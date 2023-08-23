// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BalanceStore on _BalanceStore, Store {
  late final _$_coinsAtom =
      Atom(name: '_BalanceStore._coins', context: context);

  ObservableList<CoinDto> get coins {
    _$_coinsAtom.reportRead();
    return super._coins;
  }

  @override
  ObservableList<CoinDto> get _coins => coins;

  @override
  set _coins(ObservableList<CoinDto> value) {
    _$_coinsAtom.reportWrite(value, super._coins, () {
      super._coins = value;
    });
  }

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

  late final _$_BalanceStoreActionController =
      ActionController(name: '_BalanceStore', context: context);

  @override
  void removeSelectedCard() {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(
        name: '_BalanceStore.removeSelectedCard');
    try {
      return super.removeSelectedCard();
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSelectedCard() {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(
        name: '_BalanceStore.resetSelectedCard');
    try {
      return super.resetSelectedCard();
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resetSelectedBar() {
    final _$actionInfo = _$_BalanceStoreActionController.startAction(
        name: '_BalanceStore.resetSelectedBar');
    try {
      return super.resetSelectedBar();
    } finally {
      _$_BalanceStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadings: ${loadings}
    ''';
  }
}
