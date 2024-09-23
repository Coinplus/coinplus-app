// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eth_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EthCardModelImpl _$$EthCardModelImplFromJson(Map json) => _$EthCardModelImpl(
      address: json['address'] as String,
      finalBalance: (json['amount'] as num?)?.toInt(),
      totalReceived: (json['rank'] as num?)?.toInt(),
      color: $enumDecodeNullable(_$CardColorEnumMap, json['color']) ??
          CardColor.ORANGE,
      type:
          $enumDecodeNullable(_$CardTypeEnumMap, json['type']) ?? CardType.CARD,
      name: json['name'] as String? ?? 'Coinplus Ethereum Card',
      label: $enumDecodeNullable(_$WalletTypeEnumMap, json['label']) ??
          WalletType.COINPLUS_WALLET,
      blockchain: json['blockchain'] as String? ?? 'ETH',
      createdAt: json['createdAt'] == null
          ? ''
          : timeFromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$$EthCardModelImplToJson(_$EthCardModelImpl instance) {
  final val = <String, dynamic>{
    'address': instance.address,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('amount', instance.finalBalance);
  writeNotNull('rank', instance.totalReceived);
  val['color'] = _$CardColorEnumMap[instance.color]!;
  val['type'] = _$CardTypeEnumMap[instance.type]!;
  val['name'] = instance.name;
  val['label'] = _$WalletTypeEnumMap[instance.label]!;
  val['blockchain'] = instance.blockchain;
  val['createdAt'] = instance.createdAt;
  return val;
}

const _$CardColorEnumMap = {
  CardColor.ORANGE: 'ORANGE',
  CardColor.WHITE: 'WHITE',
  CardColor.BLACK: 'BLACK',
  CardColor.TRACKER: 'TRACKER',
  CardColor.SILVER: 'SILVER',
  CardColor.GOLD: 'GOLD',
  CardColor.ETHEREUM: 'ETHEREUM',
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
