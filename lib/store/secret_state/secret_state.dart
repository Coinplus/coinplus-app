import 'package:mobx/mobx.dart';

part 'secret_state.g.dart';

class SecretState = _SecretState with _$SecretState;

abstract class _SecretState with Store {
  @observable
  bool secretOneVisibility = false;

  @observable
  bool secretTwoVisibility = false;

  @action
  void makeSecretOneVisible() {
    secretOneVisibility = true;
  }

  @action
  void makeSecretTwoVisible() {
    secretTwoVisibility = true;
  }
}
