import 'package:mobx/mobx.dart';

part 'change_pin_code_state.g.dart';

class ChangePinCodeState = _ChangePinCodeState with _$ChangePinCodeState;

abstract class _ChangePinCodeState with Store {
  @observable
  bool isNewPinMatched = false;

  @action
  Future<void> newPinMatch() async {
    isNewPinMatched = true;
    await Future.delayed(const Duration(milliseconds: 1500));
    isNewPinMatched = false;
  }
}
