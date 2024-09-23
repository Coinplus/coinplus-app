import 'package:mobx/mobx.dart';
import '../../constants/card_color.dart';
import '../../models/eth_card_model/eth_card_model.dart';

part 'eth_card_settings_state.g.dart';

class EthCardSettingState = _EthCardSettingState with _$EthCardSettingState;

abstract class _EthCardSettingState with Store {
  late EthCardModel ethCard;
  late CardColor previousCardColor;

  _EthCardSettingState({required this.ethCard}) {
    selectedCardColor = ethCard.color;
    previousCardColor = ethCard.color;
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
