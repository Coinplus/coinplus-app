import 'package:mobx/mobx.dart';

part 'settings_button_state.g.dart';

class SettingsState = _SettingsState with _$SettingsState;

abstract class _SettingsState with Store {
  @observable
  int cardCurrentIndex = 0;
  @observable
  int barCurrentIndex = 0;

  @action
  Future<void> setCardCurrentIndex(int index) async {
    cardCurrentIndex = index;
  }

  @action
  Future<void> setBarCurrentIndex(int index) async {
    barCurrentIndex = index;
  }
}
