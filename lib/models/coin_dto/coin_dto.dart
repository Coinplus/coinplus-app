import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_dto.freezed.dart';

part 'coin_dto.g.dart';

@freezed
class CoinDto with _$CoinDto {
  const factory CoinDto({
    required List<Coin> coins,
  }) = _CoinDto;

  factory CoinDto.fromJson(Map<String, dynamic> json) =>
      _$CoinDtoFromJson(json);
}

@freezed
class Coin with _$Coin {
  const factory Coin({
    required String id,
    required String icon,
    required String name,
    required String symbol,
    required double price,
    @JsonKey(name: 'priceChange1d', defaultValue: 0)
    required double priceChange1d,
  }) = _Coin;

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);
}
