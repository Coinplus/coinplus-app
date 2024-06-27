// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utxo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UtxoModelImpl _$$UtxoModelImplFromJson(Map json) => _$UtxoModelImpl(
      txHashBigEndian: json['tx_hash_big_endian'] as String,
      txHash: json['tx_hash'] as String,
      txOutputN: (json['tx_output_n'] as num).toInt(),
      script: json['script'] as String,
      value: (json['value'] as num).toInt(),
      valueHex: json['value_hex'] as String,
      confirmations: (json['confirmations'] as num).toInt(),
      txIndex: (json['tx_index'] as num).toInt(),
    );

Map<String, dynamic> _$$UtxoModelImplToJson(_$UtxoModelImpl instance) =>
    <String, dynamic>{
      'tx_hash_big_endian': instance.txHashBigEndian,
      'tx_hash': instance.txHash,
      'tx_output_n': instance.txOutputN,
      'script': instance.script,
      'value': instance.value,
      'value_hex': instance.valueHex,
      'confirmations': instance.confirmations,
      'tx_index': instance.txIndex,
    };

_$StatusImpl _$$StatusImplFromJson(Map json) => _$StatusImpl(
      notice: json['notice'] as String,
      unspentOutputs: (json['unspent_outputs'] as List<dynamic>)
          .map((e) => UtxoModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$StatusImplToJson(_$StatusImpl instance) =>
    <String, dynamic>{
      'notice': instance.notice,
      'unspent_outputs':
          instance.unspentOutputs.map((e) => e.toJson()).toList(),
    };
