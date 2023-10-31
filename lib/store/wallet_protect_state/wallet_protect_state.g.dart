// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_protect_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WalletProtectState on _WalletProtectState, Store {
  late final _$isToggleSwitchedAtom =
      Atom(name: '_WalletProtectState.isToggleSwitched', context: context);

  @override
  bool get isToggleSwitched {
    _$isToggleSwitchedAtom.reportRead();
    return super.isToggleSwitched;
  }

  @override
  set isToggleSwitched(bool value) {
    _$isToggleSwitchedAtom.reportWrite(value, super.isToggleSwitched, () {
      super.isToggleSwitched = value;
    });
  }

  late final _$isEnablePasscodeAtom =
      Atom(name: '_WalletProtectState.isEnablePasscode', context: context);

  @override
  bool get isEnablePasscode {
    _$isEnablePasscodeAtom.reportRead();
    return super.isEnablePasscode;
  }

  @override
  set isEnablePasscode(bool value) {
    _$isEnablePasscodeAtom.reportWrite(value, super.isEnablePasscode, () {
      super.isEnablePasscode = value;
    });
  }

  late final _$onToggleSwitchAsyncAction =
      AsyncAction('_WalletProtectState.onToggleSwitch', context: context);

  @override
  Future<void> onToggleSwitch() {
    return _$onToggleSwitchAsyncAction.run(() => super.onToggleSwitch());
  }

  late final _$isBiometricAvailableAsyncAction =
      AsyncAction('_WalletProtectState.isBiometricAvailable', context: context);

  @override
  Future<bool> isBiometricAvailable() {
    return _$isBiometricAvailableAsyncAction
        .run(() => super.isBiometricAvailable());
  }

  late final _$authenticateWithBiometricsAsyncAction = AsyncAction(
      '_WalletProtectState.authenticateWithBiometrics',
      context: context);

  @override
  Future<void> authenticateWithBiometrics() {
    return _$authenticateWithBiometricsAsyncAction
        .run(() => super.authenticateWithBiometrics());
  }

  late final _$_WalletProtectStateActionController =
      ActionController(name: '_WalletProtectState', context: context);

  @override
  void enablePasscode() {
    final _$actionInfo = _$_WalletProtectStateActionController.startAction(
        name: '_WalletProtectState.enablePasscode');
    try {
      return super.enablePasscode();
    } finally {
      _$_WalletProtectStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isToggleSwitched: ${isToggleSwitched},
isEnablePasscode: ${isEnablePasscode}
    ''';
  }
}
