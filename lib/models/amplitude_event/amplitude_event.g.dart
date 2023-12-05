// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'amplitude_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginEventImpl _$$LoginEventImplFromJson(Map json) => _$LoginEventImpl(
      eventType: json['eventType'] as String? ?? 'LOGIN',
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LoginEventImplToJson(_$LoginEventImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'runtimeType': instance.$type,
    };

_$CardAddedEventImpl _$$CardAddedEventImplFromJson(Map json) => _$CardAddedEventImpl(
      eventType: json['eventType'] as String? ?? 'CARD_ADDED',
      card: CardModel.fromJson(Map<String, dynamic>.from(json['card'] as Map)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$CardAddedEventImplToJson(_$CardAddedEventImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'card': instance.card.toJson(),
      'runtimeType': instance.$type,
    };

_$BarAddedEventImpl _$$BarAddedEventImplFromJson(Map json) => _$BarAddedEventImpl(
      eventType: json['eventType'] as String? ?? 'BAR_ADDED',
      bar: BarModel.fromJson(Map<String, dynamic>.from(json['bar'] as Map)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$BarAddedEventImplToJson(_$BarAddedEventImpl instance) => <String, dynamic>{
      'eventType': instance.eventType,
      'bar': instance.bar.toJson(),
      'runtimeType': instance.$type,
    };
