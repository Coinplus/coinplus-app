// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:coinplus/models/abstract_card/abstract_card.dart' as _i24;
import 'package:coinplus/models/bar_model/bar_model.dart' as _i23;
import 'package:coinplus/models/card_model/card_model.dart' as _i25;
import 'package:coinplus/pages/bar_fill_page/bar_fill_manual.dart' as _i1;
import 'package:coinplus/pages/bar_fill_page/bar_fill_with_nfc.dart' as _i2;
import 'package:coinplus/pages/bar_settings_page/bar_settings_page.dart' as _i3;
import 'package:coinplus/pages/card_fill_page/card_fill_page.dart' as _i4;
import 'package:coinplus/pages/card_fill_page/card_fill_with_nfc.dart' as _i5;
import 'package:coinplus/pages/card_secret_fill_page/card_secret_fill_page.dart'
    as _i6;
import 'package:coinplus/pages/card_settings_page/card_settings_page.dart'
    as _i7;
import 'package:coinplus/pages/custom_pin_code/change_pin_code_page.dart'
    as _i8;
import 'package:coinplus/pages/custom_pin_code/create_pin_code_page.dart'
    as _i10;
import 'package:coinplus/pages/custom_pin_code/pin_code_after_splash.dart'
    as _i13;
import 'package:coinplus/pages/custom_pin_code/pin_code_page.dart' as _i14;
import 'package:coinplus/pages/custom_pin_code/remove_pin_code.dart' as _i15;
import 'package:coinplus/pages/dashboard/dashboard.dart' as _i11;
import 'package:coinplus/pages/onboarding_page/onboarding_page.dart' as _i12;
import 'package:coinplus/pages/qr_page/qr_page.dart' as _i16;
import 'package:coinplus/pages/settings_page/contact_us/contact_us.dart' as _i9;
import 'package:coinplus/pages/settings_page/settings_page.dart' as _i17;
import 'package:coinplus/pages/splash_screen/splash_screen.dart' as _i18;
import 'package:coinplus/pages/wallet_protection_page/wallet_protection_page.dart'
    as _i19;
import 'package:flutter/cupertino.dart' as _i21;
import 'package:flutter/material.dart' as _i22;

abstract class $Router extends _i20.RootStackRouter {
  $Router({super.navigatorKey});

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    BarFillRoute.name: (routeData) {
      final args = routeData.argsAs<BarFillRouteArgs>(
          orElse: () => const BarFillRouteArgs());
      return _i20.AutoRoutePage<dynamic>(
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
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BarFillWithNfc(
          key: args.key,
          receivedData: args.receivedData,
        ),
      );
    },
    BarSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<BarSettingsRouteArgs>();
      return _i20.AutoRoutePage<dynamic>(
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
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.CardFillPage(
          key: args.key,
          receivedData: args.receivedData,
          onChangeCard: args.onChangeCard,
        ),
      );
    },
    CardFillWithNfc.name: (routeData) {
      final args = routeData.argsAs<CardFillWithNfcArgs>(
          orElse: () => const CardFillWithNfcArgs());
      return _i20.AutoRoutePage<dynamic>(
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
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.CardSecretFillPage(
          key: args.key,
          receivedData: args.receivedData,
        ),
      );
    },
    CardSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<CardSettingsRouteArgs>();
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.CardSettingsPage(
          key: args.key,
          card: args.card,
        ),
      );
    },
    ChangePinCode.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.ChangePinCode(),
      );
    },
    ContactUs.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.ContactUs(),
      );
    },
    CreatePinCode.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.CreatePinCode(),
      );
    },
    Dashboard.name: (routeData) {
      final args =
          routeData.argsAs<DashboardArgs>(orElse: () => const DashboardArgs());
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.Dashboard(
          onCarouselScroll: args.onCarouselScroll,
          onChangeCard: args.onChangeCard,
          onCardSelected: args.onCardSelected,
          key: args.key,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.OnboardingPage(),
      );
    },
    PinAfterSplash.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.PinAfterSplash(),
      );
    },
    PinCodeRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.PinCodePage(),
      );
    },
    PinRemove.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.PinRemove(),
      );
    },
    QrScannerRoute.name: (routeData) {
      return _i20.AutoRoutePage<String?>(
        routeData: routeData,
        child: const _i16.QrScannerPage(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.SettingsPage(),
      );
    },
    SplashScreenRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.SplashScreenPage(),
      );
    },
    WalletProtectionRoute.name: (routeData) {
      return _i20.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.WalletProtectionPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BarFillPage]
class BarFillRoute extends _i20.PageRouteInfo<BarFillRouteArgs> {
  BarFillRoute({
    _i21.Key? key,
    String? receivedData,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          BarFillRoute.name,
          args: BarFillRouteArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'BarFillRoute';

  static const _i20.PageInfo<BarFillRouteArgs> page =
      _i20.PageInfo<BarFillRouteArgs>(name);
}

class BarFillRouteArgs {
  const BarFillRouteArgs({
    this.key,
    this.receivedData,
  });

  final _i21.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'BarFillRouteArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i2.BarFillWithNfc]
class BarFillWithNfc extends _i20.PageRouteInfo<BarFillWithNfcArgs> {
  BarFillWithNfc({
    _i21.Key? key,
    String? receivedData,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          BarFillWithNfc.name,
          args: BarFillWithNfcArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'BarFillWithNfc';

  static const _i20.PageInfo<BarFillWithNfcArgs> page =
      _i20.PageInfo<BarFillWithNfcArgs>(name);
}

class BarFillWithNfcArgs {
  const BarFillWithNfcArgs({
    this.key,
    this.receivedData,
  });

  final _i21.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'BarFillWithNfcArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i3.BarSettingsPage]
class BarSettingsRoute extends _i20.PageRouteInfo<BarSettingsRouteArgs> {
  BarSettingsRoute({
    _i22.Key? key,
    required _i23.BarModel bar,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          BarSettingsRoute.name,
          args: BarSettingsRouteArgs(
            key: key,
            bar: bar,
          ),
          initialChildren: children,
        );

  static const String name = 'BarSettingsRoute';

  static const _i20.PageInfo<BarSettingsRouteArgs> page =
      _i20.PageInfo<BarSettingsRouteArgs>(name);
}

class BarSettingsRouteArgs {
  const BarSettingsRouteArgs({
    this.key,
    required this.bar,
  });

  final _i22.Key? key;

  final _i23.BarModel bar;

  @override
  String toString() {
    return 'BarSettingsRouteArgs{key: $key, bar: $bar}';
  }
}

/// generated route for
/// [_i4.CardFillPage]
class CardFillRoute extends _i20.PageRouteInfo<CardFillRouteArgs> {
  CardFillRoute({
    _i22.Key? key,
    String? receivedData,
    void Function(({_i24.AbstractCard? card, int index}))? onChangeCard,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          CardFillRoute.name,
          args: CardFillRouteArgs(
            key: key,
            receivedData: receivedData,
            onChangeCard: onChangeCard,
          ),
          initialChildren: children,
        );

  static const String name = 'CardFillRoute';

  static const _i20.PageInfo<CardFillRouteArgs> page =
      _i20.PageInfo<CardFillRouteArgs>(name);
}

class CardFillRouteArgs {
  const CardFillRouteArgs({
    this.key,
    this.receivedData,
    this.onChangeCard,
  });

  final _i22.Key? key;

  final String? receivedData;

  final void Function(({_i24.AbstractCard? card, int index}))? onChangeCard;

  @override
  String toString() {
    return 'CardFillRouteArgs{key: $key, receivedData: $receivedData, onChangeCard: $onChangeCard}';
  }
}

/// generated route for
/// [_i5.CardFillWithNfc]
class CardFillWithNfc extends _i20.PageRouteInfo<CardFillWithNfcArgs> {
  CardFillWithNfc({
    _i22.Key? key,
    String? receivedData,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          CardFillWithNfc.name,
          args: CardFillWithNfcArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'CardFillWithNfc';

  static const _i20.PageInfo<CardFillWithNfcArgs> page =
      _i20.PageInfo<CardFillWithNfcArgs>(name);
}

class CardFillWithNfcArgs {
  const CardFillWithNfcArgs({
    this.key,
    this.receivedData,
  });

  final _i22.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'CardFillWithNfcArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i6.CardSecretFillPage]
class CardSecretFillRoute extends _i20.PageRouteInfo<CardSecretFillRouteArgs> {
  CardSecretFillRoute({
    _i22.Key? key,
    String? receivedData,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          CardSecretFillRoute.name,
          args: CardSecretFillRouteArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'CardSecretFillRoute';

  static const _i20.PageInfo<CardSecretFillRouteArgs> page =
      _i20.PageInfo<CardSecretFillRouteArgs>(name);
}

class CardSecretFillRouteArgs {
  const CardSecretFillRouteArgs({
    this.key,
    this.receivedData,
  });

  final _i22.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'CardSecretFillRouteArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i7.CardSettingsPage]
class CardSettingsRoute extends _i20.PageRouteInfo<CardSettingsRouteArgs> {
  CardSettingsRoute({
    _i22.Key? key,
    required _i25.CardModel card,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          CardSettingsRoute.name,
          args: CardSettingsRouteArgs(
            key: key,
            card: card,
          ),
          initialChildren: children,
        );

  static const String name = 'CardSettingsRoute';

  static const _i20.PageInfo<CardSettingsRouteArgs> page =
      _i20.PageInfo<CardSettingsRouteArgs>(name);
}

class CardSettingsRouteArgs {
  const CardSettingsRouteArgs({
    this.key,
    required this.card,
  });

  final _i22.Key? key;

  final _i25.CardModel card;

  @override
  String toString() {
    return 'CardSettingsRouteArgs{key: $key, card: $card}';
  }
}

/// generated route for
/// [_i8.ChangePinCode]
class ChangePinCode extends _i20.PageRouteInfo<void> {
  const ChangePinCode({List<_i20.PageRouteInfo>? children})
      : super(
          ChangePinCode.name,
          initialChildren: children,
        );

  static const String name = 'ChangePinCode';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i9.ContactUs]
class ContactUs extends _i20.PageRouteInfo<void> {
  const ContactUs({List<_i20.PageRouteInfo>? children})
      : super(
          ContactUs.name,
          initialChildren: children,
        );

  static const String name = 'ContactUs';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i10.CreatePinCode]
class CreatePinCode extends _i20.PageRouteInfo<void> {
  const CreatePinCode({List<_i20.PageRouteInfo>? children})
      : super(
          CreatePinCode.name,
          initialChildren: children,
        );

  static const String name = 'CreatePinCode';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i11.Dashboard]
class Dashboard extends _i20.PageRouteInfo<DashboardArgs> {
  Dashboard({
    void Function(int)? onCarouselScroll,
    void Function(({_i24.AbstractCard? card, int index}))? onChangeCard,
    void Function(_i24.AbstractCard?)? onCardSelected,
    _i22.Key? key,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          Dashboard.name,
          args: DashboardArgs(
            onCarouselScroll: onCarouselScroll,
            onChangeCard: onChangeCard,
            onCardSelected: onCardSelected,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'Dashboard';

  static const _i20.PageInfo<DashboardArgs> page =
      _i20.PageInfo<DashboardArgs>(name);
}

class DashboardArgs {
  const DashboardArgs({
    this.onCarouselScroll,
    this.onChangeCard,
    this.onCardSelected,
    this.key,
  });

  final void Function(int)? onCarouselScroll;

  final void Function(({_i24.AbstractCard? card, int index}))? onChangeCard;

  final void Function(_i24.AbstractCard?)? onCardSelected;

  final _i22.Key? key;

  @override
  String toString() {
    return 'DashboardArgs{onCarouselScroll: $onCarouselScroll, onChangeCard: $onChangeCard, onCardSelected: $onCardSelected, key: $key}';
  }
}

/// generated route for
/// [_i12.OnboardingPage]
class OnboardingRoute extends _i20.PageRouteInfo<void> {
  const OnboardingRoute({List<_i20.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i13.PinAfterSplash]
class PinAfterSplash extends _i20.PageRouteInfo<void> {
  const PinAfterSplash({List<_i20.PageRouteInfo>? children})
      : super(
          PinAfterSplash.name,
          initialChildren: children,
        );

  static const String name = 'PinAfterSplash';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i14.PinCodePage]
class PinCodeRoute extends _i20.PageRouteInfo<void> {
  const PinCodeRoute({List<_i20.PageRouteInfo>? children})
      : super(
          PinCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinCodeRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i15.PinRemove]
class PinRemove extends _i20.PageRouteInfo<void> {
  const PinRemove({List<_i20.PageRouteInfo>? children})
      : super(
          PinRemove.name,
          initialChildren: children,
        );

  static const String name = 'PinRemove';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i16.QrScannerPage]
class QrScannerRoute extends _i20.PageRouteInfo<void> {
  const QrScannerRoute({List<_i20.PageRouteInfo>? children})
      : super(
          QrScannerRoute.name,
          initialChildren: children,
        );

  static const String name = 'QrScannerRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i17.SettingsPage]
class SettingsRoute extends _i20.PageRouteInfo<void> {
  const SettingsRoute({List<_i20.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i18.SplashScreenPage]
class SplashScreenRoute extends _i20.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i20.PageRouteInfo>? children})
      : super(
          SplashScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreenRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}

/// generated route for
/// [_i19.WalletProtectionPage]
class WalletProtectionRoute extends _i20.PageRouteInfo<void> {
  const WalletProtectionRoute({List<_i20.PageRouteInfo>? children})
      : super(
          WalletProtectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletProtectionRoute';

  static const _i20.PageInfo<void> page = _i20.PageInfo<void>(name);
}
