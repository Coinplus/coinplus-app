import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'amplitude_event_part_three.freezed.dart';

part 'amplitude_event_part_three.g.dart';

@freezed
class AmplitudeEventPartThree with _$AmplitudeEventPartThree {

  const factory AmplitudeEventPartThree.continueClicked({
    @Default('CONTINUE_CLICKED') String eventType,
    required String walletAddress,
    required String walletType,
  }) = ContinueCLicked;

  factory AmplitudeEventPartThree.fromJson(Map<String, dynamic> json) => _$AmplitudeEventPartThreeFromJson(json);
}