import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';

part 'address_and_balance_state.g.dart';

class AddressState = _AddressState with _$AddressState;

abstract class _AddressState with Store {
  @observable
  TextEditingController btcAddressController = TextEditingController();

  @action
  Future<void> setBTCAddress(String address) async {
    btcAddressController.text = address;
  }

  @observable
  bool isAddressVisible = false;

  @action
  void addressVisibility() {
    isAddressVisible = true;
  }
}
