// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'secret_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SecretState on _SecretState, Store {
  late final _$secretOneVisibilityAtom = Atom(name: '_SecretState.secretOneVisibility', context: context);

  @override
  bool get secretOneVisibility {
    _$secretOneVisibilityAtom.reportRead();
    return super.secretOneVisibility;
  }

  @override
  set secretOneVisibility(bool value) {
    _$secretOneVisibilityAtom.reportWrite(value, super.secretOneVisibility, () {
      super.secretOneVisibility = value;
    });
  }

  late final _$secretTwoVisibilityAtom = Atom(name: '_SecretState.secretTwoVisibility', context: context);

  @override
  bool get secretTwoVisibility {
    _$secretTwoVisibilityAtom.reportRead();
    return super.secretTwoVisibility;
  }

  @override
  set secretTwoVisibility(bool value) {
    _$secretTwoVisibilityAtom.reportWrite(value, super.secretTwoVisibility, () {
      super.secretTwoVisibility = value;
    });
  }

  late final _$_SecretStateActionController = ActionController(name: '_SecretState', context: context);

  @override
  void makeSecretOneVisible() {
    final _$actionInfo = _$_SecretStateActionController.startAction(name: '_SecretState.makeSecretOneVisible');
    try {
      return super.makeSecretOneVisible();
    } finally {
      _$_SecretStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void makeSecretTwoVisible() {
    final _$actionInfo = _$_SecretStateActionController.startAction(name: '_SecretState.makeSecretTwoVisible');
    try {
      return super.makeSecretTwoVisible();
    } finally {
      _$_SecretStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
secretOneVisibility: ${secretOneVisibility},
secretTwoVisibility: ${secretTwoVisibility}
    ''';
  }
}
