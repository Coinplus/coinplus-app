import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'package:web_socket_channel/web_socket_channel.dart';

part 'web_socket_store.g.dart';

class WebSocketStore = _WebSocketStore with _$WebSocketStore;

abstract class _WebSocketStore with Store {
  final String url = 'wss://ws.blockchain.info/inv';
  WebSocketChannel? _channel;
  Timer? _pingTimer;

  @observable
  bool walletDataReceived = false;

  @observable
  String bitcoinAddress = '';

  @action
  void connect() {
    _channel = WebSocketChannel.connect(Uri.parse(url));

    _channel?.stream.listen(
      _handleMessage,
      onDone: () {
        if (kDebugMode) {
          print('WebSocket closed');
        }
        _reconnect();
      },
      onError: (error) {
        if (kDebugMode) {
          print('WebSocket error: $error');
        }
        _reconnect();
      },
    );

    // Send an initial ping
    _ping();
    // Start the ping timer
    _startPingTimer();
  }

  @action
  void _handleMessage(message) {
    final Map<dynamic, dynamic> data = jsonDecode(message);

    if (data['op'] == 'pong') {
      if (kDebugMode) {
        print('Pong received');
      }
    } else if (data['op'] == 'utx') {
      if (kDebugMode) {
        print('New transaction: ${data['x']}');
      }
      walletDataReceived =
          true; // This will be set to true when a new transaction message is received
    } else if (data['op'] == 'addr_sub') {
      if (kDebugMode) {
        print('Subscribed to address: ${data['addr']}');
      }
    } else if (data['op'] == 'addr_unsub') {
      if (kDebugMode) {
        print('Unsubscribed from address: ${data['addr']}');
      }
    } else {
      if (kDebugMode) {
        print('Received message: $data');
      }
    }
  }

  @action
  void subscribeToAddress({required String address}) {
    bitcoinAddress = address;
    final message = jsonEncode({'op': 'addr_sub', 'addr': bitcoinAddress});
    _channel?.sink.add(message);
    log(message.toString());
    if (kDebugMode) {
      print('Subscribed to address: $bitcoinAddress');
    }
  }

  @action
  void unsubscribeFromAddress() {
    final message = jsonEncode({'op': 'addr_unsub', 'addr': bitcoinAddress});
    _channel?.sink.add(message);
    if (kDebugMode) {
      print('Unsubscribed from address: $bitcoinAddress');
    }
    bitcoinAddress = '';
  }

  void _startPingTimer() {
    _pingTimer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _ping();
    });
  }

  void _ping() {
    final message = jsonEncode({'op': 'ping'});
    _channel?.sink.add(message);
  }

  void _reconnect() {
    _pingTimer?.cancel();
    _pingTimer = null;
    Future.delayed(const Duration(seconds: 5), connect);
  }

  @action
  void disconnect() {
    _pingTimer?.cancel();
    _pingTimer = null;
    _channel?.sink.close(status.goingAway);
  }
}
