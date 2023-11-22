import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../bar_model/bar_model.dart';
import '../card_model/card_model.dart';

part 'amplitude_event.freezed.dart';

part 'amplitude_event.g.dart';

@freezed
class AmplitudeEvent with _$AmplitudeEvent {
  const factory AmplitudeEvent.login({
    @Default('LOGIN') String eventType,
  }) = LoginEvent;

  const factory AmplitudeEvent.cardAdded({
    @Default('CARD_ADDED') String eventType,
    required CardModel card,
  }) = CardAddedEvent;

  const factory AmplitudeEvent.barAdded({
    @Default('BAR_ADDED') String eventType,
    required BarModel bar,
  }) = BarAddedEvent;

  factory AmplitudeEvent.fromJson(Map<String, dynamic> json) => _$AmplitudeEventFromJson(json);
}
