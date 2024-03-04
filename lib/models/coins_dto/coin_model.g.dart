// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CoinModelImpl _$$CoinModelImplFromJson(Map json) => _$CoinModelImpl(
      result: (json['result'] as List<dynamic>)
          .map((e) => CoinResultModel.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      meta: Meta.fromJson(Map<String, dynamic>.from(json['meta'] as Map)),
    );

Map<String, dynamic> _$$CoinModelImplToJson(_$CoinModelImpl instance) => <String, dynamic>{
      'result': instance.result.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };

_$CoinResultModelImpl _$$CoinResultModelImplFromJson(Map json) => _$CoinResultModelImpl(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      name: json['name'] as String,
      icon: json['icon'] as String,
      price: json['price'] as num? ?? 0,
      priceChange1d: json['priceChange1d'] as num? ?? 0,
      marketCap: json['marketCap'] as num? ?? 0,
      rank: json['rank'] as num? ?? 0,
    );

Map<String, dynamic> _$$CoinResultModelImplToJson(_$CoinResultModelImpl instance) => <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'icon': instance.icon,
      'price': instance.price,
      'priceChange1d': instance.priceChange1d,
      'marketCap': instance.marketCap,
      'rank': instance.rank,
    };

_$MetaImpl _$$MetaImplFromJson(Map json) => _$MetaImpl(
      page: json['page'] as int,
      limit: json['limit'] as int,
      itemCount: json['itemCount'] as int,
      pageCount: json['pageCount'] as int,
      hasPreviousPage: json['hasPreviousPage'] as bool,
      hasNextPage: json['hasNextPage'] as bool,
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) => <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
      'itemCount': instance.itemCount,
      'pageCount': instance.pageCount,
      'hasPreviousPage': instance.hasPreviousPage,
      'hasNextPage': instance.hasNextPage,
    };
