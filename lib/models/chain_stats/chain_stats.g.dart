// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chain_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChainStats _$ChainStatsFromJson(Map json) => ChainStats(
      balance: json['funded_txo_sum'] as int,
      fundedTxoCount: json['funded_txo_count'] as int,
      spentTxoCount: json['spent_txo_count'] as int,
      spentTxoSum: json['spent_txo_sum'] as int,
      txCount: json['tx_count'] as int,
    );

Map<String, dynamic> _$ChainStatsToJson(ChainStats instance) => <String, dynamic>{
      'funded_txo_count': instance.fundedTxoCount,
      'funded_txo_sum': instance.balance,
      'spent_txo_count': instance.spentTxoCount,
      'spent_txo_sum': instance.spentTxoSum,
      'tx_count': instance.txCount,
    };
