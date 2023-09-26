import 'dart:async';
import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:get_it/get_it.dart';

import 'providers/flavor_service.dart';
import 'providers/screen_service.dart';
import 'router.dart';
import 'themes/light_theme.dart';
import 'utils/btc_validation.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();


  }
  @override
  void dispose() {
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextHeightBehavior(
      textHeightBehavior: const TextHeightBehavior(
        leadingDistribution: TextLeadingDistribution.even,
      ),
      child: MaterialApp.router(
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: !GetIt.I<FlavorService>().isProduction,
        theme: lightTheme,
        routerDelegate: router.delegate(
          navigatorObservers: () => [
            // analyticsService.observer,
          ],
        ),
        routeInformationParser: router.defaultRouteParser(),
      ),
    );
  }
}
