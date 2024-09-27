import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'coin_model.freezed.dart';

part 'coin_model.g.dart';

@freezed
class CoinModel with _$CoinModel {
  const factory CoinModel({
    required List<CoinResultModel> result,
    required Meta meta,
  }) = _CoinModel;

  factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);
}

@freezed
class UniqueCoinModel with _$UniqueCoinModel {
  const factory UniqueCoinModel({
    required CoinResultModel result,
  }) = _UniqueCoinModel;

  factory UniqueCoinModel.fromJson(Map<String, dynamic> json) {
    return UniqueCoinModel(
      result: CoinResultModel.fromJson(json),
    );
  }
}

@freezed
class CoinResultModel with _$CoinResultModel {
  const factory CoinResultModel({
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
    @JsonKey(
      name: 'marketCap',
      defaultValue: 0,
    )
    required num marketCap,
    @JsonKey(
      name: 'rank',
      defaultValue: 0,
    )
    required num rank,
    @JsonKey(
      name: 'volume',
      defaultValue: 0,
    )
    required num volume,
    @JsonKey(
      name: 'availableSupply',
      defaultValue: 0,
    )
    required num availableSupply,
    @JsonKey(
      name: 'totalSupply',
      defaultValue: 0,
    )
    required num totalSupply,
  }) = _CoinResultModel;

  factory CoinResultModel.fromJson(Map<String, dynamic> json) =>
      _$CoinResultModelFromJson(json);
}

@freezed
class Meta with _$Meta {
  const factory Meta({
    required int page,
    required int limit,
    required int itemCount,
    required int pageCount,
    required bool hasPreviousPage,
    required bool hasNextPage,
  }) = _Meta;

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
