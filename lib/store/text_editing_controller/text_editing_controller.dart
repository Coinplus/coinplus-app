import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'text_editing_controller.g.dart';

class TextFieldStore = _TextFieldStoreBase with _$TextFieldStore;

abstract class _TextFieldStoreBase with Store {
  @readonly
  TextEditingController _keyOneController = TextEditingController();
  @readonly
  TextEditingController _keyTwoController = TextEditingController();
  @readonly
  String _keyOne = '';
  @readonly
  String _keyTwo = '';
  @observable
  bool fieldOneSelected = true;

  @observable
  bool fieldTwoSelected = false;

  @computed
  bool get isItemOneSelected => fieldOneSelected && !fieldTwoSelected;

  @computed
  bool get isItemTwoSelected => !fieldOneSelected && fieldTwoSelected;

  @action
  Future<void> setTextEditingController(
    TextEditingController controller,
  ) async {
    _keyOneController = controller;
    _keyTwoController = controller;
  }

  @action
  Future<void> setKeyOne() async {
    _keyOne = _keyOneController.text;
  }

  @action
  Future<void> setKeyTwo() async {
    _keyTwo = _keyTwoController.text;
  }

  @action
  void selectItemOne() {
    fieldOneSelected = true;
    fieldTwoSelected = false;
  }

  @action
  void selectItemTwo() {
    fieldOneSelected = false;
    fieldTwoSelected = true;
  }
}
