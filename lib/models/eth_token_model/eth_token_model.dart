import 'package:freezed_annotation/freezed_annotation.dart';

part 'eth_token_model.freezed.dart';
part 'eth_token_model.g.dart';

@freezed
class TokenBalanceResponse with _$TokenBalanceResponse {
  const factory TokenBalanceResponse({
    required String blockchain,
    required List<TokenBalance> balances,
  }) = _TokenBalanceResponse;

  factory TokenBalanceResponse.fromJson(Map<String, dynamic> json) => _$TokenBalanceResponseFromJson(json);
}

@freezed
class TokenBalance with _$TokenBalance {
  const factory TokenBalance({
    required String coinId,
    required double amount,
    required String chain,
    required String name,
    required String symbol,
    required double price,
    required double priceBtc,
    required String imgUrl,
    required double pCh24h,
    required int rank,
    required double volume,
  }) = _TokenBalance;

  factory TokenBalance.fromJson(Map<String, dynamic> json) => _$TokenBalanceFromJson(json);
}
