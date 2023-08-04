import 'package:mobx/mobx.dart';

part 'address_and_balance_state.g.dart';

class AddressState = _AddressState with _$AddressState;

abstract class _AddressState with Store {
  @observable
  bool isAddressVisible = false;

  @action
  void addressVisibility() {
    isAddressVisible = true;
  }
}
