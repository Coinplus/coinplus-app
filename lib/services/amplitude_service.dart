import 'package:amplitude_flutter/amplitude.dart';

import '../models/amplitude_event/amplitude_event.dart';

Future<void> initializeAmplitude() async {
  final amplitude = Amplitude.getInstance();
  await amplitude.init('28670e3f0d1eee7f8f7188ef81e670a4');
}

Future<void> recordAmplitudeEvent(AmplitudeEvent event) async {
  await Amplitude.getInstance().logEvent(
    event.eventType,
    eventProperties: event.toJson(),
  );
}
