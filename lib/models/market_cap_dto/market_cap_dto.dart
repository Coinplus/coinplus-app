import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'market_cap_dto.freezed.dart';

part 'market_cap_dto.g.dart';

@freezed
class MarketCapDto with _$MarketCapDto {
  const factory MarketCapDto({
    required double marketCap,
    required double volume,
    required double btcDominance,
    required double marketCapChange,
    required double volumeChange,
    required double btcDominanceChange,
  }) = _MarketCapDto;

  factory MarketCapDto.fromJson(Map<String, dynamic> json) => _$MarketCapDtoFromJson(json);
}
