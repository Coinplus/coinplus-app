import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../http/dio.dart';
import '../../http/repositories/coins_repo.dart';
import '../../models/history_model/transaction_model.dart';
import '../../models/wallet_status_model/wallet_status_model.dart';
import '../../utils/date_formatter.dart';
import '../balance_store/balance_store.dart';

part 'history_page_store.g.dart';

class HistoryPageStore = _HistoryPageStore with _$HistoryPageStore;

BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

abstract class _HistoryPageStore with Store {
  _HistoryPageStore() {
    loadLastRefreshed();
    _startTimer();
    for (final card in _balanceStore.cards) {
      disabledButtons[card.address] = false;
    }
  }

  Timer? _timer;

  @observable
  WalletStatusModel? walletStatus;

  @observable
  int cardHistoryIndex = 0;

  @observable
  int barHistoryIndex = 0;

  @observable
  bool isLoading = false;

  @observable
  String selectedCardAddress = '';

  @observable
  String selectedBarAddress = '';

  @observable
  ObservableMap<String, List<TransactionModel>> cardHistories = ObservableMap<String, List<TransactionModel>>();

  @observable
  ObservableMap<String, List<TransactionModel>> barHistories = ObservableMap<String, List<TransactionModel>>();

  @observable
  ObservableMap<String, List<TransactionModel>> cardTransactionCache = ObservableMap<String, List<TransactionModel>>();

  @observable
  ObservableMap<String, List<TransactionModel>> barTransactionCache = ObservableMap<String, List<TransactionModel>>();

  @observable
  bool historyLoading = false;

  @observable
  ObservableMap<String, bool> disabledButtons = ObservableMap<String, bool>();

  @observable
  List<TransactionModel> cardTransactions = [];

  @observable
  List<TransactionModel> newFetchedData = [];

  @observable
  List<TransactionModel> newFetchedBarData = [];

  @observable
  List<TransactionModel> barTransactions = [];

  @observable
  Map<String, String> lastRefreshedMap = {};

  @observable
  bool isButtonDisabled = false;

  @observable
  bool isRefreshing = false;

  @observable
  int cardCurrentPage = 1;

  @observable
  int barCurrentPage = 1;

  @observable
  int tabIndex = 0;

  @observable
  bool isCardRefreshing = false;

  @observable
  bool isBarRefreshing = false;

  @action
  Future<void> setTabIndex(int value) async {
    tabIndex = value;
  }

  @action
  Future<void> setRefreshing({required bool value}) async {
    isRefreshing = value;
  }

  @action
  void cacheCardTransaction(String address, List<TransactionModel> transactions) {
    cardTransactionCache[address] = transactions;
  }

  @action
  void cacheBarTransaction(String address, List<TransactionModel> transactions) {
    barTransactionCache[address] = transactions;
  }

  @action
  List<TransactionModel>? getCardCachedTransaction(String address) {
    return cardTransactionCache[address];
  }

  @action
  List<TransactionModel>? getBarCachedTransaction(String address) {
    return barTransactionCache[address];
  }

  @action
  Future<void> getSingleCardHistory({required String address}) async {
    try {
      historyLoading = true;
      final cachedTransactions = getCardCachedTransaction(address);
      if (cachedTransactions != null) {
        await isCachedCardTransactions(address);
      } else {
        final fetchedTransactions = await CoinsClient(dio).getTransactions(address: address, page: 1);
        cardTransactions.add(fetchedTransactions);
        cardHistories[address] = [fetchedTransactions];
        cacheCardTransaction(address, [fetchedTransactions]);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      historyLoading = false;
    }
  }

  @action
  Future<void> isCachedCardTransactions(String address) async {
    final cachedTransactions = getCardCachedTransaction(address);
    cardTransactions.addAll(cachedTransactions!);
    cardHistories[address] = cachedTransactions;
  }

  @action
  Future<void> isCachedBarTransactions(String address) async {
    final cachedTransactions = getBarCachedTransaction(address);
    barTransactions.addAll(cachedTransactions!);
    barHistories[address] = cachedTransactions;
  }

  @action
  Future<void> getSingleBarHistory({required String address}) async {
    try {
      historyLoading = true;
      final cachedTransactions = getBarCachedTransaction(address);
      if (cachedTransactions != null) {
        await isCachedBarTransactions(address);
      } else {
        final fetchedTransactions = await CoinsClient(dio).getTransactions(address: address, page: 1);
        barTransactions.add(fetchedTransactions);
        barHistories[address] = [fetchedTransactions];
        cacheBarTransaction(address, [fetchedTransactions]);
      }
    } catch (e) {
      log(e.toString());
    } finally {
      historyLoading = false;
    }
  }

  @action
  Future<void> getWalletStatus({required String address}) async {
    try {
      walletStatus = await CoinsClient(dio).getWalletStatus(address: address);
    } catch (e) {
      debugPrint('Error fetching wallet status: $e');
    }
  }

  @action
  Future<void> fetchCardNextPageTransactions({required String address}) async {
    try {
      isLoading = true;
      cardCurrentPage++;
      final newData = await CoinsClient(dio).getTransactions(address: address, page: cardCurrentPage);
      newFetchedData = [];
      newFetchedData.add(newData);
      final existingTransactions = cardHistories[address];
      if (existingTransactions != null && newFetchedData.isNotEmpty) {
        cardHistories[address] = [...existingTransactions, ...newFetchedData];
      } else {
        log('No existing transactions found for address $address');
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> fetchBarNextPageTransactions({required String address}) async {
    try {
      isLoading = true;
      barCurrentPage++;
      final newData = await CoinsClient(dio).getTransactions(address: address, page: barCurrentPage);
      newFetchedBarData = [];
      newFetchedBarData.add(newData);
      final existingTransactions = barHistories[address];
      if (existingTransactions != null && newFetchedBarData.isNotEmpty) {
        barHistories[address] = [...existingTransactions, ...newFetchedBarData];
      } else {
        log('No existing transactions found for address $address');
      }
    } catch (e) {
      log(e.toString());
    } finally {
      isLoading = false;
    }
  }

  @computed
  List<TransactionItem>? get cardsTransactions {
    if (cardHistories[_balanceStore.cards[cardHistoryIndex].address] != null) {
      return cardHistories[_balanceStore.cards[cardHistoryIndex].address]?.expand((item) => item.result).toList();
    }
    return null;
  }

  @computed
  List<TransactionItem>? get barsTransactions {
    if (barHistories[selectedBarAddress] != null) {
      return barHistories[selectedBarAddress]?.expand((item) => item.result).toList();
    }
    return null;
  }

  @computed
  List<String>? get cardUniqueDates {
    return cardsTransactions?.map((transaction) => formatDate(transaction.date.toString())).toSet().toList();
  }

  @computed
  List<String>? get barUniqueDates {
    return barsTransactions?.map((transaction) => formatDate(transaction.date.toString())).toSet().toList();
  }

  @action
  Future<void> setCardHistoryIndex(int index) async {
    cardTransactions.clear();
    cardHistoryIndex = index;
  }

  @action
  Future<void> setBarHistoryIndex(int index) async {
    barTransactions.clear();
    barHistoryIndex = index;
  }

  @action
  Future<void> setCardSelectedAddress(String? value) async {
    selectedCardAddress = value!;
  }

  @action
  Future<void> setBarSelectedAddress(String? value) async {
    selectedBarAddress = value!;
  }

  @action
  Future<void> cardRefresh(String cardAddress) async {
    isCardRefreshing = true;
    historyLoading = true;
    await CoinsClient(dio).patchTransactions(address: cardAddress);
    final now = DateTime.now();
    await _saveLastRefreshed(cardAddress, now.toString());
    var synced = false;
    while (!synced) {
      await Future.delayed(const Duration(milliseconds: 2000));
      await getWalletStatus(address: cardAddress);
      synced = walletStatus?.status == 'synced';
    }
    await loadLastRefreshed();
    await getSingleCardHistory(address: cardAddress);
    isCardRefreshing = false;
    historyLoading = false;
  }

  @action
  Future<void> saveAndPatchCardAddress(String address) async {
    isCardRefreshing = true;
    await CoinsClient(dio).patchTransactions(address: address);
    var synced = false;
    while (!synced) {
      await Future.delayed(const Duration(milliseconds: 2000));
      await getWalletStatus(address: address);
      synced = walletStatus?.status == 'synced';
    }
    final now = DateTime.now();
    await _saveLastRefreshed(address, now.toString());
    await loadLastRefreshed();
    isCardRefreshing = false;
  }

  @action
  Future<void> saveAndPatchBarAddress(String address) async {
    isBarRefreshing = true;
    historyLoading = true;
    await CoinsClient(dio).patchTransactions(address: address);
    var synced = false;
    while (!synced) {
      await Future.delayed(const Duration(milliseconds: 2000));
      await getWalletStatus(address: address);
      synced = walletStatus?.status == 'synced';
    }
    final now = DateTime.now();
    await _saveLastRefreshed(address, now.toString());
    await loadLastRefreshed();
    await Future.delayed(const Duration(milliseconds: 2000));
    historyLoading = false;
    isBarRefreshing = false;
  }

  @action
  Future<void> barRefresh(String cardAddress) async {
    isBarRefreshing = true;
    historyLoading = true;
    final now = DateTime.now();
    await _saveLastRefreshed(cardAddress, now.toString());
    var synced = false;
    await CoinsClient(dio).patchTransactions(address: cardAddress);
    while (!synced) {
      await Future.delayed(const Duration(milliseconds: 2000));
      await getWalletStatus(address: cardAddress);
      synced = walletStatus?.status == 'synced';
    }
    await loadLastRefreshed();
    await getSingleBarHistory(address: cardAddress);
    isBarRefreshing = false;
    historyLoading = false;
  }

  @action
  Future<void> loadLastRefreshed() async {
    final map = await _loadLastRefreshedMap();
    lastRefreshedMap = map;
  }

  @action
  void makeInactive() {
    isButtonDisabled = true;
  }

  @action
  void makeActive() {
    isButtonDisabled = false;
  }

  Future<void> _saveLastRefreshed(String cardAddress, String lastRefreshed) async {
    final prefs = await SharedPreferences.getInstance();
    final map = prefs.getString('lastRefreshedMap') != null
        ? Map<String, String>.from(json.decode(prefs.getString('lastRefreshedMap')!))
        : {};
    map[cardAddress] = lastRefreshed;
    await prefs.setString('lastRefreshedMap', json.encode(map));
  }

  Future<Map<String, String>> _loadLastRefreshedMap() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('lastRefreshedMap') != null
        ? Map<String, String>.from(json.decode(prefs.getString('lastRefreshedMap')!))
        : {};
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 1), (_) async {
      final prefs = await SharedPreferences.getInstance();
      final map = prefs.getString('lastRefreshedMap');
      if (map != null) {
        final decodedMap = json.decode(map);
        final lastRefreshedMap = Map<String, String>.from(decodedMap);
        for (final cardAddress in lastRefreshedMap.keys) {
          final lastRefreshed = lastRefreshedMap[cardAddress];
          if (lastRefreshed != null) {
            final lastRefreshTime = DateTime.parse(lastRefreshed);
            final now = DateTime.now();
            final difference = now.difference(lastRefreshTime);
            if (difference.inHours >= 24) {
              await cardRefresh(cardAddress);
              await barRefresh(cardAddress);
            }
          } else {
            await cardRefresh(cardAddress);
            await barRefresh(cardAddress);
          }
        }
      }
    });
  }

  void dispose() {
    _timer?.cancel();
  }

  String getLastRefreshed(String cardAddress) {
    if (lastRefreshedMap.containsKey(cardAddress)) {
      final lastRefreshTime = DateTime.parse(lastRefreshedMap[cardAddress]!);
      final now = DateTime.now();
      final difference = now.difference(lastRefreshTime);

      if (difference.inDays > 0) {
        return '${difference.inDays}d ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours}h ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes}m ago';
      } else {
        return 'Just now';
      }
    } else {
      return 'Never';
    }
  }
}
