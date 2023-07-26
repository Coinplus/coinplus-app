// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_filed_zoom_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextFieldState on _TextFieldState, Store {
  late final _$isFocusedAtom =
      Atom(name: '_TextFieldState.isFocused', context: context);

  @override
  bool get isFocused {
    _$isFocusedAtom.reportRead();
    return super.isFocused;
  }

  @override
  set isFocused(bool value) {
    _$isFocusedAtom.reportWrite(value, super.isFocused, () {
      super.isFocused = value;
    });
  }

  late final _$focusNodeAtom =
      Atom(name: '_TextFieldState.focusNode', context: context);

  @override
  FocusNode get focusNode {
    _$focusNodeAtom.reportRead();
    return super.focusNode;
  }

  @override
  set focusNode(FocusNode value) {
    _$focusNodeAtom.reportWrite(value, super.focusNode, () {
      super.focusNode = value;
    });
  }

  late final _$_TextFieldStateActionController =
      ActionController(name: '_TextFieldState', context: context);

  @override
  void focusField() {
    final _$actionInfo = _$_TextFieldStateActionController.startAction(
        name: '_TextFieldState.focusField');
    try {
      return super.focusField();
    } finally {
      _$_TextFieldStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFocused: ${isFocused},
focusNode: ${focusNode}
    ''';
  }
}
