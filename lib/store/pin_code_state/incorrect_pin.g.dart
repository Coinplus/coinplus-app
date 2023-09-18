// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'incorrect_pin.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PinState on _PinState, Store {
  late final _$isCorrectAtom =
      Atom(name: '_PinState.isCorrect', context: context);

  @override
  bool get isCorrect {
    _$isCorrectAtom.reportRead();
    return super.isCorrect;
  }

  @override
  set isCorrect(bool value) {
    _$isCorrectAtom.reportWrite(value, super.isCorrect, () {
      super.isCorrect = value;
    });
  }

  late final _$_PinStateActionController =
      ActionController(name: '_PinState', context: context);

  @override
  void pinCheck() {
    final _$actionInfo =
        _$_PinStateActionController.startAction(name: '_PinState.pinCheck');
    try {
      return super.pinCheck();
    } finally {
      _$_PinStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isCorrect: ${isCorrect}
    ''';
  }
}
