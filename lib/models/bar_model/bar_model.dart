import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/bar_color.dart';
import '../../constants/card_type.dart';

part 'bar_model.freezed.dart';
part 'bar_model.g.dart';

@freezed
class BarModel with _$BarModel {
  const factory BarModel({
    required String address,
    @Default(BarColor.SILVER) BarColor barColor,
    @Default(CardType.BAR) CardType cardType,
    @Default('Coinplus Bitcoin Card') String barName,
    int? totalReceived,
    int? totalSent,
    int? balance,
    @Default('01/01/2023') String cardAddedDate,
    @JsonKey(name: 'chain_stats') ChainStats? data,
    @JsonKey(name: 'mempool_stats') MempoolStats? mempoolStats,
  }) = _BarModel;

  factory BarModel.fromJson(Map<String, dynamic> json) =>
      _$BarModelFromJson(json);
}

@JsonSerializable()
class ChainStats {
  @JsonKey(name: 'funded_txo_count')
  final int fundedTxoCount;

  @JsonKey(name: 'funded_txo_sum')
  final int balance;

  @JsonKey(name: 'spent_txo_count')
  final int spentTxoCount;

  @JsonKey(name: 'spent_txo_sum')
  final int spentTxoSum;

  @JsonKey(name: 'tx_count')
  final int txCount;

  ChainStats({
    required this.balance,
    required this.fundedTxoCount,
    required this.spentTxoCount,
    required this.spentTxoSum,
    required this.txCount,
  });

  factory ChainStats.fromJson(Map<String, dynamic> json) =>
      _$ChainStatsFromJson(json);

  Map<String, dynamic> toJson() => _$ChainStatsToJson(this);
}

@JsonSerializable()
class MempoolStats {
  @JsonKey(name: 'funded_txo_count')
  final int fundedTxoCount;

  @JsonKey(name: 'funded_txo_sum')
  final int fundedTxoSum;

  @JsonKey(name: 'spent_txo_count')
  final int spentTxoCount;

  @JsonKey(name: 'spent_txo_sum')
  final int spentTxoSum;

  @JsonKey(name: 'tx_count')
  final int txCount;

  MempoolStats({
    required this.fundedTxoCount,
    required this.fundedTxoSum,
    required this.spentTxoCount,
    required this.spentTxoSum,
    required this.txCount,
  });

  factory MempoolStats.fromJson(Map<String, dynamic> json) =>
      _$MempoolStatsFromJson(json);

  Map<String, dynamic> toJson() => _$MempoolStatsToJson(this);
}
