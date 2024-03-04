// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_name_sate.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardNameState on _CardNameState, Store {
  late final _$isButtonEnabledAtom = Atom(name: '_CardNameState.isButtonEnabled', context: context);

  @override
  bool get isButtonEnabled {
    _$isButtonEnabledAtom.reportRead();
    return super.isButtonEnabled;
  }

  @override
  set isButtonEnabled(bool value) {
    _$isButtonEnabledAtom.reportWrite(value, super.isButtonEnabled, () {
      super.isButtonEnabled = value;
    });
  }

  late final _$_CardNameStateActionController = ActionController(name: '_CardNameState', context: context);

  @override
  bool isEmpty() {
    final _$actionInfo = _$_CardNameStateActionController.startAction(name: '_CardNameState.isEmpty');
    try {
      return super.isEmpty();
    } finally {
      _$_CardNameStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isButtonEnabled: ${isButtonEnabled}
    ''';
  }
}
