// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_history_list_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardHistoryListState on _CardHistoryListState, Store {
  Computed<HistoryPageStore>? _$historyPageStoreComputed;

  @override
  HistoryPageStore get historyPageStore => (_$historyPageStoreComputed ??=
          Computed<HistoryPageStore>(() => super.historyPageStore, name: '_CardHistoryListState.historyPageStore'))
      .value;
  Computed<BalanceStore>? _$balanceStoreComputed;

  @override
  BalanceStore get balanceStore => (_$balanceStoreComputed ??=
          Computed<BalanceStore>(() => super.balanceStore, name: '_CardHistoryListState.balanceStore'))
      .value;
  Computed<AccelerometerStore>? _$accelerometerStoreComputed;

  @override
  AccelerometerStore get accelerometerStore =>
      (_$accelerometerStoreComputed ??= Computed<AccelerometerStore>(() => super.accelerometerStore,
              name: '_CardHistoryListState.accelerometerStore'))
          .value;
  Computed<bool>? _$hasPerformedActionComputed;

  @override
  bool get hasPerformedAction => (_$hasPerformedActionComputed ??=
          Computed<bool>(() => super.hasPerformedAction, name: '_CardHistoryListState.hasPerformedAction'))
      .value;

  late final _$loadCardWalletStatusFromStorageAsyncAction =
      AsyncAction('_CardHistoryListState.loadCardWalletStatusFromStorage', context: context);

  @override
  Future<void> loadCardWalletStatusFromStorage(String address) {
    return _$loadCardWalletStatusFromStorageAsyncAction.run(() => super.loadCardWalletStatusFromStorage(address));
  }

  late final _$_CardHistoryListStateActionController =
      ActionController(name: '_CardHistoryListState', context: context);

  @override
  void getNextPageTransactions() {
    final _$actionInfo =
        _$_CardHistoryListStateActionController.startAction(name: '_CardHistoryListState.getNextPageTransactions');
    try {
      return super.getNextPageTransactions();
    } finally {
      _$_CardHistoryListStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
historyPageStore: ${historyPageStore},
balanceStore: ${balanceStore},
accelerometerStore: ${accelerometerStore},
hasPerformedAction: ${hasPerformedAction}
    ''';
  }
}
