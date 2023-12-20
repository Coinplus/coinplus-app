// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accept_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AcceptState on _AcceptState, Store {
  late final _$isAcceptedAtom = Atom(name: '_AcceptState.isAccepted', context: context);

  @override
  bool get isAccepted {
    _$isAcceptedAtom.reportRead();
    return super.isAccepted;
  }

  @override
  set isAccepted(bool value) {
    _$isAcceptedAtom.reportWrite(value, super.isAccepted, () {
      super.isAccepted = value;
    });
  }

  late final _$isCheckboxAcceptedAtom = Atom(name: '_AcceptState.isCheckboxAccepted', context: context);

  @override
  bool get isCheckboxAccepted {
    _$isCheckboxAcceptedAtom.reportRead();
    return super.isCheckboxAccepted;
  }

  @override
  set isCheckboxAccepted(bool value) {
    _$isCheckboxAcceptedAtom.reportWrite(value, super.isCheckboxAccepted, () {
      super.isCheckboxAccepted = value;
    });
  }

  late final _$_AcceptStateActionController = ActionController(name: '_AcceptState', context: context);

  @override
  void checkboxAccept() {
    final _$actionInfo = _$_AcceptStateActionController.startAction(name: '_AcceptState.checkboxAccept');
    try {
      return super.checkboxAccept();
    } finally {
      _$_AcceptStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void accept() {
    final _$actionInfo = _$_AcceptStateActionController.startAction(name: '_AcceptState.accept');
    try {
      return super.accept();
    } finally {
      _$_AcceptStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isAccepted: ${isAccepted},
isCheckboxAccepted: ${isCheckboxAccepted}
    ''';
  }
}
