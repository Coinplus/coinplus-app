import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/card_color.dart';
import '../../constants/card_type.dart';
import '../../extensions/extensions.dart';
import '../abstract_card/abstract_card.dart';

part 'card_model.freezed.dart';

part 'card_model.g.dart';

@freezed
class CardModel with _$CardModel {
  @Implements<AbstractCard>()
  const factory CardModel({
    required String address,
    @JsonKey(name: 'final_balance') num? finalBalance,
    @JsonKey(name: 'total_received') int? totalReceived,
    @Default(CardColor.ORANGE) CardColor color,
    @Default(CardType.CARD) CardType type,
    @Default(WalletType.COINPLUS_WALLET) WalletType label,
    @Default('Coinplus Bitcoin Card') String name,
    @Default('BTC') String blockchain,
    @JsonKey(fromJson: timeFromJson) @Default('') String createdAt,
  }) = _CardModel;

  factory CardModel.fromJson(Map<String, dynamic> json) =>
      _$CardModelFromJson(json);
}

String timeFromJson(String a) {
  return a.isNotEmpty ? a : DateFormat('dd/MM/yyyy').format(DateTime.now());
}
