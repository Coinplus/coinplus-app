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

Map<String, dynamic> _$OldCardModelToJson(OldCardModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('address', instance.address);
  writeNotNull('nfcId', instance.nfcId);
  writeNotNull('type', instance.type);
  return val;
}
