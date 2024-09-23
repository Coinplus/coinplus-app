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

Future<bool> isEthCardWalletActivated({
  required BalanceStore balanceStore,
}) async {
  final ethCardIndex =
      balanceStore.cardCurrentIndex - balanceStore.cards.length;
  if (balanceStore.ethCards.isNotEmpty &&
      ethCardIndex >= 0 &&
      ethCardIndex < balanceStore.ethCards.length) {
    return _secureStorage.checkWalletStatus(
      balanceStore.ethCards[ethCardIndex].address,
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
