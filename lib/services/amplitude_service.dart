import 'dart:developer';

import 'package:amplitude_flutter/amplitude.dart';
import 'package:get_it/get_it.dart';

import '../models/amplitude_event/amplitude_event.dart';
import '../providers/flavor_service.dart';

Future<void> initializeAmplitude() async {
  if (GetIt.I<FlavorService>().isProduction) {
    final amplitude = Amplitude.getInstance();
    await amplitude.init('28670e3f0d1eee7f8f7188ef81e670a4');
    log('Amplitude init');
  }
}

Future<void> recordAmplitudeEvent(AmplitudeEvent event) async {
  await Amplitude.getInstance().logEvent(
    event.eventType,
    eventProperties: event.toJson(),
  );
}
