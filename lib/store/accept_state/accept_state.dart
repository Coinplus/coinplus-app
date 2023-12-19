import 'package:mobx/mobx.dart';

part 'accept_state.g.dart';

class AcceptState = _AcceptState with _$AcceptState;

abstract class _AcceptState with Store {
  @observable
  bool isAccepted = true;
  @observable
  bool isCheckboxAccepted = true;

  @action
  void checkboxAccept() {
    isCheckboxAccepted = false;
  }

  @action
  void accept() {
    isAccepted = false;
  }
}
