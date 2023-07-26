import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'text_filed_zoom_state.g.dart';

class TextFieldState = _TextFieldState with _$TextFieldState;

abstract class _TextFieldState with Store {
  @observable
  bool isFocused = false;
  @observable
  FocusNode focusNode = FocusNode();

  @action
  void focusField() {
    isFocused = focusNode.hasFocus;
  }
}
