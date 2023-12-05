import 'dart:async';
import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/amplitude_event/amplitude_event.dart';
import 'amplitude_service.dart';

Future<void> signInAnonymously({String? address}) async {
  final auth = FirebaseAuth.instance;
  await auth.signInAnonymously();
  unawaited(recordAmplitudeEvent(const LoginEvent()));

  try {
    dynamic token;
    try {
      final result = await FirebaseFunctions.instance.httpsCallable('getCustomToken').call({
        'uid': '$address',
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
}
