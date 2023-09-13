// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bar_setting_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BarSettingState on _BarSettingState, Store {
  late final _$selectedColorAtom =
      Atom(name: '_BarSettingState.selectedColor', context: context);

  @override
  BarColor get selectedColor {
    _$selectedColorAtom.reportRead();
    return super.selectedColor;
  }

  @override
  set selectedColor(BarColor value) {
    _$selectedColorAtom.reportWrite(value, super.selectedColor, () {
      super.selectedColor = value;
    });
  }

  late final _$changeColorAsyncAction =
      AsyncAction('_BarSettingState.changeColor', context: context);

  @override
  Future<void> changeColor(BarColor color) {
    return _$changeColorAsyncAction.run(() => super.changeColor(color));
  }

  @override
  String toString() {
    return '''
selectedColor: ${selectedColor}
    ''';
  }
}
