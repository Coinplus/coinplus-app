import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../models/bar_model/bar_model.dart';
import '../../../../models/card_model/card_model.dart';
import '../../../../models/coins_dto/coin_model.dart';
import '../../../../store/balance_store/balance_store.dart';
import '../../../../store/history_page_store/history_page_store.dart';
import '../../../../store/market_page_store/market_page_store.dart';

part 'change_selected_address_state.g.dart';

class ChangeSelectedAddressState = ChangeSelectedAddressStateBase with _$ChangeSelectedAddressState;

abstract class ChangeSelectedAddressStateBase with Store {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  @computed
  ObservableList<CardModel> get cards => _balanceStore.cards;

  @computed
  ObservableList<BarModel> get bars => _balanceStore.bars;

  @computed
  CoinResultModel? get btc => _marketPageStore.singleCoin?.result.first;

  @computed
  int get selectedCardIndex => _historyPageStore.cardHistoryIndex;

  @computed
  int get selectedBarIndex => _historyPageStore.barHistoryIndex;
}
