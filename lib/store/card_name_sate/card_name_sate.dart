import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'card_name_sate.g.dart';

class CardNameState = _CardNameState with _$CardNameState;

abstract class _CardNameState with Store {
  late TextEditingController nameController = TextEditingController();

  @observable
  bool isButtonEnabled = false;

  @action
  bool isEmpty() {
    return isButtonEnabled = nameController.text.isNotEmpty;
  }
}
