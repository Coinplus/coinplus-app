// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_protect_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WalletProtectState on _WalletProtectState, Store {
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

  late final _$isBiometricsEnabledAtom = Atom(name: '_WalletProtectState.isBiometricsEnabled', context: context);

  @override
  bool get isBiometricsEnabled {
    _$isBiometricsEnabledAtom.reportRead();
    return super.isBiometricsEnabled;
  }

  @override
  set isBiometricsEnabled(bool value) {
    _$isBiometricsEnabledAtom.reportWrite(value, super.isBiometricsEnabled, () {
      super.isBiometricsEnabled = value;
    });
  }

  late final _$_isNfcSessionStartedAtom = Atom(name: '_WalletProtectState._isNfcSessionStarted', context: context);

  bool get isNfcSessionStarted {
    _$_isNfcSessionStartedAtom.reportRead();
    return super._isNfcSessionStarted;
  }

  @override
  bool get _isNfcSessionStarted => isNfcSessionStarted;

  @override
  set _isNfcSessionStarted(bool value) {
    _$_isNfcSessionStartedAtom.reportWrite(value, super._isNfcSessionStarted, () {
      super._isNfcSessionStarted = value;
    });
  }

  late final _$_isModalOpenedAtom = Atom(name: '_WalletProtectState._isModalOpened', context: context);

  bool get isModalOpened {
    _$_isModalOpenedAtom.reportRead();
    return super._isModalOpened;
  }

  @override
  bool get _isModalOpened => isModalOpened;

  @override
  set _isModalOpened(bool value) {
    _$_isModalOpenedAtom.reportWrite(value, super._isModalOpened, () {
      super._isModalOpened = value;
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

  late final _$isSwitchedNotificationsToggleAtom =
      Atom(name: '_WalletProtectState.isSwitchedNotificationsToggle', context: context);

  @override
  bool get isSwitchedNotificationsToggle {
    _$isSwitchedNotificationsToggleAtom.reportRead();
    return super.isSwitchedNotificationsToggle;
  }

  @override
  set isSwitchedNotificationsToggle(bool value) {
    _$isSwitchedNotificationsToggleAtom.reportWrite(value, super.isSwitchedNotificationsToggle, () {
      super.isSwitchedNotificationsToggle = value;
    });
  }

  late final _$isLinkOpenedAtom = Atom(name: '_WalletProtectState.isLinkOpened', context: context);

  @override
  bool get isLinkOpened {
    _$isLinkOpenedAtom.reportRead();
    return super.isLinkOpened;
  }

  @override
  set isLinkOpened(bool value) {
    _$isLinkOpenedAtom.reportWrite(value, super.isLinkOpened, () {
      super.isLinkOpened = value;
    });
  }

  late final _$canCheckBiometricsAtom = Atom(name: '_WalletProtectState.canCheckBiometrics', context: context);

  @override
  bool get canCheckBiometrics {
    _$canCheckBiometricsAtom.reportRead();
    return super.canCheckBiometrics;
  }

  @override
  set canCheckBiometrics(bool value) {
    _$canCheckBiometricsAtom.reportWrite(value, super.canCheckBiometrics, () {
      super.canCheckBiometrics = value;
    });
  }

  late final _$availableBiometricAtom = Atom(name: '_WalletProtectState.availableBiometric', context: context);

  @override
  BiometricType? get availableBiometric {
    _$availableBiometricAtom.reportRead();
    return super.availableBiometric;
  }

  @override
  set availableBiometric(BiometricType? value) {
    _$availableBiometricAtom.reportWrite(value, super.availableBiometric, () {
      super.availableBiometric = value;
    });
  }

  late final _$checkBiometricsAsyncAction = AsyncAction('_WalletProtectState.checkBiometrics', context: context);

  @override
  Future<void> checkBiometrics() {
    return _$checkBiometricsAsyncAction.run(() => super.checkBiometrics());
  }

  late final _$checkPinCodeStatusAsyncAction = AsyncAction('_WalletProtectState.checkPinCodeStatus', context: context);

  @override
  Future<void> checkPinCodeStatus() {
    return _$checkPinCodeStatusAsyncAction.run(() => super.checkPinCodeStatus());
  }

  late final _$checkBiometricStatusAsyncAction =
      AsyncAction('_WalletProtectState.checkBiometricStatus', context: context);

  @override
  Future<void> checkBiometricStatus() {
    return _$checkBiometricStatusAsyncAction.run(() => super.checkBiometricStatus());
  }

  late final _$checkNotificationToggleStatusAsyncAction =
      AsyncAction('_WalletProtectState.checkNotificationToggleStatus', context: context);

  @override
  Future<void> checkNotificationToggleStatus() {
    return _$checkNotificationToggleStatusAsyncAction.run(() => super.checkNotificationToggleStatus());
  }

  late final _$updateNfcSessionStatusAsyncAction =
      AsyncAction('_WalletProtectState.updateNfcSessionStatus', context: context);

  @override
  Future<void> updateNfcSessionStatus({required bool isStarted}) {
    return _$updateNfcSessionStatusAsyncAction.run(() => super.updateNfcSessionStatus(isStarted: isStarted));
  }

  late final _$updateModalStatusAsyncAction = AsyncAction('_WalletProtectState.updateModalStatus', context: context);

  @override
  Future<void> updateModalStatus({required bool isOpened}) {
    return _$updateModalStatusAsyncAction.run(() => super.updateModalStatus(isOpened: isOpened));
  }

  late final _$disableBiometricAsyncAction = AsyncAction('_WalletProtectState.disableBiometric', context: context);

  @override
  Future<void> disableBiometric() {
    return _$disableBiometricAsyncAction.run(() => super.disableBiometric());
  }

  late final _$disableNotificationAsyncAction =
      AsyncAction('_WalletProtectState.disableNotification', context: context);

  @override
  Future<void> disableNotification() {
    return _$disableNotificationAsyncAction.run(() => super.disableNotification());
  }

  late final _$enableNotificationAsyncAction = AsyncAction('_WalletProtectState.enableNotification', context: context);

  @override
  Future<void> enableNotification() {
    return _$enableNotificationAsyncAction.run(() => super.enableNotification());
  }

  late final _$authenticateWithBiometricsAsyncAction =
      AsyncAction('_WalletProtectState.authenticateWithBiometrics', context: context);

  @override
  Future<bool> authenticateWithBiometrics() {
    return _$authenticateWithBiometricsAsyncAction.run(() => super.authenticateWithBiometrics());
  }

  late final _$checkAvailableBiometricsAsyncAction =
      AsyncAction('_WalletProtectState.checkAvailableBiometrics', context: context);

  @override
  Future<void> checkAvailableBiometrics() {
    return _$checkAvailableBiometricsAsyncAction.run(() => super.checkAvailableBiometrics());
  }

  late final _$authenticateWithBiometricsAndPopAsyncAction =
      AsyncAction('_WalletProtectState.authenticateWithBiometricsAndPop', context: context);

  @override
  Future<bool> authenticateWithBiometricsAndPop() {
    return _$authenticateWithBiometricsAndPopAsyncAction.run(() => super.authenticateWithBiometricsAndPop());
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
  void openLink() {
    final _$actionInfo = _$_WalletProtectStateActionController.startAction(name: '_WalletProtectState.openLink');
    try {
      return super.openLink();
    } finally {
      _$_WalletProtectStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isCreatedPinMatch: ${isCreatedPinMatch},
isBiometricsRunning: ${isBiometricsRunning},
isBiometricsEnabled: ${isBiometricsEnabled},
isSetPinCode: ${isSetPinCode},
isSwitchedNotificationsToggle: ${isSwitchedNotificationsToggle},
isLinkOpened: ${isLinkOpened},
canCheckBiometrics: ${canCheckBiometrics},
availableBiometric: ${availableBiometric}
    ''';
  }
}
