import 'package:btc_address_validate_swan/btc_address_validate_swan.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../constants/currency.dart';
import '../../../extensions/num_extension.dart';
import '../../../models/bar_model/bar_model.dart';
import '../../../models/card_model/card_model.dart';
import '../../../models/coins_dto/coin_model.dart';
import '../../../store/accelerometer_store/accelerometer_store.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../store/history_page_store/history_page_store.dart';
import '../../../store/market_page_store/market_page_store.dart';
import '../../../store/transaction_store/transaction_store.dart';
import '../../../utils/data_utils.dart';

part 'send_to_state.g.dart';

class SendToState = SendToStateBase with _$SendToState;

abstract class SendToStateBase with Store {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  AccelerometerStore get _accelerometerStore => GetIt.I<AccelerometerStore>();

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  final transactionsStore = TransactionStore();

  @readonly
  int _selectedIndex = 0;
  @readonly
  String _outputAddress = '';
  @readonly
  num _amount = 0;
  @observable
  bool isUseMaxClicked = false;
  @readonly
  Currency _currency = Currency.USD;

  TextEditingController usdController = TextEditingController(text: '0');

  TextEditingController btcController = TextEditingController(text: '0');

  TextEditingController addressController = TextEditingController();

  @observable
  bool shouldValidateReceiverAddress = false;

  @observable
  bool nextButtonStatus = false;

  @computed
  bool get isValidReceiverAddress {
    if (!shouldValidateReceiverAddress) {
      return true;
    }
    try {
      validate(receiverWalletAddress);
      return true;
    } catch (e) {
      return false;
    }
  }

  @action
  void onAddressChanges(String val) {
    transactionsStore.setReceiverWalletAddress(val);
    shouldValidateReceiverAddress = val.length >= 27;
    validateReceiverAddress();
  }

  @action
  void validateReceiverAddress() {
    nextButtonStatus = isValidReceiverAddress;
  }

  @computed
  String get formattedAddress {
    return getSplitAddress(_outputAddress);
  }

  @computed
  String? get formattedSelectedCardAddress {
    return getSplitAddress(selectedCardAddress ?? '');
  }

  @computed
  String get formattedSelectedBarAddress {
    return getSplitAddress(selectedBarAddress ?? '');
  }

  @computed
  CoinResultModel? get btc => _marketPageStore.singleCoin?.result.first;

  @computed
  bool get isConvertedAmountVisible =>
      _amount.usdToSatoshi(btcCurrentPrice: btcPrice) != 0;

  @computed
  bool get hasCards => _balanceStore.cards.isNotEmpty;

  @computed
  bool get hasMoreThanOneWallets =>
      _balanceStore.cards.length + _balanceStore.bars.length > 1;

  @computed
  CardModel? get selectedCard {
    if (_balanceStore.cards.isNotEmpty) {
      return _balanceStore.cards[_historyPageStore.cardHistoryIndex];
    } else {
      return null;
    }
  }

  @computed
  BarModel? get selectedBar {
    if (_balanceStore.bars.isNotEmpty) {
      return _balanceStore.bars[_historyPageStore.barHistoryIndex];
    } else {
      return null;
    }
  }

  @computed
  bool get hasPerformedAction => _accelerometerStore.hasPerformedAction;

  @computed
  num get totalAmount =>
      transactionsStore.sortedUtxos.fold(0, (prev, utxo) => prev + utxo.value);

  @computed
  num get spendableBalance =>
      totalAmount.satoshiToUsd(btcCurrentPrice: btcPrice);

  @computed
  String get receiverWalletAddress => transactionsStore.receiverWalletAddress;

  @computed
  String? get selectedCardAddress => selectedCard?.address;

  @computed
  String? get selectedBarAddress => selectedBar?.address;

  @computed
  num get networkFee =>
      transactionsStore.txFee.satoshiToUsd(btcCurrentPrice: btcPrice);

  @computed
  num get sendAmountInUsd {
    return transactionsStore.sendAmount.satoshiToUsd(btcCurrentPrice: btcPrice);
  }

  @computed
  num get networkFeeInBtc => transactionsStore.txFee.satoshiToBtc();

  @computed
  bool get isCoverFee {
    if (transactionsStore.sendAmount == 0) {
      return false;
    }
    if (transactionsStore.sendAmount < totalAmount &&
        transactionsStore.sendAmount + transactionsStore.txFee > totalAmount) {}
    return transactionsStore.sendAmount < totalAmount &&
        transactionsStore.sendAmount + transactionsStore.txFee > totalAmount;
  }

  @computed
  num get usdToSatoshi => _amount.usdToSatoshi(btcCurrentPrice: btcPrice);

  @computed
  bool get isAmountToSmall {
    if (0 < usdToSatoshi && usdToSatoshi < 500) {}
    return 0 < usdToSatoshi && usdToSatoshi < 500;
  }

  @computed
  bool get isInputtedAmountBiggerTotal {
    if (!isUseMaxClicked) {
      if (transactionsStore.sendAmount == 0) {
        return false;
      }
    }
    if ((transactionsStore.sendAmount + transactionsStore.txFee) >
        totalAmount) {}
    return (transactionsStore.sendAmount + transactionsStore.txFee) >
        totalAmount;
  }

  @computed
  HistoryPageStore get historyPageStore => _historyPageStore;

  @computed
  AccelerometerStore get accelerometerStore => _accelerometerStore;

  @computed
  num get balanceAfter {
    final balanceAfterWithoutFee = spendableBalance - _amount;
    return balanceAfterWithoutFee == 0
        ? 0
        : (balanceAfterWithoutFee -
                    transactionsStore.txFee
                        .satoshiToUsd(btcCurrentPrice: btcPrice)) <
                0.3
            ? 0
            : (balanceAfterWithoutFee -
                transactionsStore.txFee
                    .satoshiToUsd(btcCurrentPrice: btcPrice));
  }

  @computed
  num get maxTotal {
    return _amount == spendableBalance
        ? spendableBalance
        : (_amount.usdToSatoshi(btcCurrentPrice: btcPrice) +
                transactionsStore.txFee)
            .satoshiToUsd(btcCurrentPrice: btcPrice);
  }

  @computed
  num? get btcPrice {
    if (btc?.price != null) {
      return (btc!.price * 100).round() / 100;
    }
    return null;
  }

  @action
  Future<void> onToggleCurrency() async {
    if (_currency == Currency.USD) {
      _currency = Currency.BTC;

      return;
    }
    if (_currency == Currency.BTC) {
      _currency = Currency.USD;

      return;
    }
  }

  @action
  void setSelectedIndex(int a) {
    _selectedIndex = a;
  }

  @action
  void setOutputAddress(String a) {
    _outputAddress = a;
  }

  @action
  void setAmount(String a) {
    final e = double.tryParse(a.replaceAll(',', ''));
    _amount = e ?? 0.0;
    final satoshiAmount = _amount.usdToSatoshi(btcCurrentPrice: btcPrice);
    transactionsStore.sendAmount = satoshiAmount.toInt();
  }

  @action
  void hideMaxValue() {
    isUseMaxClicked = false;
  }

  @action
  void handleUsdAmountSelection() {
    final selection = usdController.selection;
    final isAllTextSelected = selection.baseOffset == 0 &&
        selection.extentOffset == usdController.text.length;
    if (isAllTextSelected) {
      isUseMaxClicked = false;
    }
  }

  @action
  void handleBtcAmountSelection() {
    final selection = btcController.selection;
    final isAllTextSelected = selection.baseOffset == 0 &&
        selection.extentOffset == btcController.text.length;
    if (isAllTextSelected) {
      isUseMaxClicked = false;
    }
  }

  @action
  void handleNextButtonStatus() {
    final selection = addressController.selection;
    final isAllTextSelected = selection.baseOffset == 0 &&
        selection.extentOffset == addressController.text.length;
    if (isAllTextSelected) {
      nextButtonStatus = false;
    }
  }

  @action
  void clearAddressController() {
    nextButtonStatus = false;
    addressController.clear();
  }

  @action
  void clearAmountControllers() {
    usdController.text = '0';
    btcController.text = '0';
  }

  @action
  num onUseMax() {
    isUseMaxClicked = true;
    final res = transactionsStore.findMaxUtxo().toDouble();
    final usdAmount = res.satoshiToUsd(btcCurrentPrice: btcPrice);
    _amount = usdAmount.toDouble();
    return usdAmount;
  }

  void dispose() {
    transactionsStore.dispose();
  }
}
