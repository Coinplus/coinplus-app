// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nfc_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NfcStore on _NfcStore, Store {
  late final _$isNfcSupportedAtom = Atom(name: '_NfcStore.isNfcSupported', context: context);

  @override
  bool get isNfcSupported {
    _$isNfcSupportedAtom.reportRead();
    return super.isNfcSupported;
  }

  @override
  set isNfcSupported(bool value) {
    _$isNfcSupportedAtom.reportWrite(value, super.isNfcSupported, () {
      super.isNfcSupported = value;
    });
  }

  late final _$checkNfcSupportAsyncAction = AsyncAction('_NfcStore.checkNfcSupport', context: context);

  @override
  Future<void> checkNfcSupport() {
    return _$checkNfcSupportAsyncAction.run(() => super.checkNfcSupport());
  }

  @override
  String toString() {
    return '''
isNfcSupported: ${isNfcSupported}
    ''';
  }
}
