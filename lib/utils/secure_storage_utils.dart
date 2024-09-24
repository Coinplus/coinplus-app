import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/abstract_card/abstract_card.dart';
import '../models/bar_model/bar_model.dart';
import '../pages/send_page/send_to/send_to_state.dart';
import '../store/balance_store/balance_store.dart';

class SecureStorageService {
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> savePrivateKeyInSecureStorage({
    required String key,
    required String value,
  }) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> getPrivateKeyFromStorage({
    required String key,
  }) async {
    final privateKey = await _secureStorage.read(key: key);
    return privateKey;
  }

  Future<void> savePinCode({required String pinCode}) async {
    await _secureStorage.write(key: 'pin_code', value: pinCode);
  }

  Future<String?> getSavedPinCode() {
    return _secureStorage.read(key: 'pin_code');
  }

  Future<bool> getIsPinCodeSet() async {
    final value = await getSavedPinCode();
    return value != null;
  }

  Future<void> deleteCard({required AbstractCard card}) async {
    await _secureStorage.delete(key: 'card${card.address}');
  }

  Future<void> deleteBar({required BarModel bar}) async {
    await _secureStorage.delete(key: 'card${bar.address}');
  }

  Future<bool> getIsPrivateKeySet(String key) async {
    final value = await getPrivateKeyFromStorage(key: key);
    return value != null;
  }

  Future<bool> getBiometricStatus() async {
    final value = await _secureStorage.read(key: 'biometricAuth');
    return value != null;
  }

  Future<void> enableBiometricAuth() async {
    await _secureStorage.write(key: 'biometricAuth', value: 'ENABLED');
  }

  Future<void> disableBiometricAuth() async {
    await _secureStorage.delete(key: 'biometricAuth');
  }

  Future<bool> getNotificationToggleStatus() async {
    final value = await _secureStorage.read(key: 'notification');
    return value != null;
  }

  Future<bool> getHideBalancesToggleStatus() async {
    final value = await _secureStorage.read(key: 'hide_balances');
    return value != null;
  }

  Future<void> enableNotificationToggle() async {
    await _secureStorage.write(key: 'notification', value: 'ENABLED');
  }

  Future<void> disableNotificationToggle() async {
    await _secureStorage.delete(key: 'notification');
  }

  Future<void> enableHideBalancesToggle() async {
    await _secureStorage.write(key: 'hide_balances', value: 'ENABLED');
  }

  Future<void> disableHideBalancesToggle() async {
    await _secureStorage.delete(key: 'hide_balances');
  }

  Future<void> isWalletActivated({
    required bool isSet,
    required String address,
  }) async {
    await _secureStorage.write(key: 'card$address', value: isSet.toString());
  }

  Future<bool> checkWalletStatus(String address) async {
    final value = await _secureStorage.read(key: 'card$address');
    return value == 'true';
  }

  Future<void> delete({required String key}) async {
    await _secureStorage.delete(key: key);
  }

  Future<void> write({required String key, required String value}) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> read({required String key}) async {
    return _secureStorage.read(key: key);
  }

  Future<bool> isCardWalletActivated({
    required BalanceStore balanceStore,
    required SendToState state,
  }) async {
    if (balanceStore.cards.isNotEmpty &&
        balanceStore.cards.length != balanceStore.cardCurrentIndex) {
      return checkWalletStatus(
        balanceStore.cards[state.historyPageStore.cardHistoryIndex].address,
      );
    } else {
      return false;
    }
  }

  Future<bool> isBarWalletActivated({
    required BalanceStore balanceStore,
    required SendToState state,
  }) async {
    if (balanceStore.bars.isNotEmpty &&
        balanceStore.bars.length != balanceStore.barCurrentIndex) {
      return checkWalletStatus(
        balanceStore.bars[state.historyPageStore.barHistoryIndex].address,
      );
    } else {
      return false;
    }
  }

  Future<void> localStorage() async {
    final prefs = await SharedPreferences.getInstance();
    final packageInfo = await PackageInfo.fromPlatform();
    if (prefs.getBool('first_run') ?? true) {
      await prefs.setBool('show_modal', true);
      await prefs.setString('package_info', packageInfo.version.toString());
      await clearSecureStorage();
      await prefs.setBool('first_run', false);
    }
  }

  Future<void> clearSecureStorage() async {
    await _secureStorage.deleteAll();
  }
}
