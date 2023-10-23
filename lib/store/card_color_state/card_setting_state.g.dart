// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_setting_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardSettingState on _CardSettingState, Store {
  late final _$selectedColorAtom =
      Atom(name: '_CardSettingState.selectedColor', context: context);

  @override
  CardColor get selectedColor {
    _$selectedColorAtom.reportRead();
    return super.selectedColor;
  }

  @override
  set selectedColor(CardColor value) {
    _$selectedColorAtom.reportWrite(value, super.selectedColor, () {
      super.selectedColor = value;
    });
  }

  late final _$isColorChangedAtom =
      Atom(name: '_CardSettingState.isColorChanged', context: context);

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

  late final _$isPrivateKeyVisibleAtom =
      Atom(name: '_CardSettingState.isPrivateKeyVisible', context: context);

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

  late final _$changeColorAsyncAction =
      AsyncAction('_CardSettingState.changeColor', context: context);

  @override
  Future<void> changeColor(CardColor color) {
    return _$changeColorAsyncAction.run(() => super.changeColor(color));
  }

  late final _$_CardSettingStateActionController =
      ActionController(name: '_CardSettingState', context: context);

  @override
  void makePrivateVisible() {
    final _$actionInfo = _$_CardSettingStateActionController.startAction(
        name: '_CardSettingState.makePrivateVisible');
    try {
      return super.makePrivateVisible();
    } finally {
      _$_CardSettingStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void colorState() {
    final _$actionInfo = _$_CardSettingStateActionController.startAction(
        name: '_CardSettingState.colorState');
    try {
      return super.colorState();
    } finally {
      _$_CardSettingStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedColor: ${selectedColor},
isColorChanged: ${isColorChanged},
isPrivateKeyVisible: ${isPrivateKeyVisible}
    ''';
  }
}
