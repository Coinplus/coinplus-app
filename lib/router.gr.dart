// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:coinplus/models/bar_model/bar_model.dart' as _i18;
import 'package:coinplus/models/card_model/card_model.dart' as _i19;
import 'package:coinplus/pages/bar_fill_page/bar_fill_manual.dart' as _i1;
import 'package:coinplus/pages/bar_fill_page/bar_fill_with_nfc.dart' as _i2;
import 'package:coinplus/pages/bar_settings_page/bar_settings_page.dart' as _i3;
import 'package:coinplus/pages/card_fill_page/card_fill_page.dart' as _i4;
import 'package:coinplus/pages/card_settings_page/card_settings_page.dart'
    as _i5;
import 'package:coinplus/pages/custom_pin_code/ui/create_pin_page.dart' as _i7;
import 'package:coinplus/pages/custom_pin_code/ui/pin_page.dart' as _i10;
import 'package:coinplus/pages/custom_pin_code/ui/widget/change_pin_page.dart'
    as _i6;
import 'package:coinplus/pages/dashboard/dashboard.dart' as _i8;
import 'package:coinplus/pages/onboarding_page/onboarding_page.dart' as _i9;
import 'package:coinplus/pages/qr_page/qr_page.dart' as _i11;
import 'package:coinplus/pages/settings_page/settings_page.dart' as _i12;
import 'package:coinplus/pages/splash_screen/splash_screen.dart' as _i13;
import 'package:coinplus/pages/wallet_protection_page/wallet_protection_page.dart'
    as _i14;
import 'package:flutter/cupertino.dart' as _i16;
import 'package:flutter/material.dart' as _i17;

abstract class $Router extends _i15.RootStackRouter {
  $Router({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    BarFillRoute.name: (routeData) {
      final args = routeData.argsAs<BarFillRouteArgs>(
          orElse: () => const BarFillRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.BarFillPage(
          key: args.key,
          receivedData: args.receivedData,
        ),
      );
    },
    BarFillWithNfc.name: (routeData) {
      final args = routeData.argsAs<BarFillWithNfcArgs>(
          orElse: () => const BarFillWithNfcArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BarFillWithNfc(
          key: args.key,
          receivedData: args.receivedData,
        ),
      );
    },
    BarSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<BarSettingsRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.BarSettingsPage(
          key: args.key,
          bar: args.bar,
        ),
      );
    },
    CardFillRoute.name: (routeData) {
      final args = routeData.argsAs<CardFillRouteArgs>(
          orElse: () => const CardFillRouteArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CardFillPage(
          key: args.key,
          receivedData: args.receivedData,
        ),
      );
    },
    CardSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<CardSettingsRouteArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CardSettingsPage(
          key: args.key,
          card: args.card,
        ),
      );
    },
    ChangePinRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ChangePinPage(),
      );
    },
    CreatePinRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.CreatePinPage(),
      );
    },
    Dashboard.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.Dashboard(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.OnboardingPage(),
      );
    },
    PinRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.PinPage(),
      );
    },
    QrScannerRoute.name: (routeData) {
      return _i15.AutoRoutePage<String?>(
        routeData: routeData,
        child: const _i11.QrScannerPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.SettingsPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SplashScreenPage(),
      );
    },
    WalletProtectionRoute.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.WalletProtectionPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BarFillPage]
class BarFillRoute extends _i15.PageRouteInfo<BarFillRouteArgs> {
  BarFillRoute({
    _i16.Key? key,
    String? receivedData,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          BarFillRoute.name,
          args: BarFillRouteArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'BarFillRoute';

  static const _i15.PageInfo<BarFillRouteArgs> page =
      _i15.PageInfo<BarFillRouteArgs>(name);
}

class BarFillRouteArgs {
  const BarFillRouteArgs({
    this.key,
    this.receivedData,
  });

  final _i16.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'BarFillRouteArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i2.BarFillWithNfc]
class BarFillWithNfc extends _i15.PageRouteInfo<BarFillWithNfcArgs> {
  BarFillWithNfc({
    _i16.Key? key,
    String? receivedData,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          BarFillWithNfc.name,
          args: BarFillWithNfcArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'BarFillWithNfc';

  static const _i15.PageInfo<BarFillWithNfcArgs> page =
      _i15.PageInfo<BarFillWithNfcArgs>(name);
}

class BarFillWithNfcArgs {
  const BarFillWithNfcArgs({
    this.key,
    this.receivedData,
  });

  final _i16.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'BarFillWithNfcArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i3.BarSettingsPage]
class BarSettingsRoute extends _i15.PageRouteInfo<BarSettingsRouteArgs> {
  BarSettingsRoute({
    _i17.Key? key,
    required _i18.BarModel bar,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          BarSettingsRoute.name,
          args: BarSettingsRouteArgs(
            key: key,
            bar: bar,
          ),
          initialChildren: children,
        );

  static const String name = 'BarSettingsRoute';

  static const _i15.PageInfo<BarSettingsRouteArgs> page =
      _i15.PageInfo<BarSettingsRouteArgs>(name);
}

class BarSettingsRouteArgs {
  const BarSettingsRouteArgs({
    this.key,
    required this.bar,
  });

  final _i17.Key? key;

  final _i18.BarModel bar;

  @override
  String toString() {
    return 'BarSettingsRouteArgs{key: $key, bar: $bar}';
  }
}

/// generated route for
/// [_i4.CardFillPage]
class CardFillRoute extends _i15.PageRouteInfo<CardFillRouteArgs> {
  CardFillRoute({
    _i16.Key? key,
    String? receivedData,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          CardFillRoute.name,
          args: CardFillRouteArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'CardFillRoute';

  static const _i15.PageInfo<CardFillRouteArgs> page =
      _i15.PageInfo<CardFillRouteArgs>(name);
}

class CardFillRouteArgs {
  const CardFillRouteArgs({
    this.key,
    this.receivedData,
  });

  final _i16.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'CardFillRouteArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i5.CardSettingsPage]
class CardSettingsRoute extends _i15.PageRouteInfo<CardSettingsRouteArgs> {
  CardSettingsRoute({
    _i17.Key? key,
    required _i19.CardModel card,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          CardSettingsRoute.name,
          args: CardSettingsRouteArgs(
            key: key,
            card: card,
          ),
          initialChildren: children,
        );

  static const String name = 'CardSettingsRoute';

  static const _i15.PageInfo<CardSettingsRouteArgs> page =
      _i15.PageInfo<CardSettingsRouteArgs>(name);
}

class CardSettingsRouteArgs {
  const CardSettingsRouteArgs({
    this.key,
    required this.card,
  });

  final _i17.Key? key;

  final _i19.CardModel card;

  @override
  String toString() {
    return 'CardSettingsRouteArgs{key: $key, card: $card}';
  }
}

/// generated route for
/// [_i6.ChangePinPage]
class ChangePinRoute extends _i15.PageRouteInfo<void> {
  const ChangePinRoute({List<_i15.PageRouteInfo>? children})
      : super(
          ChangePinRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChangePinRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.CreatePinPage]
class CreatePinRoute extends _i15.PageRouteInfo<void> {
  const CreatePinRoute({List<_i15.PageRouteInfo>? children})
      : super(
          CreatePinRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatePinRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.Dashboard]
class Dashboard extends _i15.PageRouteInfo<void> {
  const Dashboard({List<_i15.PageRouteInfo>? children})
      : super(
          Dashboard.name,
          initialChildren: children,
        );

  static const String name = 'Dashboard';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.OnboardingPage]
class OnboardingRoute extends _i15.PageRouteInfo<void> {
  const OnboardingRoute({List<_i15.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.PinPage]
class PinRoute extends _i15.PageRouteInfo<void> {
  const PinRoute({List<_i15.PageRouteInfo>? children})
      : super(
          PinRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.QrScannerPage]
class QrScannerRoute extends _i15.PageRouteInfo<void> {
  const QrScannerRoute({List<_i15.PageRouteInfo>? children})
      : super(
          QrScannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrScannerRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SettingsPage]
class SettingsRoute extends _i15.PageRouteInfo<void> {
  const SettingsRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SplashScreenPage]
class SplashScreenRoute extends _i15.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i15.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.WalletProtectionPage]
class WalletProtectionRoute extends _i15.PageRouteInfo<void> {
  const WalletProtectionRoute({List<_i15.PageRouteInfo>? children})
      : super(
          WalletProtectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletProtectionRoute';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
