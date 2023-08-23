import 'package:mobx/mobx.dart';

part 'nav_bar_state.g.dart';

class NavBarState = NavBarStore with _$NavBarState;

abstract class NavBarStore with Store {
  @observable
  int currentIndex = 0;
  @action
  Future<void> updateIndex(int index) async {
    currentIndex = index;
  }
}
