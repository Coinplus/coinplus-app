// import 'dart:async';
// import 'dart:developer';
//
// import 'package:cloud_functions/cloud_functions.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:get_it/get_it.dart';
//
// import '../models/amplitude_event/amplitude_event.dart';
// import '../providers/flavor_service.dart';
// import 'amplitude_service.dart';
//
// FlavorService get flavorService => GetIt.I<FlavorService>();
//
// Future<void> signInAnonymously({String? address}) async {
//   if (flavorService.isProduction) {
//     final auth = FirebaseAuth.instance;
//     await auth.signInAnonymously();
//     unawaited(recordAmplitudeEvent(const LoginEvent()));
//
//     try {
//       dynamic token;
//       try {
//         final result = await FirebaseFunctions.instance.httpsCallable('getCustomToken').call({
//           'uid': '$address',
//           // "additionalClaims": {"premiumAccount": true}
//         });
//         token = result.data as String;
//       } on FirebaseFunctionsException catch (error) {
//         log(error.code);
//         log(error.details);
//         log(error.message.toString());
//       }
//       await auth.signInWithCustomToken(token);
//       log('Sign-in successful.');
//     } on FirebaseAuthException catch (e) {
//       switch (e.code) {
//         case 'invalid-custom-token':
//           log('Custom token expired or invalid.');
//
//           break;
//         case 'custom-token-mismatch':
//           log('The supplied token is for a different Firebase project.');
//           break;
//         default:
//           log('Unknown error: $e.code');
//       }
//     }
//   }
// }
//
// Future<void> signOut() async {
//   final auth = FirebaseAuth.instance;
//
//   try{
//     await auth.signOut();
//     log('Signed Out');
//   } catch (e) {
//     log(e.toString());
//   }
// }
