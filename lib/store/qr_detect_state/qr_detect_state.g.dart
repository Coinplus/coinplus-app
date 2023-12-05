// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_detect_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ValidationState on _ValidationState, Store {
  late final _$_isDetectedAtom =
      Atom(name: '_ValidationState._isDetected', context: context);

  bool get isDetected {
    _$_isDetectedAtom.reportRead();
    return super._isDetected;
  }

  @override
  bool get _isDetected => isDetected;

  @override
  set _isDetected(bool value) {
    _$_isDetectedAtom.reportWrite(value, super._isDetected, () {
      super._isDetected = value;
    });
  }

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

  late final _$_isSecret1ValidAtom =
      Atom(name: '_ValidationState._isSecret1Valid', context: context);

  bool get isSecret1Valid {
    _$_isSecret1ValidAtom.reportRead();
    return super._isSecret1Valid;
  }

  @override
  bool get _isSecret1Valid => isSecret1Valid;

  @override
  set _isSecret1Valid(bool value) {
    _$_isSecret1ValidAtom.reportWrite(value, super._isSecret1Valid, () {
      super._isSecret1Valid = value;
    });
  }

  late final _$_isSecret2ValidAtom =
      Atom(name: '_ValidationState._isSecret2Valid', context: context);

  bool get isSecret2Valid {
    _$_isSecret2ValidAtom.reportRead();
    return super._isSecret2Valid;
  }

  @override
  bool get _isSecret2Valid => isSecret2Valid;

  @override
  set _isSecret2Valid(bool value) {
    _$_isSecret2ValidAtom.reportWrite(value, super._isSecret2Valid, () {
      super._isSecret2Valid = value;
    });
  }

  late final _$_ValidationStateActionController =
      ActionController(name: '_ValidationState', context: context);

  @override
  void validate() {
    final _$actionInfo = _$_ValidationStateActionController.startAction(
        name: '_ValidationState.validate');
    try {
      return super.validate();
    } finally {
      _$_ValidationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateSecretOne() {
    final _$actionInfo = _$_ValidationStateActionController.startAction(
        name: '_ValidationState.validateSecretOne');
    try {
      return super.validateSecretOne();
    } finally {
      _$_ValidationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSecretOne() {
    final _$actionInfo = _$_ValidationStateActionController.startAction(
        name: '_ValidationState.invalidSecretOne');
    try {
      return super.invalidSecretOne();
    } finally {
      _$_ValidationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSecretTwo() {
    final _$actionInfo = _$_ValidationStateActionController.startAction(
        name: '_ValidationState.invalidSecretTwo');
    try {
      return super.invalidSecretTwo();
    } finally {
      _$_ValidationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateSecretTwo() {
    final _$actionInfo = _$_ValidationStateActionController.startAction(
        name: '_ValidationState.validateSecretTwo');
    try {
      return super.validateSecretTwo();
    } finally {
      _$_ValidationStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void detectQr() {
    final _$actionInfo = _$_ValidationStateActionController.startAction(
        name: '_ValidationState.detectQr');
    try {
      return super.detectQr();
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
