import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';

import '../providers/flavor_service.dart';
import '../store/all_settings_state/all_settings_state.dart';
import '../utils/page_controller_manager.dart';

FlavorService get flavorService => GetIt.I<FlavorService>();

final _pageController = PageControllerManager().pageController;

final _allSettingsState = AllSettingsState();

Future<void> signInAnonymously() async {
  final auth = FirebaseAuth.instance;
  try {
    await auth.signInAnonymously();
  } catch (e) {
    log('General error during sign-in: $e');
  }
}

Future<void> initNotifications() async {
  await FirebaseMessaging.instance.requestPermission();
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    if (message.data['page'] == 'Wallet') {
      _pageController.jumpToPage(0);
      _allSettingsState.updateIndex(0);
    } else if (message.data['page'] == 'Market') {
      _pageController.jumpToPage(1);
      _allSettingsState.updateIndex(1);
    } else if (message.data['page'] == 'History') {
      _pageController.jumpToPage(2);
      _allSettingsState.updateIndex(2);
    } else if (message.data['page'] == 'Settings') {
      _pageController.jumpToPage(3);
      _allSettingsState.updateIndex(3);
    }
  });
}
