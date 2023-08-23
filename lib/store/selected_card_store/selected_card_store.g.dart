// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_card_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SelectedCardStore on _SelectedCardStore, Store {
  Computed<CardModel?>? _$selectedCardComputed;

  @override
  CardModel? get selectedCard =>
      (_$selectedCardComputed ??= Computed<CardModel?>(() => super.selectedCard,
              name: '_SelectedCardStore.selectedCard'))
          .value;

  late final _$_selectedCardAtom =
      Atom(name: '_SelectedCardStore._selectedCard', context: context);

  @override
  CardModel? get _selectedCard {
    _$_selectedCardAtom.reportRead();
    return super._selectedCard;
  }

  @override
  set _selectedCard(CardModel? value) {
    _$_selectedCardAtom.reportWrite(value, super._selectedCard, () {
      super._selectedCard = value;
    });
  }

  late final _$_SelectedCardStoreActionController =
      ActionController(name: '_SelectedCardStore', context: context);

  @override
  void setSelectedCard(CardModel card) {
    final _$actionInfo = _$_SelectedCardStoreActionController.startAction(
        name: '_SelectedCardStore.setSelectedCard');
    try {
      return super.setSelectedCard(card);
    } finally {
      _$_SelectedCardStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedCard: ${selectedCard}
    ''';
  }
}
