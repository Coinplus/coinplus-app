// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bar_model.dart';

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

Map<String, dynamic> _$ChainStatsToJson(ChainStats instance) =>
    <String, dynamic>{
      'funded_txo_count': instance.fundedTxoCount,
      'funded_txo_sum': instance.balance,
      'spent_txo_count': instance.spentTxoCount,
      'spent_txo_sum': instance.spentTxoSum,
      'tx_count': instance.txCount,
    };

MempoolStats _$MempoolStatsFromJson(Map json) => MempoolStats(
      fundedTxoCount: json['funded_txo_count'] as int,
      fundedTxoSum: json['funded_txo_sum'] as int,
      spentTxoCount: json['spent_txo_count'] as int,
      spentTxoSum: json['spent_txo_sum'] as int,
      txCount: json['tx_count'] as int,
    );

Map<String, dynamic> _$MempoolStatsToJson(MempoolStats instance) =>
    <String, dynamic>{
      'funded_txo_count': instance.fundedTxoCount,
      'funded_txo_sum': instance.fundedTxoSum,
      'spent_txo_count': instance.spentTxoCount,
      'spent_txo_sum': instance.spentTxoSum,
      'tx_count': instance.txCount,
    };

_$_BarModel _$$_BarModelFromJson(Map json) => _$_BarModel(
      address: json['address'] as String,
      barColor: $enumDecodeNullable(_$BarColorEnumMap, json['barColor']) ??
          BarColor.SILVER,
      cardType: $enumDecodeNullable(_$CardTypeEnumMap, json['cardType']) ??
          CardType.BAR,
      barName: json['barName'] as String? ?? 'Coinplus Bitcoin Card',
      totalReceived: json['totalReceived'] as int?,
      totalSent: json['totalSent'] as int?,
      balance: json['balance'] as int?,
      cardAddedDate: json['cardAddedDate'] as String? ?? '01/01/2023',
      data: json['chain_stats'] == null
          ? null
          : ChainStats.fromJson(
              Map<String, dynamic>.from(json['chain_stats'] as Map)),
      mempoolStats: json['mempool_stats'] == null
          ? null
          : MempoolStats.fromJson(
              Map<String, dynamic>.from(json['mempool_stats'] as Map)),
    );

Map<String, dynamic> _$$_BarModelToJson(_$_BarModel instance) {
  final val = <String, dynamic>{
    'address': instance.address,
    'barColor': _$BarColorEnumMap[instance.barColor]!,
    'cardType': _$CardTypeEnumMap[instance.cardType]!,
    'barName': instance.barName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('totalReceived', instance.totalReceived);
  writeNotNull('totalSent', instance.totalSent);
  writeNotNull('balance', instance.balance);
  val['cardAddedDate'] = instance.cardAddedDate;
  writeNotNull('chain_stats', instance.data?.toJson());
  writeNotNull('mempool_stats', instance.mempoolStats?.toJson());
  return val;
}

const _$BarColorEnumMap = {
  BarColor.SILVER: 'SILVER',
  BarColor.GOLD: 'GOLD',
};

const _$CardTypeEnumMap = {
  CardType.BAR: 'BAR',
  CardType.CARD: 'CARD',
};
