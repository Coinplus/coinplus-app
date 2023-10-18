import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'contact_us_state.g.dart';

class ContactUsStore = _ContactUsStore with _$ContactUsStore;

abstract class _ContactUsStore with Store {
  late TextEditingController nameController = TextEditingController();
  late TextEditingController mailController = TextEditingController();
  late TextEditingController messageController = TextEditingController();

  @observable
  bool isEmailValid = true;

  @observable
  bool isButtonEnabled = false;

  @action
  bool validateEmail(String email) {
    final emailRegExp = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return isEmailValid = email.isEmpty || emailRegExp.hasMatch(email);
  }

  @action
  bool isEmpty() {
    return isButtonEnabled = nameController.text.isNotEmpty &&
        mailController.text.isNotEmpty &&
        messageController.text.isNotEmpty;
  }
}
