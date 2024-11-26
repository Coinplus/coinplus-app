// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardModelImpl _$$CardModelImplFromJson(Map json) => _$CardModelImpl(
      address: json['address'] as String,
      finalBalance: json['final_balance'] as num?,
      totalReceived: (json['total_received'] as num?)?.toInt(),
      color: $enumDecodeNullable(_$CardColorEnumMap, json['color']) ?? CardColor.ORANGE,
      type: $enumDecodeNullable(_$CardTypeEnumMap, json['type']) ?? CardType.CARD,
      label: $enumDecodeNullable(_$WalletTypeEnumMap, json['label']) ?? WalletType.COINPLUS_WALLET,
      name: json['name'] as String? ?? 'Coinplus Bitcoin Card',
      blockchain: json['blockchain'] as String? ?? 'BTC',
      isBackup: json['isBackup'] as bool? ?? false,
      hasBackedUp: json['hasBackedUp'] as bool? ?? false,
      createdAt: json['createdAt'] == null ? '' : timeFromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$$CardModelImplToJson(_$CardModelImpl instance) => <String, dynamic>{
      'address': instance.address,
      if (instance.finalBalance case final value?) 'final_balance': value,
      if (instance.totalReceived case final value?) 'total_received': value,
      'color': _$CardColorEnumMap[instance.color]!,
      'type': _$CardTypeEnumMap[instance.type]!,
      'label': _$WalletTypeEnumMap[instance.label]!,
      'name': instance.name,
      'blockchain': instance.blockchain,
      'isBackup': instance.isBackup,
      'hasBackedUp': instance.hasBackedUp,
      'createdAt': instance.createdAt,
    };

const _$CardColorEnumMap = {
  CardColor.ORANGE: 'ORANGE',
  CardColor.WHITE: 'WHITE',
  CardColor.BLACK: 'BLACK',
  CardColor.BACKUP: 'BACKUP',
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
