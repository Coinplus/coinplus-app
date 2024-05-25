import 'dart:developer';

import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../http/repositories/broadcast_repo.dart';
import '../../http/repositories/mempool_repo.dart';
import '../../http/repositories/utxo_repo.dart';
import '../../models/bar_model/bar_model.dart';
import '../../models/card_model/card_model.dart';
import '../../models/coins_dto/coin_model.dart';
import '../../models/tx_fee/tx_fee_dto.dart';
import '../../models/utxo_model/utxo_model.dart';
import '../../utils/secure_storage_utils.dart';
import '../balance_store/balance_store.dart';
import '../history_page_store/history_page_store.dart';
import '../market_page_store/market_page_store.dart';

part 'transaction_store.g.dart';

class TransactionStore = _TransactionStore with _$TransactionStore;

abstract class _TransactionStore with Store {
  final _balanceStore = GetIt.I<BalanceStore>();
  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();
  final _marketPageStore = GetIt.I<MarketPageStore>();

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
  String get currentAddress {
    if (selectedCard >= 0 && selectedCard < cards.length) {
      return cards[selectedCard].address;
    } else if (selectedBar >= 0 && selectedBar < bars.length) {
      return bars[selectedBar].address;
    }
    return '';
  }

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
  String txHex = '';
  @observable
  bool isBroadcasted = false;
  @observable
  bool isTxInPending = false;
  @observable
  int selectedCard = -1;
  @observable
  int selectedBar = -1;

  @computed
  ObservableList<CardModel> get cards => _balanceStore.cards;

  @computed
  ObservableList<BarModel> get bars => _balanceStore.bars;

  @computed
  CoinResultModel? get btc => _marketPageStore.singleCoin?.result.first;

  @computed
  int get selectedCardIndex => _historyPageStore.cardHistoryIndex;

  @computed
  int get selectedBarIndex => _historyPageStore.barHistoryIndex;

  @action
  void onSelectCard(int index) {
    _historyPageStore
      ..setCardHistoryIndex(index)
      ..setCardSelectedAddress(
        cards[_historyPageStore.cardHistoryIndex].address,
      );
    selectedCard = index;
    selectedBar = -1;
  }

  @action
  void onSelectBar(int index) {
    _historyPageStore
      ..setBarHistoryIndex(index)
      ..setBarSelectedAddress(
        bars[_historyPageStore.barHistoryIndex].address,
      );
    selectedBar = index;
    selectedCard = -1;
  }

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

  @action
  Future<void> createTransaction({
    required List<({String hash, int amount, int vout})> inputs,
    required ({String address, int amount}) output,
    required int fee,
    required String refundAddress,
  }) async {
    final network = bitcoin;
    final privateKey = await secureStorage.read(key: refundAddress);
    if (privateKey == null) {
      return;
    }

    final decrypter = ECPair.fromWIF(
      privateKey,
      network: network,
    );
    final txb = TransactionBuilder(network: network)..setVersion(1);

    final totalAmount = inputs.fold(
      0,
      (previousValue, element) => previousValue + element.amount,
    );
    final refundAmount = totalAmount - output.amount - fee;

    final canRefund = refundAmount > 500;

    for (final input in inputs) {
      txb.addInput(input.hash, input.vout);
    }

    txb.addOutput(output.address, output.amount);
    if (canRefund) {
      txb.addOutput(refundAddress, refundAmount);
    }
    txb.sign(vin: 0, keyPair: decrypter);

    final tx = txb.build().toHex();

    txHex = tx;

    if (kDebugMode) {
      print(txHex);
    }
  }

  @action
  Future<String> broadcastTransaction() async {
    try {
      final res = await broadcastRepo.broadcastTransaction(hex: txHex);
      log(txHex.toString());
      return res;
    } catch (e) {
      throw Exception('Failed to broadcast transaction: $e');
    }
  }

  void dispose() {
    for (final d in _disposer) {
      d();
    }
    _disposer.clear();
  }
}
