// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_selected_address_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangeSelectedAddressState on ChangeSelectedAddressStateBase, Store {
  Computed<ObservableList<CardModel>>? _$cardsComputed;

  @override
  ObservableList<CardModel> get cards => (_$cardsComputed ??=
          Computed<ObservableList<CardModel>>(() => super.cards,
              name: 'ChangeSelectedAddressStateBase.cards'))
      .value;
  Computed<ObservableList<BarModel>>? _$barsComputed;

  @override
  ObservableList<BarModel> get bars =>
      (_$barsComputed ??= Computed<ObservableList<BarModel>>(() => super.bars,
              name: 'ChangeSelectedAddressStateBase.bars'))
          .value;
  Computed<CoinResultModel?>? _$btcComputed;

  @override
  CoinResultModel? get btc =>
      (_$btcComputed ??= Computed<CoinResultModel?>(() => super.btc,
              name: 'ChangeSelectedAddressStateBase.btc'))
          .value;
  Computed<int>? _$selectedCardIndexComputed;

  @override
  int get selectedCardIndex => (_$selectedCardIndexComputed ??= Computed<int>(
          () => super.selectedCardIndex,
          name: 'ChangeSelectedAddressStateBase.selectedCardIndex'))
      .value;

  late final _$ChangeSelectedAddressStateBaseActionController =
      ActionController(
          name: 'ChangeSelectedAddressStateBase', context: context);

  @override
  void onSelectCard(int index) {
    final _$actionInfo = _$ChangeSelectedAddressStateBaseActionController
        .startAction(name: 'ChangeSelectedAddressStateBase.onSelectCard');
    try {
      return super.onSelectCard(index);
    } finally {
      _$ChangeSelectedAddressStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cards: ${cards},
bars: ${bars},
btc: ${btc},
selectedCardIndex: ${selectedCardIndex}
    ''';
  }
}
