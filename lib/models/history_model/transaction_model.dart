import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_model.freezed.dart';
part 'transaction_model.g.dart';

@freezed
abstract class TransactionModel with _$TransactionModel {
  factory TransactionModel({
    required List<TransactionItem> result,
  }) = _TransactionModel;

  factory TransactionModel.fromJson(Map<String, dynamic> json) => _$TransactionModelFromJson(json);
}

@freezed
abstract class TransactionItem with _$TransactionItem {
  factory TransactionItem({
    required String? type,
    required String? date,
    required MainContent? mainContent,
    required CoinData? coinData,
    required ProfitLoss? profitLoss,
    required List<Transaction>? transactions,
  }) = _TransactionItem;

  factory TransactionItem.fromJson(Map<String, dynamic> json) => _$TransactionItemFromJson(json);
}

@freezed
abstract class MainContent with _$MainContent {
  factory MainContent({
    required List<String> coinIcons,
    required List<dynamic> coinAssets,
  }) = _MainContent;

  factory MainContent.fromJson(Map<String, dynamic> json) => _$MainContentFromJson(json);
}

@freezed
abstract class CoinData with _$CoinData {
  factory CoinData({
    required double count,
    required String symbol,
    required double currentValue,
  }) = _CoinData;

  factory CoinData.fromJson(Map<String, dynamic> json) => _$CoinDataFromJson(json);
}

@freezed
abstract class ProfitLoss with _$ProfitLoss {
  factory ProfitLoss({
    required double profit,
    required double profitPercent,
    required double currentValue,
  }) = _ProfitLoss;

  factory ProfitLoss.fromJson(Map<String, dynamic> json) => _$ProfitLossFromJson(json);
}

@freezed
abstract class Transaction with _$Transaction {
  factory Transaction({
    required String action,
    required List<Item> items,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
}

@freezed
abstract class Item with _$Item {
  factory Item({
    required String id,
    required double count,
    required double totalWorth,
    required Coin coin,
  }) = _Item;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
}

@freezed
abstract class Coin with _$Coin {
  factory Coin({
    required String name,
    required String symbol,
    required String icon,
  }) = _Coin;

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);
}
