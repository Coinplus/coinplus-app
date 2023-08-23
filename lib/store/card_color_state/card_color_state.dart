import 'package:mobx/mobx.dart';

import '../../utils/storage_utils.dart';

part 'card_color_state.g.dart';

class CardColorState = _CardColorState with _$CardColorState;

abstract class _CardColorState with Store {
  @observable
  int currentIndex = 0;

  @action
  Future<void> changeIndex(int index) async {
    currentIndex = index;
    await StorageUtils.setInt(key: 'selectedColor', value: currentIndex);
  }
}
