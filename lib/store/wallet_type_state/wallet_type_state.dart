import 'package:mobx/mobx.dart';

part 'wallet_type_state.g.dart';

class WalletTypeState = _WalletTypeState with _$WalletTypeState;

abstract class _WalletTypeState with Store {
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
}
