import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_dto.freezed.dart';

part 'coin_dto.g.dart';

@freezed
class CoinDto with _$CoinDto {
  const factory CoinDto({
    required String id,
    required String symbol,
    required String name,
    required String image,
    @JsonKey(
      name: 'current_price',
      defaultValue: 0,
    )
    required num currentPrice,
    @JsonKey(
      name: 'price_change_24h',
      defaultValue: 0,
    )
    required num priceChangePercentage_24h,
    @JsonKey(
      name: 'high_24h',
      defaultValue: 0,
    )
    required num high24h,
    @JsonKey(
      name: 'low_24h',
      defaultValue: 0,
    )
    required num low24h,
  }) = _CoinDto;

  factory CoinDto.fromJson(Map<String, dynamic> json) =>
      _$CoinDtoFromJson(json);
}
