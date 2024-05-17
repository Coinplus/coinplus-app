// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change_pin_code_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChangePinCodeState on _ChangePinCodeState, Store {
  late final _$isNewPinMatchedAtom =
      Atom(name: '_ChangePinCodeState.isNewPinMatched', context: context);

  @override
  bool get isNewPinMatched {
    _$isNewPinMatchedAtom.reportRead();
    return super.isNewPinMatched;
  }

  @override
  set isNewPinMatched(bool value) {
    _$isNewPinMatchedAtom.reportWrite(value, super.isNewPinMatched, () {
      super.isNewPinMatched = value;
    });
  }

  late final _$newPinMatchAsyncAction =
      AsyncAction('_ChangePinCodeState.newPinMatch', context: context);

  @override
  Future<void> newPinMatch() {
    return _$newPinMatchAsyncAction.run(() => super.newPinMatch());
  }

  @override
  String toString() {
    return '''
isNewPinMatched: ${isNewPinMatched}
    ''';
  }
}
