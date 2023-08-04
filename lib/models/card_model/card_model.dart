import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/card_color.dart';
import '../../constants/card_type.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';

@freezed
class CardModel with _$CardModel {
  const factory CardModel({
    required String address,
    @Default(CardColor.ORANGE) CardColor cardColor,
    @Default(CardType.CARD) CardType cardType,
    int? totalReceived,
    int? totalSent,
    int? balance,
  }) = _CardModel;

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
}
