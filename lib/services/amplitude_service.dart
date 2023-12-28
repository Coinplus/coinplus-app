import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/identify.dart';
import 'package:get_it/get_it.dart';

import '../models/amplitude_event/amplitude_event.dart';
import '../models/amplitude_user_property_model/amplitude_user_property_model.dart';
import '../providers/flavor_service.dart';

Future<void> initializeAmplitude() async {
  if (GetIt.I<FlavorService>().isProduction) {
    final amplitude = Amplitude.getInstance();
    await amplitude.init('28670e3f0d1eee7f8f7188ef81e670a4');
  }
}

Future<void> recordAmplitudeEvent(AmplitudeEvent event) async {
  await Amplitude.getInstance().logEvent(
    event.eventType,
    eventProperties: event.toJson(),
  );
}

Future<void> recordUserProperty(IdentifyModel identification) async {
  final identify = Identify();
  final properties = identification.toJson();
  final filteredProperties = Map<String, dynamic>.from(properties)..removeWhere((key, value) => key == 'runtimeType');
  for (final entry in filteredProperties.entries) {
    identify.set(entry.key, entry.value);
  }
  await Amplitude.getInstance().identify(identify);
}

Future<void> deleteIdentifyProperties(IdentifyModel identification) async {
  final identify = Identify();
  final properties = identification.toJson();
  properties.keys.forEach(identify.unset);
  await Amplitude.getInstance().identify(identify);
}
