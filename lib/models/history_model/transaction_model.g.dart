// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(Map json) => _$TransactionModelImpl(
      result: (json['result'] as List<dynamic>)
          .map((e) => TransactionItem.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
      meta: Meta.fromJson(Map<String, dynamic>.from(json['meta'] as Map)),
    );

Map<String, dynamic> _$$TransactionModelImplToJson(_$TransactionModelImpl instance) => <String, dynamic>{
      'result': instance.result.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };

_$TransactionItemImpl _$$TransactionItemImplFromJson(Map json) => _$TransactionItemImpl(
      type: json['type'] as String?,
      date: json['date'] as String?,
      mainContent: json['mainContent'] == null
          ? null
          : MainContent.fromJson(Map<String, dynamic>.from(json['mainContent'] as Map)),
      coinData: json['coinData'] == null ? null : CoinData.fromJson(Map<String, dynamic>.from(json['coinData'] as Map)),
      profitLoss:
          json['profitLoss'] == null ? null : ProfitLoss.fromJson(Map<String, dynamic>.from(json['profitLoss'] as Map)),
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => Transaction.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$TransactionItemImplToJson(_$TransactionItemImpl instance) => <String, dynamic>{
      if (instance.type case final value?) 'type': value,
      if (instance.date case final value?) 'date': value,
      if (instance.mainContent?.toJson() case final value?) 'mainContent': value,
      if (instance.coinData?.toJson() case final value?) 'coinData': value,
      if (instance.profitLoss?.toJson() case final value?) 'profitLoss': value,
      if (instance.transactions?.map((e) => e.toJson()).toList() case final value?) 'transactions': value,
    };

_$MainContentImpl _$$MainContentImplFromJson(Map json) => _$MainContentImpl(
      coinIcons: (json['coinIcons'] as List<dynamic>).map((e) => e as String).toList(),
      coinAssets: json['coinAssets'] as List<dynamic>,
    );

Map<String, dynamic> _$$MainContentImplToJson(_$MainContentImpl instance) => <String, dynamic>{
      'coinIcons': instance.coinIcons,
      'coinAssets': instance.coinAssets,
    };

_$CoinDataImpl _$$CoinDataImplFromJson(Map json) => _$CoinDataImpl(
      count: (json['count'] as num).toDouble(),
      symbol: json['symbol'] as String,
      currentValue: (json['currentValue'] as num).toDouble(),
    );

Map<String, dynamic> _$$CoinDataImplToJson(_$CoinDataImpl instance) => <String, dynamic>{
      'count': instance.count,
      'symbol': instance.symbol,
      'currentValue': instance.currentValue,
    };

_$ProfitLossImpl _$$ProfitLossImplFromJson(Map json) => _$ProfitLossImpl(
      profit: (json['profit'] as num).toDouble(),
      profitPercent: (json['profitPercent'] as num).toDouble(),
      currentValue: (json['currentValue'] as num).toDouble(),
    );

Map<String, dynamic> _$$ProfitLossImplToJson(_$ProfitLossImpl instance) => <String, dynamic>{
      'profit': instance.profit,
      'profitPercent': instance.profitPercent,
      'currentValue': instance.currentValue,
    };

_$TransactionImpl _$$TransactionImplFromJson(Map json) => _$TransactionImpl(
      action: json['action'] as String,
      items: (json['items'] as List<dynamic>).map((e) => Item.fromJson(Map<String, dynamic>.from(e as Map))).toList(),
    );

Map<String, dynamic> _$$TransactionImplToJson(_$TransactionImpl instance) => <String, dynamic>{
      'action': instance.action,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

_$ItemImpl _$$ItemImplFromJson(Map json) => _$ItemImpl(
      id: json['id'] as String,
      count: (json['count'] as num).toDouble(),
      totalWorth: (json['totalWorth'] as num).toDouble(),
      coin: Coin.fromJson(Map<String, dynamic>.from(json['coin'] as Map)),
    );

Map<String, dynamic> _$$ItemImplToJson(_$ItemImpl instance) => <String, dynamic>{
      'id': instance.id,
      'count': instance.count,
      'totalWorth': instance.totalWorth,
      'coin': instance.coin.toJson(),
    };

_$CoinImpl _$$CoinImplFromJson(Map json) => _$CoinImpl(
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$$CoinImplToJson(_$CoinImpl instance) => <String, dynamic>{
      'name': instance.name,
      'symbol': instance.symbol,
      'icon': instance.icon,
    };

_$MetaImpl _$$MetaImplFromJson(Map json) => _$MetaImpl(
      page: (json['page'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$$MetaImplToJson(_$MetaImpl instance) => <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
