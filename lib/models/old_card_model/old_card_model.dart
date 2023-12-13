import 'package:json_annotation/json_annotation.dart';

part 'old_card_model.g.dart';

@JsonSerializable()
class OldCardModel {
  final String? address;
  final String? nfcId;
  final String? type;

  OldCardModel({
    this.address,
    this.nfcId,
    this.type,
  });

  factory OldCardModel.fromJson(Map<String, dynamic> json) => _$OldCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$OldCardModelToJson(this);
}
