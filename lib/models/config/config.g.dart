// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Config _$$_ConfigFromJson(Map json) => _$_Config(
      env: $enumDecode(_$FlavorEnumMap, json['env']),
      production: json['production'] as bool,
      apiUrl: json['apiUrl'] as String,
      coinsUrl: json['coinsUrl'] as String,
    );

Map<String, dynamic> _$$_ConfigToJson(_$_Config instance) => <String, dynamic>{
      'env': _$FlavorEnumMap[instance.env]!,
      'production': instance.production,
      'apiUrl': instance.apiUrl,
      'coinsUrl': instance.coinsUrl,
    };

const _$FlavorEnumMap = {
  Flavor.PROD: 'PROD',
};
