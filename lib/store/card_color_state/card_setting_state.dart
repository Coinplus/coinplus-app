import 'package:mobx/mobx.dart';
import '../../constants/card_color.dart';
import '../../models/card_model/card_model.dart';
import '../../models/eth_card_model/eth_card_model.dart';

part 'card_setting_state.g.dart';

class CardSettingState = _CardSettingState with _$CardSettingState;

abstract class _CardSettingState with Store {
  late CardModel card;
  late EthCardModel? ethCard;
  late CardColor previousCardColor;

  _CardSettingState({required this.card, required this.ethCard}) {
    selectedCardColor = card.color;
    previousCardColor = card.color;
  }

  @observable
  CardColor selectedCardColor = CardColor.ORANGE;

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
    isColorChanged = selectedCardColor != previousCardColor;
  }

  @action
  Future<void> changeCardColor(CardColor color) async {
    selectedCardColor = color;
    colorState();
  }
}
