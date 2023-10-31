import 'package:json_annotation/json_annotation.dart';

part 'chain_stats.g.dart';

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

  Map<String, dynamic> toJson() =>
      _$ChainStatsToJson(this);
}
