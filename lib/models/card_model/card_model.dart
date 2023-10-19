import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/card_color.dart';
import '../../constants/card_type.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';

@freezed
class CardModel with _$CardModel {
  const factory CardModel({
    required String address,
    @Default(CardColor.ORANGE) CardColor cardColor,
    @Default(CardType.CARD) CardType cardType,
    @Default('Coinplus Bitcoin Card') String cardName,
    int? totalReceived,
    int? totalSent,
    int? balance,
    @Default('01/01/2023') String cardAddedDate,
    @JsonKey(name: 'chain_stats') ChainStats? data,
    @JsonKey(name: 'mempool_stats') MempoolStats? mempoolStats,
  }) = _CardModel;

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
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

  Map<String, dynamic> toJson() => _$ChainStatsToJson(this); // Define toJson method
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
