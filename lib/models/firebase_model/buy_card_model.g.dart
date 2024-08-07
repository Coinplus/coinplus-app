// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buy_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuyCardModel _$BuyCardModelFromJson(Map json) => BuyCardModel(
      link: json['link'] as String?,
      price: json['price'] as String?,
    );

Map<String, dynamic> _$BuyCardModelToJson(BuyCardModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('link', instance.link);
  writeNotNull('price', instance.price);
  return val;
}
