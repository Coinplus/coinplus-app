import 'package:mobx/mobx.dart';
part 'qr_detect_state.g.dart';

class QrDetectState = _QrDetectState with _$QrDetectState;

abstract class _QrDetectState with Store {
  @readonly
  bool _isDetected = false;

  @action
  void startLoading() {
    _isDetected = true;
  }
}
