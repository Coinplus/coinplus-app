import 'package:mobx/mobx.dart';

import '../../constants/card_color.dart';
import '../../models/card_model/card_model.dart';

part 'card_setting_state.g.dart';

class CardSettingState = _CardSettingState with _$CardSettingState;

abstract class _CardSettingState with Store {
  late CardModel card;

  _CardSettingState({required this.card}) {
    selectedColor = card.cardColor;
  }

  @observable
  CardColor selectedColor = CardColor.ORANGE;

  @action
  Future<void> changeColor(CardColor color) async {
    selectedColor = color;
  }
}