import 'package:get_it/get_it.dart';

import '../store/balance_store/balance_store.dart';
import 'secure_storage_utils.dart';

final _secureStorage = SecureStorageService();

BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

Future<bool> isCardWalletActivated() async {
  if (_balanceStore.cards.isNotEmpty &&
      _balanceStore.cards.length != _balanceStore.cardCurrentIndex) {
    return _secureStorage.checkWalletStatus(
      _balanceStore.cards[_balanceStore.cardCurrentIndex].address,
    );
  } else {
    return false;
  }
}

Future<bool> isCardWalletHasBackup({required String address}) async {
  if (_balanceStore.backupCards.isNotEmpty) {
    return _secureStorage.checkBackupStatus(
      address,
    );
  } else {
    return false;
  }
}

Future<bool> isEthCardWalletActivated() async {
  final ethCardIndex =
      _balanceStore.cardCurrentIndex - _balanceStore.cards.length;
  if (_balanceStore.ethCards.isNotEmpty &&
      ethCardIndex >= 0 &&
      ethCardIndex < _balanceStore.ethCards.length) {
    return _secureStorage.checkWalletStatus(
      _balanceStore.ethCards[ethCardIndex].address,
    );
  } else {
    return false;
  }
}

Future<bool> isBarWalletActivated() async {
  if (_balanceStore.bars.isNotEmpty &&
      _balanceStore.bars.length != _balanceStore.barCurrentIndex) {
    return _secureStorage.checkWalletStatus(
      _balanceStore.bars[_balanceStore.barCurrentIndex].address,
    );
  } else {
    return false;
  }
}
