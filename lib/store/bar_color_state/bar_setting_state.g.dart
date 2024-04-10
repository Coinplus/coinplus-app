// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bar_setting_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BarSettingState on _BarSettingState, Store {
  late final _$selectedBarColorAtom =
      Atom(name: '_BarSettingState.selectedBarColor', context: context);

  @override
  CardColor get selectedBarColor {
    _$selectedBarColorAtom.reportRead();
    return super.selectedBarColor;
  }

  @override
  set selectedBarColor(CardColor value) {
    _$selectedBarColorAtom.reportWrite(value, super.selectedBarColor, () {
      super.selectedBarColor = value;
    });
  }

  late final _$isPrivateKeyVisibleAtom =
      Atom(name: '_BarSettingState.isPrivateKeyVisible', context: context);

  @override
  bool get isPrivateKeyVisible {
    _$isPrivateKeyVisibleAtom.reportRead();
    return super.isPrivateKeyVisible;
  }

  @override
  set isPrivateKeyVisible(bool value) {
    _$isPrivateKeyVisibleAtom.reportWrite(value, super.isPrivateKeyVisible, () {
      super.isPrivateKeyVisible = value;
    });
  }

  late final _$isColorChangedAtom =
      Atom(name: '_BarSettingState.isColorChanged', context: context);

  @override
  bool get isColorChanged {
    _$isColorChangedAtom.reportRead();
    return super.isColorChanged;
  }

  @override
  set isColorChanged(bool value) {
    _$isColorChangedAtom.reportWrite(value, super.isColorChanged, () {
      super.isColorChanged = value;
    });
  }

  late final _$changeBarColorAsyncAction =
      AsyncAction('_BarSettingState.changeBarColor', context: context);

  @override
  Future<void> changeBarColor(CardColor color) {
    return _$changeBarColorAsyncAction.run(() => super.changeBarColor(color));
  }

  late final _$_BarSettingStateActionController =
      ActionController(name: '_BarSettingState', context: context);

  @override
  void makePrivateVisible() {
    final _$actionInfo = _$_BarSettingStateActionController.startAction(
        name: '_BarSettingState.makePrivateVisible');
    try {
      return super.makePrivateVisible();
    } finally {
      _$_BarSettingStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void colorState() {
    final _$actionInfo = _$_BarSettingStateActionController.startAction(
        name: '_BarSettingState.colorState');
    try {
      return super.colorState();
    } finally {
      _$_BarSettingStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedBarColor: ${selectedBarColor},
isPrivateKeyVisible: ${isPrivateKeyVisible},
isColorChanged: ${isColorChanged}
    ''';
  }
}
