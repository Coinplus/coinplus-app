// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_firebase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardsModel _$CardsModelFromJson(Map json) => CardsModel(
      activated: json['activated'] as bool?,
      activationCount: (json['activationCount'] as num?)?.toInt(),
      activationFailureCount: (json['activationFailureCount'] as num?)?.toInt(),
      address: json['address'] as String?,
      approved: json['approved'] as bool?,
      barcodeId: json['barcodeId'] as String?,
      color: json['color'] as String?,
      connected: (json['connected'] as num?)?.toInt(),
      deleted: (json['deleted'] as num?)?.toInt(),
      email: json['email'] as String?,
      s: (json['s'] as num?)?.toInt(),
      hasBackup: json['hasBackup'] as bool?,
      backup: json['backup'] as bool?,
      nfcId: json['nfcId'] as String?,
      possibleOldCard: json['possibleOldCard'] as bool?,
      lost: json['lost'] as bool?,
      replenished: json['replenished'] as bool?,
      replenishmentHistory:
          (json['replenishmentHistory'] as List<dynamic>?)?.map((e) => Map<String, dynamic>.from(e as Map)).toList(),
      type: json['type'] as String?,
      verificationFailureCount: (json['verificationFailureCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CardsModelToJson(CardsModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('activated', instance.activated);
  writeNotNull('activationCount', instance.activationCount);
  writeNotNull('activationFailureCount', instance.activationFailureCount);
  writeNotNull('address', instance.address);
  writeNotNull('approved', instance.approved);
  writeNotNull('barcodeId', instance.barcodeId);
  writeNotNull('color', instance.color);
  writeNotNull('connected', instance.connected);
  writeNotNull('deleted', instance.deleted);
  writeNotNull('s', instance.s);
  writeNotNull('email', instance.email);
  writeNotNull('hasBackup', instance.hasBackup);
  writeNotNull('backup', instance.backup);
  writeNotNull('nfcId', instance.nfcId);
  writeNotNull('possibleOldCard', instance.possibleOldCard);
  writeNotNull('replenished', instance.replenished);
  writeNotNull('lost', instance.lost);
  writeNotNull('replenishmentHistory', instance.replenishmentHistory);
  writeNotNull('type', instance.type);
  writeNotNull('verificationFailureCount', instance.verificationFailureCount);
  return val;
}
