// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CoinDto _$$_CoinDtoFromJson(Map json) => _$_CoinDto(
      coins: (json['coins'] as List<dynamic>)
          .map((e) => Coin.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_CoinDtoToJson(_$_CoinDto instance) =>
    <String, dynamic>{
      'coins': instance.coins.map((e) => e.toJson()).toList(),
    };

_$_Coin _$$_CoinFromJson(Map json) => _$_Coin(
      id: json['id'] as String,
      icon: json['icon'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      price: (json['price'] as num).toDouble(),
      priceChange1d: (json['priceChange1d'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_CoinToJson(_$_Coin instance) => <String, dynamic>{
      'id': instance.id,
      'icon': instance.icon,
      'name': instance.name,
      'symbol': instance.symbol,
      'price': instance.price,
      'priceChange1d': instance.priceChange1d,
    };
