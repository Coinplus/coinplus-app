import 'package:json_annotation/json_annotation.dart';

part 'buy_card_model.g.dart';

@JsonSerializable()
class BuyCardModel {
  late String? link;
  late String? price;
  late String? previousPrice;

  BuyCardModel({
    this.link,
    this.price,
    this.previousPrice,
  });

  factory BuyCardModel.fromJson(Map<String, dynamic> json) => _$BuyCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$BuyCardModelToJson(this);
}
