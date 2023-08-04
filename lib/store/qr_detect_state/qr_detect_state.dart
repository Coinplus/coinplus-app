import 'package:mobx/mobx.dart';

part 'qr_detect_state.g.dart';

class QrDetectState = _QrDetectState with _$QrDetectState;

abstract class _QrDetectState with Store {
  @readonly
  bool _isDetected = false;
  @readonly
  bool _isValid = true;

  @action
  void validate() {
    _isValid = !_isValid;
  }

  @action
  void detectQr() {
    _isDetected = true;
  }
}
