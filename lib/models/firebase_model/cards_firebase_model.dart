import 'package:json_annotation/json_annotation.dart';

part 'cards_firebase_model.g.dart';

@JsonSerializable()
class CardsModel {
  final String? activation;
  final String? activationCount;
  final String? activationFailureCount;
  final String? address;
  final bool? approved;
  final int? barcodeId;
  final String? color;
  final int? connected;
  final String? email;
  final String? nfcId;
  final bool? possibleOldCard;
  final List<dynamic>? replenished;
  final String? type;
  final int? verificationFailureCount;

  CardsModel({
    this.activation,
    this.activationCount,
    this.activationFailureCount,
    this.address,
    this.approved,
    this.barcodeId,
    this.color,
    this.connected,
    this.email,
    this.nfcId,
    this.possibleOldCard,
    this.replenished,
    this.type,
    this.verificationFailureCount,
  });

  factory CardsModel.fromJson(Map<String, dynamic> json) => _$CardsModelFromJson(json);

  Map<String, dynamic> toJson() => _$CardsModelToJson(this);
}
