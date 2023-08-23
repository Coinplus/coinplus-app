// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nav_bar_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NavBarState on NavBarStore, Store {
  late final _$currentIndexAtom =
      Atom(name: 'NavBarStore.currentIndex', context: context);

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

  late final _$updateIndexAsyncAction =
      AsyncAction('NavBarStore.updateIndex', context: context);

  @override
  Future<void> updateIndex(int index) {
    return _$updateIndexAsyncAction.run(() => super.updateIndex(index));
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
