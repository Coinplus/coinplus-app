import 'package:freezed_annotation/freezed_annotation.dart';

import '../../constants/bar_color.dart';
import '../../constants/card_type.dart';

part 'bar_model.freezed.dart';
part 'bar_model.g.dart';

@freezed
class BarModel with _$BarModel {
  const factory BarModel({
    required String address,
    @Default(BarColor.SILVER) BarColor barColor,
    @Default(CardType.BAR) CardType cardType,
    @Default('Coinplus Bitcoin Bar') String barName,
    int? totalReceived,
    int? totalSent,
    int? balance,
    @Default('01/01/2023') String cardAddedDate,
  }) = _BarModel;

  factory BarModel.fromJson(Map<String, dynamic> json) =>
      _$BarModelFromJson(json);
}
