// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:coinplus/models/card_model/card_model.dart' as _i12;
import 'package:coinplus/pages/bar_fill_page/bar_fill_page.dart' as _i1;
import 'package:coinplus/pages/card_fill_page/card_fill_page.dart' as _i2;
import 'package:coinplus/pages/card_settings_page/card_settings_page.dart'
    as _i3;
import 'package:coinplus/pages/dashboard/dashboard.dart' as _i4;
import 'package:coinplus/pages/onboarding_page/onboarding_page.dart' as _i5;
import 'package:coinplus/pages/qr_page/qr_page.dart' as _i6;
import 'package:coinplus/pages/splash_screen/splash_screen.dart' as _i7;
import 'package:coinplus/pages/wallet_protection_page/wallet_protection_page.dart'
    as _i8;
import 'package:flutter/cupertino.dart' as _i10;
import 'package:flutter/material.dart' as _i11;

abstract class $Router extends _i9.RootStackRouter {
  $Router({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    BarFillRoute.name: (routeData) {
      final args = routeData.argsAs<BarFillRouteArgs>(
          orElse: () => const BarFillRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BarFillPage(
          key: args.key,
          receivedData: args.receivedData,
        ),
      );
    },
    CardFillRoute.name: (routeData) {
      final args = routeData.argsAs<CardFillRouteArgs>(
          orElse: () => const CardFillRouteArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CardFillPage(
          key: args.key,
          receivedData: args.receivedData,
        ),
      );
    },
    CardSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<CardSettingsRouteArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.CardSettingsPage(
          key: args.key,
          card: args.card,
        ),
      );
    },
    Dashboard.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.Dashboard(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.OnboardingPage(),
      );
    },
    QrScannerRoute.name: (routeData) {
      return _i9.AutoRoutePage<String?>(
        routeData: routeData,
        child: const _i6.QrScannerPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreenPage(),
      );
    },
    WalletProtectionRoute.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.WalletProtectionPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BarFillPage]
class BarFillRoute extends _i9.PageRouteInfo<BarFillRouteArgs> {
  BarFillRoute({
    _i10.Key? key,
    String? receivedData,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          BarFillRoute.name,
          args: BarFillRouteArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'BarFillRoute';

  static const _i9.PageInfo<BarFillRouteArgs> page =
      _i9.PageInfo<BarFillRouteArgs>(name);
}

class BarFillRouteArgs {
  const BarFillRouteArgs({
    this.key,
    this.receivedData,
  });

  final _i10.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'BarFillRouteArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i2.CardFillPage]
class CardFillRoute extends _i9.PageRouteInfo<CardFillRouteArgs> {
  CardFillRoute({
    _i10.Key? key,
    String? receivedData,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          CardFillRoute.name,
          args: CardFillRouteArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'CardFillRoute';

  static const _i9.PageInfo<CardFillRouteArgs> page =
      _i9.PageInfo<CardFillRouteArgs>(name);
}

class CardFillRouteArgs {
  const CardFillRouteArgs({
    this.key,
    this.receivedData,
  });

  final _i10.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'CardFillRouteArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i3.CardSettingsPage]
class CardSettingsRoute extends _i9.PageRouteInfo<CardSettingsRouteArgs> {
  CardSettingsRoute({
    _i11.Key? key,
    required _i12.CardModel card,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          CardSettingsRoute.name,
          args: CardSettingsRouteArgs(
            key: key,
            card: card,
          ),
          initialChildren: children,
        );

  static const String name = 'CardSettingsRoute';

  static const _i9.PageInfo<CardSettingsRouteArgs> page =
      _i9.PageInfo<CardSettingsRouteArgs>(name);
}

class CardSettingsRouteArgs {
  const CardSettingsRouteArgs({
    this.key,
    required this.card,
  });

  final _i11.Key? key;

  final _i12.CardModel card;

  @override
  String toString() {
    return 'CardSettingsRouteArgs{key: $key, card: $card}';
  }
}

/// generated route for
/// [_i4.Dashboard]
class Dashboard extends _i9.PageRouteInfo<void> {
  const Dashboard({List<_i9.PageRouteInfo>? children})
      : super(
          Dashboard.name,
          initialChildren: children,
        );

  static const String name = 'Dashboard';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OnboardingPage]
class OnboardingRoute extends _i9.PageRouteInfo<void> {
  const OnboardingRoute({List<_i9.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.QrScannerPage]
class QrScannerRoute extends _i9.PageRouteInfo<void> {
  const QrScannerRoute({List<_i9.PageRouteInfo>? children})
      : super(
          QrScannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrScannerRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreenPage]
class SplashScreenRoute extends _i9.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.WalletProtectionPage]
class WalletProtectionRoute extends _i9.PageRouteInfo<void> {
  const WalletProtectionRoute({List<_i9.PageRouteInfo>? children})
      : super(
          WalletProtectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletProtectionRoute';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
