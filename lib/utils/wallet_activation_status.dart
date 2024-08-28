import '../store/balance_store/balance_store.dart';
import 'secure_storage_utils.dart';

final _secureStorage = SecureStorageService();

Future<bool> isCardWalletActivated({required BalanceStore balanceStore}) async {
  if (balanceStore.cards.isNotEmpty &&
      balanceStore.cards.length != balanceStore.cardCurrentIndex) {
    return _secureStorage.checkWalletStatus(
      balanceStore.cards[balanceStore.cardCurrentIndex].address,
    );
  } else {
    return false;
  }
}

Future<bool> isBarWalletActivated({required BalanceStore balanceStore}) async {
  if (balanceStore.bars.isNotEmpty &&
      balanceStore.bars.length != balanceStore.barCurrentIndex) {
    return _secureStorage.checkWalletStatus(
      balanceStore.bars[balanceStore.barCurrentIndex].address,
    );
  } else {
    return false;
  }
}
