import 'package:mobx/mobx.dart';

import '../../constants/bar_color.dart';
import '../../models/bar_model/bar_model.dart';

part 'bar_setting_state.g.dart';

class BarSettingState = _BarSettingState with _$BarSettingState;

abstract class _BarSettingState with Store {
  late BarModel bar;

  _BarSettingState({required this.bar}) {
    selectedColor = bar.barColor;
  }

  @observable
  BarColor selectedColor = BarColor.SILVER;

  @action
  Future<void> changeColor(BarColor color) async {
    selectedColor = color;
  }
}