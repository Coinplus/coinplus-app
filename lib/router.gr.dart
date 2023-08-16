// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:Coinplus/pages/bar_fill_page/bar_fill_page.dart' as _i1;
import 'package:Coinplus/pages/card_fill_page/card_fill_page.dart' as _i2;
import 'package:Coinplus/pages/onboarding_page/onboarding_page.dart' as _i3;
import 'package:Coinplus/pages/qr_page/qr_page.dart' as _i4;
import 'package:Coinplus/pages/splash_screen/splash_screen.dart' as _i5;
import 'package:Coinplus/pages/wallet_page/wallet_page.dart' as _i6;
import 'package:Coinplus/pages/wallet_protection_page/wallet_protection_page.dart'
    as _i7;
import 'package:flutter/cupertino.dart' as _i9;

abstract class $Router extends _i8.RootStackRouter {
  $Router({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    BarFillRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BarFillPage(),
      );
    },
    CardFillRoute.name: (routeData) {
      final args = routeData.argsAs<CardFillRouteArgs>(
          orElse: () => const CardFillRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CardFillPage(
          key: args.key,
          receivedData: args.receivedData,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.OnboardingPage(),
      );
    },
    QrScannerRoute.name: (routeData) {
      return _i8.AutoRoutePage<String?>(
        routeData: routeData,
        child: const _i4.QrScannerPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreenPage(),
      );
    },
    WalletRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.WalletPage(),
      );
    },
    WalletProtectionRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.WalletProtectionPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BarFillPage]
class BarFillRoute extends _i8.PageRouteInfo<void> {
  const BarFillRoute({List<_i8.PageRouteInfo>? children})
      : super(
          BarFillRoute.name,
          initialChildren: children,
        );

  static const String name = 'BarFillRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CardFillPage]
class CardFillRoute extends _i8.PageRouteInfo<CardFillRouteArgs> {
  CardFillRoute({
    _i9.Key? key,
    String? receivedData,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          CardFillRoute.name,
          args: CardFillRouteArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'CardFillRoute';

  static const _i8.PageInfo<CardFillRouteArgs> page =
      _i8.PageInfo<CardFillRouteArgs>(name);
}

class CardFillRouteArgs {
  const CardFillRouteArgs({
    this.key,
    this.receivedData,
  });

  final _i9.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'CardFillRouteArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i3.OnboardingPage]
class OnboardingRoute extends _i8.PageRouteInfo<void> {
  const OnboardingRoute({List<_i8.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.QrScannerPage]
class QrScannerRoute extends _i8.PageRouteInfo<void> {
  const QrScannerRoute({List<_i8.PageRouteInfo>? children})
      : super(
          QrScannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrScannerRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashScreenPage]
class SplashScreenRoute extends _i8.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.WalletPage]
class WalletRoute extends _i8.PageRouteInfo<void> {
  const WalletRoute({List<_i8.PageRouteInfo>? children})
      : super(
          WalletRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.WalletProtectionPage]
class WalletProtectionRoute extends _i8.PageRouteInfo<void> {
  const WalletProtectionRoute({List<_i8.PageRouteInfo>? children})
      : super(
          WalletProtectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletProtectionRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
