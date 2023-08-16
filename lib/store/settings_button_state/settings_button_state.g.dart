// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_button_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsState on _SettingsState, Store {
  late final _$currentIndexAtom =
      Atom(name: '_SettingsState.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  late final _$setCurrentIndexAsyncAction =
      AsyncAction('_SettingsState.setCurrentIndex', context: context);

  @override
  Future<void> setCurrentIndex(int index) {
    return _$setCurrentIndexAsyncAction.run(() => super.setCurrentIndex(index));
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
