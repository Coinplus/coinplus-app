import 'package:flutter/cupertino.dart';

import 'constants/flavor_type.dart';
import 'main.dart' as app;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await app.run(env: Flavor.PROD);
}
