import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import '../../services/firebase_service.dart';

part 'connectivity_store.g.dart';

class ConnectivityStore = _ConnectivityStore with _$ConnectivityStore;

abstract class _ConnectivityStore with Store {
  late Connectivity _connectivity;

  _ConnectivityStore() {
    _connectivity = Connectivity();
  }

  @observable
  ConnectivityResult connectionStatus = ConnectivityResult.none;

  @action
  Future<void> initConnectivity() async {
    await signInAnonymously();
    try {
      final result = await _connectivity.checkConnectivity();
      await updateConnectionStatus(result);
    } on PlatformException {
      return;
    }
  }

  @action
  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    connectionStatus = result;
  }
}
