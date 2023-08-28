// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_setting_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardSettingState on _CardSettingState, Store {
  late final _$currentIndexAtom =
      Atom(name: '_CardSettingState.currentIndex', context: context);

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

  late final _$changeIndexAsyncAction =
      AsyncAction('_CardSettingState.changeIndex', context: context);

  @override
  Future<void> changeIndex(int index) {
    return _$changeIndexAsyncAction.run(() => super.changeIndex(index));
  }

  late final _$_CardSettingStateActionController =
      ActionController(name: '_CardSettingState', context: context);

  @override
  void changeCardColor({required CardColor color}) {
    final _$actionInfo = _$_CardSettingStateActionController.startAction(
        name: '_CardSettingState.changeCardColor');
    try {
      return super.changeCardColor(color: color);
    } finally {
      _$_CardSettingStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeColor() {
    final _$actionInfo = _$_CardSettingStateActionController.startAction(
        name: '_CardSettingState.changeColor');
    try {
      return super.changeColor();
    } finally {
      _$_CardSettingStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
