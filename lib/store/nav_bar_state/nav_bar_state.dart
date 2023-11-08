import 'package:mobx/mobx.dart';

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
  void inAddBar() {
    isInAddBar = !isInAddBar;
  }

  @action
  void inAddCard() {
    isInAddCard = !isInAddCard;
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
