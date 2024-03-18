import 'package:mobx/mobx.dart';

import '../../models/abstract_card/abstract_card.dart';

part 'all_settings_state.g.dart';

class AllSettingsState = _AllSettingsState with _$AllSettingsState;

abstract class _AllSettingsState with Store {
  @observable
  int currentIndex = 0;
  @observable
  int tabCurrentIndex = 0;
  @observable
  bool isInAddCard = false;
  @observable
  bool isInAddBar = false;
  @observable
  bool isAccepted = true;
  @observable
  bool isCheckboxAccepted = true;
  @observable
  bool isActive = false;
  @observable
  bool isActivatedCheckBox = false;
  @observable
  bool isLineVisible = false;

  @action
  void makeVisible() {
    isLineVisible = true;
  }

  void makeInvisible() {
    isLineVisible = false;
  }

  @action
  void makeActiveCheckbox() {
    isActivatedCheckBox = !isActivatedCheckBox;
  }

  @action
  void makeActive() {
    isActive = !isActive;
  }

  @action
  void checkboxAccept() {
    isCheckboxAccepted = false;
  }

  @action
  void accept() {
    isAccepted = false;
  }

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
