// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav_bar_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavBarState on NavBarStore, Store {
  late final _$currentIndexAtom =
      Atom(name: 'NavBarStore.currentIndex', context: context);

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
      Atom(name: 'NavBarStore.tabCurrentIndex', context: context);

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
      Atom(name: 'NavBarStore.isInAddCard', context: context);

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
      Atom(name: 'NavBarStore.isInAddBar', context: context);

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

  late final _$updateIndexAsyncAction =
      AsyncAction('NavBarStore.updateIndex', context: context);

  @override
  Future<void> updateIndex(int index) {
    return _$updateIndexAsyncAction.run(() => super.updateIndex(index));
  }

  late final _$updateTabIndexAsyncAction =
      AsyncAction('NavBarStore.updateTabIndex', context: context);

  @override
  Future<void> updateTabIndex(int index) {
    return _$updateTabIndexAsyncAction.run(() => super.updateTabIndex(index));
  }

  late final _$NavBarStoreActionController =
      ActionController(name: 'NavBarStore', context: context);

  @override
  void inAddBar() {
    final _$actionInfo =
        _$NavBarStoreActionController.startAction(name: 'NavBarStore.inAddBar');
    try {
      return super.inAddBar();
    } finally {
      _$NavBarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void inAddCard() {
    final _$actionInfo = _$NavBarStoreActionController.startAction(
        name: 'NavBarStore.inAddCard');
    try {
      return super.inAddCard();
    } finally {
      _$NavBarStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
tabCurrentIndex: ${tabCurrentIndex},
isInAddCard: ${isInAddCard},
isInAddBar: ${isInAddBar}
    ''';
  }
}
