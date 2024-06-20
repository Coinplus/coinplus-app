import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../store/accelerometer_store/accelerometer_store.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../store/history_page_store/history_page_store.dart';

part 'card_history_list_state.g.dart';

class CardHistoryListState = _CardHistoryListState with _$CardHistoryListState;

abstract class _CardHistoryListState with Store {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  AccelerometerStore get _accelerometerStore => GetIt.I<AccelerometerStore>();

  @computed
  HistoryPageStore get historyPageStore => _historyPageStore;

  @computed
  BalanceStore get balanceStore => _balanceStore;

  @computed
  AccelerometerStore get accelerometerStore => _accelerometerStore;

  @computed
  bool get hasPerformedAction => accelerometerStore.hasPerformedAction;

  @action
  void getNextPageTransactions() {
    historyPageStore.fetchCardNextPageTransactions(
      address: historyPageStore.selectedCardAddress,
    );
  }

  @action
  Future<void> loadCardWalletStatusFromStorage(String address) async {
    if (!historyPageStore.isCardRefreshing) {
      await historyPageStore.setCardSelectedAddress(
        balanceStore.cards[historyPageStore.cardHistoryIndex].address,
      );
      await historyPageStore.getSingleCardHistory(
        address: balanceStore.cards[historyPageStore.cardHistoryIndex].address,
      );
    }
  }
}
