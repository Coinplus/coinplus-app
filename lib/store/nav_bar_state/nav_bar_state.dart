import 'package:mobx/mobx.dart';

import '../../models/abstract_card/abstract_card.dart';

part 'nav_bar_state.g.dart';

class NavBarState = NavBarStore with _$NavBarState;

abstract class NavBarStore with Store {
  @observable
  int currentIndex = 0;

  @observable
  int tabCurrentIndex = 0;

  @observable
  bool isInAddCard = false;

  @observable
  bool isInAddBar = false;

  @action
  void updateAddCardPosition({AbstractCard? card, required int tabIndex}) {
    isInAddCard = card == null && tabIndex == 0;
    isInAddBar = card == null && tabIndex == 1;
  }

  @action
  Future<void> updateIndex(int index) async {
    currentIndex = index;
  }

  @action
  Future<void> updateTabIndex(int index) async {
    tabCurrentIndex = index;
  }
}
