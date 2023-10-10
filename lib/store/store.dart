import 'package:get_it/get_it.dart';

import '../pages/settings_page/contact_us/contact_us.dart';
import 'balance_store/balance_store.dart';
import 'contact_us_state/contact_us_state.dart';

void registerStoreGetIt() {
  GetIt.I.registerSingleton(BalanceStore());
  GetIt.I.registerSingleton(ContactUsStore());
}

void reRegisterStoreGetIt() {
  final balancesStore = GetIt.I<BalanceStore>();
  final store = GetIt.I<ContactUsStore>();

  GetIt.I.unregister(instance: balancesStore);
  GetIt.I.unregister(instance: store);
  registerStoreGetIt();
}
