import 'dart:async';

import 'constants/flavor_type.dart';
import 'main.dart' as app;
import 'services/amplitude_service.dart';

Future<void> main() async {
  await app.run(env: Flavor.PROD);
  await initializeAmplitude();
}
