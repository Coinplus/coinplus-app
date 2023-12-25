import '../store/balance_store/balance_store.dart';
import '../store/settings_button_state/settings_button_state.dart';
import 'secure_storage_utils.dart';

Future<bool> isCardWalletActivated({required BalanceStore balanceStore, required SettingsState settingsState}) async {
  if (balanceStore.cards.isNotEmpty && balanceStore.cards.length != settingsState.cardCurrentIndex) {
    return checkWalletStatus(
      balanceStore.cards[settingsState.cardCurrentIndex].address,
    );
  } else {
    return false;
  }
}

Future<bool> isBarWalletActivated({required BalanceStore balanceStore, required SettingsState settingsState}) async {
  if (balanceStore.bars.isNotEmpty && balanceStore.bars.length != settingsState.barCurrentIndex) {
    return checkWalletStatus(
      balanceStore.bars[settingsState.barCurrentIndex].address,
    );
  } else {
    return false;
  }
}
