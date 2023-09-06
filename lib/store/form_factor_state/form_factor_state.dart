import 'package:mobx/mobx.dart';

part 'form_factor_state.g.dart';

class FormFactorState = _FormFactorState with _$FormFactorState;

abstract class _FormFactorState with Store {
  @observable
  bool isFirstWidgetZoomed = false;
  @observable
  bool isSecondWidgetZoomed = false;
  @observable
  bool isFirstWidgetVisible = true;
  @observable
  bool isSecondWidgetVisible = true;
  @observable
  bool isFirstWidget = true;

  @action
  void cardSelection() {
    isFirstWidgetZoomed = true;
    isSecondWidgetVisible = !isFirstWidgetZoomed;
  }

  void barSelection() {
    isSecondWidgetZoomed = true;
    isFirstWidgetVisible = !isSecondWidgetZoomed;
  }

  @action
  void toggleWidget() {
    isFirstWidget = !isFirstWidget;
  }
}
