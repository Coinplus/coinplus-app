// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_factor_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormFactorState on _FormFactorState, Store {
  late final _$isFirstWidgetZoomedAtom =
      Atom(name: '_FormFactorState.isFirstWidgetZoomed', context: context);

  @override
  bool get isFirstWidgetZoomed {
    _$isFirstWidgetZoomedAtom.reportRead();
    return super.isFirstWidgetZoomed;
  }

  @override
  set isFirstWidgetZoomed(bool value) {
    _$isFirstWidgetZoomedAtom.reportWrite(value, super.isFirstWidgetZoomed, () {
      super.isFirstWidgetZoomed = value;
    });
  }

  late final _$isSecondWidgetZoomedAtom =
      Atom(name: '_FormFactorState.isSecondWidgetZoomed', context: context);

  @override
  bool get isSecondWidgetZoomed {
    _$isSecondWidgetZoomedAtom.reportRead();
    return super.isSecondWidgetZoomed;
  }

  @override
  set isSecondWidgetZoomed(bool value) {
    _$isSecondWidgetZoomedAtom.reportWrite(value, super.isSecondWidgetZoomed,
        () {
      super.isSecondWidgetZoomed = value;
    });
  }

  late final _$isFirstWidgetVisibleAtom =
      Atom(name: '_FormFactorState.isFirstWidgetVisible', context: context);

  @override
  bool get isFirstWidgetVisible {
    _$isFirstWidgetVisibleAtom.reportRead();
    return super.isFirstWidgetVisible;
  }

  @override
  set isFirstWidgetVisible(bool value) {
    _$isFirstWidgetVisibleAtom.reportWrite(value, super.isFirstWidgetVisible,
        () {
      super.isFirstWidgetVisible = value;
    });
  }

  late final _$isSecondWidgetVisibleAtom =
      Atom(name: '_FormFactorState.isSecondWidgetVisible', context: context);

  @override
  bool get isSecondWidgetVisible {
    _$isSecondWidgetVisibleAtom.reportRead();
    return super.isSecondWidgetVisible;
  }

  @override
  set isSecondWidgetVisible(bool value) {
    _$isSecondWidgetVisibleAtom.reportWrite(value, super.isSecondWidgetVisible,
        () {
      super.isSecondWidgetVisible = value;
    });
  }

  late final _$_FormFactorStateActionController =
      ActionController(name: '_FormFactorState', context: context);

  @override
  void cardSelection() {
    final _$actionInfo = _$_FormFactorStateActionController.startAction(
        name: '_FormFactorState.cardSelection');
    try {
      return super.cardSelection();
    } finally {
      _$_FormFactorStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFirstWidgetZoomed: ${isFirstWidgetZoomed},
isSecondWidgetZoomed: ${isSecondWidgetZoomed},
isFirstWidgetVisible: ${isFirstWidgetVisible},
isSecondWidgetVisible: ${isSecondWidgetVisible}
    ''';
  }
}
