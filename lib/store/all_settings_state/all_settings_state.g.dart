// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_settings_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AllSettingsState on _AllSettingsState, Store {
  late final _$currentIndexAtom =
      Atom(name: '_AllSettingsState.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$tabCurrentIndexAtom =
      Atom(name: '_AllSettingsState.tabCurrentIndex', context: context);

  @override
  int get tabCurrentIndex {
    _$tabCurrentIndexAtom.reportRead();
    return super.tabCurrentIndex;
  }

  @override
  set tabCurrentIndex(int value) {
    _$tabCurrentIndexAtom.reportWrite(value, super.tabCurrentIndex, () {
      super.tabCurrentIndex = value;
    });
  }

  late final _$isInAddCardAtom =
      Atom(name: '_AllSettingsState.isInAddCard', context: context);

  @override
  bool get isInAddCard {
    _$isInAddCardAtom.reportRead();
    return super.isInAddCard;
  }

  @override
  set isInAddCard(bool value) {
    _$isInAddCardAtom.reportWrite(value, super.isInAddCard, () {
      super.isInAddCard = value;
    });
  }

  late final _$isInAddBarAtom =
      Atom(name: '_AllSettingsState.isInAddBar', context: context);

  @override
  bool get isInAddBar {
    _$isInAddBarAtom.reportRead();
    return super.isInAddBar;
  }

  @override
  set isInAddBar(bool value) {
    _$isInAddBarAtom.reportWrite(value, super.isInAddBar, () {
      super.isInAddBar = value;
    });
  }

  late final _$isAcceptedAtom =
      Atom(name: '_AllSettingsState.isAccepted', context: context);

  @override
  bool get isAccepted {
    _$isAcceptedAtom.reportRead();
    return super.isAccepted;
  }

  @override
  set isAccepted(bool value) {
    _$isAcceptedAtom.reportWrite(value, super.isAccepted, () {
      super.isAccepted = value;
    });
  }

  late final _$isCheckboxAcceptedAtom =
      Atom(name: '_AllSettingsState.isCheckboxAccepted', context: context);

  @override
  bool get isCheckboxAccepted {
    _$isCheckboxAcceptedAtom.reportRead();
    return super.isCheckboxAccepted;
  }

  @override
  set isCheckboxAccepted(bool value) {
    _$isCheckboxAcceptedAtom.reportWrite(value, super.isCheckboxAccepted, () {
      super.isCheckboxAccepted = value;
    });
  }

  late final _$isActiveAtom =
      Atom(name: '_AllSettingsState.isActive', context: context);

  @override
  bool get isActive {
    _$isActiveAtom.reportRead();
    return super.isActive;
  }

  @override
  set isActive(bool value) {
    _$isActiveAtom.reportWrite(value, super.isActive, () {
      super.isActive = value;
    });
  }

  late final _$isActivatedCheckBoxAtom =
      Atom(name: '_AllSettingsState.isActivatedCheckBox', context: context);

  @override
  bool get isActivatedCheckBox {
    _$isActivatedCheckBoxAtom.reportRead();
    return super.isActivatedCheckBox;
  }

  @override
  set isActivatedCheckBox(bool value) {
    _$isActivatedCheckBoxAtom.reportWrite(value, super.isActivatedCheckBox, () {
      super.isActivatedCheckBox = value;
    });
  }

  late final _$isLineVisibleAtom =
      Atom(name: '_AllSettingsState.isLineVisible', context: context);

  @override
  bool get isLineVisible {
    _$isLineVisibleAtom.reportRead();
    return super.isLineVisible;
  }

  @override
  set isLineVisible(bool value) {
    _$isLineVisibleAtom.reportWrite(value, super.isLineVisible, () {
      super.isLineVisible = value;
    });
  }

  late final _$updateIndexAsyncAction =
      AsyncAction('_AllSettingsState.updateIndex', context: context);

  @override
  Future<void> updateIndex(int index) {
    return _$updateIndexAsyncAction.run(() => super.updateIndex(index));
  }

  late final _$updateTabIndexAsyncAction =
      AsyncAction('_AllSettingsState.updateTabIndex', context: context);

  @override
  Future<void> updateTabIndex(int index) {
    return _$updateTabIndexAsyncAction.run(() => super.updateTabIndex(index));
  }

  late final _$_AllSettingsStateActionController =
      ActionController(name: '_AllSettingsState', context: context);

  @override
  void makeVisible() {
    final _$actionInfo = _$_AllSettingsStateActionController.startAction(
        name: '_AllSettingsState.makeVisible');
    try {
      return super.makeVisible();
    } finally {
      _$_AllSettingsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void makeActiveCheckbox() {
    final _$actionInfo = _$_AllSettingsStateActionController.startAction(
        name: '_AllSettingsState.makeActiveCheckbox');
    try {
      return super.makeActiveCheckbox();
    } finally {
      _$_AllSettingsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void makeActive() {
    final _$actionInfo = _$_AllSettingsStateActionController.startAction(
        name: '_AllSettingsState.makeActive');
    try {
      return super.makeActive();
    } finally {
      _$_AllSettingsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void checkboxAccept() {
    final _$actionInfo = _$_AllSettingsStateActionController.startAction(
        name: '_AllSettingsState.checkboxAccept');
    try {
      return super.checkboxAccept();
    } finally {
      _$_AllSettingsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void accept() {
    final _$actionInfo = _$_AllSettingsStateActionController.startAction(
        name: '_AllSettingsState.accept');
    try {
      return super.accept();
    } finally {
      _$_AllSettingsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateAddCardPosition({AbstractCard? card, required int tabIndex}) {
    final _$actionInfo = _$_AllSettingsStateActionController.startAction(
        name: '_AllSettingsState.updateAddCardPosition');
    try {
      return super.updateAddCardPosition(card: card, tabIndex: tabIndex);
    } finally {
      _$_AllSettingsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
tabCurrentIndex: ${tabCurrentIndex},
isInAddCard: ${isInAddCard},
isInAddBar: ${isInAddBar},
isAccepted: ${isAccepted},
isCheckboxAccepted: ${isCheckboxAccepted},
isActive: ${isActive},
isActivatedCheckBox: ${isActivatedCheckBox},
isLineVisible: ${isLineVisible}
    ''';
  }
}
