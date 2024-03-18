import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gaimon/gaimon.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../all_settings_state/all_settings_state.dart';
import '../wallet_protect_state/wallet_protect_state.dart';

part 'accelerometer_store.g.dart';

class AccelerometerStore = _AccelerometerStore with _$AccelerometerStore;

WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

abstract class _AccelerometerStore with Store, WidgetsBindingObserver {
  final _settingsState = AllSettingsState();

  @observable
  bool hasPerformedAction = false;

  bool _hasPerformedActionInRange = false;

  late StreamSubscription<AccelerometerEvent> _subscription;

  _AccelerometerStore() {
    loadActionState();

    WidgetsBinding.instance.addObserver(this);

    _subscription = accelerometerEventStream().listen((event) {
      if (_walletProtectState.isSwitchedHideBalancesToggle &&
          WidgetsBinding.instance.lifecycleState == AppLifecycleState.resumed &&
          router.current.name == DashboardRoute.name &&
          _settingsState.currentIndex != 1 &&
          _settingsState.currentIndex != 3) {
        _handleAccelerometerEvent(event);
      }
    });
  }

  void _handleAccelerometerEvent(AccelerometerEvent event) {
    if (event.z > -9.5 && event.z < -6 && !_hasPerformedActionInRange) {
      _hasPerformedActionInRange = true;
      hasPerformedAction = !hasPerformedAction;
      Gaimon.heavy();
      saveActionState();
    } else if (event.z >= -6) {
      _hasPerformedActionInRange = false;
      saveActionState();
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      loadActionState();
    }
  }

  @action
  Future<void> loadActionState() async {
    final prefs = await SharedPreferences.getInstance();
    hasPerformedAction = prefs.getBool('hasPerformedAction') ?? false;
  }

  @action
  Future<void> saveActionState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasPerformedAction', hasPerformedAction);
  }

  @action
  Future<void> disableAccelerometerFunction() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('hasPerformedAction');
  }

  void dispose() {
    _subscription.cancel();
    WidgetsBinding.instance.removeObserver(this);
  }
}
