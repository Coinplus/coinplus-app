// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tx_fee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TxFeeDtoImpl _$$TxFeeDtoImplFromJson(Map json) => _$TxFeeDtoImpl(
      fastestFee: (json['fastestFee'] as num?)?.toInt() ?? 0,
      halfHourFee: (json['halfHourFee'] as num?)?.toInt() ?? 0,
      hourFee: (json['hourFee'] as num?)?.toInt() ?? 0,
      economyFee: (json['economyFee'] as num?)?.toInt() ?? 0,
      minimumFee: (json['minimumFee'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$TxFeeDtoImplToJson(_$TxFeeDtoImpl instance) =>
    <String, dynamic>{
      'fastestFee': instance.fastestFee,
      'halfHourFee': instance.halfHourFee,
      'hourFee': instance.hourFee,
      'economyFee': instance.economyFee,
      'minimumFee': instance.minimumFee,
    };
