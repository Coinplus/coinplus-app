// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BalanceStore on _BalanceStore, Store {
  Computed<String>? _$btcAddressComputed;

  @override
  String get btcAddress =>
      (_$btcAddressComputed ??= Computed<String>(() => super.btcAddress,
              name: '_BalanceStore.btcAddress'))
          .value;

  late final _$addressAtom =
      Atom(name: '_BalanceStore.address', context: context);

  @override
  String get address {
    _$addressAtom.reportRead();
    return super.address;
  }

  @override
  set address(String value) {
    _$addressAtom.reportWrite(value, super.address, () {
      super.address = value;
    });
  }

  late final _$fetchCardInfoAsyncAction =
      AsyncAction('_BalanceStore.fetchCardInfo', context: context);

  @override
  Future<CardModel> fetchCardInfo() {
    return _$fetchCardInfoAsyncAction.run(() => super.fetchCardInfo());
  }

  @override
  String toString() {
    return '''
address: ${address},
btcAddress: ${btcAddress}
    ''';
  }
}
