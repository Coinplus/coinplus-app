// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkbox_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CheckboxState on _CheckboxState, Store {
  late final _$isActiveAtom = Atom(name: '_CheckboxState.isActive', context: context);

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

  late final _$isActivatedCheckBoxAtom = Atom(name: '_CheckboxState.isActivatedCheckBox', context: context);

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

  late final _$_CheckboxStateActionController = ActionController(name: '_CheckboxState', context: context);

  @override
  void makeActiveCheckbox() {
    final _$actionInfo = _$_CheckboxStateActionController.startAction(name: '_CheckboxState.makeActiveCheckbox');
    try {
      return super.makeActiveCheckbox();
    } finally {
      _$_CheckboxStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void makeActive() {
    final _$actionInfo = _$_CheckboxStateActionController.startAction(name: '_CheckboxState.makeActive');
    try {
      return super.makeActive();
    } finally {
      _$_CheckboxStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isActive: ${isActive},
isActivatedCheckBox: ${isActivatedCheckBox}
    ''';
  }
}
