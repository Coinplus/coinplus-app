// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_us_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactUsStore on _ContactUsStore, Store {
  late final _$isEmailValidAtom =
      Atom(name: '_ContactUsStore.isEmailValid', context: context);

  @override
  bool get isEmailValid {
    _$isEmailValidAtom.reportRead();
    return super.isEmailValid;
  }

  @override
  set isEmailValid(bool value) {
    _$isEmailValidAtom.reportWrite(value, super.isEmailValid, () {
      super.isEmailValid = value;
    });
  }

  late final _$isButtonEnabledAtom =
      Atom(name: '_ContactUsStore.isButtonEnabled', context: context);

  @override
  bool get isButtonEnabled {
    _$isButtonEnabledAtom.reportRead();
    return super.isButtonEnabled;
  }

  @override
  set isButtonEnabled(bool value) {
    _$isButtonEnabledAtom.reportWrite(value, super.isButtonEnabled, () {
      super.isButtonEnabled = value;
    });
  }

  late final _$_ContactUsStoreActionController =
      ActionController(name: '_ContactUsStore', context: context);

  @override
  bool validateEmail(String email) {
    final _$actionInfo = _$_ContactUsStoreActionController.startAction(
        name: '_ContactUsStore.validateEmail');
    try {
      return super.validateEmail(email);
    } finally {
      _$_ContactUsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isEmpty() {
    final _$actionInfo = _$_ContactUsStoreActionController.startAction(
        name: '_ContactUsStore.isEmpty');
    try {
      return super.isEmpty();
    } finally {
      _$_ContactUsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEmailValid: ${isEmailValid},
isButtonEnabled: ${isButtonEnabled}
    ''';
  }
}
