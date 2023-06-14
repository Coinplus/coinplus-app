// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:flutter_boilerplate/pages/card_fill_page/card_fill_page.dart'
    as _i4;
import 'package:flutter_boilerplate/pages/onboarding_page/onboarding_page.dart'
    as _i5;
import 'package:flutter_boilerplate/pages/qr_page/qr_page.dart' as _i2;
import 'package:flutter_boilerplate/pages/secret_fields_page/secret_fileds_page.dart'
    as _i1;
import 'package:flutter_boilerplate/pages/splash_screen/splash_screen.dart'
    as _i3;

abstract class $Router extends _i6.RootStackRouter {
  $Router({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    SecretFieldsRoute.name: (routeData) {
      final args = routeData.argsAs<SecretFieldsRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.SecretFieldsPage(
          key: args.key,
          qrData: args.qrData,
        ),
      );
    },
    QrScannerRoute.name: (routeData) {
      return _i6.AutoRoutePage<String?>(
        routeData: routeData,
        child: const _i2.QrScannerPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SplashScreenPage(),
      );
    },
    CardFillRoute.name: (routeData) {
      final args = routeData.argsAs<CardFillRouteArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CardFillPage(
          key: args.key,
          receivedData: args.receivedData,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.OnboardingPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.SecretFieldsPage]
class SecretFieldsRoute extends _i6.PageRouteInfo<SecretFieldsRouteArgs> {
  SecretFieldsRoute({
    _i7.Key? key,
    required String qrData,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          SecretFieldsRoute.name,
          args: SecretFieldsRouteArgs(
            key: key,
            qrData: qrData,
          ),
          initialChildren: children,
        );

  static const String name = 'SecretFieldsRoute';

  static const _i6.PageInfo<SecretFieldsRouteArgs> page =
      _i6.PageInfo<SecretFieldsRouteArgs>(name);
}

class SecretFieldsRouteArgs {
  const SecretFieldsRouteArgs({
    this.key,
    required this.qrData,
  });

  final _i7.Key? key;

  final String qrData;

  @override
  String toString() {
    return 'SecretFieldsRouteArgs{key: $key, qrData: $qrData}';
  }
}

/// generated route for
/// [_i2.QrScannerPage]
class QrScannerRoute extends _i6.PageRouteInfo<void> {
  const QrScannerRoute({List<_i6.PageRouteInfo>? children})
      : super(
          QrScannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrScannerRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SplashScreenPage]
class SplashScreenRoute extends _i6.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.CardFillPage]
class CardFillRoute extends _i6.PageRouteInfo<CardFillRouteArgs> {
  CardFillRoute({
    _i7.Key? key,
    required String receivedData,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          CardFillRoute.name,
          args: CardFillRouteArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'CardFillRoute';

  static const _i6.PageInfo<CardFillRouteArgs> page =
      _i6.PageInfo<CardFillRouteArgs>(name);
}

class CardFillRouteArgs {
  const CardFillRouteArgs({
    this.key,
    required this.receivedData,
  });

  final _i7.Key? key;

  final String receivedData;

  @override
  String toString() {
    return 'CardFillRouteArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i5.OnboardingPage]
class OnboardingRoute extends _i6.PageRouteInfo<void> {
  const OnboardingRoute({List<_i6.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
