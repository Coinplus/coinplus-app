// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_firebase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardsModel _$CardsModelFromJson(Map json) => CardsModel(
      activation: json['activation'] as String?,
      activationCount: json['activationCount'] as String?,
      activationFailureCount: json['activationFailureCount'] as String?,
      address: json['address'] as String?,
      approved: json['approved'] as bool?,
      barcodeId: json['barcodeId'] as int?,
      color: json['color'] as String?,
      connected: json['connected'] as int?,
      email: json['email'] as String?,
      nfcId: json['nfcId'] as String?,
      possibleOldCard: json['possibleOldCard'] as bool?,
      replenished: json['replenished'] as List<dynamic>?,
      type: json['type'] as String?,
      verificationFailureCount: json['verificationFailureCount'] as int?,
    );

Map<String, dynamic> _$CardsModelToJson(CardsModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('activation', instance.activation);
  writeNotNull('activationCount', instance.activationCount);
  writeNotNull('activationFailureCount', instance.activationFailureCount);
  writeNotNull('address', instance.address);
  writeNotNull('approved', instance.approved);
  writeNotNull('barcodeId', instance.barcodeId);
  writeNotNull('color', instance.color);
  writeNotNull('connected', instance.connected);
  writeNotNull('email', instance.email);
  writeNotNull('nfcId', instance.nfcId);
  writeNotNull('possibleOldCard', instance.possibleOldCard);
  writeNotNull('replenished', instance.replenished);
  writeNotNull('type', instance.type);
  writeNotNull('verificationFailureCount', instance.verificationFailureCount);
  return val;
}
