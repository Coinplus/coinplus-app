// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'old_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OldCardModel _$OldCardModelFromJson(Map json) => OldCardModel(
      address: json['address'] as String?,
      nfcId: json['nfcId'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$OldCardModelToJson(OldCardModel instance) => <String, dynamic>{
      if (instance.address case final value?) 'address': value,
      if (instance.nfcId case final value?) 'nfcId': value,
      if (instance.type case final value?) 'type': value,
    };
