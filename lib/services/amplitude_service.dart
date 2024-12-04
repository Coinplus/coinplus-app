import 'package:amplitude_flutter/amplitude.dart';
import 'package:amplitude_flutter/configuration.dart';
import 'package:amplitude_flutter/events/base_event.dart';
import 'package:amplitude_flutter/events/identify.dart';
import 'package:amplitude_flutter/tracking_options.dart';
import 'package:get_it/get_it.dart';

import '../http/interceptors/api_keys.dart';
import '../models/amplitude_event/amplitude_event_part_one/amplitude_event.dart';
import '../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../models/amplitude_user_property_model/amplitude_user_property_model.dart';
import '../providers/flavor_service.dart';

final trackingOptions = TrackingOptions(
  appSetId: false,
  adid: false,
);

final amplitude = Amplitude(
  Configuration(
    trackingOptions: trackingOptions,
    apiKey: amplitudeApiKey,
  ),
);

Future<void> initializeAmplitude() async {
  if (GetIt.I<FlavorService>().isProduction) {
    await amplitude.isBuilt;
  }
}

Future<void> recordAmplitudeEvent(AmplitudeEvent event) async {
  await amplitude.track(
    BaseEvent(
      event.eventType,
      eventProperties: event.toJson(),
    ),
  );
}

Future<void> recordAmplitudeEventPartTwo(AmplitudeEventPartTwo event) async {
  await amplitude.track(
    BaseEvent(
      event.eventType,
      eventProperties: event.toJson(),
    ),
  );
}

Future<void> recordUserProperty(IdentifyModel identification) async {
  final identify = Identify();
  final properties = identification.toJson();
  final filteredProperties = Map<String, dynamic>.from(properties)..removeWhere((key, value) => key == 'runtimeType');
  for (final entry in filteredProperties.entries) {
    identify.set(entry.key, entry.value);
  }
  await amplitude.identify(identify);
}

Future<void> deleteIdentifyProperties(IdentifyModel identification) async {
  final identify = Identify();
  final properties = identification.toJson();
  properties.keys.forEach(identify.unset);
  await amplitude.identify(identify);
}
