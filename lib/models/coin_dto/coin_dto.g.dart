// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoinDto _$$_CoinDtoFromJson(Map json) => _$_CoinDto(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      image: json['image'] as String,
      currentPrice: json['current_price'] as num? ?? 0,
      priceChange24h: json['price_change_24h'] as num? ?? 0,
      priceChangePercentage_24h:
          json['price_change_percentage_24h'] as num? ?? 0,
      high24h: json['high_24h'] as num? ?? 0,
      low24h: json['low_24h'] as num? ?? 0,
    );

Map<String, dynamic> _$$_CoinDtoToJson(_$_CoinDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'current_price': instance.currentPrice,
      'price_change_24h': instance.priceChange24h,
      'price_change_percentage_24h': instance.priceChangePercentage_24h,
      'high_24h': instance.high24h,
      'low_24h': instance.low24h,
    };
