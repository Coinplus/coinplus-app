// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_code_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PinLockStore on _PinLockStore, Store {
  late final _$valueAtom = Atom(name: '_PinLockStore.value', context: context);

  @override
  String get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(String value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$isEnteredCorrectAtom = Atom(name: '_PinLockStore.isEnteredCorrect', context: context);

  @override
  bool? get isEnteredCorrect {
    _$isEnteredCorrectAtom.reportRead();
    return super.isEnteredCorrect;
  }

  @override
  set isEnteredCorrect(bool? value) {
    _$isEnteredCorrectAtom.reportWrite(value, super.isEnteredCorrect, () {
      super.isEnteredCorrect = value;
    });
  }

  late final _$_PinLockStoreActionController = ActionController(name: '_PinLockStore', context: context);

  @override
  void onNumberTap(int number, int pinLength, int correctPin) {
    final _$actionInfo = _$_PinLockStoreActionController.startAction(name: '_PinLockStore.onNumberTap');
    try {
      return super.onNumberTap(number, pinLength, correctPin);
    } finally {
      _$_PinLockStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onDelete() {
    final _$actionInfo = _$_PinLockStoreActionController.startAction(name: '_PinLockStore.onDelete');
    try {
      return super.onDelete();
    } finally {
      _$_PinLockStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearValue() {
    final _$actionInfo = _$_PinLockStoreActionController.startAction(name: '_PinLockStore.clearValue');
    try {
      return super.clearValue();
    } finally {
      _$_PinLockStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
isEnteredCorrect: ${isEnteredCorrect}
    ''';
  }
}
