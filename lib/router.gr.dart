// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:coinplus/models/bar_model/bar_model.dart' as _i19;
import 'package:coinplus/models/card_model/card_model.dart' as _i20;
import 'package:coinplus/pages/bar_fill_page/bar_fill_manual.dart' as _i1;
import 'package:coinplus/pages/bar_fill_page/bar_fill_with_nfc.dart' as _i2;
import 'package:coinplus/pages/bar_settings_page/bar_settings_page.dart' as _i3;
import 'package:coinplus/pages/card_fill_page/card_fill_page.dart' as _i4;
import 'package:coinplus/pages/card_fill_page/card_fill_with_nfc.dart' as _i5;
import 'package:coinplus/pages/card_secret_fill_page/card_secret_fill_page.dart'
    as _i6;
import 'package:coinplus/pages/card_settings_page/card_settings_page.dart'
    as _i7;
import 'package:coinplus/pages/custom_pin_code/pin_code_page.dart' as _i9;
import 'package:coinplus/pages/dashboard/dashboard.dart' as _i10;
import 'package:coinplus/pages/onboarding_page/onboarding_page.dart' as _i11;
import 'package:coinplus/pages/qr_page/qr_page.dart' as _i12;
import 'package:coinplus/pages/settings_page/contact_us/contact_us.dart' as _i8;
import 'package:coinplus/pages/settings_page/settings_page.dart' as _i13;
import 'package:coinplus/pages/splash_screen/splash_screen.dart' as _i14;
import 'package:coinplus/pages/wallet_protection_page/wallet_protection_page.dart'
    as _i15;
import 'package:flutter/cupertino.dart' as _i17;
import 'package:flutter/material.dart' as _i18;

abstract class $Router extends _i16.RootStackRouter {
  $Router({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    BarFillRoute.name: (routeData) {
      final args = routeData.argsAs<BarFillRouteArgs>(
          orElse: () => const BarFillRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
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
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BarFillWithNfc(
          key: args.key,
          receivedData: args.receivedData,
        ),
      );
    },
    BarSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<BarSettingsRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
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
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CardFillPage(
          key: args.key,
          receivedData: args.receivedData,
        ),
      );
    },
    CardFillWithNfc.name: (routeData) {
      final args = routeData.argsAs<CardFillWithNfcArgs>(
          orElse: () => const CardFillWithNfcArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.CardFillWithNfc(
          key: args.key,
          receivedData: args.receivedData,
        ),
      );
    },
    CardSecretFillRoute.name: (routeData) {
      final args = routeData.argsAs<CardSecretFillRouteArgs>(
          orElse: () => const CardSecretFillRouteArgs());
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.CardSecretFillPage(
          key: args.key,
          receivedData: args.receivedData,
        ),
      );
    },
    CardSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<CardSettingsRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.CardSettingsPage(
          key: args.key,
          card: args.card,
        ),
      );
    },
    ContactUs.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ContactUs(),
      );
    },
    CustomPinCode.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.CustomPinCode(),
      );
    },
    Dashboard.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.Dashboard(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.OnboardingPage(),
      );
    },
    QrScannerRoute.name: (routeData) {
      return _i16.AutoRoutePage<String?>(
        routeData: routeData,
        child: const _i12.QrScannerPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.SettingsPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.SplashScreenPage(),
      );
    },
    WalletProtectionRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.WalletProtectionPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BarFillPage]
class BarFillRoute extends _i16.PageRouteInfo<BarFillRouteArgs> {
  BarFillRoute({
    _i17.Key? key,
    String? receivedData,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          BarFillRoute.name,
          args: BarFillRouteArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'BarFillRoute';

  static const _i16.PageInfo<BarFillRouteArgs> page =
      _i16.PageInfo<BarFillRouteArgs>(name);
}

class BarFillRouteArgs {
  const BarFillRouteArgs({
    this.key,
    this.receivedData,
  });

  final _i17.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'BarFillRouteArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i2.BarFillWithNfc]
class BarFillWithNfc extends _i16.PageRouteInfo<BarFillWithNfcArgs> {
  BarFillWithNfc({
    _i17.Key? key,
    String? receivedData,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          BarFillWithNfc.name,
          args: BarFillWithNfcArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'BarFillWithNfc';

  static const _i16.PageInfo<BarFillWithNfcArgs> page =
      _i16.PageInfo<BarFillWithNfcArgs>(name);
}

class BarFillWithNfcArgs {
  const BarFillWithNfcArgs({
    this.key,
    this.receivedData,
  });

  final _i17.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'BarFillWithNfcArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i3.BarSettingsPage]
class BarSettingsRoute extends _i16.PageRouteInfo<BarSettingsRouteArgs> {
  BarSettingsRoute({
    _i18.Key? key,
    required _i19.BarModel bar,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          BarSettingsRoute.name,
          args: BarSettingsRouteArgs(
            key: key,
            bar: bar,
          ),
          initialChildren: children,
        );

  static const String name = 'BarSettingsRoute';

  static const _i16.PageInfo<BarSettingsRouteArgs> page =
      _i16.PageInfo<BarSettingsRouteArgs>(name);
}

class BarSettingsRouteArgs {
  const BarSettingsRouteArgs({
    this.key,
    required this.bar,
  });

  final _i18.Key? key;

  final _i19.BarModel bar;

  @override
  String toString() {
    return 'BarSettingsRouteArgs{key: $key, bar: $bar}';
  }
}

/// generated route for
/// [_i4.CardFillPage]
class CardFillRoute extends _i16.PageRouteInfo<CardFillRouteArgs> {
  CardFillRoute({
    _i18.Key? key,
    String? receivedData,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          CardFillRoute.name,
          args: CardFillRouteArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'CardFillRoute';

  static const _i16.PageInfo<CardFillRouteArgs> page =
      _i16.PageInfo<CardFillRouteArgs>(name);
}

class CardFillRouteArgs {
  const CardFillRouteArgs({
    this.key,
    this.receivedData,
  });

  final _i18.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'CardFillRouteArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i5.CardFillWithNfc]
class CardFillWithNfc extends _i16.PageRouteInfo<CardFillWithNfcArgs> {
  CardFillWithNfc({
    _i18.Key? key,
    String? receivedData,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          CardFillWithNfc.name,
          args: CardFillWithNfcArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'CardFillWithNfc';

  static const _i16.PageInfo<CardFillWithNfcArgs> page =
      _i16.PageInfo<CardFillWithNfcArgs>(name);
}

class CardFillWithNfcArgs {
  const CardFillWithNfcArgs({
    this.key,
    this.receivedData,
  });

  final _i18.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'CardFillWithNfcArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i6.CardSecretFillPage]
class CardSecretFillRoute extends _i16.PageRouteInfo<CardSecretFillRouteArgs> {
  CardSecretFillRoute({
    _i18.Key? key,
    String? receivedData,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          CardSecretFillRoute.name,
          args: CardSecretFillRouteArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'CardSecretFillRoute';

  static const _i16.PageInfo<CardSecretFillRouteArgs> page =
      _i16.PageInfo<CardSecretFillRouteArgs>(name);
}

class CardSecretFillRouteArgs {
  const CardSecretFillRouteArgs({
    this.key,
    this.receivedData,
  });

  final _i18.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'CardSecretFillRouteArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i7.CardSettingsPage]
class CardSettingsRoute extends _i16.PageRouteInfo<CardSettingsRouteArgs> {
  CardSettingsRoute({
    _i18.Key? key,
    required _i20.CardModel card,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          CardSettingsRoute.name,
          args: CardSettingsRouteArgs(
            key: key,
            card: card,
          ),
          initialChildren: children,
        );

  static const String name = 'CardSettingsRoute';

  static const _i16.PageInfo<CardSettingsRouteArgs> page =
      _i16.PageInfo<CardSettingsRouteArgs>(name);
}

class CardSettingsRouteArgs {
  const CardSettingsRouteArgs({
    this.key,
    required this.card,
  });

  final _i18.Key? key;

  final _i20.CardModel card;

  @override
  String toString() {
    return 'CardSettingsRouteArgs{key: $key, card: $card}';
  }
}

/// generated route for
/// [_i8.ContactUs]
class ContactUs extends _i16.PageRouteInfo<void> {
  const ContactUs({List<_i16.PageRouteInfo>? children})
      : super(
          ContactUs.name,
          initialChildren: children,
        );

  static const String name = 'ContactUs';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.CustomPinCode]
class CustomPinCode extends _i16.PageRouteInfo<void> {
  const CustomPinCode({List<_i16.PageRouteInfo>? children})
      : super(
          CustomPinCode.name,
          initialChildren: children,
        );

  static const String name = 'CustomPinCode';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.Dashboard]
class Dashboard extends _i16.PageRouteInfo<void> {
  const Dashboard({List<_i16.PageRouteInfo>? children})
      : super(
          Dashboard.name,
          initialChildren: children,
        );

  static const String name = 'Dashboard';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.OnboardingPage]
class OnboardingRoute extends _i16.PageRouteInfo<void> {
  const OnboardingRoute({List<_i16.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.QrScannerPage]
class QrScannerRoute extends _i16.PageRouteInfo<void> {
  const QrScannerRoute({List<_i16.PageRouteInfo>? children})
      : super(
          QrScannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrScannerRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SettingsPage]
class SettingsRoute extends _i16.PageRouteInfo<void> {
  const SettingsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i14.SplashScreenPage]
class SplashScreenRoute extends _i16.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i16.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i15.WalletProtectionPage]
class WalletProtectionRoute extends _i16.PageRouteInfo<void> {
  const WalletProtectionRoute({List<_i16.PageRouteInfo>? children})
      : super(
          WalletProtectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletProtectionRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
