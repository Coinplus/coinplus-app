// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'qr_detect_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$QrDetectState on _QrDetectState, Store {
  late final _$_isDetectedAtom =
      Atom(name: '_QrDetectState._isDetected', context: context);

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
      Atom(name: '_QrDetectState._isValid', context: context);

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

  late final _$_QrDetectStateActionController =
      ActionController(name: '_QrDetectState', context: context);

  @override
  void validate() {
    final _$actionInfo = _$_QrDetectStateActionController.startAction(
        name: '_QrDetectState.validate');
    try {
      return super.validate();
    } finally {
      _$_QrDetectStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  void detectQr() {
    final _$actionInfo = _$_QrDetectStateActionController.startAction(
        name: '_QrDetectState.detectQr');
    try {
      return super.detectQr();
    } finally {
      _$_QrDetectStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
