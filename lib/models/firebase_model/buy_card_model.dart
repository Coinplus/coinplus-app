import 'package:json_annotation/json_annotation.dart';

part 'buy_card_model.g.dart';

@JsonSerializable()
class BuyCardModel {
  late String? link;
  late String? price;

  BuyCardModel({
    this.link,
    this.price,
  });

  factory BuyCardModel.fromJson(Map<String, dynamic> json) => _$BuyCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$BuyCardModelToJson(this);
}
