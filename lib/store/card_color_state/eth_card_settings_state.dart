import 'package:mobx/mobx.dart';
import '../../constants/card_color.dart';
import '../../models/abstract_card/abstract_card.dart';

part 'eth_card_settings_state.g.dart';

class EthCardSettingState = _EthCardSettingState with _$EthCardSettingState;

abstract class _EthCardSettingState with Store {
  late AbstractCard card;
  late CardColor previousCardColor;

  _EthCardSettingState({required this.card}) {
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
