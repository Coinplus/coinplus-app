import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

import 'main.dart' as app;

Future<void> main() async {
  await app.run();

  await initDeepLinkHandling();
}

Future<void> initDeepLinkHandling() async {
  // Check if the app was opened via a deep link
  String? initialLink;
  try {
    initialLink = await getInitialLink();
  } on PlatformException {
    initialLink = null;
  }

  // Handle the initial link or any subsequent links
  handleDeepLink(initialLink! as Uri);
  listenForDeepLinks();
}

void handleDeepLink(Uri uri) {
  if (uri.path == 'air.coinplus.com') {
    // Handle the deep link or custom URL scheme
    log('Deep link received: $uri');
    // Add your custom logic here to handle the link and navigate accordingly
  }
}

void listenForDeepLinks() {
  // Listen for any subsequent deep links or custom URL schemes
  uriLinkStream.listen((uri) {
    if (uri != null) {
      // Handle the deep link or custom URL scheme
      final link = uri.toString();
      handleDeepLink(link as Uri);
    }
  }, onError: (err) {
    log('Error listening to deep link: $err');
  },);
}
