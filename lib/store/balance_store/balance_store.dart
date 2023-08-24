import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../../constants/card_type.dart';
import '../../http/dio.dart';
import '../../http/repositories/coins_repo.dart';
import '../../models/bar_model/bar_model.dart';
import '../../models/card_model/card_model.dart';
import '../../models/coin_dto/coin_dto.dart';
import '../../utils/storage_utils.dart';

part 'balance_store.g.dart';

class BalanceStore = _BalanceStore with _$BalanceStore;

abstract class _BalanceStore with Store {
  @readonly
  ObservableList<CoinDto> _coins = <CoinDto>[].asObservable();
  @readonly
  ObservableList<CardModel> _cards = <CardModel>[].asObservable();
  @readonly
  ObservableList<BarModel> _bars = <BarModel>[].asObservable();
  @readonly
  CardModel? _selectedCard;
  @readonly
  BarModel? _selectedBar;
  @observable
  ObservableMap<String, bool> loadings = <String, bool>{}.asObservable();

  _BalanceStore() {
    getCardsFromStorage();
    getBarsFromStorage();
    getCoins();
  }

  Future<void> getCoins() async {
    _coins = (await CoinsClient(dio).getCoins()).asObservable();
  }

  Future<void> getCardsFromStorage() async {
    final allCards = await StorageUtils.getCards();
    _cards = allCards
        .where((element) => element.cardType == CardType.CARD)
        .toList()
        .asObservable();
  }

  Future<void> getBarsFromStorage() async {
    final allCards = await StorageUtils.getBars();
    _bars = allCards
        .where((element) => element.cardType == CardType.BAR)
        .toList()
        .asObservable();
  }

  @action
  Future<void> getCardsInfo() async {
    if (_cards.isEmpty) {
      return;
    }
    for (final element in _cards) {
      final card = await _getSingleCardInfo(element.address);
      if (card != null) {
        final index = _cards.indexOf(element);
        _cards.replaceRange(
          index,
          index + 1,
          [
            element.copyWith(
              balance: card.balance,
              totalReceived: card.totalReceived,
              totalSent: card.totalSent,
            ),
          ],
        );
      }
    }
  }

  @action
  Future<void> getBarsInfo() async {
    if (_bars.isEmpty) {
      return;
    }
    for (final element in _bars) {
      final card = await _getSingleBarInfo(element.address);
      if (card != null) {
        final index = _bars.indexOf(element);
        _bars.replaceRange(
          index,
          index + 1,
          [
            element.copyWith(
              balance: card.balance,
              totalReceived: card.totalReceived,
              totalSent: card.totalSent,
            ),
          ],
        );
      }
    }
  }

  @action
  Future<void> getSelectedCard(String address) async {
    _selectedCard = CardModel(address: address);
    _selectedCard = await _getSingleCardInfo(address);
  }

  @action
  Future<void> getSelectedBar(String address) async {
    _selectedBar = BarModel(address: address);
    _selectedBar = await _getSingleBarInfo(address);
  }

  @action
  void removeSelectedCard() {
    if (_selectedCard == null) {
      return;
    }
    final index = _cards.indexWhere((element) => element.address == _selectedCard!.address);
      _cards.removeAt(index);
      StorageUtils.removeCard(_selectedCard!.address);
      resetSelectedCard();
  }

  Future<CardModel?> _getSingleCardInfo(String address) async {
    try {
      loadings[address] = true;
      final card = await CoinsClient(dio).getCard(
        coinName: 'btc',
        address: address,
      );
      return card;
    } on DioException catch (e, stc) {
      log(e.message.toString(), stackTrace: stc);
    } finally {
      loadings[address] = false;
    }

    return null;
  }

  Future<BarModel?> _getSingleBarInfo(String address) async {
    try {
      loadings[address] = true;
      final bar = await CoinsClient(dio).getBar(
        coinName: 'btc',
        address: address,
      );
      return bar;
    } on DioException catch (e, stc) {
      log(e.message.toString(), stackTrace: stc);
    } finally {
      loadings[address] = false;
    }

    return null;
  }

  void saveSelectedCard() {
    if (_selectedCard == null) {
      return;
    }

    final isCardNotExist = _cards
        .indexWhere((element) => element.address == _selectedCard?.address)
        .isNegative;

    if (isCardNotExist) {
      _cards.add(_selectedCard!);

      StorageUtils.addCard(_selectedCard!);
    } else {
      throw Exception('Card is already added');
    }
  }

  void saveSelectedBar() {
    if (_selectedBar == null) {
      return;
    }

    final isBarNotExist = _bars
        .indexWhere((element) => element.address == _selectedBar?.address)
        .isNegative;

    if (isBarNotExist) {
      _bars.add(_selectedBar!);
      StorageUtils.addBar(_selectedBar!);
    } else {
      throw Exception('Bar is already added');
    }
  }

  @action
  void resetSelectedCard() {
    _selectedCard = null;
  }

  @action
  void resetSelectedBar() {
    _selectedBar = null;
  }
}
