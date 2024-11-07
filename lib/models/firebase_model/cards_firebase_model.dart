import 'package:json_annotation/json_annotation.dart';

part 'cards_firebase_model.g.dart';

@JsonSerializable()
class CardsModel {
  late bool? activated;
  late int? activationCount;
  late int? activationFailureCount;
  final String? address;
  final bool? approved;
  final String? barcodeId;
  final String? color;
  late int? connected;
  late int? deleted;
  late int? s;
  final String? email;
  final bool? hasBackup;
  late bool? backup;
  final String? nfcId;
  final bool? possibleOldCard;
  late bool? replenished;
  late bool? lost;
  late List<Map<String, dynamic>>? replenishmentHistory;
  final String? type;
  late int? verificationFailureCount;

  CardsModel({
    this.activated,
    this.activationCount,
    this.activationFailureCount,
    this.address,
    this.approved,
    this.barcodeId,
    this.color,
    this.connected,
    this.deleted,
    this.email,
    this.s,
    this.hasBackup,
    this.backup,
    this.nfcId,
    this.possibleOldCard,
    this.lost,
    this.replenished,
    this.replenishmentHistory,
    this.type,
    this.verificationFailureCount,
  });

  factory CardsModel.fromJson(Map<String, dynamic> json) => _$CardsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardsModelToJson(this);
}
