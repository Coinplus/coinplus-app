// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'validator_animation_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ValidationState on _ValidationState, Store {
  late final _$_isValidAtom =
      Atom(name: '_ValidationState._isValid', context: context);

  bool get isValid {
    _$_isValidAtom.reportRead();
    return super._isValid;
  }

  @override
  bool get _isValid => isValid;

  @override
  set _isValid(bool value) {
    _$_isValidAtom.reportWrite(value, super._isValid, () {
      super._isValid = value;
    });
  }

  late final _$_ValidationStateActionController =
      ActionController(name: '_ValidationState', context: context);

  @override
  void startLoading() {
    final _$actionInfo = _$_ValidationStateActionController.startAction(
        name: '_ValidationState.startLoading');
    try {
      return super.startLoading();
    } finally {
      _$_ValidationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
