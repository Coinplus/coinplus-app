// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BalanceStore on _BalanceStore, Store {
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

  ObservableList<CardModel> get bars {
    _$_barsAtom.reportRead();
    return super._bars;
  }

  @override
  ObservableList<CardModel> get _bars => bars;

  @override
  set _bars(ObservableList<CardModel> value) {
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

  late final _$_loadingsAtom =
      Atom(name: '_BalanceStore._loadings', context: context);

  ObservableMap<String, bool> get loadings {
    _$_loadingsAtom.reportRead();
    return super._loadings;
  }

  @override
  ObservableMap<String, bool> get _loadings => loadings;

  @override
  set _loadings(ObservableMap<String, bool> value) {
    _$_loadingsAtom.reportWrite(value, super._loadings, () {
      super._loadings = value;
    });
  }

  late final _$getAllCardsInfoAsyncAction =
      AsyncAction('_BalanceStore.getAllCardsInfo', context: context);

  @override
  Future<void> getAllCardsInfo() {
    return _$getAllCardsInfoAsyncAction.run(() => super.getAllCardsInfo());
  }

  late final _$getSelectedCardAsyncAction =
      AsyncAction('_BalanceStore.getSelectedCard', context: context);

  @override
  Future<void> getSelectedCard(String address) {
    return _$getSelectedCardAsyncAction
        .run(() => super.getSelectedCard(address));
  }

  late final _$_BalanceStoreActionController =
      ActionController(name: '_BalanceStore', context: context);

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
  String toString() {
    return '''

    ''';
  }
}
