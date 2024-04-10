// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_and_balance_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AddressState on _AddressState, Store {
  late final _$btcAddressAtom =
      Atom(name: '_AddressState.btcAddress', context: context);

  @override
  String get btcAddress {
    _$btcAddressAtom.reportRead();
    return super.btcAddress;
  }

  @override
  set btcAddress(String value) {
    _$btcAddressAtom.reportWrite(value, super.btcAddress, () {
      super.btcAddress = value;
    });
  }

  late final _$hasErrorAtom =
      Atom(name: '_AddressState.hasError', context: context);

  @override
  bool get hasError {
    _$hasErrorAtom.reportRead();
    return super.hasError;
  }

  @override
  set hasError(bool value) {
    _$hasErrorAtom.reportWrite(value, super.hasError, () {
      super.hasError = value;
    });
  }

  late final _$isAddressValidAtom =
      Atom(name: '_AddressState.isAddressValid', context: context);

  @override
  bool get isAddressValid {
    _$isAddressValidAtom.reportRead();
    return super.isAddressValid;
  }

  @override
  set isAddressValid(bool value) {
    _$isAddressValidAtom.reportWrite(value, super.isAddressValid, () {
      super.isAddressValid = value;
    });
  }

  late final _$isAddressVisibleAtom =
      Atom(name: '_AddressState.isAddressVisible', context: context);

  @override
  bool get isAddressVisible {
    _$isAddressVisibleAtom.reportRead();
    return super.isAddressVisible;
  }

  @override
  set isAddressVisible(bool value) {
    _$isAddressVisibleAtom.reportWrite(value, super.isAddressVisible, () {
      super.isAddressVisible = value;
    });
  }

  late final _$_AddressStateActionController =
      ActionController(name: '_AddressState', context: context);

  @override
  void setValidationPassed() {
    final _$actionInfo = _$_AddressStateActionController.startAction(
        name: '_AddressState.setValidationPassed');
    try {
      return super.setValidationPassed();
    } finally {
      _$_AddressStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValidationFailed() {
    final _$actionInfo = _$_AddressStateActionController.startAction(
        name: '_AddressState.setValidationFailed');
    try {
      return super.setValidationFailed();
    } finally {
      _$_AddressStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addressVisibility() {
    final _$actionInfo = _$_AddressStateActionController.startAction(
        name: '_AddressState.addressVisibility');
    try {
      return super.addressVisibility();
    } finally {
      _$_AddressStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
btcAddress: ${btcAddress},
hasError: ${hasError},
isAddressValid: ${isAddressValid},
isAddressVisible: ${isAddressVisible}
    ''';
  }
}
