import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:mobx/mobx.dart';

import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../utils/secure_storage_utils.dart';

part 'wallet_protect_state.g.dart';

class WalletProtectState = _WalletProtectState with _$WalletProtectState;

abstract class _WalletProtectState with Store {
  final _auth = LocalAuthentication();
  late FocusNode pinFocusNode = FocusNode();

  _WalletProtectState() {
    checkPinCodeStatus();
    checkBiometricStatus();
  }

  @observable
  bool isCreatedPinMatch = false;

  @observable
  bool isBiometricsRunning = false;

  @observable
  bool isBiometricsEnabled = false;

  @readonly
  bool _isNfcSessionStarted = false;

  @readonly
  bool _isModalOpened = false;

  @observable
  bool isSetPinCode = false;

  @observable
  bool isLinkOpened = false;
  @observable
  bool canCheckBiometrics = false;

  @action
  Future<void> checkBiometrics() async {
    canCheckBiometrics = await _auth.canCheckBiometrics;
  }

  @action
  void openLink() {
    isLinkOpened = true;
  }

  @action
  Future<void> checkPinCodeStatus() async {
    isSetPinCode = await getIsPinCodeSet();
    if (!isSetPinCode) {
      isBiometricsEnabled = false;
      await disableBiometricAuth();
    }
  }

  @action
  Future<void> checkBiometricStatus() async {
    isBiometricsEnabled = await getBiometricStatus();
  }

  @action
  Future<void> updateNfcSessionStatus({required bool isStarted}) async {
    _isNfcSessionStarted = isStarted;
  }

  @action
  Future<void> updateModalStatus({required bool isOpened}) async {
    _isModalOpened = isOpened;
  }

  @action
  Future<void> disableBiometric() async {
    final res = await authenticateWithBiometrics();
    if (res) {
      await disableBiometricAuth();
      isBiometricsEnabled = false;
    }
  }

  @action
  Future<bool> authenticateWithBiometrics() async {
    isBiometricsRunning = true;
    if (await isBiometricAvailable()) {
      try {
        final isAuthorized = await _auth.authenticate(
          localizedReason: 'Authenticate using Face ID',
          options: const AuthenticationOptions(
            biometricOnly: true,
            stickyAuth: true,
            sensitiveTransaction: false,
          ),
          authMessages: const <AuthMessages>[
            AndroidAuthMessages(
              signInTitle: 'Oops! Biometric authentication required!',
              cancelButton: 'No thanks',
            ),
            IOSAuthMessages(
              cancelButton: 'No thanks',
            ),
          ],
        );
        if (isAuthorized) {
          await enableBiometricAuth();
          await router.pushAndPopAll(const DashboardRoute());
          return true;
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
        return false;
      } finally {
        isBiometricsRunning = false;
      }
    }
    isBiometricsRunning = false;

    return false;
  }

  @observable
  BiometricType? availableBiometric;

  @action
  Future<void> checkAvailableBiometrics() async {
    try {
      final availableBiometrics = await _auth.getAvailableBiometrics();
      if (availableBiometrics.contains(BiometricType.face)) {
        availableBiometric = BiometricType.face;
      } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
        availableBiometric = BiometricType.fingerprint;
      } else {
        availableBiometric = null;
      }
    } catch (e) {
      availableBiometric = null;
    }
  }

  @action
  Future<bool> authenticateWithBiometricsAndPop() async {
    isBiometricsRunning = true;
    if (await isBiometricAvailable()) {
      try {
        final isAuthorized = await _auth.authenticate(
          localizedReason: 'Authenticate using Face ID',
          options: const AuthenticationOptions(
            biometricOnly: true,
          ),
        );
        if (isAuthorized) {
          await enableBiometricAuth();
          await router.pop();
          return true;
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
        return false;
      } finally {
        isBiometricsRunning = false;
      }
    }
    isBiometricsRunning = false;

    return false;
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
    await Future.delayed(const Duration(milliseconds: 1000));
    isCreatedPinMatch = false;
  }

  void initState() {
    _auth.getAvailableBiometrics();
  }
}
