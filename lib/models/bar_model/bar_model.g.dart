// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BarModelImpl _$$BarModelImplFromJson(Map json) => _$BarModelImpl(
      address: json['address'] as String,
      finalBalance: (json['final_balance'] as num?)?.toInt(),
      totalReceived: (json['total_received'] as num?)?.toInt(),
      color: $enumDecodeNullable(_$CardColorEnumMap, json['color']) ??
          CardColor.SILVER,
      type:
          $enumDecodeNullable(_$CardTypeEnumMap, json['type']) ?? CardType.BAR,
      label: $enumDecodeNullable(_$WalletTypeEnumMap, json['label']) ??
          WalletType.COINPLUS_WALLET,
      name: json['name'] as String? ?? 'Coinplus Bitcoin Bar',
      blockchain: json['blockchain'] as String? ?? 'BTC',
      isBackup: json['isBackup'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? ''
          : timeFromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$$BarModelImplToJson(_$BarModelImpl instance) {
  final val = <String, dynamic>{
    'address': instance.address,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('final_balance', instance.finalBalance);
  writeNotNull('total_received', instance.totalReceived);
  val['color'] = _$CardColorEnumMap[instance.color]!;
  val['type'] = _$CardTypeEnumMap[instance.type]!;
  val['label'] = _$WalletTypeEnumMap[instance.label]!;
  val['name'] = instance.name;
  val['blockchain'] = instance.blockchain;
  val['isBackup'] = instance.isBackup;
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
