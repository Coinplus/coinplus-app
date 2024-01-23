import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/card_color.dart';
import '../../constants/card_type.dart';
import '../../extensions/extensions.dart';
import '../abstract_card/abstract_card.dart';
import '../chain_stats/chain_stats.dart';
import '../mempool_stats/mempool_stats.dart';

part 'card_model.freezed.dart';

part 'card_model.g.dart';

@freezed
class CardModel with _$CardModel {
  @Implements<AbstractCard>()
  const factory CardModel({
    required String address,
    @Default(CardColor.ORANGE) CardColor color,
    @Default(CardType.CARD) CardType type,
    @Default(WalletType.COINPLUS_WALLET) WalletType label,
    @Default('Coinplus Bitcoin Card') String name,
    @Default('BTC') String blockchain,
    int? totalReceived,
    int? totalSent,
    int? balance,
    @JsonKey(fromJson: timeFromJson) @Default('') String createdAt,
    @JsonKey(name: 'chain_stats') ChainStats? data,
    @JsonKey(name: 'mempool_stats') MempoolStats? mempoolStats,
  }) = _CardModel;

  factory CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);
}

String timeFromJson(String a) {
  return a.isNotEmpty ? a : DateFormat('dd/MM/yyyy').format(DateTime.now());
}
