// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_color_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CardColorState on _CardColorState, Store {
  late final _$currentIndexAtom =
      Atom(name: '_CardColorState.currentIndex', context: context);

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

  late final _$changeIndexAsyncAction =
      AsyncAction('_CardColorState.changeIndex', context: context);

  @override
  Future<void> changeIndex(int index) {
    return _$changeIndexAsyncAction.run(() => super.changeIndex(index));
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
