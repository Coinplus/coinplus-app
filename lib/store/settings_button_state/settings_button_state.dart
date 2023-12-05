import 'package:mobx/mobx.dart';

part 'settings_button_state.g.dart';

class SettingsState = _SettingsState with _$SettingsState;

abstract class _SettingsState with Store {
  @observable
  int cardCurrentIndex = 0;
  @observable
  int barCurrentIndex = 0;
  @observable
  int cardAndBarTabBarIndex = 0;
  @observable
  bool isAddressCopied = false;
  @observable
  bool isReorderingStart = false;

  @action
  void startReorder() {
    isReorderingStart = true;
  }

  @action
  Future<void> setCardCurrentIndex(int index) async {
    cardCurrentIndex = index;
  }

  @action
  Future<void> setBarCurrentIndex(int index) async {
    barCurrentIndex = index;
  }

  @action
  Future<void> copyAddress() async {
    isAddressCopied = true;
    await Future.delayed(const Duration(milliseconds: 1000));
    isAddressCopied = false;
  }

  @action
  Future<void> changeTabBarIndex(int index) async {
    cardAndBarTabBarIndex = index;
  }
}
