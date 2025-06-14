import 'dart:developer';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/card_color.dart';
import '../../constants/card_type.dart';
import '../../extensions/extensions.dart';
import '../../http/repositories/balance_repo.dart';
import '../../http/repositories/coins_repo.dart';
import '../../models/bar_model/bar_model.dart';
import '../../models/card_model/card_model.dart';
import '../../models/coins_dto/coin_model.dart';
import '../../models/eth_card_model/eth_card_model.dart';
import '../../models/eth_token_model/eth_token_model.dart';
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
  ObservableList<CardModel> _backupCards = <CardModel>[].asObservable();
  @readonly
  ObservableList<EthCardModel> _ethCards = <EthCardModel>[].asObservable();
  @readonly
  ObservableList<BarModel> _bars = <BarModel>[].asObservable();
  @observable
  MapResult? cardMapResult;
  @observable
  List<dynamic>? listResult;
  @observable
  MapResult? barMapResult;
  @readonly
  CardModel? _selectedCard;
  @readonly
  CardModel? _selectedBackupCard;
  @readonly
  EthCardModel? _selectedEthCard;
  @readonly
  BarModel? _selectedBar;
  @observable
  int cardCurrentIndex = 0;
  @observable
  int barCurrentIndex = 0;
  @observable
  String mainWalletAddress = '';
  @observable
  String backupWalletAddress = '';
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
  @observable
  ObservableMap<String, bool> loadings = <String, bool>{}.asObservable();
  @observable
  bool balanceLoading = false;
  @observable
  CardModel? backupSingleCard;
  @observable
  bool backupCardLoading = true;
  final CoinsClient _repo = coinStatsRepo;

  @observable
  ObservableList<TokenBalance> tokens = ObservableList<TokenBalance>();

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @action
  Future<void> fetchTokens(String address) async {
    isLoading = true;
    errorMessage = null;

    try {
      final response = await _repo.getTokenBalances(address: address);
      tokens.clear();
      if (response.isNotEmpty) {
        final balances = List<TokenBalance>.from(response.first.balances)
          ..sort((a, b) {
            final aValue = a.amount * a.price;
            final bValue = b.amount * b.price;
            return bValue.compareTo(aValue);
          });

        tokens.addAll(balances);
      }
    } catch (e, stackTrace) {
      errorMessage = 'Failed to load tokens';
      if (kDebugMode) {
        print('fetchTokens error: $e');
        print(stackTrace);
      }
    } finally {
      isLoading = false;
    }
  }

  Future<void> signIn() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('first_run') ?? true) {
      await signInAnonymously();
    }
  }

  final _secureStorage = SecureStorageService();

  _BalanceStore() {
    if (_cards.isNotEmpty) {
      getCardsInfo();
    }
    if (_bars.isNotEmpty) {
      getBarsInfo();
    }
    if (_cards.isNotEmpty) {
      getEthCardsInfo();
    }
    if (_backupCards.isNotEmpty) {
      getBackupCardsInfo();
    }
    getCardsFromStorage();
    getBackupCardsFromStorage();
    getEthCardsFromStorage();
    getBarsFromStorage();
    signIn();
  }

  @computed
  num? get btcPrice => _marketPageStore.singleCoin?.result.first.price;

  @computed
  num? get ethPrice => _marketPageStore.singleCoin?.result.firstWhereOrNull((e) => e.symbol == 'ETH')?.price;

  @computed
  num get allCardsBalances {
    final cardTotalBalance = _cards.fold<num>(
      0,
      (acc, card) => acc + (card.finalBalance ?? 0),
    );

    final barTotalBalance = _bars.fold<num>(
      0,
      (acc, bar) => acc + (bar.finalBalance ?? 0),
    );

    return cardTotalBalance + barTotalBalance;
  }

  @computed
  num get allEthCardsBalances {
    final cardTotalBalance = _ethCards.fold<num>(
      0,
      (acc, card) => acc + (card.finalBalance ?? 0),
    );
    return cardTotalBalance;
  }

  @computed
  CoinModel? get singleCoin => _marketPageStore.singleCoin;

  @computed
  num get cardBalance {
    return cardCurrentIndex != _cards.length ? (_cards[cardCurrentIndex].finalBalance ?? 0) / 100000000 * btcPrice! : 0;
  }

  @computed
  num get backupCardBalance {
    return cardCurrentIndex != _backupCards.length
        ? (_backupCards[cardCurrentIndex].finalBalance ?? 0) / 100000000 * btcPrice!
        : 0;
  }

  @computed
  num? get barBalance {
    return barCurrentIndex != _bars.length ? (_bars[barCurrentIndex].finalBalance ?? 0) / 100000000 * btcPrice! : null;
  }

  //----------Get cards from locale storage----------//
  @action
  Future<void> loadBackupCard(String mainCardAddress) async {
    try {
      backupCardLoading = true;
      backupSingleCard = await StorageUtils.searchMainAndBackupCard(mainCardAddress);
    } catch (e) {
      log('Error while loading backup card: $e');
    } finally {
      backupCardLoading = false;
    }
  }

  @action
  Future<void> getCardsFromStorage() async {
    final allCards = await StorageUtils.getCards();
    _cards = allCards.where((element) => element.type == CardType.CARD).toList().asObservable();
  }

  @action
  Future<void> getBackupCardsFromStorage() async {
    final allCards = await StorageUtils.getBackupCards();
    _backupCards = allCards.where((element) => element.type == CardType.CARD).toList().asObservable();
  }

  @action
  Future<void> getEthCardsFromStorage() async {
    final allCards = await StorageUtils.getEthCards();
    _ethCards = allCards.where((element) => element.type == CardType.CARD).toList().asObservable();
  }

  @action
  Future<void> getBarsFromStorage() async {
    final allCards = await StorageUtils.getBars();
    _bars = allCards.where((element) => element.type == CardType.BAR).toList().asObservable();
  }

  //-----------------------------------------------//

  //--------Fetch cards balances---------//
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
      if (kDebugMode) {
        print(e.toString());
      }
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
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      balanceLoading = false;
    }
  }

  @action
  Future<void> getEthCardsInfo() async {
    if (_ethCards.isEmpty) {
      return;
    }

    try {
      balanceLoading = true;

      for (var i = 0; i < _ethCards.length; i++) {
        final card = _ethCards[i];
        final address = card.address;
        final res = await coinStatsRepo.getTokenBalances(address: address);
        listResult = res;
        double totalBalance = 0;
        if (res.isNotEmpty && res.first.balances.isNotEmpty) {
          for (final token in res.first.balances) {
            totalBalance += token.amount * token.price;
          }
        }
        final updatedCard = card.copyWith(
          finalBalance: totalBalance,
          address: address,
        );
        _ethCards[i] = updatedCard;
        if (_selectedEthCard?.address == card.address) {
          _selectedEthCard = updatedCard;
        }
      }
    } catch (e) {
      log(e.toString());
    } finally {
      balanceLoading = false;
    }
  }

  @action
  Future<void> getBackupCardsInfo() async {
    if (_backupCards.isEmpty) {
      return;
    }
    try {
      balanceLoading = true;
      final addresses = _backupCards.map((e) => e.address).toList();
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

      for (var i = 0; i < _backupCards.length; i++) {
        final card = _backupCards[i];
        final balanceCard = data.firstWhere((e) => e.address == card.address);
        _backupCards[i] = card.copyWith(
          finalBalance: balanceCard.finalBalance,
          totalReceived: balanceCard.totalReceived,
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    } finally {
      balanceLoading = false;
    }
  }

  //-------------------------------------//

  //---------------------Get cards---------------------//
  @action
  Future<void> getSelectedCard(String address) async {
    _selectedCard = CardModel(
      address: address,
      createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
    );
    final res = (await balanceRepo.getCards(addresses: address)).data.entries.first;
    final cardJson = {
      'address': res.key,
      'final_balance': (res.value as Map)['final_balance'],
      'total_received': (res.value as Map)['total_received'],
    };
    _selectedCard = CardModel.fromJson(cardJson);
  }

  @action
  Future<void> getSelectedBackupCard(String address) async {
    _selectedBackupCard = CardModel(
      address: address,
      createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
    );
    final res = (await balanceRepo.getCards(addresses: address)).data.entries.first;
    final cardJson = {
      'address': res.key,
      'final_balance': (res.value as Map)['final_balance'],
      'total_received': (res.value as Map)['total_received'],
    };
    _selectedBackupCard = CardModel.fromJson(cardJson);
  }

  @action
  Future<void> getSelectedEthCard(String address) async {
    loadings[address] = true;

    try {
      final res = await coinStatsRepo.getTokenBalances(address: address);
      if (res.isEmpty || res.first.balances.isEmpty) {
        _selectedEthCard = EthCardModel(
          address: address,
          finalBalance: 0,
        );
        return;
      }

      double totalBalance = 0;
      for (final token in res.first.balances) {
        totalBalance += token.amount * token.price;
      }
      final cardJson = {
        'address': address,
        'amount': totalBalance,
      };

      _selectedEthCard = EthCardModel.fromJson(cardJson);
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching Ethereum card data for address $address: ${e.toString()}');
      }
    } finally {
      loadings[address] = false;
    }
  }

  @action
  Future<void> getSelectedBar(String address) async {
    _selectedBar = BarModel(
      address: address,
      createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
    );

    final res = (await balanceRepo.getBars(addresses: address)).data.entries.first;
    final barJson = {
      'address': res.key,
      'final_balance': (res.value as Map)['final_balance'],
      'total_received': (res.value as Map)['total_received'],
    };
    _selectedBar = BarModel.fromJson(barJson);
  }

  //---------------------------------------------//

  //--------------------Save cards--------------------//
  @action
  void saveSelectedCard({required CardColor color}) {
    if (_selectedCard == null) {
      return;
    }

    final isCardNotExist = _cards.indexWhere((element) => element.address == _selectedCard?.address).isNegative;
    final isBarNotExist = _bars.indexWhere((element) => element.address == _selectedCard?.address).isNegative;

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

  @action
  void saveSelectedBackupCard({required CardColor color}) {
    final isBackupCardNotExist = _backupCards
        .indexWhere(
          (element) => element.address == _selectedBackupCard?.address,
        )
        .isNegative;

    if (isBackupCardNotExist) {
      final backup = _selectedBackupCard!.copyWith(
        address: _selectedBackupCard!.address,
        createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
        color: color,
        name: 'Coinplus Backup Card',
        isBackup: true,
      );
      _backupCards.add(backup);
      StorageUtils.addBackupCard(backup);
    } else {
      if (kDebugMode) {
        print('Backup card is already added');
      }
    }
  }

  @action
  void saveSelectedEthCard({required CardColor color}) {
    if (_selectedEthCard == null) {
      return;
    }

    final isCardNotExist = _ethCards.indexWhere((element) => element.address == _selectedEthCard?.address).isNegative;

    if (isCardNotExist) {
      _selectedEthCard = _selectedEthCard!.copyWith(
        createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
        color: color,
      );
      _ethCards.add(_selectedEthCard!);

      StorageUtils.addEthCard(_selectedEthCard!);
      onCardAdded(_selectedEthCard!.address);
    } else {
      _ethCards[_ethCards.indexWhere((element) => element.address == _selectedEthCard?.address)] = _selectedEthCard!;
      StorageUtils.addEthCard(_selectedEthCard!);
      onCardAdded(_selectedEthCard!.address);
      throw Exception('Card is already added');
    }
  }

  @action
  void saveSelectedCardManually({
    required CardColor color,
    required WalletType label,
    required String name,
  }) {
    if (_selectedCard == null) {
      return;
    }

    final isCardNotExist = _cards.indexWhere((element) => element.address == _selectedCard!.address).isNegative;
    final isBarNotExist = _bars.indexWhere((element) => element.address == _selectedCard?.address).isNegative;

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

  @action
  void saveSelectedBar({required CardColor color}) {
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
      onBarAdded(_selectedBar!.address);
    } else {
      onBarAdded(_selectedBar!.address);

      throw Exception('Bar is already added');
    }
  }

  //---------------------------------------------//

  //--------------------Remove cards--------------------//
  @action
  Future<void> removeSelectedCard({required String address}) async {
    final index = _cards.indexWhere((element) => element.address == address);
    _cards.removeAt(index);
    await StorageUtils.removeCard(address);
    await _secureStorage.delete(key: address);
  }

  @action
  Future<void> removeSelectedBackupCard({required String address}) async {
    final index = _backupCards.indexWhere(
      (element) => element.address == address,
    );
    _backupCards.removeAt(index);
    await StorageUtils.removeBackupCard(address);
    await _secureStorage.delete(key: address);
  }

  @action
  Future<void> removeSelectedEthCard({required String address}) async {
    final index = _ethCards.indexWhere((element) => element.address == address);
    _ethCards.removeAt(index);
    await StorageUtils.removeEthCard(address);
    await _secureStorage.delete(key: address);
  }

  @action
  Future<void> removeSelectedBar() async {
    if (_selectedBar == null) {
      return;
    }
    final index = _bars.indexWhere((element) => element.address == _selectedBar!.address);
    _bars.removeAt(index);
    await StorageUtils.removeBar(_selectedBar!.address);
    await _secureStorage.delete(key: _selectedBar!.address);
  }

  //---------------------------------------------//

  //--------------------Actions with cards--------------------//
  @action
  Future<void> replaceMainCardWithBackup({required String mainCardAddress, required CardModel? backedUpCard}) async {
    final backupCardIndex = _backupCards.indexWhere(
      (element) => element.address == backedUpCard?.address,
    );
    if (backupCardIndex.isNegative) {
      throw Exception('No backup card available to replace the main card');
    }
    final mainCardIndex = _cards.indexWhere(
      (element) => element.address == mainCardAddress,
    );
    if (mainCardIndex.isNegative) {
      throw Exception('Main card not found');
    }
    _cards.removeAt(mainCardIndex);
    await StorageUtils.removeCard(mainCardAddress);
    await _secureStorage.delete(key: mainCardAddress);
    final backupCard = _backupCards[backupCardIndex];
    await _secureStorage.isWalletActivated(
      isSet: false,
      address: mainCardAddress,
    );
    await _secureStorage.setBackupStatus(isSet: false, address: mainCardAddress);
    final updatedCard = backupCard.copyWith(
      isBackup: false,
      createdAt: DateFormat('dd/MM/yyyy').format(DateTime.now()),
      color: CardColor.BACKUP,
    );
    await updateCardBackupStatus(cardAddress: updatedCard.address, backupStatus: false);
    _cards.insert(0, updatedCard);
    await StorageUtils.saveUpdatedCards(_cards);

    _backupCards.removeAt(backupCardIndex);
    await StorageUtils.removeBackupCard(backupCard.address);
    await _secureStorage.delete(key: backedUpCard!.address);
    onCardAdded(updatedCard.address);
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
  void changeCardBackupStatusAndSave({
    required String cardAddress,
    required bool hasBackedUp,
  }) {
    final cardIndex = _cards.indexWhere((element) => element.address == cardAddress);

    if (cardIndex != -1) {
      final updatedCard = _cards[cardIndex].copyWith(hasBackedUp: hasBackedUp);
      _cards[cardIndex] = updatedCard;

      StorageUtils.replaceCard(cardAddress, updatedCard);
    } else {
      throw Exception('Card not found');
    }
  }

  @action
  void changeEthCardColorAndSave({
    required String cardAddress,
    required CardColor color,
  }) {
    final cardIndex = _ethCards.indexWhere((element) => element.address == cardAddress);

    if (cardIndex != -1) {
      final updatedCard = _ethCards[cardIndex].copyWith(color: color);
      _ethCards[cardIndex] = updatedCard;

      StorageUtils.replaceEthCard(cardAddress, updatedCard);
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
  void changeEthCardNameAndSave({
    required String cardAddress,
    required String newName,
  }) {
    final cardIndex = _ethCards.indexWhere((element) => element.address == cardAddress);

    if (cardIndex != -1) {
      final updatedCard = _ethCards[cardIndex].copyWith(name: newName);
      _ethCards[cardIndex] = updatedCard;

      StorageUtils.replaceEthCard(cardAddress, updatedCard);
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
  Future<void> setMainWalletAddress({required String walletAddress}) async {
    mainWalletAddress = walletAddress;
  }

  @action
  Future<void> setBackupWalletAddress({required String walletAddress}) async {
    backupWalletAddress = walletAddress;
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

  @action
  Future<void> updateCardIndicatorIndex(int index) async {
    cardIndicatorIndex = index;
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
