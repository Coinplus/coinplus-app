import 'package:get_it/get_it.dart';

import 'balance_store/balance_store.dart';
import 'contact_us_state/contact_us_state.dart';
import 'settings_button_state/settings_button_state.dart';
import 'wallet_protect_state/wallet_protect_state.dart';

void registerStoreGetIt() {
  GetIt.I.registerSingleton(BalanceStore());
  GetIt.I.registerSingleton(ContactUsStore());
  GetIt.I.registerSingleton(SettingsState());
  GetIt.I.registerSingleton(WalletProtectState());
}

void reRegisterStoreGetIt() {
  final balancesStore = GetIt.I<BalanceStore>();
  final store = GetIt.I<ContactUsStore>();
  final _settingsState = GetIt.I<SettingsState>();
  final _walletProtectState = GetIt.I<WalletProtectState>();

  GetIt.I.unregister(instance: balancesStore);
  GetIt.I.unregister(instance: store);
  GetIt.I.unregister(instance: _settingsState);
  GetIt.I.unregister(instance: _walletProtectState);
  registerStoreGetIt();
}
