// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TransactionStore on _TransactionStore, Store {
  Computed<String>? _$currentAddressComputed;

  @override
  String get currentAddress =>
      (_$currentAddressComputed ??= Computed<String>(() => super.currentAddress,
              name: '_TransactionStore.currentAddress'))
          .value;
  Computed<int>? _$usedUtxosCountComputed;

  @override
  int get usedUtxosCount =>
      (_$usedUtxosCountComputed ??= Computed<int>(() => super.usedUtxosCount,
              name: '_TransactionStore.usedUtxosCount'))
          .value;
  Computed<int>? _$outputByteComputed;

  @override
  int get outputByte =>
      (_$outputByteComputed ??= Computed<int>(() => super.outputByte,
              name: '_TransactionStore.outputByte'))
          .value;
  Computed<bool>? _$isValidReceiverAddressComputed;

  @override
  bool get isValidReceiverAddress => (_$isValidReceiverAddressComputed ??=
          Computed<bool>(() => super.isValidReceiverAddress,
              name: '_TransactionStore.isValidReceiverAddress'))
      .value;

  late final _$utxoDataAtom =
      Atom(name: '_TransactionStore.utxoData', context: context);

  @override
  Status? get utxoData {
    _$utxoDataAtom.reportRead();
    return super.utxoData;
  }

  @override
  set utxoData(Status? value) {
    _$utxoDataAtom.reportWrite(value, super.utxoData, () {
      super.utxoData = value;
    });
  }

  late final _$sendAmountAtom =
      Atom(name: '_TransactionStore.sendAmount', context: context);

  @override
  int get sendAmount {
    _$sendAmountAtom.reportRead();
    return super.sendAmount;
  }

  @override
  set sendAmount(int value) {
    _$sendAmountAtom.reportWrite(value, super.sendAmount, () {
      super.sendAmount = value;
    });
  }

  late final _$totalValueAtom =
      Atom(name: '_TransactionStore.totalValue', context: context);

  @override
  int get totalValue {
    _$totalValueAtom.reportRead();
    return super.totalValue;
  }

  @override
  set totalValue(int value) {
    _$totalValueAtom.reportWrite(value, super.totalValue, () {
      super.totalValue = value;
    });
  }

  late final _$usedUtxosAtom =
      Atom(name: '_TransactionStore.usedUtxos', context: context);

  @override
  ObservableList<UtxoModel> get usedUtxos {
    _$usedUtxosAtom.reportRead();
    return super.usedUtxos;
  }

  @override
  set usedUtxos(ObservableList<UtxoModel> value) {
    _$usedUtxosAtom.reportWrite(value, super.usedUtxos, () {
      super.usedUtxos = value;
    });
  }

  late final _$txFeeAtom =
      Atom(name: '_TransactionStore.txFee', context: context);

  @override
  int get txFee {
    _$txFeeAtom.reportRead();
    return super.txFee;
  }

  @override
  set txFee(int value) {
    _$txFeeAtom.reportWrite(value, super.txFee, () {
      super.txFee = value;
    });
  }

  late final _$txFeeRateAtom =
      Atom(name: '_TransactionStore.txFeeRate', context: context);

  @override
  TxFeeDto get txFeeRate {
    _$txFeeRateAtom.reportRead();
    return super.txFeeRate;
  }

  @override
  set txFeeRate(TxFeeDto value) {
    _$txFeeRateAtom.reportWrite(value, super.txFeeRate, () {
      super.txFeeRate = value;
    });
  }

  late final _$receiverWalletAddressAtom =
      Atom(name: '_TransactionStore.receiverWalletAddress', context: context);

  @override
  String get receiverWalletAddress {
    _$receiverWalletAddressAtom.reportRead();
    return super.receiverWalletAddress;
  }

  @override
  set receiverWalletAddress(String value) {
    _$receiverWalletAddressAtom.reportWrite(value, super.receiverWalletAddress,
        () {
      super.receiverWalletAddress = value;
    });
  }

  late final _$sortedUtxosAtom =
      Atom(name: '_TransactionStore.sortedUtxos', context: context);

  @override
  ObservableList<UtxoModel> get sortedUtxos {
    _$sortedUtxosAtom.reportRead();
    return super.sortedUtxos;
  }

  @override
  set sortedUtxos(ObservableList<UtxoModel> value) {
    _$sortedUtxosAtom.reportWrite(value, super.sortedUtxos, () {
      super.sortedUtxos = value;
    });
  }

  late final _$findOptimalUtxoAsyncAction =
      AsyncAction('_TransactionStore.findOptimalUtxo', context: context);

  @override
  Future<void> findOptimalUtxo() {
    return _$findOptimalUtxoAsyncAction.run(() => super.findOptimalUtxo());
  }

  late final _$_TransactionStoreActionController =
      ActionController(name: '_TransactionStore', context: context);

  @override
  void createTransactionHex() {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.createTransactionHex');
    try {
      return super.createTransactionHex();
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSortedUtxos(List<UtxoModel> newList) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.setSortedUtxos');
    try {
      return super.setSortedUtxos(newList);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReceiverWalletAddress(String walletAddress) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.setReceiverWalletAddress');
    try {
      return super.setReceiverWalletAddress(walletAddress);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTotalValue(int newValue) {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.setTotalValue');
    try {
      return super.setTotalValue(newValue);
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void combineUtxos() {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.combineUtxos');
    try {
      return super.combineUtxos();
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  int findMaxUtxo() {
    final _$actionInfo = _$_TransactionStoreActionController.startAction(
        name: '_TransactionStore.findMaxUtxo');
    try {
      return super.findMaxUtxo();
    } finally {
      _$_TransactionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
utxoData: ${utxoData},
sendAmount: ${sendAmount},
totalValue: ${totalValue},
usedUtxos: ${usedUtxos},
txFee: ${txFee},
txFeeRate: ${txFeeRate},
receiverWalletAddress: ${receiverWalletAddress},
sortedUtxos: ${sortedUtxos},
currentAddress: ${currentAddress},
usedUtxosCount: ${usedUtxosCount},
outputByte: ${outputByte},
isValidReceiverAddress: ${isValidReceiverAddress}
    ''';
  }
}
