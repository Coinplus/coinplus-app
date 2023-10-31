import 'package:mobx/mobx.dart';

import '../../constants/card_color.dart';
import '../../models/card_model/card_model.dart';

part 'card_setting_state.g.dart';

class CardSettingState = _CardSettingState with _$CardSettingState;

abstract class _CardSettingState with Store {
  late CardModel card;

  _CardSettingState({required this.card}) {
    selectedColor = card.color;
  }

  @observable
  CardColor selectedColor = CardColor.ORANGE;

  @observable
  bool isColorChanged = false;

  @observable
  bool isPrivateKeyVisible = false;

  @action
  void makePrivateVisible() {
    isPrivateKeyVisible = !isPrivateKeyVisible;
  }

  @action
  void colorState() {
    isColorChanged = true;
  }

  @action
  Future<void> changeColor(CardColor color) async {
    selectedColor = color;
  }
}
