// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BarModel _$$_BarModelFromJson(Map json) => _$_BarModel(
      address: json['address'] as String,
      barColor: $enumDecodeNullable(_$BarColorEnumMap, json['barColor']) ??
          BarColor.SILVER,
      cardType: $enumDecodeNullable(_$CardTypeEnumMap, json['cardType']) ??
          CardType.BAR,
      totalReceived: json['totalReceived'] as int?,
      totalSent: json['totalSent'] as int?,
      balance: json['balance'] as int?,
    );

Map<String, dynamic> _$$_BarModelToJson(_$_BarModel instance) {
  final val = <String, dynamic>{
    'address': instance.address,
    'barColor': _$BarColorEnumMap[instance.barColor]!,
    'cardType': _$CardTypeEnumMap[instance.cardType]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('totalReceived', instance.totalReceived);
  writeNotNull('totalSent', instance.totalSent);
  writeNotNull('balance', instance.balance);
  return val;
}

const _$BarColorEnumMap = {
  BarColor.SILVER: 'SILVER',
};

const _$CardTypeEnumMap = {
  CardType.BAR: 'BAR',
  CardType.CARD: 'CARD',
};
