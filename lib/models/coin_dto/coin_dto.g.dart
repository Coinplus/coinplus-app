// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoinDto _$$_CoinDtoFromJson(Map json) => _$_CoinDto(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      price: json['price'] as num? ?? 0,
      priceChange1d: json['priceChange1d'] as num? ?? 0,
    );

Map<String, dynamic> _$$_CoinDtoToJson(_$_CoinDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'icon': instance.icon,
      'price': instance.price,
      'priceChange1d': instance.priceChange1d,
    };
