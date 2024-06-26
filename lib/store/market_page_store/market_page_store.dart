import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

import '../../http/repositories/coins_repo.dart';
import '../../models/coins_dto/coin_model.dart';
import '../../models/market_cap_dto/market_cap_dto.dart';

part 'market_page_store.g.dart';

class MarketPageStore = _MarketPageStore with _$MarketPageStore;

abstract class _MarketPageStore with Store {
  _MarketPageStore() {
    getSingleCoin();
  }

  @readonly
  MarketCapDto? _marketCap;

  @observable
  String q = '';

  @observable
  List<CoinResultModel> filteredData = <CoinResultModel>[];

  @observable
  int currentPage = 1;

  @observable
  int displayedItemCount = 0;

  @observable
  int totalItemCount = 0;

  @observable
  bool hasError = false;
  @observable
  bool shouldShowUpButton = false;

  @observable
  bool isSearchVisible = false;

  @observable
  bool isTextFieldVisible = false;

  @observable
  bool isLoading = false;

  @observable
  bool isSearched = false;

  @observable
  CoinModel? allCoins;

  @observable
  CoinModel? singleCoin;

  AnimationController? animationController;

  FocusNode focusNode = FocusNode();

  Future<void> getMarketCap() async {
    _marketCap = await coinStatsRepo.getMarketCap();
  }

  Future<void> getOtherCoins({required int pageNumber}) async {
    allCoins = await coinStatsRepo.getAllCoins(page: pageNumber, limit: 500);
  }

  Future<void> getSingleCoin() async {
    singleCoin = await coinStatsRepo.getAllCoins(page: 1, limit: 1);
  }

  @action
  void initAnimationController(TickerProvider vsync) {
    animationController = AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );
  }

  @action
  void toggleTextFieldVisibility() {
    isTextFieldVisible = !isTextFieldVisible;
    if (isTextFieldVisible) {
      isSearchVisible = !isSearchVisible;
      focusNode.requestFocus();
      animationController?.forward();
    } else {
      animationController?.reverse();
      focusNode.unfocus();
      makeInvisible();
    }
  }

  @action
  Future<void> makeInvisible() async {
    await Future.delayed(const Duration(milliseconds: 200));
    isSearchVisible = !isSearchVisible;
  }

  @computed
  List<CoinResultModel> get searchedList => filteredData
      .where(
        (element) =>
            element.name.toLowerCase().contains(q.trim().toLowerCase()) ||
            element.symbol.toLowerCase().contains(q.trim().toLowerCase()),
      )
      .toList();

  @action
  Future<void> setSearchText(String val) async {
    isSearched = true;
    q = val;
  }

  @action
  Future<void> resetSearch() async {
    q = '';
    isSearched = false;
  }

  @action
  Future<void> loadCoins({bool resetPage = false}) async {
    try {
      isLoading = true;
      hasError = false;
      if (resetPage) {
        currentPage = 1;
      }
      await getOtherCoins(pageNumber: currentPage);
      totalItemCount = allCoins!.meta.itemCount;
      displayedItemCount = allCoins!.result.length;
      filteredData = ObservableList.of(allCoins!.result);
    } catch (e) {
      handleError(e.toString());
    } finally {
      isLoading = false;
    }
  }

  Future<void> onRefresh() async {
    await loadCoins(resetPage: true);
  }

  @action
  Future<void> loadMoreCoins() async {
    if (displayedItemCount >= totalItemCount) {
      return;
    }
    try {
      isSearched = false;
      isLoading = true;
      hasError = false;

      currentPage++;
      await getOtherCoins(pageNumber: currentPage);

      if (allCoins != null) {
        final newCoinsCount = allCoins!.result.length;
        if (newCoinsCount > 0) {
          totalItemCount = allCoins!.meta.itemCount;
          displayedItemCount += newCoinsCount;
          filteredData.addAll(allCoins!.result);
        }
      }
    } catch (e) {
      handleError(e.toString());
    } finally {
      isLoading = false;
    }
  }

  @action
  void handleError(String errorMessage) {
    hasError = true;
    if (kDebugMode) {
      print('Error: $errorMessage');
    }
  }

  @action
  Future<void> toggleShouldShowUpButton({
    bool shouldShowUpButton = false,
  }) async {
    this.shouldShowUpButton = shouldShowUpButton;
  }
}
