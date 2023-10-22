import 'package:mobx/mobx.dart';

part 'pin_code_state.g.dart';

class PinLockStore = _PinLockStore with _$PinLockStore;

abstract class _PinLockStore with Store {
  @observable
  String value = '';

  @observable
  bool? isEnteredCorrect;

  @action
  void onNumberTap(int number, int pinLength, int correctPin) {
    if (value.length < pinLength) {
      value += number.toString();
    }
    if (value.length == pinLength) {
      final isCorrect = int.parse(value) == correctPin;
      isEnteredCorrect = isCorrect;
      if (!isCorrect) {
        _clearValueAfterDelay();
      }
    }
  }

  @action
  void onDelete() {
    if (value.isNotEmpty) {
      value = value.substring(0, value.length - 1);
      isEnteredCorrect = null;
    }
  }

  @action
  void clearValue() {
    value = '';
    isEnteredCorrect = null;
  }

  Future<void> _clearValueAfterDelay() async {
    await Future.delayed(const Duration(milliseconds: 300));
    clearValue();
  }
}
