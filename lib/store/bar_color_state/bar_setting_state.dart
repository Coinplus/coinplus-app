import 'package:mobx/mobx.dart';

import '../../constants/card_color.dart';
import '../../models/bar_model/bar_model.dart';

part 'bar_setting_state.g.dart';

class BarSettingState = _BarSettingState with _$BarSettingState;

abstract class _BarSettingState with Store {
  late BarModel bar;

  _BarSettingState({required this.bar}) {
    selectedBarColor = bar.color;
  }

  @observable
  CardColor selectedBarColor = CardColor.SILVER;

  @observable
  bool isPrivateKeyVisible = false;

  @observable
  bool isColorChanged = false;

  @action
  void makePrivateVisible() {
    isPrivateKeyVisible = !isPrivateKeyVisible;
  }

  @action
  void colorState() {
    isColorChanged = true;
  }

  @action
  Future<void> changeBarColor(CardColor color) async {
    selectedBarColor = color;
  }
}
