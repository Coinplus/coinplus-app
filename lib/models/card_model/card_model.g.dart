// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardModelImpl _$$CardModelImplFromJson(Map json) => _$CardModelImpl(
      address: json['address'] as String,
      color: $enumDecodeNullable(_$CardColorEnumMap, json['color']) ?? CardColor.ORANGE,
      type: $enumDecodeNullable(_$CardTypeEnumMap, json['type']) ?? CardType.CARD,
      label: $enumDecodeNullable(_$WalletTypeEnumMap, json['label']) ?? WalletType.COINPLUS_WALLET,
      name: json['name'] as String? ?? 'Coinplus Bitcoin Card',
      blockchain: json['blockchain'] as String? ?? 'BTC',
      totalReceived: json['totalReceived'] as int?,
      totalSent: json['totalSent'] as int?,
      balance: json['balance'] as int?,
      createdAt: json['createdAt'] == null ? '' : timeFromJson(json['createdAt'] as String),
      data: json['chain_stats'] == null
          ? null
          : ChainStats.fromJson(Map<String, dynamic>.from(json['chain_stats'] as Map)),
      mempoolStats: json['mempool_stats'] == null
          ? null
          : MempoolStats.fromJson(Map<String, dynamic>.from(json['mempool_stats'] as Map)),
    );

Map<String, dynamic> _$$CardModelImplToJson(_$CardModelImpl instance) {
  final val = <String, dynamic>{
    'address': instance.address,
    'color': _$CardColorEnumMap[instance.color]!,
    'type': _$CardTypeEnumMap[instance.type]!,
    'label': _$WalletTypeEnumMap[instance.label]!,
    'name': instance.name,
    'blockchain': instance.blockchain,
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
  CardColor.BLACK: 'BLACK',
  CardColor.TRACKER: 'TRACKER',
  CardColor.SILVER: 'SILVER',
  CardColor.GOLD: 'GOLD',
};

const _$CardTypeEnumMap = {
  CardType.BAR: 'BAR',
  CardType.CARD: 'CARD',
};

const _$WalletTypeEnumMap = {
  WalletType.COINPLUS_WALLET: 'COINPLUS_WALLET',
  WalletType.TRACKER: 'TRACKER',
  WalletType.TRACKER_PLUS: 'TRACKER_PLUS',
};
