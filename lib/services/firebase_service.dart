import 'dart:async';
import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../providers/flavor_service.dart';

FlavorService get flavorService => GetIt.I<FlavorService>();

Future<void> signInAnonymously({String? address}) async {
  if (flavorService.isProduction) {
    final auth = FirebaseAuth.instance;
    try {
      try {
        dynamic token;
        final result = await FirebaseFunctions.instance.httpsCallable('getCustomToken').call({
          'uid': address,
        });
        token = result.data as String;
        log('Custom token retrieved: $token');

        await auth.signInWithCustomToken(token);
        log('Sign-in with custom token successful.');
      } on FirebaseFunctionsException catch (error) {
        log('Firebase Functions error: ${error.message}');
        log('Details: ${error.details}');
        log('Stack trace: ${error.stackTrace}');
      } catch (e) {
        log('Error calling Firebase Function: $e');
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-custom-token':
          log('Custom token expired or invalid.');
          break;
        case 'custom-token-mismatch':
          log('The supplied token is for a different Firebase project.');
          break;
        default:
          log('Unknown FirebaseAuth error: ${e.code}');
      }
    } catch (e) {
      log('General error during sign-in: $e');
    }
  }
}

Future<void> signOut() async {
  final auth = FirebaseAuth.instance;
  try {
    await auth.signOut();
    log('Signed out successfully.');
  } catch (e) {
    log('Error signing out: $e');
  }
}
