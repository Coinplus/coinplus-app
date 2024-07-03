import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'remote_config_store.g.dart';

class RemoteConfigStore = _RemoteConfigStore with _$RemoteConfigStore;

abstract class _RemoteConfigStore with Store {
  _RemoteConfigStore() {
    _init();
  }

  @observable
  bool showAlert = false;

  @action
  Future<void> _init() async {
    final remoteConfig = FirebaseRemoteConfig.instance;

    try {
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: Duration.zero,
        ),
      );
      await remoteConfig.fetchAndActivate();
      showAlert = remoteConfig.getBool('hide_balance_toggle');
    } catch (e) {
      if (kDebugMode) {
        print('Failed to fetch remote config: $e');
      }
    }
  }
}
