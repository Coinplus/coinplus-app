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
  final String? email;
  final String? nfcId;
  final bool? possibleOldCard;
  late bool? replenished;
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
    this.nfcId,
    this.possibleOldCard,
    this.replenished,
    this.replenishmentHistory,
    this.type,
    this.verificationFailureCount,
  });

  factory CardsModel.fromJson(Map<String, dynamic> json) =>
      _$CardsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardsModelToJson(this);
}
