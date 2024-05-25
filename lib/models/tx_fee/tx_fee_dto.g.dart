// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tx_fee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TxFeeDtoImpl _$$TxFeeDtoImplFromJson(Map json) => _$TxFeeDtoImpl(
      fastestFee: json['fastestFee'] as int? ?? 0,
      halfHourFee: json['halfHourFee'] as int? ?? 0,
      hourFee: json['hourFee'] as int? ?? 0,
      economyFee: json['economyFee'] as int? ?? 0,
      minimumFee: json['minimumFee'] as int? ?? 0,
    );

Map<String, dynamic> _$$TxFeeDtoImplToJson(_$TxFeeDtoImpl instance) =>
    <String, dynamic>{
      'fastestFee': instance.fastestFee,
      'halfHourFee': instance.halfHourFee,
      'hourFee': instance.hourFee,
      'economyFee': instance.economyFee,
      'minimumFee': instance.minimumFee,
    };
