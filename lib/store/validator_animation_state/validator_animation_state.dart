import 'package:mobx/mobx.dart';

part 'validator_animation_state.g.dart';

class ValidationState = _ValidationState with _$ValidationState;

abstract class _ValidationState with Store {
  @readonly
  bool _isValid = false;

  @action
  void startLoading() {
    _isValid = !_isValid;
  }
}
