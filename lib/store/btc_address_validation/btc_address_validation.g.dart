// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'btc_address_validation.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BitcoinStore on _BitcoinStore, Store {
  Computed<bool>? _$isValidBitcoinAddressComputed;

  @override
  bool get isValidBitcoinAddress => (_$isValidBitcoinAddressComputed ??=
          Computed<bool>(() => super.isValidBitcoinAddress,
              name: '_BitcoinStore.isValidBitcoinAddress'))
      .value;

  late final _$bitcoinAddressAtom =
      Atom(name: '_BitcoinStore.bitcoinAddress', context: context);

  @override
  String get bitcoinAddress {
    _$bitcoinAddressAtom.reportRead();
    return super.bitcoinAddress;
  }

  @override
  set bitcoinAddress(String value) {
    _$bitcoinAddressAtom.reportWrite(value, super.bitcoinAddress, () {
      super.bitcoinAddress = value;
    });
  }

  @override
  String toString() {
    return '''
bitcoinAddress: ${bitcoinAddress},
isValidBitcoinAddress: ${isValidBitcoinAddress}
    ''';
  }
}
