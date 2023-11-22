import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const secureStorage = FlutterSecureStorage();

Future<void> savePrivateKeyInSecureStorage({
  required String key,
  required String value,
}) async {
  await secureStorage.write(key: key, value: value);
}

Future<String?> getPrivateKeyFromStorage({
  required String key,
}) async {
  final privateKey = await secureStorage.read(key: key);
  return privateKey;
}

Future<void> savePinCode({required String pinCode}) async {
  await secureStorage.write(key: 'pin_code', value: pinCode);
}

Future<String?> getSavedPinCode() {
  return secureStorage.read(key: 'pin_code');
}

Future<bool> getIsPinCodeSet() async {
  final value = await getSavedPinCode();
  return value != null;
}

Future<bool> getBiometricStatus() async {
  final value = await secureStorage.read(key: 'biometricAuth');
  return value != null;
}

Future<void> enableBiometricAuth() async {
  await secureStorage.write(key: 'biometricAuth', value: 'ENABLED');
}

Future<void> disableBiometricAuth() async {
  await secureStorage.delete(key: 'biometricAuth');
}

Future<void> isWalletActivated({
  required bool isSet,
  required String address,
}) async {
  await secureStorage.write(key: 'card$address', value: isSet.toString());
}

Future<bool> checkWalletStatus(String address) async {
  final value = await secureStorage.read(key: 'card$address');
  return value == 'true';
}

Future<void> localStorage() async {
  final prefs = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage();
  if (prefs.getBool('first_run') ?? true) {
    await secureStorage.deleteAll();
    await prefs.setBool('first_run', false);
  }
}
