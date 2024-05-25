import 'package:freezed_annotation/freezed_annotation.dart';

part 'tx_fee_dto.freezed.dart';

part 'tx_fee_dto.g.dart';

@freezed
class TxFeeDto with _$TxFeeDto {
  const factory TxFeeDto({
    @Default(0) int fastestFee,
    @Default(0) int halfHourFee,
    @Default(0) int hourFee,
    @Default(0) int economyFee,
    @Default(0) int minimumFee,
  }) = _TxFeeDto;

  factory TxFeeDto.fromJson(Map<String, dynamic> json) =>
      _$TxFeeDtoFromJson(json);
}
