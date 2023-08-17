
import 'package:mobx/mobx.dart';

part 'card_color_state.g.dart';

class CardColorState = _CardColorState with _$CardColorState;

abstract class _CardColorState with Store {
  @observable
  int currentIndex = 0;

  @action
  Future<void> changeIndex(int index) async {
    currentIndex = index;
  }
}
