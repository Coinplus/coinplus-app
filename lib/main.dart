// ignore_for_file: cascade_invocations

import 'dart:async';

import 'package:amplitude_flutter/amplitude.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'constants/flavor_type.dart';
import 'providers/get_it.dart';
import 'store/wallet_protect_state/wallet_protect_state.dart';

Future<void> run({Flavor env = Flavor.PROD}) async {
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await EasyLocalization.ensureInitialized();
  registerGetIt(env);

  //await StorageUtils.clear();
  await localStorage();

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
  final _walletProtectionState = WalletProtectState();
  final prefs = await SharedPreferences.getInstance();
  final initialValue = prefs.getBool('toggleValue') ?? false;
  _walletProtectionState.appLockToggle = initialValue;
  WidgetsFlutterBinding.ensureInitialized();
  final amplitude = Amplitude.getInstance();
  await amplitude.init('28670e3f0d1eee7f8f7188ef81e670a4');
<<<<<<< Updated upstream
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  // final auth = FirebaseAuth.instanceFor(app: Firebase.app());
  // await auth.signInAnonymously();
  //
  // try {
  //   dynamic token;
  //   try {
  //     final result = await FirebaseFunctions.instance
  //         .httpsCallable('getCustomToken')
  //         .call({
  //       'uid': '14DeGgtQ5BFAzXjvb2UpGrdqygAysLyE5x',
  //       // "additionalClaims": {"premiumAccount": true}
  //     });
  //     token = result.data as String;
  //   } on FirebaseFunctionsException catch (error) {
  //     log(error.code);
  //     log(error.details);
  //     log(error.message.toString());
  //   }
  //   await auth.signInWithCustomToken(token);
  //   log('Sign-in successful.');
  // } on FirebaseAuthException catch (e) {
  //   switch (e.code) {
  //     case 'invalid-custom-token':
  //       log('Custom token expired or invalid.');
  //
  //       break;
  //     case 'custom-token-mismatch':
  //       log('The supplied token is for a different Firebase project.');
  //       break;
  //     default:
  //       log('Unknown error: $e.code');
  //   }
  // }
=======
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final auth = FirebaseAuth.instanceFor(app: Firebase.app());
  await auth.signInAnonymously();

  try {
    dynamic token;
    try {
      final result = await FirebaseFunctions.instance
          .httpsCallable('getCustomToken')
          .call({
        'uid': '14DeGgtQ5BFAzXjvb2UpGrdqygAysLyE5x',
        // "additionalClaims": {"premiumAccount": true}
      });
      token = result.data as String;
    } on FirebaseFunctionsException catch (error) {
      log(error.code);
      log(error.details);
      log(error.message.toString());
    }
    await auth.signInWithCustomToken(token);
    log('Sign-in successful.');
  } on FirebaseAuthException catch (e) {
    switch (e.code) {
      case 'invalid-custom-token':
        log('Custom token expired or invalid.');

        break;
      case 'custom-token-mismatch':
        log('The supplied token is for a different Firebase project.');
        break;
      default:
        log('Unknown error: $e.code');
    }
  }
>>>>>>> Stashed changes
  await run();
}

Future<void> localStorage() async {
  final prefs = await SharedPreferences.getInstance();
  const secureStorage = FlutterSecureStorage();
  if (prefs.getBool('first_run') ?? true) {
    await prefs.setBool('first_run', false);
<<<<<<< Updated upstream
    await secureStorage.write(key: 'pin_code_is_set', value: 'false');
=======
    await secureStorage.deleteAll();
>>>>>>> Stashed changes
  }
}
