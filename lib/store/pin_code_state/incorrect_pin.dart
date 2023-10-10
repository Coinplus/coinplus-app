import 'package:mobx/mobx.dart';

part 'incorrect_pin.g.dart';

class PinState = _PinState with _$PinState;

abstract class _PinState with Store {
  @observable
  bool isCorrect = true;

  @action
  void pinCheck() {
    isCorrect = false;
  }
}
