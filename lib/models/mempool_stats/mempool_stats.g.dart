// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mempool_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MempoolStats _$MempoolStatsFromJson(Map json) => MempoolStats(
      fundedTxoCount: json['funded_txo_count'] as int,
      fundedTxoSum: json['funded_txo_sum'] as int,
      spentTxoCount: json['spent_txo_count'] as int,
      spentTxoSum: json['spent_txo_sum'] as int,
      txCount: json['tx_count'] as int,
    );

Map<String, dynamic> _$MempoolStatsToJson(MempoolStats instance) => <String, dynamic>{
      'funded_txo_count': instance.fundedTxoCount,
      'funded_txo_sum': instance.fundedTxoSum,
      'spent_txo_count': instance.spentTxoCount,
      'spent_txo_sum': instance.spentTxoSum,
      'tx_count': instance.txCount,
    };
