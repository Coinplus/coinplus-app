import 'package:mobx/mobx.dart';

part 'qr_detect_state.g.dart';

class ValidationState = _ValidationState with _$ValidationState;

abstract class _ValidationState with Store {
  @readonly
  bool _isDetected = false;
  @observable
  bool isValid = true;
  @readonly
  bool _isSecret1Valid = false;
  @readonly
  bool _isSecret2Valid = false;
  @observable
  bool isInvalidAddress = false;

  @action
  void validate() {
    isValid = !isValid;
  }

  @action
  void invalidAddress() {
    isInvalidAddress = true;
  }

  @action
  void validateSecretOne() {
    _isSecret1Valid = true;
  }

  @action
  void invalidSecretOne() {
    _isSecret1Valid = false;
  }

  @action
  void invalidSecretTwo() {
    _isSecret2Valid = false;
  }

  @action
  void validateSecretTwo() {
    _isSecret2Valid = true;
  }

  @action
  void detectQr() {
    _isDetected = true;
  }
}
