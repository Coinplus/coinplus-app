// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secret_lines_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LinesStore on _LinesStore, Store {
  late final _$isLineVisibleAtom = Atom(name: '_LinesStore.isLineVisible', context: context);

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

  late final _$_LinesStoreActionController = ActionController(name: '_LinesStore', context: context);

  @override
  void makeVisible() {
    final _$actionInfo = _$_LinesStoreActionController.startAction(name: '_LinesStore.makeVisible');
    try {
      return super.makeVisible();
    } finally {
      _$_LinesStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLineVisible: ${isLineVisible}
    ''';
  }
}
