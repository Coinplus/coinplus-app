import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/card_color.dart';
import '../../constants/card_type.dart';
import '../../extensions/extensions.dart';

part 'card_model.freezed.dart';
part 'card_model.g.dart';

@freezed
class CardModel with _$CardModel {
  static final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  const factory CardModel({
    required String address,
    @Default(CardColor.ORANGE) CardColor cardColor,
    @Default(CardType.CARD) CardType cardType,
    @Default('Coinplus Bitcoin Card') String cardName,
    int? totalReceived,
    int? totalSent,
    int? balance,
    @Default('01/01/2023') String cardAddedDate,
  }) = _CardModel;

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);

  factory CardModel.withCurrentDate({
    required String address,
    CardColor cardColor = CardColor.ORANGE,
    CardType cardType = CardType.CARD,
    String cardName = 'Coinplus Bitcoin Card',
    int? totalReceived,
    int? totalSent,
    int? balance,
  }) {
    final currentDate = _dateFormat.format(DateTime.now());
    return CardModel(
      address: address,
      cardColor: cardColor,
      cardType: cardType,
      cardName: cardName,
      totalReceived: totalReceived,
      totalSent: totalSent,
      balance: balance,
      cardAddedDate: currentDate,
    );
  }
}
