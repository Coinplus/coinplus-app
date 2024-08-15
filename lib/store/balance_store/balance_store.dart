import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/card_color.dart';
import '../../constants/card_type.dart';
import '../../extensions/extensions.dart';
import '../../http/repositories/balance_repo.dart';
import '../../models/bar_model/bar_model.dart';
import '../../models/card_model/card_model.dart';
import '../../models/coins_dto/coin_model.dart';
import '../../models/map_result/map_result_dto.dart';
import '../../services/cloud_firestore_service.dart';
import '../../services/firebase_service.dart';
import '../../utils/secure_storage_utils.dart';
import '../../utils/storage_utils.dart';
import '../market_page_store/market_page_store.dart';

part 'balance_store.g.dart';

class BalanceStore = _BalanceStore with _$BalanceStore;

MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

abstract class _BalanceStore with Store {
  @readonly
  ObservableList<CardModel> _cards = <CardModel>[].asObservable();
  @readonly
  ObservableList<BarModel> _bars = <BarModel>[].asObservable();
  @observable
  MapResult? cardMapResult;
  @observable
  MapResult? barMapResult;
  @readonly
  CardModel? _selectedCard;
  @readonly
  BarModel? _selectedBar;
  @observable
  ObservableMap<String, bool> loadings = <String, bool>{}.asObservable();
  @observable
  bool balanceLoading = false;
  @observable
  int cardCurrentIndex = 0;
  @observable
  int barCurrentIndex = 0;
  @observable
  bool barActivation = false;
  @observable
  bool cardActivation = false;
  @observable
  bool inAppWebViewLoading = false;
  @observable
  int cardIndicatorIndex = 0;
  @observable
  bool isCardIndicatorTapped = false;

  Future<void> signIn() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('first_run') ?? true) {
      await signInAnonymously();
    }
  }

  _BalanceStore() {
    if (_cards.isNotEmpty) {
      getCardsInfo();
    }
    if (_bars.isNotEmpty) {
      getBarsInfo();
    }
    getCardsFromStorage();
    getBarsFromStorage();
    signIn();
  }

  Future<void> getCardsFromStorage() async {
    final allCards = await StorageUtils.getCards();
    _cards = allCards
        .where((element) => element.type == CardType.CARD)
        .toList()
        .asObservable();
  }

  Future<void> getBarsFromStorage() async {
    final allCards = await StorageUtils.getBars();
    _bars = allCards
        .where((element) => element.type == CardType.BAR)
        .toList()
        .asObservable();
  }

  @computed
  int? get allCardsBalances {
    final cardTotalBalance = _cards.fold<int>(
      0,
      (acc, card) => acc + (card.finalBalance ?? 0),
    );
    final barTotalBalance = _bars.fold<int>(
      0,
      (acc, bar) => acc + (bar.finalBalance ?? 0),
    );
    return cardTotalBalance + barTotalBalance;
  }

  @computed
  num? get btcPrice => _marketPageStore.singleCoin?.result.first.price;

  @computed
  CoinModel? get singleCoin => _marketPageStore.singleCoin;

  @computed
  num get cardBalance {
    return cardCurrentIndex != _cards.length
        ? (_cards[cardCurrentIndex].finalBalance ?? 0) / 100000000 * btcPrice!
        : 0;
  }

  @computed
  num? get barBalance {
    return barCurrentIndex != _bars.length
        ? (_bars[barCurrentIndex].finalBalance ?? 0) / 100000000 * btcPrice!
        : null;
  }

  @action
  Future<void> getCardsInfo() async {
    if (_cards.isEmpty) {
      return;
    }
    try {
      balanceLoading = true;
      final addresses = _cards.map((e) => e.address).toList();
      final joinedAddresses = addresses.join('|');
      final res = await balanceRepo.getCards(
        addresses: joinedAddresses,
      );
      cardMapResult = res;
      final data = res.data.entries.map((e) {
        final resJson = {
          'address': e.key,
          'final_balance': (e.value as Map)['final_balance'],
          'total_received': (e.value as Map)['total_received'],
        };

        return CardModel.fromJson(resJson);
      }).toList();

      for (var i = 0; i < _cards.length; i++) {
        final card = _cards[i];
        final balanceCard = data.firstWhere((e) => e.address == card.address);
        _cards[i] = card.copyWith(
          finalBalance: balanceCard.finalBalance,
          totalReceived: balanceCard.totalReceived,
        );
      }
    } catch (e) {
      log(e.toString());
    } finally {
      balanceLoading = false;
    }
  }

  @action
  Future<void> getBarsInfo() async {
    if (_bars.isEmpty) {
      return;
    }
    try {
      balanceLoading = true;
      final res = await balanceRepo.getBars(
        addresses: _bars.map((e) => e.address).join('|'),
      );
      barMapResult = res;
      final data = res.data.entries.map((e) {
        final resJson = {
          'address': e.key,
          'final_balance': (e.value as Map)['final_balance'],
          'total_received': (e.value as Map)['total_received'],
        };

        return BarModel.fromJson(resJson);
      }).toList();

      for (var i = 0; i < _bars.length; i++) {
        final bar = _bars[i];
        final balanceBar = data.firstWhere((e) => e.address == bar.address);
        _bars[i] = bar.copyWith(
          finalBalance: balanceBar.finalBalance,
          totalReceived: balanceBar.totalReceived,
        );
      }
    } catch (e) {
      log(e.toString());
    } finally {
      balanceLoading = false;
    }
  }

  @action
  Future<void> updateCardIndicatorIndex(int index) async {
    cardIndicatorIndex = index;
  }

  @action
  Future<void> cardIndicatorTapStatus({required bool status}) async {
    isCardIndicatorTapped = status;
  }

  @action
  Future<void> getSelectedCard(String address) async {
    _selectedCard = CardModel(
      address: address,
      createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
    );
    final res =
        (await balanceRepo.getCards(addresses: address)).data.entries.first;
    final cardJson = {
      'address': res.key,
      'final_balance': (res.value as Map)['final_balance'],
      'total_received': (res.value as Map)['total_received'],
    };
    _selectedCard = CardModel.fromJson(cardJson);
  }

  @action
  Future<void> getSelectedBar(String address) async {
    _selectedBar = BarModel(
      address: address,
      createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
    );

    final res =
        (await balanceRepo.getBars(addresses: address)).data.entries.first;
    final barJson = {
      'address': res.key,
      'final_balance': (res.value as Map)['final_balance'],
      'total_received': (res.value as Map)['total_received'],
    };
    _selectedBar = BarModel.fromJson(barJson);
  }

  @action
  Future<void> removeSelectedCard() async {
    if (_selectedCard == null) {
      return;
    }
    final index = _cards
        .indexWhere((element) => element.address == _selectedCard!.address);
    _cards.removeAt(index);
    await StorageUtils.removeCard(_selectedCard!.address);
    await secureStorage.delete(key: _selectedCard!.address);
  }

  @action
  Future<void> removeSelectedBar() async {
    if (_selectedBar == null) {
      return;
    }
    final index =
        _bars.indexWhere((element) => element.address == _selectedBar!.address);
    _bars.removeAt(index);
    await StorageUtils.removeBar(_selectedBar!.address);
    await secureStorage.delete(key: _selectedBar!.address);
  }

  void saveSelectedCard({required CardColor color}) {
    if (_selectedCard == null) {
      return;
    }

    final isCardNotExist = _cards
        .indexWhere((element) => element.address == _selectedCard?.address)
        .isNegative;
    final isBarNotExist = _bars
        .indexWhere((element) => element.address == _selectedCard?.address)
        .isNegative;

    if (isCardNotExist && isBarNotExist) {
      _selectedCard = _selectedCard!.copyWith(
        createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
        color: color,
      );
      _cards.add(_selectedCard!);

      StorageUtils.addCard(_selectedCard!);
      onCardAdded(_selectedCard!.address);
    } else {
      onCardAdded(_selectedCard!.address);

      throw Exception('Card is already added');
    }
  }

  void saveSelectedCardManually({
    required CardColor color,
    required WalletType label,
    required String name,
  }) {
    if (_selectedCard == null) {
      return;
    }

    final isCardNotExist = _cards
        .indexWhere((element) => element.address == _selectedCard?.address)
        .isNegative;
    final isBarNotExist = _bars
        .indexWhere((element) => element.address == _selectedCard?.address)
        .isNegative;

    if (isCardNotExist && isBarNotExist) {
      _selectedCard = _selectedCard!.copyWith(
        createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
        color: color,
        label: label,
        name: name,
      );
      _cards.add(_selectedCard!);
      onCardAdded(_selectedCard!.address);

      StorageUtils.addCard(_selectedCard!);
    } else {
      onCardAdded(_selectedCard!.address);

      throw Exception('Card is already added');
    }
  }

  void saveSelectedBar({required CardColor color}) {
    if (_selectedBar == null) {
      return;
    }

    final isBarNotExist = _bars
        .indexWhere((element) => element.address == _selectedBar?.address)
        .isNegative;

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
      onBarAdded(_selectedBar!.address);
    } else {
      onBarAdded(_selectedBar!.address);

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
    final cardIndex =
        _cards.indexWhere((element) => element.address == cardAddress);

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
    final barIndex =
        _bars.indexWhere((element) => element.address == barAddress);

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
    final cardIndex =
        _cards.indexWhere((element) => element.address == cardAddress);

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
    final cardIndex =
        _bars.indexWhere((element) => element.address == barAddress);

    if (cardIndex != -1) {
      final updatedCard = _bars[cardIndex].copyWith(name: newName);
      _bars[cardIndex] = updatedCard;

      StorageUtils.replaceBar(barAddress, updatedCard);
    } else {
      throw Exception('Card not found');
    }
  }

  @action
  Future<bool?> getCard({
    required String? receivedData,
    required TextEditingController textEditingController,
  }) async {
    if (receivedData != null) {
      final card = await getCardData(receivedData);
      return card?.activated;
    } else if (textEditingController.text.length > 26) {
      final card = await getCardData(textEditingController.text);
      return card?.activated;
    }
    return null;
  }

  @action
  Future<void> setCardCurrentIndex(int index) async {
    cardCurrentIndex = index;
  }

  @action
  Future<void> setBarCurrentIndex(int index) async {
    barCurrentIndex = index;
  }

  @action
  void activateBar() {
    barActivation = true;
  }

  @action
  void activateCard() {
    cardActivation = true;
  }

  @action
  void reActivateBar() {
    barActivation = false;
  }

  @action
  void reActivateCard() {
    cardActivation = false;
  }

  @action
  void webViewStartLoading() {
    inAppWebViewLoading = true;
  }

  @action
  void webViewStopLoading() {
    inAppWebViewLoading = false;
  }

  late void Function(String addr) onCardAdded = _defaultOnCardAdded;
  late void Function(String addr) onBarAdded = _defaultOnBarAdded;

  void _defaultOnCardAdded(String addr) {}

  void _defaultOnBarAdded(String addr) {}

  Future<void> setOnCardAddedCallback(
    void Function(String addr) onCardAdded,
  ) async {
    this.onCardAdded = onCardAdded;
  }

  Future<void> setOnBarAddedCallback(
    void Function(String addr) onBarAdded,
  ) async {
    this.onBarAdded = onBarAdded;
  }

  late void Function(String addr) onCardDeleted = _defaultOnCardDeleted;
  late void Function(String addr) onBarDeleted = _defaultOnBarDeleted;

  void _defaultOnCardDeleted(String addr) {}

  void _defaultOnBarDeleted(String addr) {}

  Future<void> setOnCardDeletedCallback(
    void Function(String addr) onCardDeleted,
  ) async {
    this.onCardDeleted = onCardDeleted;
  }

  Future<void> setOnBarDeletedCallback(
    void Function(String addr) onBarDeleted,
  ) async {
    this.onBarDeleted = onBarDeleted;
  }

  late void Function(String addr) onCardActivated = _defaultOnCardActivated;
  late void Function(String addr) onBarActivated = _defaultOnBarActivated;

  void _defaultOnCardActivated(String addr) {}

  void _defaultOnBarActivated(String addr) {}

  Future<void> setOnCardActivatedCallback(
    void Function(String addr) onCardActivated,
  ) async {
    this.onCardActivated = onCardActivated;
  }

  Future<void> setOnBarActivatedCallback(
    void Function(String addr) onBarActivated,
  ) async {
    this.onBarActivated = onBarActivated;
  }
}
