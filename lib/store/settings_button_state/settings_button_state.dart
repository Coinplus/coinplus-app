import 'package:mobx/mobx.dart';

part 'settings_button_state.g.dart';

class SettingsState = _SettingsState with _$SettingsState;

abstract class _SettingsState with Store {
  @observable
  bool isAddressCopied = false;
  @observable
  bool isReorderingStart = false;

  @action
  void startReorder() {
    isReorderingStart = true;
  }

  @action
  Future<void> copyAddress() async {
    isAddressCopied = true;
    await Future.delayed(const Duration(milliseconds: 1000));
    isAddressCopied = false;
  }
}
