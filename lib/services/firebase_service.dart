import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

import '../providers/flavor_service.dart';

FlavorService get flavorService => GetIt.I<FlavorService>();

Future<void> signInAnonymously() async {
  if (flavorService.isProduction) {
    final auth = FirebaseAuth.instance;
    try {
      await auth.signInAnonymously();
      log('Anonymous sign-in successful.');
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
