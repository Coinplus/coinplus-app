// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_protect_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WalletProtectState on _WalletProtectState, Store {
  late final _$hasAuthenticatedAtom = Atom(name: '_WalletProtectState.hasAuthenticated', context: context);

  @override
  bool get hasAuthenticated {
    _$hasAuthenticatedAtom.reportRead();
    return super.hasAuthenticated;
  }

  @override
  set hasAuthenticated(bool value) {
    _$hasAuthenticatedAtom.reportWrite(value, super.hasAuthenticated, () {
      super.hasAuthenticated = value;
    });
  }

  late final _$isCreatedPinMatchAtom = Atom(name: '_WalletProtectState.isCreatedPinMatch', context: context);

  @override
  bool get isCreatedPinMatch {
    _$isCreatedPinMatchAtom.reportRead();
    return super.isCreatedPinMatch;
  }

  @override
  set isCreatedPinMatch(bool value) {
    _$isCreatedPinMatchAtom.reportWrite(value, super.isCreatedPinMatch, () {
      super.isCreatedPinMatch = value;
    });
  }

  late final _$appLockToggleAtom = Atom(name: '_WalletProtectState.appLockToggle', context: context);

  @override
  bool get appLockToggle {
    _$appLockToggleAtom.reportRead();
    return super.appLockToggle;
  }

  @override
  set appLockToggle(bool value) {
    _$appLockToggleAtom.reportWrite(value, super.appLockToggle, () {
      super.appLockToggle = value;
    });
  }

  late final _$isBiometricsRunningAtom = Atom(name: '_WalletProtectState.isBiometricsRunning', context: context);

  @override
  bool get isBiometricsRunning {
    _$isBiometricsRunningAtom.reportRead();
    return super.isBiometricsRunning;
  }

  @override
  set isBiometricsRunning(bool value) {
    _$isBiometricsRunningAtom.reportWrite(value, super.isBiometricsRunning, () {
      super.isBiometricsRunning = value;
    });
  }

  late final _$isNfcSessionStartedAtom = Atom(name: '_WalletProtectState.isNfcSessionStarted', context: context);

  @override
  bool get isNfcSessionStarted {
    _$isNfcSessionStartedAtom.reportRead();
    return super.isNfcSessionStarted;
  }

  @override
  set isNfcSessionStarted(bool value) {
    _$isNfcSessionStartedAtom.reportWrite(value, super.isNfcSessionStarted, () {
      super.isNfcSessionStarted = value;
    });
  }

  late final _$isSetPinCodeAtom = Atom(name: '_WalletProtectState.isSetPinCode', context: context);

  @override
  bool get isSetPinCode {
    _$isSetPinCodeAtom.reportRead();
    return super.isSetPinCode;
  }

  @override
  set isSetPinCode(bool value) {
    _$isSetPinCodeAtom.reportWrite(value, super.isSetPinCode, () {
      super.isSetPinCode = value;
    });
  }

  late final _$checkPinCodeStatusAsyncAction = AsyncAction('_WalletProtectState.checkPinCodeStatus', context: context);

  @override
  Future<void> checkPinCodeStatus() {
    return _$checkPinCodeStatusAsyncAction.run(() => super.checkPinCodeStatus());
  }

  late final _$enableBiometricsAsyncAction = AsyncAction('_WalletProtectState.enableBiometrics', context: context);

  @override
  Future<void> enableBiometrics() {
    return _$enableBiometricsAsyncAction.run(() => super.enableBiometrics());
  }

  late final _$enableDisableAppLockToggleAsyncAction =
      AsyncAction('_WalletProtectState.enableDisableAppLockToggle', context: context);

  @override
  Future<void> enableDisableAppLockToggle() {
    return _$enableDisableAppLockToggleAsyncAction.run(() => super.enableDisableAppLockToggle());
  }

  late final _$authenticateWithBiometricsAsyncAction =
      AsyncAction('_WalletProtectState.authenticateWithBiometrics', context: context);

  @override
  Future<void> authenticateWithBiometrics() {
    return _$authenticateWithBiometricsAsyncAction.run(() => super.authenticateWithBiometrics());
  }

  late final _$authenticateWithBiometricsInSplashAsyncAction =
      AsyncAction('_WalletProtectState.authenticateWithBiometricsInSplash', context: context);

  @override
  Future<void> authenticateWithBiometricsInSplash() {
    return _$authenticateWithBiometricsInSplashAsyncAction.run(() => super.authenticateWithBiometricsInSplash());
  }

  late final _$isBiometricAvailableAsyncAction =
      AsyncAction('_WalletProtectState.isBiometricAvailable', context: context);

  @override
  Future<bool> isBiometricAvailable() {
    return _$isBiometricAvailableAsyncAction.run(() => super.isBiometricAvailable());
  }

  late final _$dontMatchAsyncAction = AsyncAction('_WalletProtectState.dontMatch', context: context);

  @override
  Future<void> dontMatch() {
    return _$dontMatchAsyncAction.run(() => super.dontMatch());
  }

  late final _$_WalletProtectStateActionController = ActionController(name: '_WalletProtectState', context: context);

  @override
  void isNfcSessionStart() {
    final _$actionInfo =
        _$_WalletProtectStateActionController.startAction(name: '_WalletProtectState.isNfcSessionStart');
    try {
      return super.isNfcSessionStart();
    } finally {
      _$_WalletProtectStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
hasAuthenticated: ${hasAuthenticated},
isCreatedPinMatch: ${isCreatedPinMatch},
appLockToggle: ${appLockToggle},
isBiometricsRunning: ${isBiometricsRunning},
isNfcSessionStarted: ${isNfcSessionStarted},
isSetPinCode: ${isSetPinCode}
    ''';
  }
}
