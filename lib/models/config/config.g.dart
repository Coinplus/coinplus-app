// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConfigImpl _$$ConfigImplFromJson(Map json) => _$ConfigImpl(
      env: $enumDecode(_$FlavorEnumMap, json['env']),
      production: json['production'] as bool,
      apiUrl: json['apiUrl'] as String,
      coinsUrl: json['coinsUrl'] as String,
      mempool: json['mempool'] as String,
      utxoUrl: json['utxoUrl'] as String,
    );

Map<String, dynamic> _$$ConfigImplToJson(_$ConfigImpl instance) =>
    <String, dynamic>{
      'env': _$FlavorEnumMap[instance.env]!,
      'production': instance.production,
      'apiUrl': instance.apiUrl,
      'coinsUrl': instance.coinsUrl,
      'mempool': instance.mempool,
      'utxoUrl': instance.utxoUrl,
    };

const _$FlavorEnumMap = {
  Flavor.PROD: 'PROD',
  Flavor.DEV: 'DEV',
};
