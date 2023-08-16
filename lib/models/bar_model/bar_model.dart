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
    int? totalReceived,
    int? totalSent,
    int? balance,
  }) = _BarModel;

  factory BarModel.fromJson(Map<String, dynamic> json) =>
      _$BarModelFromJson(json);
}
