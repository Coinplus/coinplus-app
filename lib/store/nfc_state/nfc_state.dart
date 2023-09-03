import 'package:mobx/mobx.dart';
import 'package:nfc_manager/nfc_manager.dart';

part 'nfc_state.g.dart';

class NfcStore = _NfcStore with _$NfcStore;

abstract class _NfcStore with Store {
  @observable
  bool isNfcSupported = false;

  @action
  Future<void> checkNfcSupport() async {
    final isAvailable = await NfcManager.instance.isAvailable();
    isNfcSupported = isAvailable;
  }
}
