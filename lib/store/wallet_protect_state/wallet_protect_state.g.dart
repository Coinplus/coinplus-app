// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_protect_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WalletProtectState on _WalletProtectState, Store {
  late final _$isToggleSwitchedAtom =
      Atom(name: '_WalletProtectState.isToggleSwitched', context: context);

  @override
  bool get isToggleSwitched {
    _$isToggleSwitchedAtom.reportRead();
    return super.isToggleSwitched;
  }

  @override
  set isToggleSwitched(bool value) {
    _$isToggleSwitchedAtom.reportWrite(value, super.isToggleSwitched, () {
      super.isToggleSwitched = value;
    });
  }

  late final _$onToggleSwitchAsyncAction =
      AsyncAction('_WalletProtectState.onToggleSwitch', context: context);

  @override
  Future<void> onToggleSwitch() {
    return _$onToggleSwitchAsyncAction.run(() => super.onToggleSwitch());
  }

  @override
  String toString() {
    return '''
isToggleSwitched: ${isToggleSwitched}
    ''';
  }
}
