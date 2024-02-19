// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_cap_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarketCapDtoImpl _$$MarketCapDtoImplFromJson(Map json) => _$MarketCapDtoImpl(
      marketCap: (json['marketCap'] as num).toDouble(),
      volume: (json['volume'] as num).toDouble(),
      btcDominance: (json['btcDominance'] as num).toDouble(),
      marketCapChange: (json['marketCapChange'] as num).toDouble(),
      volumeChange: (json['volumeChange'] as num).toDouble(),
      btcDominanceChange: (json['btcDominanceChange'] as num).toDouble(),
    );

Map<String, dynamic> _$$MarketCapDtoImplToJson(_$MarketCapDtoImpl instance) =>
    <String, dynamic>{
      'marketCap': instance.marketCap,
      'volume': instance.volume,
      'btcDominance': instance.btcDominance,
      'marketCapChange': instance.marketCapChange,
      'volumeChange': instance.volumeChange,
      'btcDominanceChange': instance.btcDominanceChange,
    };
