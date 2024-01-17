import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../constants/card_type.dart';
import '../../utils/compute_private_key.dart';
import '../balance_store/balance_store.dart';

part 'address_and_balance_state.g.dart';

class AddressState = _AddressState with _$AddressState;

BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

abstract class _AddressState with Store {
  final CardType addressType;

  _AddressState(this.addressType) {
    reaction(
      (p0) => btcAddress,
      (p0) => validateBTCAddress(),
    );
  }

  @observable
  String btcAddress = '';

  @observable
  bool hasError = false;

  @observable
  bool isAddressValid = false;

  @observable
  bool isAddressVisible = false;

  Future<void> validateBTCAddress() async {
    if (btcAddress.length < 26) {
      setValidationFailed();
      return;
    }

    final validationRes = isValidPublicAddress(btcAddress);
    if (!validationRes) {
      setValidationFailed();
      return;
    }
    setValidationPassed();

    addressType == CardType.CARD
        ? await _balanceStore.getSelectedCard(btcAddress)
        : await _balanceStore.getSelectedBar(btcAddress);

    final isAddressExist =
        addressType == CardType.CARD ? _balanceStore.selectedCard != null : _balanceStore.selectedBar != null;

    if (isAddressExist) {
      setValidationPassed();
      return;
    }

    setValidationFailed();
  }

  @action
  void setValidationPassed() {
    hasError = false;
    isAddressValid = true;
  }

  @action
  void setValidationFailed() {
    hasError = true;
    isAddressValid = false;
  }

  @action
  void addressVisibility() {
    isAddressVisible = true;
  }
}
