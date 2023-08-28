// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CardModel _$$_CardModelFromJson(Map json) => _$_CardModel(
      address: json['address'] as String,
      cardColor: $enumDecodeNullable(_$CardColorEnumMap, json['cardColor']) ??
          CardColor.ORANGE,
      cardType: $enumDecodeNullable(_$CardTypeEnumMap, json['cardType']) ??
          CardType.CARD,
      cardName: json['cardName'] as String? ?? 'Coinplus Bitcoin Card',
      totalReceived: json['totalReceived'] as int?,
      totalSent: json['totalSent'] as int?,
      balance: json['balance'] as int?,
      cardAddedDate: json['cardAddedDate'] as String? ?? '01/01/2023',
    );

Map<String, dynamic> _$$_CardModelToJson(_$_CardModel instance) {
  final val = <String, dynamic>{
    'address': instance.address,
    'cardColor': _$CardColorEnumMap[instance.cardColor]!,
    'cardType': _$CardTypeEnumMap[instance.cardType]!,
    'cardName': instance.cardName,
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
  return val;
}

const _$CardColorEnumMap = {
  CardColor.ORANGE: 'ORANGE',
  CardColor.WHITE: 'WHITE',
  CardColor.BROWN: 'BROWN',
};

const _$CardTypeEnumMap = {
  CardType.BAR: 'BAR',
  CardType.CARD: 'CARD',
};
