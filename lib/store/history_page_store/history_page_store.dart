import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../http/dio.dart';
import '../../http/interceptors/api_keys.dart';
import '../../http/repositories/coins_repo.dart';
import '../../models/history_model/transaction_model.dart';
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
  int cardHistoryIndex = 0;
  @observable
  int barHistoryIndex = 0;
  @observable
  String cardSelectedAddress = '';
  @observable
  String barSelectedAddress = '';
  @observable
  ObservableMap<String, TransactionModel?> cardHistories = ObservableMap<String, TransactionModel?>();
  @observable
  ObservableMap<String, TransactionModel?> barHistories = ObservableMap<String, TransactionModel?>();
  @observable
  bool historyLoading = false;
  @observable
  ObservableMap<String, TransactionModel?> cardsTransactionCache = <String, TransactionModel?>{}.asObservable();
  @observable
  ObservableMap<String, TransactionModel?> barsTransactionCache = <String, TransactionModel?>{}.asObservable();

  @observable
  ObservableMap<String, bool> disabledButtons = ObservableMap<String, bool>();
  @observable
  TransactionModel? cardTransactions;
  @observable
  TransactionModel? barTransactions;
  @observable
  Map<String, String> lastRefreshedMap = {};
  @observable
  bool isButtonDisabled = false;
  @observable
  bool isRefreshing = false;
  @observable
  int currentPage = 1;

  @action
  Future<void> setRefreshing({required bool value}) async {
    isRefreshing = value;
  }

  TransactionModel? getCardCachedTransaction(String address) => cardsTransactionCache[address];

  TransactionModel? getBarCachedTransaction(String address) => barsTransactionCache[address];

  Future<void> getSingleCardHistory({required String address}) async {
    try {
      historyLoading = true;
      final cachedTransaction = getCardCachedTransaction(address);
      if (cachedTransaction != null) {
        cardTransactions = cachedTransaction;
      } else {
        cardTransactions = await CoinsClient(dio).getTransactions(address: address, page: 1);
        cacheCardsTransaction(address, cardTransactions);
      }
      cardHistories[address] = cardTransactions;
    } catch (e) {
      log(e.toString());
    } finally {
      historyLoading = false;
    }
  }

  Future<void> getSingleBarHistory({required String address}) async {
    try {
      historyLoading = true;
      final cachedTransaction = getBarCachedTransaction(address);
      if (cachedTransaction != null) {
        barTransactions = cachedTransaction;
      } else {
        barTransactions = await CoinsClient(dio).getTransactions(address: address, page: 1);
        cacheBarsTransaction(address, barTransactions);
      }
      barHistories[address] = barTransactions;
    } catch (e) {
      log(e.toString());
    } finally {
      historyLoading = false;
    }
  }

  @action
  Future<void> fetchNextPageTransactions({required String address}) async {
    try {
      // final nextPageTransactions = await CoinsClient(dio).getTransactions(address: address, page: 2);
      final existingTransactions = cardHistories[address];
      if (existingTransactions != null) {
        // cardHistories[address] = existingTransactions.addAll(nextPageTransactions);
      } else {
        log('No existing transactions found for address $address');
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> onCardRefresh({required String address}) async {
    try {
      historyLoading = true;
      cardTransactions = await CoinsClient(dio).getTransactions(address: address, page: 1);
      cacheCardsTransaction(address, cardTransactions);
      cardHistories[address] = cardTransactions;
    } catch (e) {
      log(e.toString());
    } finally {
      historyLoading = false;
    }
  }

  Future<void> onBarRefresh({required String address}) async {
    try {
      historyLoading = true;
      barTransactions = await CoinsClient(dio).getTransactions(address: address, page: 1);
      cacheBarsTransaction(address, barTransactions);
      barHistories[address] = barTransactions;
    } catch (e) {
      log(e.toString());
    } finally {
      historyLoading = false;
    }
  }

  @action
  void cacheCardsTransaction(String address, TransactionModel? transactions) {
    cardsTransactionCache[address] = transactions;
  }

  @action
  void cacheBarsTransaction(String address, TransactionModel? transactions) {
    barsTransactionCache[address] = transactions;
  }

  @action
  Future<void> setCardHistoryIndex(int index) async {
    cardHistoryIndex = index;
  }

  @action
  Future<void> setBarHistoryIndex(int index) async {
    barHistoryIndex = index;
  }

  @action
  Future<void> setCardSelectedAddress(String? value) async {
    cardSelectedAddress = value!;
  }

  @action
  Future<void> setBarSelectedAddress(String? value) async {
    barSelectedAddress = value!;
  }

  @action
  Future<void> refresh(String cardAddress) async {
    final now = DateTime.now();
    await _saveLastRefreshed(cardAddress, now.toString());
    await patchWithAddress(address: cardAddress);
    await Future.delayed(const Duration(milliseconds: 500));
    await loadLastRefreshed();
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
              await refresh(cardAddress);
            }
          } else {
            await refresh(cardAddress);
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

  final Dio _dio = Dio()..interceptors.add(LogInterceptor(responseBody: true));

  Future<void> patchTransactions({required String address}) async {
    final headers = {
      'x-api-key': coinStatsApiKey,
      'Content-Type': 'application/json',
    };
    try {
      await _dio.patch(
        'https://openapiv1.coinstats.app/wallet/transactions?address=$address&connectionId=bitcoin',
        options: Options(headers: headers),
      );
    } catch (e) {
      log('Error occurred while making PATCH request: $e');
    }
  }

  Future<void> patchWithAddress({required String address}) async {
    await patchTransactions(address: address);
  }
}
