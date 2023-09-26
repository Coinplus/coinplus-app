import 'package:hive_flutter/hive_flutter.dart';

abstract class PINRepository {
  void changePin(String currentPIN, String newPIN);

  void close();

  Future<bool> isPINSet();

  void addPin(String pin);

  Future<bool> pinEquals(String pin);
}

class HivePINRepository extends PINRepository {
  static const String _boxName = 'PIN_BOX';
  static const String _keyName = 'PIN_Key';
  static const String _pinSetFlagKey = 'PIN_Set_Flag';

  @override
  Future<void> addPin(String pin) async {
    final box = Hive.isBoxOpen(_boxName)
        ? Hive.box(_boxName)
        : await Hive.openBox(_boxName);

    await box.put(_keyName, pin);
    await box.put(_pinSetFlagKey, true);
  }

  @override
  Future<void> changePin(String currentPIN, String newPIN) async {
    final box = Hive.isBoxOpen(_boxName)
        ? Hive.box(_boxName)
        : await Hive.openBox(_boxName);

    final storedPIN = box.get(_keyName, defaultValue: _keyName);

    if (storedPIN == currentPIN) {
      await box.put(_keyName, newPIN);
    } else {
      // Handle incorrect current PIN here, you can throw an exception or return an error flag.
      throw Exception('Incorrect current PIN');
    }

    await box.close();
  }

  @override
  Future<bool> pinEquals(String pin) async {
    final box = Hive.isBoxOpen(_boxName)
        ? Hive.box(_boxName)
        : await Hive.openBox(_boxName);

    return box.get(_keyName, defaultValue: _keyName) == pin;
  }

  @override
  Future<bool> isPINSet() async {
    final box = await Hive.openBox(_boxName);
    if (box.containsKey(_pinSetFlagKey)) {
      await box.close();
      return true;
    } else {
      await box.close();
      return false;
    }
  }

  @override
  Future<void> close() async {
    if (Hive.isBoxOpen(_boxName)) {
      final box = Hive.box(_boxName);
      await box.close();
    }
  }
}
