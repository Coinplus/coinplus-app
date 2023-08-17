// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_button_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsState on _SettingsState, Store {
  late final _$cardCurrentIndexAtom =
      Atom(name: '_SettingsState.cardCurrentIndex', context: context);

  @override
  int get cardCurrentIndex {
    _$cardCurrentIndexAtom.reportRead();
    return super.cardCurrentIndex;
  }

  @override
  set cardCurrentIndex(int value) {
    _$cardCurrentIndexAtom.reportWrite(value, super.cardCurrentIndex, () {
      super.cardCurrentIndex = value;
    });
  }

  late final _$barCurrentIndexAtom =
      Atom(name: '_SettingsState.barCurrentIndex', context: context);

  @override
  int get barCurrentIndex {
    _$barCurrentIndexAtom.reportRead();
    return super.barCurrentIndex;
  }

  @override
  set barCurrentIndex(int value) {
    _$barCurrentIndexAtom.reportWrite(value, super.barCurrentIndex, () {
      super.barCurrentIndex = value;
    });
  }

  late final _$setCardCurrentIndexAsyncAction =
      AsyncAction('_SettingsState.setCardCurrentIndex', context: context);

  @override
  Future<void> setCardCurrentIndex(int index) {
    return _$setCardCurrentIndexAsyncAction
        .run(() => super.setCardCurrentIndex(index));
  }

  late final _$setBarCurrentIndexAsyncAction =
      AsyncAction('_SettingsState.setBarCurrentIndex', context: context);

  @override
  Future<void> setBarCurrentIndex(int index) {
    return _$setBarCurrentIndexAsyncAction
        .run(() => super.setBarCurrentIndex(index));
  }

  @override
  String toString() {
    return '''
cardCurrentIndex: ${cardCurrentIndex},
barCurrentIndex: ${barCurrentIndex}
    ''';
  }
}
