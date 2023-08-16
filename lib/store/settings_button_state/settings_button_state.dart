import 'package:mobx/mobx.dart';

part 'settings_button_state.g.dart';

class SettingsState = _SettingsState with _$SettingsState;

abstract class _SettingsState with Store {
  @observable
  int currentIndex = 0;

  @action
  Future<void> setCurrentIndex(int index) async {
    currentIndex = index;
  }
}
