import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../constants/card_color.dart';
import '../../constants/card_type.dart';
import '../../extensions/extensions.dart';
import '../../http/dio.dart';
import '../../http/repositories/coins_repo.dart';
import '../../models/bar_model/bar_model.dart';
import '../../models/card_model/card_model.dart';
import '../../models/coin_dto/coin_dto.dart';
import '../../services/cloud_firestore_service.dart';
import '../../utils/storage_utils.dart';
import '../qr_detect_state/qr_detect_state.dart';

part 'balance_store.g.dart';

class BalanceStore = _BalanceStore with _$BalanceStore;

abstract class _BalanceStore with Store {
  @readonly
  CoinDto? _coins;
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

  ValidationState get _validationStore => GetIt.I<ValidationState>();

  _BalanceStore() {
    getCardsFromStorage();
    getBarsFromStorage();
    getCoins();
  }

  Future<void> getCoins() async {
    _coins = await CoinsClient(dio).getCoins();
  }

  Future<void> getCardsFromStorage() async {
    final allCards = await StorageUtils.getCards();
    _cards = allCards.where((element) => element.type == CardType.CARD).toList().asObservable();
  }

  Future<void> getBarsFromStorage() async {
    final allCards = await StorageUtils.getBars();
    _bars = allCards.where((element) => element.type == CardType.BAR).toList().asObservable();
  }

  @computed
  int get allCardsBalances {
    var cardTotalBalance = 0;
    var barTotalBalance = 0;

    for (final card in _cards) {
      cardTotalBalance += (card.data!.balance - card.data!.spentTxoSum).toInt();
    }
    for (final bar in _bars) {
      barTotalBalance += (bar.data!.balance - bar.data!.spentTxoSum).toInt();
    }
    final totalBalance = cardTotalBalance + barTotalBalance;
    return totalBalance;
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
              data: card.data,
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
              data: card.data,
            ),
          ],
        );
      }
    }
  }

  @action
  Future<void> getSelectedCard(String address) async {
    _selectedCard = CardModel(
      address: address,
      createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
    );
    _selectedCard = await _getSingleCardInfo(address);
  }

  @action
  Future<void> getSelectedBar(String address) async {
    _selectedBar = BarModel(
      address: address,
      createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
    );
    _selectedBar = await _getSingleBarInfo(address);
  }

  @action
  Future<void> removeSelectedCard() async {
    if (_selectedCard == null) {
      return;
    }
    final index = _cards.indexWhere((element) => element.address == _selectedCard!.address);
    _cards.removeAt(index);
    await StorageUtils.removeCard(_selectedCard!.address);
    const secureStorage = FlutterSecureStorage();
    await secureStorage.delete(key: _selectedCard!.address);
  }

  @action
  Future<void> removeSelectedBar() async {
    if (_selectedBar == null) {
      return;
    }
    final index = _bars.indexWhere((element) => element.address == _selectedBar!.address);
    _bars.removeAt(index);
    await StorageUtils.removeBar(_selectedBar!.address);
    const secureStorage = FlutterSecureStorage();
    await secureStorage.delete(key: _selectedBar!.address);
  }

  Future<CardModel?> _getSingleCardInfo(String address) async {
    try {
      loadings[address] = true;
      final card = await CoinsClient(dio).getCard(
        address: address,
      );
      return card;
    } on DioException {
      _validationStore.invalidAddress();
      log('Its not valid btc address');
    } finally {
      loadings[address] = false;
    }

    return null;
  }

  Future<BarModel?> _getSingleBarInfo(String address) async {
    try {
      loadings[address] = true;
      final bar = await CoinsClient(dio).getBar(
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

  void saveSelectedCard({required CardColor color}) {
    if (_selectedCard == null) {
      return;
    }

    final isCardNotExist = _cards.indexWhere((element) => element.address == _selectedCard?.address).isNegative;

    if (isCardNotExist) {
      _selectedCard = _selectedCard!.copyWith(
        createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
        color: color,
      );
      _cards.add(_selectedCard!);

      StorageUtils.addCard(_selectedCard!);
    } else {
      throw Exception('Card is already added');
    }
  }

  void saveSelectedCardAsTracker({required CardColor color, required WalletType label, required String name}) {
    if (_selectedCard == null) {
      return;
    }

    final isCardNotExist = _cards.indexWhere((element) => element.address == _selectedCard?.address).isNegative;

    if (isCardNotExist) {
      _selectedCard = _selectedCard!.copyWith(
        createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
        color: color,
        label: label,
        name: name,
      );
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

    final isBarNotExist = _bars.indexWhere((element) => element.address == _selectedBar?.address).isNegative;

    if (isBarNotExist) {
      _selectedBar = _selectedBar!.copyWith(
        createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
      );
      _bars.add(_selectedBar!);
      StorageUtils.addBar(
        _selectedBar!.copyWith(
          createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
        ),
      );
    } else {
      throw Exception('Bar is already added');
    }
  }

  void changeCardIndexAndSave({
    required int oldIndex,
    required String cardAddress,
    required int newIndex,
  }) {
    final cardToMove = _cards.removeAt(oldIndex);

    if (newIndex > oldIndex) {
      _cards.insert(newIndex - 1, cardToMove);
    } else {
      _cards.insert(newIndex, cardToMove);
    }
    StorageUtils.saveUpdatedCards(_cards);
  }

  @action
  void changeBarIndexAndSave({
    required int oldIndex,
    required String cardAddress,
    required int newIndex,
  }) {
    final cardToMove = _bars.removeAt(oldIndex);
    if (newIndex > oldIndex) {
      _bars.insert(newIndex - 1, cardToMove);
    } else {
      _bars.insert(newIndex, cardToMove);
    }
    StorageUtils.saveUpdatedBars(_bars);
  }

  @action
  void changeCardColorAndSave({
    required String cardAddress,
    required CardColor color,
  }) {
    final cardIndex = _cards.indexWhere((element) => element.address == cardAddress);

    if (cardIndex != -1) {
      final updatedCard = _cards[cardIndex].copyWith(color: color);
      _cards[cardIndex] = updatedCard;

      StorageUtils.replaceCard(cardAddress, updatedCard);
    } else {
      throw Exception('Card not found');
    }
  }

  @action
  void changeBarColorAndSave({
    required String barAddress,
    required CardColor color,
  }) {
    final barIndex = _bars.indexWhere((element) => element.address == barAddress);

    if (barIndex != -1) {
      final updatedCard = _bars[barIndex].copyWith(color: color);
      _bars[barIndex] = updatedCard;

      StorageUtils.replaceBar(barAddress, updatedCard);
    } else {
      throw Exception('Card not found');
    }
  }

  @action
  void changeCardNameAndSave({
    required String cardAddress,
    required String newName,
  }) {
    final cardIndex = _cards.indexWhere((element) => element.address == cardAddress);

    if (cardIndex != -1) {
      final updatedCard = _cards[cardIndex].copyWith(name: newName);
      _cards[cardIndex] = updatedCard;

      StorageUtils.replaceCard(cardAddress, updatedCard);
    } else {
      throw Exception('Card not found');
    }
  }

  @action
  void changeBarNameAndSave({
    required String barAddress,
    required String newName,
  }) {
    final cardIndex = _bars.indexWhere((element) => element.address == barAddress);

    if (cardIndex != -1) {
      final updatedCard = _bars[cardIndex].copyWith(name: newName);
      _bars[cardIndex] = updatedCard;

      StorageUtils.replaceBar(barAddress, updatedCard);
    } else {
      throw Exception('Card not found');
    }
  }

  @action
  Future<bool?> getCard({required String? receivedData, required TextEditingController textEditingController}) async {
    if (receivedData != null) {
      final card = await getCardData(receivedData);
      return card?.activated;
    } else if (textEditingController.text.length > 26) {
      final card = await getCardData(textEditingController.text);
      return card?.activated;
    }
    return null;
  }
}
