import 'package:mobx/mobx.dart';

part 'checkbox_state.g.dart';

class CheckboxState = _CheckboxState with _$CheckboxState;

abstract class _CheckboxState with Store {
  @observable
  bool isActive = false;
  @observable
  bool isActivatedCheckBox = false;

  @action
  void makeActiveCheckbox() {
    isActivatedCheckBox = !isActivatedCheckBox;
  }

  @action
  void makeActive() {
    isActive = !isActive;
  }
}
