import 'package:json_annotation/json_annotation.dart';

part 'mempool_stats.g.dart';

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
