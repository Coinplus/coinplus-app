import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
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

  @action
  Future<void> sendEmail() async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const serviceId = 'service_o331bdj';
    const templateId = 'template_pzvj3p4';
    const userId = 'PYCIF3IrwX2TJ_KxP';
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'from_name': nameController.text,
          'message': messageController.text,
          'user_email': mailController.text,
        },
      }),
    );
    if (response.statusCode == 200) {
      // Handle success
    } else {
      // Handle failure
    }
  }
}
