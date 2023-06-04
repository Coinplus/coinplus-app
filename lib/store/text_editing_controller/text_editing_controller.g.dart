// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_editing_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TextFieldStore on _TextFieldStoreBase, Store {
  Computed<bool>? _$isItemOneSelectedComputed;

  @override
  bool get isItemOneSelected => (_$isItemOneSelectedComputed ??= Computed<bool>(
          () => super.isItemOneSelected,
          name: '_TextFieldStoreBase.isItemOneSelected'))
      .value;
  Computed<bool>? _$isItemTwoSelectedComputed;

  @override
  bool get isItemTwoSelected => (_$isItemTwoSelectedComputed ??= Computed<bool>(
          () => super.isItemTwoSelected,
          name: '_TextFieldStoreBase.isItemTwoSelected'))
      .value;

  late final _$_keyOneControllerAtom =
      Atom(name: '_TextFieldStoreBase._keyOneController', context: context);

  TextEditingController get keyOneController {
    _$_keyOneControllerAtom.reportRead();
    return super._keyOneController;
  }

  @override
  TextEditingController get _keyOneController => keyOneController;

  @override
  set _keyOneController(TextEditingController value) {
    _$_keyOneControllerAtom.reportWrite(value, super._keyOneController, () {
      super._keyOneController = value;
    });
  }

  late final _$_keyTwoControllerAtom =
      Atom(name: '_TextFieldStoreBase._keyTwoController', context: context);

  TextEditingController get keyTwoController {
    _$_keyTwoControllerAtom.reportRead();
    return super._keyTwoController;
  }

  @override
  TextEditingController get _keyTwoController => keyTwoController;

  @override
  set _keyTwoController(TextEditingController value) {
    _$_keyTwoControllerAtom.reportWrite(value, super._keyTwoController, () {
      super._keyTwoController = value;
    });
  }

  late final _$_keyOneAtom =
      Atom(name: '_TextFieldStoreBase._keyOne', context: context);

  String get keyOne {
    _$_keyOneAtom.reportRead();
    return super._keyOne;
  }

  @override
  String get _keyOne => keyOne;

  @override
  set _keyOne(String value) {
    _$_keyOneAtom.reportWrite(value, super._keyOne, () {
      super._keyOne = value;
    });
  }

  late final _$_keyTwoAtom =
      Atom(name: '_TextFieldStoreBase._keyTwo', context: context);

  String get keyTwo {
    _$_keyTwoAtom.reportRead();
    return super._keyTwo;
  }

  @override
  String get _keyTwo => keyTwo;

  @override
  set _keyTwo(String value) {
    _$_keyTwoAtom.reportWrite(value, super._keyTwo, () {
      super._keyTwo = value;
    });
  }

  late final _$fieldOneSelectedAtom =
      Atom(name: '_TextFieldStoreBase.fieldOneSelected', context: context);

  @override
  bool get fieldOneSelected {
    _$fieldOneSelectedAtom.reportRead();
    return super.fieldOneSelected;
  }

  @override
  set fieldOneSelected(bool value) {
    _$fieldOneSelectedAtom.reportWrite(value, super.fieldOneSelected, () {
      super.fieldOneSelected = value;
    });
  }

  late final _$fieldTwoSelectedAtom =
      Atom(name: '_TextFieldStoreBase.fieldTwoSelected', context: context);

  @override
  bool get fieldTwoSelected {
    _$fieldTwoSelectedAtom.reportRead();
    return super.fieldTwoSelected;
  }

  @override
  set fieldTwoSelected(bool value) {
    _$fieldTwoSelectedAtom.reportWrite(value, super.fieldTwoSelected, () {
      super.fieldTwoSelected = value;
    });
  }

  late final _$setTextEditingControllerAsyncAction = AsyncAction(
      '_TextFieldStoreBase.setTextEditingController',
      context: context);

  @override
  Future<void> setTextEditingController(TextEditingController controller) {
    return _$setTextEditingControllerAsyncAction
        .run(() => super.setTextEditingController(controller));
  }

  late final _$setKeyOneAsyncAction =
      AsyncAction('_TextFieldStoreBase.setKeyOne', context: context);

  @override
  Future<void> setKeyOne() {
    return _$setKeyOneAsyncAction.run(() => super.setKeyOne());
  }

  late final _$setKeyTwoAsyncAction =
      AsyncAction('_TextFieldStoreBase.setKeyTwo', context: context);

  @override
  Future<void> setKeyTwo() {
    return _$setKeyTwoAsyncAction.run(() => super.setKeyTwo());
  }

  late final _$_TextFieldStoreBaseActionController =
      ActionController(name: '_TextFieldStoreBase', context: context);

  @override
  void selectItemOne() {
    final _$actionInfo = _$_TextFieldStoreBaseActionController.startAction(
        name: '_TextFieldStoreBase.selectItemOne');
    try {
      return super.selectItemOne();
    } finally {
      _$_TextFieldStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectItemTwo() {
    final _$actionInfo = _$_TextFieldStoreBaseActionController.startAction(
        name: '_TextFieldStoreBase.selectItemTwo');
    try {
      return super.selectItemTwo();
    } finally {
      _$_TextFieldStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
fieldOneSelected: ${fieldOneSelected},
fieldTwoSelected: ${fieldTwoSelected},
isItemOneSelected: ${isItemOneSelected},
isItemTwoSelected: ${isItemTwoSelected}
    ''';
  }
}
