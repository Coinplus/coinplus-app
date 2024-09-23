import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../models/abstract_card/abstract_card.dart';

part 'all_settings_state.g.dart';

class AllSettingsState = _AllSettingsState with _$AllSettingsState;

abstract class _AllSettingsState with Store {
  late TextEditingController nameController = TextEditingController();

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
  @observable
  bool isAddressCopied = false;
  @observable
  bool isReorderingStart = false;
  @observable
  bool isButtonEnabled = false;
  @observable
  bool isNfcSupported = false;

  @action
  bool isEmpty() {
    return isButtonEnabled = nameController.text.isNotEmpty;
  }

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
  Future<void> checkNfcSupport() async {
    final isAvailable = await NfcManager.instance.isAvailable();
    isNfcSupported = isAvailable;
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

  @action
  void startReorder() {
    isReorderingStart = true;
  }

  @action
  Future<void> copyAddress() async {
    isAddressCopied = true;
    await Future.delayed(const Duration(milliseconds: 1000));
    isAddressCopied = false;
  }
}
