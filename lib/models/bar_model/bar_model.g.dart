// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BarModelImpl _$$BarModelImplFromJson(Map json) => _$BarModelImpl(
      address: json['address'] as String,
      color: $enumDecodeNullable(_$CardColorEnumMap, json['color']) ??
          CardColor.SILVER,
      type:
          $enumDecodeNullable(_$CardTypeEnumMap, json['type']) ?? CardType.BAR,
      name: json['name'] as String? ?? 'Coinplus Bitcoin Bar',
      totalReceived: json['totalReceived'] as int?,
      totalSent: json['totalSent'] as int?,
      balance: json['balance'] as int?,
      createdAt: json['createdAt'] == null
          ? ''
          : timeFromJson(json['createdAt'] as String),
      data: json['chain_stats'] == null
          ? null
          : ChainStats.fromJson(
              Map<String, dynamic>.from(json['chain_stats'] as Map)),
      mempoolStats: json['mempool_stats'] == null
          ? null
          : MempoolStats.fromJson(
              Map<String, dynamic>.from(json['mempool_stats'] as Map)),
    );

Map<String, dynamic> _$$BarModelImplToJson(_$BarModelImpl instance) {
  final val = <String, dynamic>{
    'address': instance.address,
    'color': _$CardColorEnumMap[instance.color]!,
    'type': _$CardTypeEnumMap[instance.type]!,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('totalReceived', instance.totalReceived);
  writeNotNull('totalSent', instance.totalSent);
  writeNotNull('balance', instance.balance);
  val['createdAt'] = instance.createdAt;
  writeNotNull('chain_stats', instance.data?.toJson());
  writeNotNull('mempool_stats', instance.mempoolStats?.toJson());
  return val;
}

const _$CardColorEnumMap = {
  CardColor.ORANGE: 'ORANGE',
  CardColor.WHITE: 'WHITE',
  CardColor.BROWN: 'BROWN',
  CardColor.SILVER: 'SILVER',
  CardColor.GOLD: 'GOLD',
};

const _$CardTypeEnumMap = {
  CardType.BAR: 'BAR',
  CardType.CARD: 'CARD',
};
