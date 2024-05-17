import 'dart:developer';

import 'package:btc_address_validate_swan/btc_address_validate_swan.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../http/repositories/mempool_repo.dart';
import '../../http/repositories/utxo_repo.dart';
import '../../models/tx_fee/tx_fee_dto.dart';
import '../../models/utxo_model/utxo_model.dart';
import '../../utils/send_from_wallet.dart';
import '../balance_store/balance_store.dart';
import '../history_page_store/history_page_store.dart';

part 'transaction_store.g.dart';

class TransactionStore = _TransactionStore with _$TransactionStore;

abstract class _TransactionStore with Store {
  final _balanceStore = GetIt.I<BalanceStore>();
  final _historyPageStore = GetIt.I<HistoryPageStore>();
  final _disposer = <ReactionDisposer>[];

  _TransactionStore() {
    _init();
  }

  void _init() {
    getUtxosData();
    _disposer.add(
      reaction(
        (p0) => currentAddress,
        (p0) => getUtxosData(),
      ),
    );
  }

  @computed
  String get currentAddress =>
      _balanceStore.cards[_historyPageStore.cardHistoryIndex].address;

  @action
  void createTransactionHex() {
    final inputs = usedUtxos
        .map(
          (e) => (
            hash: e.txHashBigEndian,
            amount: e.value,
            vout: e.txOutputN,
          ),
        )
        .toList();
    final output = (address: receiverWalletAddress, amount: sendAmount);
    createTransaction(
      inputs: inputs,
      output: output,
      refundAddress: currentAddress,
      fee: txFee,
    );
  }

  @observable
  Status? utxoData;
  @observable
  int sendAmount = 0;
  @observable
  int totalValue = 0;
  @observable
  ObservableList<UtxoModel> usedUtxos = <UtxoModel>[].asObservable();
  @observable
  int txFee = 0;
  @observable
  TxFeeDto txFeeRate = const TxFeeDto();
  @observable
  String receiverWalletAddress = '';

  @observable
  ObservableList<UtxoModel> sortedUtxos = <UtxoModel>[].asObservable();

  @computed
  int get usedUtxosCount => usedUtxos.length;

  @computed
  int get outputByte {
    if (receiverWalletAddress.startsWith('1')) {
      return 34;
    } else if (receiverWalletAddress.startsWith('3')) {
      return 32;
    } else if (receiverWalletAddress.startsWith('bc1p')) {
      return 43;
    } else if (receiverWalletAddress.startsWith('bc1')) {
      return 31;
    }

    return 0;
  }

  @computed
  bool get isValidReceiverAddress {
    try {
      validate(receiverWalletAddress);
      return true;
    } catch (e) {
      return false;
    }
  }

  @action
  void setSortedUtxos(List<UtxoModel> newList) {
    sortedUtxos = newList.asObservable();
  }

  @action
  void setReceiverWalletAddress(String walletAddress) {
    if (walletAddress != '') {
      receiverWalletAddress = walletAddress.replaceAll(' ', '');
    }
  }

  @action
  void setTotalValue(int newValue) {
    totalValue = newValue;
  }

  Future<void> getUtxosData() async {
    final currentAddress =
        _balanceStore.cards[_historyPageStore.cardHistoryIndex].address;
    utxoData = await utxoRepo.getUtxoList(address: currentAddress);
    final sortedUtxos = (utxoData?.unspentOutputs.toList() ?? <UtxoModel>[])
      ..sort((a, b) => a.value.compareTo(b.value));
    await _getRecommendedFee();
    final totalValue = sortedUtxos.fold(0, (prev, utxo) => prev + utxo.value);
    setSortedUtxos(sortedUtxos);
    setTotalValue(totalValue);
  }

  Future<void> _getRecommendedFee() async {
    try {
      txFeeRate = await mempoolRepo.getFees();
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  @action
  Future<void> findOptimalUtxo() async {
    if (sendAmount > totalValue) {
      if (kDebugMode) {
        print('Not enough funds');
      }
    } else {
      final TxFeeDto(:fastestFee) = txFeeRate;
      final initialTxSize = (1 * 148) + (0 * 34) + (1 * outputByte) + 10;
      final initialFee = initialTxSize * fastestFee;
      log('Initial Fee: $initialFee');
      final rangeStart = sendAmount + initialFee;
      final rangeEnd = sendAmount + initialFee + 500;
      final mostOptimalSingleUtxo = sortedUtxos.firstWhereOrNull(
        (utxo) => utxo.value >= rangeStart && utxo.value <= rangeEnd,
      );
      if (mostOptimalSingleUtxo != null) {
        txFee = initialFee;
        usedUtxos = [mostOptimalSingleUtxo].asObservable();
        if (kDebugMode) {
          print(
            'Smallest UTXO (1 input, 1 output, without change): ${mostOptimalSingleUtxo.txHash}',
          );
        }
        return;
      } //Pass

      for (final utxo in sortedUtxos) {
        final txSize = (1 * 148) + (1 * 34) + (1 * outputByte) + 10;
        final newFee = txSize * fastestFee;
        usedUtxos = [utxo].asObservable();
        txFee = newFee;
        if (utxo.value >= sendAmount + newFee) {
          if (kDebugMode) {
            print(
              'Smallest UTXO (1 input, 2 outputs, with change): ${utxo.txHash}',
            );
          }
          return;
        }
      } //Pass
      combineUtxos();
    }
  }

  @action
  void combineUtxos() {
    usedUtxos.clear();
    final selectedUtxos = <UtxoModel>[];
    var inputQuantity = 2;
    if (sendAmount > totalValue) {
      if (kDebugMode) {
        print('Not enough funds');
      }
      return;
    }
    while (true) {
      final fee = ((inputQuantity * 148) + (1 * 34) + (1 * outputByte) + 10) *
          txFeeRate.fastestFee;
      for (var i = 0; i < sortedUtxos.length - (inputQuantity - 1); i++) {
        var totalValue = sortedUtxos[i].value;
        final combination = [sortedUtxos[i]];

        for (var j = i + 1; j < i + inputQuantity; j++) {
          totalValue += sortedUtxos[j].value;
          combination.add(sortedUtxos[j]);
        }

        if (totalValue >= sendAmount + fee) {
          if (kDebugMode) {
            print(
              'Combined UTXOs ($inputQuantity inputs): ${combination.map((utxo) => utxo.txHash).join(', ')}',
            );
            txFee = fee;
          }

          selectedUtxos.addAll(combination);
          break;
        }
      }
      final foundCombination = selectedUtxos.isNotEmpty;

      if (foundCombination) {
        break;
      }
      selectedUtxos.clear();
      inputQuantity++;
      final newFeeWithChange =
          ((inputQuantity * 148) + (1 * 34) + (1 * outputByte) + 10) *
              txFeeRate.fastestFee;
      if (sendAmount + newFeeWithChange > totalValue) {
        findMaxUtxo();
        selectedUtxos.addAll(sortedUtxos);
        break;
      }
    }
    usedUtxos = selectedUtxos.asObservable();
  }

  @action
  int findMaxUtxo() {
    final newTxSizeWithoutChange =
        (sortedUtxos.length * 148) + (1 * outputByte) + 10;
    final newFeeWithoutChange = newTxSizeWithoutChange * txFeeRate.fastestFee;
    txFee = newFeeWithoutChange;
    final utxoHashes = sortedUtxos.map((utxo) => utxo.txHash).toList();
    if (kDebugMode) {
      print('Max UTXOs Without Change :$utxoHashes');
    }
    return totalValue;
  }

  void dispose() {
    for (final d in _disposer) {
      d();
    }
    _disposer.clear();
  }
}
