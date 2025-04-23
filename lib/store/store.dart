import 'package:get_it/get_it.dart';

import '../pages/send_page/send_to/send_to_state.dart';
import '../services/ramp_service.dart';
import 'accelerometer_store/accelerometer_store.dart';
import 'balance_store/balance_store.dart';
import 'contact_us_state/contact_us_state.dart';
import 'history_page_store/history_page_store.dart';
import 'market_page_store/market_page_store.dart';
import 'qr_detect_state/qr_detect_state.dart';
import 'remote_config_store/remote_config_store.dart';
import 'wallet_protect_state/wallet_protect_state.dart';

void registerStoreGetIt() {
  GetIt.I.registerSingleton(RampService());
  GetIt.I.registerSingleton(BalanceStore());
  GetIt.I.registerSingleton(WalletProtectState());
  GetIt.I.registerSingleton(SendToState());
  GetIt.I.registerSingleton(HistoryPageStore());
  GetIt.I.registerSingleton(MarketPageStore());
  GetIt.I.registerSingleton(ContactUsStore());
  GetIt.I.registerSingleton(ValidationState());
  GetIt.I.registerSingleton(AccelerometerStore());
  GetIt.I.registerSingleton(RemoteConfigStore());
}

void reRegisterStoreGetIt() {
  final _rampService = GetIt.I<RampService>();
  final _balancesStore = GetIt.I<BalanceStore>();
  final _walletProtectState = GetIt.I<WalletProtectState>();
  final _sendToState = GetIt.I<SendToState>();
  final _historyPageStore = GetIt.I<HistoryPageStore>();
  final _marketStore = GetIt.I<MarketPageStore>();
  final _contactUsStore = GetIt.I<ContactUsStore>();
  final _validationStore = GetIt.I<ValidationState>();
  final _sensorsStore = GetIt.I<AccelerometerStore>();
  final _remoteConfigStore = GetIt.I<RemoteConfigStore>();

  GetIt.I.unregister(instance: _rampService);
  GetIt.I.unregister(instance: _balancesStore);
  GetIt.I.unregister(instance: _walletProtectState);
  GetIt.I.unregister(instance: _sendToState);
  GetIt.I.unregister(instance: _historyPageStore);
  GetIt.I.unregister(instance: _marketStore);
  GetIt.I.unregister(instance: _contactUsStore);
  GetIt.I.unregister(instance: _validationStore);
  GetIt.I.unregister(instance: _sensorsStore);
  GetIt.I.unregister(instance: _remoteConfigStore);
  registerStoreGetIt();
}
