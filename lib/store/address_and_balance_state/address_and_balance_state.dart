import 'dart:async';

import 'package:btc_address_validate_swan/btc_address_validate_swan.dart';
import 'package:ethereum_addresses/ethereum_addresses.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../constants/card_type.dart';
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
    reaction(
      (p0) => ethAddress,
      (p0) => validateETHAddress(),
    );
  }

  @observable
  String btcAddress = '';

  @observable
  String ethAddress = '';

  @observable
  bool hasError = false;

  @observable
  bool isAddressValid = false;

  @observable
  bool isAddressVisible = false;

  @computed
  bool get isValidReceiverAddress {
    try {
      validate(btcAddress);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> validateBTCAddress() async {
    try {
      validate(btcAddress);
    } catch (e) {
      setValidationFailed();
      return;
    }

    setValidationPassed();

    if (addressType == CardType.CARD) {
      await _balanceStore.getSelectedCard(btcAddress);
      await _balanceStore.getSelectedBackupCard(btcAddress);
    } else {
      await _balanceStore.getSelectedBar(btcAddress);
    }

    final isAddressExist =
    addressType == CardType.CARD ? _balanceStore.selectedCard != null : _balanceStore.selectedBar != null;

    if (isAddressExist) {
      setValidationPassed();
    } else {
      setValidationFailed();
    }
  }

  Future<void> validateETHAddress() async {
    if (ethAddress.length < 38) {
      setValidationFailed();
      return;
    }

    final validationRes = isValidEthereumAddress(ethAddress);
    if (!validationRes) {
      setValidationFailed();
      return;
    }
    setValidationPassed();

    addressType == CardType.CARD
        ? await _balanceStore.getSelectedEthCard(ethAddress)
        : await _balanceStore.getSelectedEthCard(ethAddress);

    final isAddressExist =
        addressType == CardType.CARD ? _balanceStore.selectedEthCard != null : _balanceStore.selectedEthCard != null;

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
