// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_button_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SettingsState on _SettingsState, Store {
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

  late final _$isReorderingStartAtom =
      Atom(name: '_SettingsState.isReorderingStart', context: context);

  @override
  bool get isReorderingStart {
    _$isReorderingStartAtom.reportRead();
    return super.isReorderingStart;
  }

  @override
  set isReorderingStart(bool value) {
    _$isReorderingStartAtom.reportWrite(value, super.isReorderingStart, () {
      super.isReorderingStart = value;
    });
  }

  late final _$copyAddressAsyncAction =
      AsyncAction('_SettingsState.copyAddress', context: context);

  @override
  Future<void> copyAddress() {
    return _$copyAddressAsyncAction.run(() => super.copyAddress());
  }

  late final _$_SettingsStateActionController =
      ActionController(name: '_SettingsState', context: context);

  @override
  void startReorder() {
    final _$actionInfo = _$_SettingsStateActionController.startAction(
        name: '_SettingsState.startReorder');
    try {
      return super.startReorder();
    } finally {
      _$_SettingsStateActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isAddressCopied: ${isAddressCopied},
isReorderingStart: ${isReorderingStart}
    ''';
  }
}
