import 'package:mobx/mobx.dart';

part 'qr_detect_state.g.dart';

class QrDetectState = _QrDetectState with _$QrDetectState;

abstract class _QrDetectState with Store {
  @readonly
  bool _isDetected = false;
  @readonly
  bool _isValid = true;
  @readonly
  bool _isSecret1Valid = false;
  @readonly
  bool _isSecret2Valid = false;

  @action
  void validate() {
    _isValid = !_isValid;
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
