import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'utxo_model.freezed.dart';
part 'utxo_model.g.dart';

@freezed
class UtxoModel with _$UtxoModel {
  const factory UtxoModel({
    @JsonKey(name: 'tx_hash_big_endian') required String txHashBigEndian,
    @JsonKey(name: 'tx_hash') required String txHash,
    @JsonKey(name: 'tx_output_n') required int txOutputN,
    required String script,
    required int value,
    @JsonKey(name: 'value_hex') required String valueHex,
    required int confirmations,
    @JsonKey(name: 'tx_index') required int txIndex,
  }) = _UtxoModel;

  factory UtxoModel.fromJson(Map<String, dynamic> json) => _$UtxoModelFromJson(json);
}

@freezed
class Status with _$Status {
  const factory Status({
    required String notice,
    @JsonKey(name: 'unspent_outputs') required List<UtxoModel> unspentOutputs,
  }) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
}
