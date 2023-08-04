import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';

import '../../constants/card_type.dart';
import '../../http/dio.dart';
import '../../http/repositories/coins_repo.dart';
import '../../models/card_model/card_model.dart';
import '../../utils/storage_utils.dart';

part 'balance_store.g.dart';

class BalanceStore = _BalanceStore with _$BalanceStore;

abstract class _BalanceStore with Store {
  @readonly
  ObservableList<CardModel> _cards = <CardModel>[].asObservable();
  @readonly
  ObservableList<CardModel> _bars = <CardModel>[].asObservable();
  @readonly
  CardModel? _selectedCard;
  @readonly
  ObservableMap<String, bool> _loadings = <String, bool>{}.asObservable();

  _BalanceStore() {
    getCardsFromStorage();
  }

  Future<void> getCardsFromStorage() async {
    final allCards = await StorageUtils.getCards();
    _cards = allCards
        .where((element) => element.cardType == CardType.CARD)
        .toList()
        .asObservable();
    _bars = allCards
        .where((element) => element.cardType == CardType.BAR)
        .toList()
        .asObservable();
  }

  @action
  Future<void> getAllCardsInfo() async {
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
  Future<void> getSelectedCard(String address) async {
    _selectedCard = CardModel(address: address);
    _selectedCard = await _getSingleCardInfo(address);
  }

  Future<CardModel?> _getSingleCardInfo(String address) async {
    try {
      _loadings[address] = true;
      final card = await CoinsClient(dio).getCard(
        coinName: 'btc',
        address: address,
      );
      return card;
    } on DioException catch (e, stc) {
      log(e.message.toString(), stackTrace: stc);
    } finally {
      _loadings[address] = false;
    }

    return null;
  }

  Future<void> saveToWallet() async {
    if (_selectedCard == null) {
      return;
    }
    await StorageUtils.addCard(_selectedCard!);
  }

  void saveSelectedCard() {
    if (_selectedCard == null) {
      return;
    }

    _selectedCard!.cardType == CardType.CARD
        ? _cards.add(_selectedCard!)
        : _bars.add(_selectedCard!);
    StorageUtils.addCard(_selectedCard!);
  }

  @action
  void resetSelectedCard() {
    _selectedCard = null;
  }
}
