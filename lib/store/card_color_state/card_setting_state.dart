import 'package:mobx/mobx.dart';

import '../../constants/card_color.dart';
import '../../models/card_model/card_model.dart';

part 'card_setting_state.g.dart';

class CardSettingState = _CardSettingState with _$CardSettingState;

abstract class _CardSettingState with Store {
  late CardModel card;

  _CardSettingState({required this.card});

  @action
  void changeCardColor({required CardColor color}) {
    final updatedCard = card.copyWith(cardColor: color);
    card = updatedCard;
  }

  @action
  void changeColor() {}
  @observable
  int currentIndex = 0;

  @action
  Future<void> changeIndex(int index) async {
    currentIndex = index;
  }
}
