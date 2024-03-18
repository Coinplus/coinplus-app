// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accelerometer_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AccelerometerStore on _AccelerometerStore, Store {
  late final _$hasPerformedActionAtom = Atom(name: '_AccelerometerStore.hasPerformedAction', context: context);

  @override
  bool get hasPerformedAction {
    _$hasPerformedActionAtom.reportRead();
    return super.hasPerformedAction;
  }

  @override
  set hasPerformedAction(bool value) {
    _$hasPerformedActionAtom.reportWrite(value, super.hasPerformedAction, () {
      super.hasPerformedAction = value;
    });
  }

  late final _$loadActionStateAsyncAction = AsyncAction('_AccelerometerStore.loadActionState', context: context);

  @override
  Future<void> loadActionState() {
    return _$loadActionStateAsyncAction.run(() => super.loadActionState());
  }

  late final _$saveActionStateAsyncAction = AsyncAction('_AccelerometerStore.saveActionState', context: context);

  @override
  Future<void> saveActionState() {
    return _$saveActionStateAsyncAction.run(() => super.saveActionState());
  }

  late final _$disableAccelerometerFunctionAsyncAction =
      AsyncAction('_AccelerometerStore.disableAccelerometerFunction', context: context);

  @override
  Future<void> disableAccelerometerFunction() {
    return _$disableAccelerometerFunctionAsyncAction.run(() => super.disableAccelerometerFunction());
  }

  @override
  String toString() {
    return '''
hasPerformedAction: ${hasPerformedAction}
    ''';
  }
}
