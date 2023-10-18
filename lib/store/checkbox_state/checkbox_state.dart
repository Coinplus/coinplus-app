import 'package:mobx/mobx.dart';

part 'checkbox_state.g.dart';

class CheckboxState = _CheckboxState with _$CheckboxState;

abstract class _CheckboxState with Store {
  @observable
  bool isActive = false;

  @action
  void makeActive() {
    isActive = !isActive;
  }

}
