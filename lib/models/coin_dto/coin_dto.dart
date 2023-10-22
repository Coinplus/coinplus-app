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
    required String icon,
    @JsonKey(
      name: 'price',
      defaultValue: 0,
    )
    required num price,
    @JsonKey(
      name: 'priceChange1d',
      defaultValue: 0,
    )
    required num priceChange1d,
  }) = _CoinDto;

  factory CoinDto.fromJson(Map<String, dynamic> json) =>
      _$CoinDtoFromJson(json);
}
