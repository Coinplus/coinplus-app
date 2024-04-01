import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'constants/flavor_type.dart';
import 'firebase_options.dart';
import 'providers/get_it.dart';
import 'services/amplitude_service.dart';
import 'utils/secure_storage_utils.dart';
//import 'utils/send_from_wallet.dart';

Future<void> run({Flavor env = Flavor.DEV}) async {
  BackgroundIsolateBinaryMessenger.ensureInitialized(RootIsolateToken.instance!);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  unawaited(
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
  );

  await EasyLocalization.ensureInitialized();
  unawaited(localStorage());
  registerGetIt(env);
  //createTransaction();
  //await StorageUtils.clear();

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en', 'US'),
      ],
      startLocale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      path: 'assets/translations',
      child: const MyApp(),
    ),
  );
}

Future<void> main() async {
  await run();
  await initializeAmplitude();
}
