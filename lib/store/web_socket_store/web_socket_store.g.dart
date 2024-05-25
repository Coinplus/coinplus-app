// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_socket_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WebSocketStore on _WebSocketStore, Store {
  late final _$walletDataReceivedAtom =
      Atom(name: '_WebSocketStore.walletDataReceived', context: context);

  @override
  bool get walletDataReceived {
    _$walletDataReceivedAtom.reportRead();
    return super.walletDataReceived;
  }

  @override
  set walletDataReceived(bool value) {
    _$walletDataReceivedAtom.reportWrite(value, super.walletDataReceived, () {
      super.walletDataReceived = value;
    });
  }

  late final _$bitcoinAddressAtom =
      Atom(name: '_WebSocketStore.bitcoinAddress', context: context);

  @override
  String get bitcoinAddress {
    _$bitcoinAddressAtom.reportRead();
    return super.bitcoinAddress;
  }

  @override
  set bitcoinAddress(String value) {
    _$bitcoinAddressAtom.reportWrite(value, super.bitcoinAddress, () {
      super.bitcoinAddress = value;
    });
  }

  late final _$_WebSocketStoreActionController =
      ActionController(name: '_WebSocketStore', context: context);

  @override
  void connect() {
    final _$actionInfo = _$_WebSocketStoreActionController.startAction(
        name: '_WebSocketStore.connect');
    try {
      return super.connect();
    } finally {
      _$_WebSocketStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _handleMessage(dynamic message) {
    final _$actionInfo = _$_WebSocketStoreActionController.startAction(
        name: '_WebSocketStore._handleMessage');
    try {
      return super._handleMessage(message);
    } finally {
      _$_WebSocketStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void subscribeToAddress({required String address}) {
    final _$actionInfo = _$_WebSocketStoreActionController.startAction(
        name: '_WebSocketStore.subscribeToAddress');
    try {
      return super.subscribeToAddress(address: address);
    } finally {
      _$_WebSocketStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void unsubscribeFromAddress() {
    final _$actionInfo = _$_WebSocketStoreActionController.startAction(
        name: '_WebSocketStore.unsubscribeFromAddress');
    try {
      return super.unsubscribeFromAddress();
    } finally {
      _$_WebSocketStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void disconnect() {
    final _$actionInfo = _$_WebSocketStoreActionController.startAction(
        name: '_WebSocketStore.disconnect');
    try {
      return super.disconnect();
    } finally {
      _$_WebSocketStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
walletDataReceived: ${walletDataReceived},
bitcoinAddress: ${bitcoinAddress}
    ''';
  }
}
