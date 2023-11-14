import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

Future<void> savePinCode({
  required String pinCode,
}) async {
  await secureStorage.write(key: 'pin_code', value: pinCode);
}

Future<String?> getSavedPinCode() {
  return secureStorage.read(key: 'pin_code');
}

Future<void> isPinCodeSet({
  required bool isSet,
}) async {
  await secureStorage.write(key: 'pin_code_is_set', value: isSet.toString());
}

Future<bool> isPinCodeEnabled() async {
  final isSet = await getIsPinCodeSet();
  return isSet == true;
}

Future<bool> getIsPinCodeSet() async {
  final value = await secureStorage.read(key: 'pin_code_is_set');
  return value == 'true';
}
<<<<<<< Updated upstream
=======

Future<void> isWalletActivated({
  required bool isSet,
  required String address,
}) async {
  await secureStorage.write(key: 'card$address', value: isSet.toString());
}

Future<bool> getIsWalletActivated(String address) async {
  final value = await secureStorage.read(key: 'card$address');
  return value == 'true';
}
>>>>>>> Stashed changes
