import 'package:mobx/mobx.dart';

part 'secret_lines_state.g.dart';

class LinesStore = _LinesStore with _$LinesStore;

abstract class _LinesStore with Store {
  @observable
  bool isLineVisible = false;

  @action
  void makeVisible() {
    isLineVisible = !isLineVisible;
  }
}
