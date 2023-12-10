import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app.dart';
import 'constants/flavor_type.dart';
import 'firebase_options.dart';
import 'providers/get_it.dart';
import 'services/amplitude_service.dart';
import 'utils/secure_storage_utils.dart';

Future<void> run({Flavor env = Flavor.PROD}) async {
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await EasyLocalization.ensureInitialized();
  await localStorage();
  registerGetIt(env);

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
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
  await initializeAmplitude();
  await FlutterBranchSdk.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await run();
}
