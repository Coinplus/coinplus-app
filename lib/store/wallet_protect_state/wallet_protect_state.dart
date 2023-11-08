import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobx/mobx.dart';

import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../utils/secure_storage_utils.dart';

part 'wallet_protect_state.g.dart';

class WalletProtectState = _WalletProtectState with _$WalletProtectState;

abstract class _WalletProtectState with Store {
  final isPinCodeSet = getIsPinCodeSet();
  final _auth = LocalAuthentication();
  late FocusNode pinFocusNode = FocusNode();

  @observable
  bool hasAuthenticated = false;

  @observable
  bool isCreatedPinMatch = false;

  @observable
  bool appLockToggle = false;

  @observable
  bool isBiometricsRunning = false;

  @observable
  bool isNfcSessionStarted = false;

  @observable
  bool isSetPinCode = true;

  @action
  Future<void> checkPinCodeStatus() async {
    final result = await isPinCodeEnabled();
    isSetPinCode = result;
  }

  @action
  Future<void> enableBiometrics() async {
    isBiometricsRunning = true;
  }

  @action
  void isNfcSessionStart() {
    isNfcSessionStarted = !isNfcSessionStarted;
  }

  @action
  Future<void> enableDisableAppLockToggle() async {
    appLockToggle = !appLockToggle;
  }

  @action
  Future<void> authenticateWithBiometrics() async {
    if (await isBiometricAvailable()) {
      try {
        final isAuthorized = await _auth.authenticate(
          localizedReason: 'Authenticate using Face ID',
        );
        if (isAuthorized) {
          isBiometricsRunning = true;
          await router.pop();
        }
      } catch (e) {
        if (e is PlatformException && e.code == 'NotAvailable') {
          hasAuthenticated = true;
          pinFocusNode.requestFocus();
        } else if (e is PlatformException && e.code == 'NotEnrolled') {
          log('Biometrics not enrolled');
        } else if (e is PlatformException && e.code == 'AuthenticationFailed') {
          log('Biometrics authentication failed or canceled');
        } else {
          log('Unhandled exception: $e');
        }
      }
    }
  }

  @action
  Future<void> authenticateWithBiometricsInSplash() async {
    if (await isBiometricAvailable()) {
      try {
        final isAuthorized = await _auth.authenticate(
          localizedReason: 'Authenticate using Face ID',
        );
        if (isAuthorized) {
          isBiometricsRunning = true;
          await router.pushAndPopAll(Dashboard());
        }
      } catch (e) {
        if (e is PlatformException && e.code == 'NotAvailable') {
          pinFocusNode.requestFocus();
        } else if (e is PlatformException && e.code == 'NotEnrolled') {
          log('Biometrics not enrolled');
        } else if (e is PlatformException && e.code == 'AuthenticationFailed') {
          log('Biometrics authentication failed or canceled');
        } else {
          log('Unhandled exception: $e');
        }
      }
    }
  }

  @action
  Future<bool> isBiometricAvailable() async {
    try {
      return await _auth.isDeviceSupported();
    } catch (e) {
      return false;
    }
  }

  @action
  Future<void> dontMatch() async {
    isCreatedPinMatch = true;
    await Future.delayed(const Duration(milliseconds: 1500));
    isCreatedPinMatch = false;
  }

  void initState() {
    _auth.getAvailableBiometrics();
  }
}
