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

  late final _$cardAndBarTabBarIndexAtom =
      Atom(name: '_SettingsState.cardAndBarTabBarIndex', context: context);

  @override
  int get cardAndBarTabBarIndex {
    _$cardAndBarTabBarIndexAtom.reportRead();
    return super.cardAndBarTabBarIndex;
  }

  @override
  set cardAndBarTabBarIndex(int value) {
    _$cardAndBarTabBarIndexAtom.reportWrite(value, super.cardAndBarTabBarIndex,
        () {
      super.cardAndBarTabBarIndex = value;
    });
  }

  late final _$isAddressCopiedAtom =
      Atom(name: '_SettingsState.isAddressCopied', context: context);

  @override
  bool get isAddressCopied {
    _$isAddressCopiedAtom.reportRead();
    return super.isAddressCopied;
  }

  @override
  set isAddressCopied(bool value) {
    _$isAddressCopiedAtom.reportWrite(value, super.isAddressCopied, () {
      super.isAddressCopied = value;
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

  late final _$copyAddressAsyncAction =
      AsyncAction('_SettingsState.copyAddress', context: context);

  @override
  Future<void> copyAddress() {
    return _$copyAddressAsyncAction.run(() => super.copyAddress());
  }

  late final _$changeTabBarIndexAsyncAction =
      AsyncAction('_SettingsState.changeTabBarIndex', context: context);

  @override
  Future<void> changeTabBarIndex(int index) {
    return _$changeTabBarIndexAsyncAction
        .run(() => super.changeTabBarIndex(index));
  }

  @override
  String toString() {
    return '''
cardCurrentIndex: ${cardCurrentIndex},
barCurrentIndex: ${barCurrentIndex},
cardAndBarTabBarIndex: ${cardAndBarTabBarIndex},
isAddressCopied: ${isAddressCopied}
    ''';
  }
}
