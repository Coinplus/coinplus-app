import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/card_color.dart';
import '../../constants/card_type.dart';
import '../../extensions/extensions.dart';
import '../abstract_card/abstract_card.dart';
import '../chain_stats/chain_stats.dart';

part 'bar_model.freezed.dart';
part 'bar_model.g.dart';

@freezed
class BarModel with _$BarModel {
  @Implements<AbstractCard>()
  const factory BarModel({
    required String address,
    @Default(CardColor.SILVER) CardColor color,
    @Default(CardType.BAR) CardType type,
    @Default(WalletType.COINPLUS_WALLET) WalletType label,
    @Default('Coinplus Bitcoin Bar') String name,
    @Default('BTC') String blockchain,
    @JsonKey(fromJson: timeFromJson) @Default('') String createdAt,
    @JsonKey(name: 'chain_stats') ChainStats? data,
  }) = _BarModel;

  factory BarModel.fromJson(Map<String, dynamic> json) => _$BarModelFromJson(json);
}

String timeFromJson(String a) {
  return a.isNotEmpty ? a : DateFormat('dd/MM/yyyy').format(DateTime.now());
}
