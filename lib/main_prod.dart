import 'dart:async';

import 'main.dart' as app;
import 'services/amplitude_service.dart';

Future<void> main() async {
  await app.run();
  unawaited(initializeAmplitude());
}
