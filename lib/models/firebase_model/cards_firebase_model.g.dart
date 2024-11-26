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
      backupPack: json['backupPack'] as bool?,
      backup: json['backup'] as bool?,
      nfcId: json['nfcId'] as String?,
      possibleOldCard: json['possibleOldCard'] as bool?,
      primaryWalletAddress: json['primaryWalletAddress'] as String?,
      primaryWalletColor: json['primaryWalletColor'] as String?,
      lost: json['lost'] as bool?,
      replenished: json['replenished'] as bool?,
      replenishmentHistory:
          (json['replenishmentHistory'] as List<dynamic>?)?.map((e) => Map<String, dynamic>.from(e as Map)).toList(),
      type: json['type'] as String?,
      verificationFailureCount: (json['verificationFailureCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CardsModelToJson(CardsModel instance) => <String, dynamic>{
      if (instance.activated case final value?) 'activated': value,
      if (instance.activationCount case final value?) 'activationCount': value,
      if (instance.activationFailureCount case final value?) 'activationFailureCount': value,
      if (instance.address case final value?) 'address': value,
      if (instance.approved case final value?) 'approved': value,
      if (instance.barcodeId case final value?) 'barcodeId': value,
      if (instance.color case final value?) 'color': value,
      if (instance.connected case final value?) 'connected': value,
      if (instance.deleted case final value?) 'deleted': value,
      if (instance.s case final value?) 's': value,
      if (instance.email case final value?) 'email': value,
      if (instance.backupPack case final value?) 'backupPack': value,
      if (instance.hasBackup case final value?) 'hasBackup': value,
      if (instance.backup case final value?) 'backup': value,
      if (instance.nfcId case final value?) 'nfcId': value,
      if (instance.possibleOldCard case final value?) 'possibleOldCard': value,
      if (instance.replenished case final value?) 'replenished': value,
      if (instance.primaryWalletAddress case final value?) 'primaryWalletAddress': value,
      if (instance.primaryWalletColor case final value?) 'primaryWalletColor': value,
      if (instance.lost case final value?) 'lost': value,
      if (instance.replenishmentHistory case final value?) 'replenishmentHistory': value,
      if (instance.type case final value?) 'type': value,
      if (instance.verificationFailureCount case final value?) 'verificationFailureCount': value,
    };
