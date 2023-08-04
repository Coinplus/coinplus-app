import 'package:get_it/get_it.dart';

import 'balance_store/balance_store.dart';

void registerStoreGetIt() {
  GetIt.I.registerSingleton(BalanceStore());
}

void reRegisterStoreGetIt() {
  final balancesStore = GetIt.I<BalanceStore>();
  GetIt.I.unregister(instance: balancesStore);
  registerStoreGetIt();
}
