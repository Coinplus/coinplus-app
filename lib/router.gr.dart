// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:coinplus/models/abstract_card/abstract_card.dart' as _i31;
import 'package:coinplus/models/bar_model/bar_model.dart' as _i30;
import 'package:coinplus/models/card_model/card_model.dart' as _i32;
import 'package:coinplus/models/coins_dto/coin_model.dart' as _i33;
import 'package:coinplus/pages/bar_fill_page/bar_fill_manual.dart' as _i2;
import 'package:coinplus/pages/bar_fill_page/bar_fill_with_nfc.dart' as _i3;
import 'package:coinplus/pages/bar_secret_fill_page/bar_secret_fill_page.dart'
    as _i4;
import 'package:coinplus/pages/bar_settings_page/bar_settings_page.dart' as _i5;
import 'package:coinplus/pages/card_fill_page/card_fill_page.dart' as _i6;
import 'package:coinplus/pages/card_fill_page/card_fill_with_nfc.dart' as _i7;
import 'package:coinplus/pages/card_secret_fill_page/card_secret_fill_page.dart'
    as _i8;
import 'package:coinplus/pages/card_settings_page/card_settings_page.dart'
    as _i9;
import 'package:coinplus/pages/dashboard/dashboard.dart' as _i14;
import 'package:coinplus/pages/market_page/coin_chart_page/coin_chart_page.dart'
    as _i11;
import 'package:coinplus/pages/onboarding_page/onboarding_page.dart' as _i15;
import 'package:coinplus/pages/pin_code_page/change_pin_code_page.dart' as _i10;
import 'package:coinplus/pages/pin_code_page/create_pin_code_page.dart' as _i13;
import 'package:coinplus/pages/pin_code_page/pin_code_after_splash.dart'
    as _i16;
import 'package:coinplus/pages/pin_code_page/pin_code_for_all_pages.dart'
    as _i17;
import 'package:coinplus/pages/pin_code_page/pin_code_for_private_key.dart'
    as _i18;
import 'package:coinplus/pages/pin_code_page/pin_code_page.dart' as _i19;
import 'package:coinplus/pages/pin_code_page/remove_pin_code.dart' as _i20;
import 'package:coinplus/pages/qr_scanner_page/qr_scanner.dart' as _i21;
import 'package:coinplus/pages/send_page/send_to/send_to_state.dart' as _i28;
import 'package:coinplus/pages/settings_page/app_info_page/app_info_page.dart'
    as _i1;
import 'package:coinplus/pages/settings_page/contact_us/contact_us.dart'
    as _i12;
import 'package:coinplus/pages/settings_page/settings_page.dart' as _i22;
import 'package:coinplus/pages/splash_screen/splash_screen.dart' as _i23;
import 'package:coinplus/pages/wallet_protection_page/wallet_protection_page.dart'
    as _i24;
import 'package:coinplus/store/bar_color_state/bar_setting_state.dart' as _i34;
import 'package:coinplus/store/card_color_state/card_setting_state.dart'
    as _i35;
import 'package:flutter/cupertino.dart' as _i26;
import 'package:flutter/foundation.dart' as _i27;
import 'package:flutter/material.dart' as _i29;

abstract class $Router extends _i25.RootStackRouter {
  $Router({super.navigatorKey});

  @override
  final Map<String, _i25.PageFactory> pagesMap = {
    AboutAppRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutAppPage(),
      );
    },
    BarFillRoute.name: (routeData) {
      final args = routeData.argsAs<BarFillRouteArgs>(
          orElse: () => const BarFillRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BarFillPage(
          key: args.key,
          receivedData: args.receivedData,
        ),
      );
    },
    BarFillWithNfc.name: (routeData) {
      final args = routeData.argsAs<BarFillWithNfcArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.BarFillWithNfc(
          key: args.key,
          receivedData: args.receivedData,
          barColor: args.barColor,
          isOriginalTag: args.isOriginalTag,
          isActivated: args.isActivated,
        ),
      );
    },
    BarSecretFillRoute.name: (routeData) {
      final args = routeData.argsAs<BarSecretFillRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.BarSecretFillPage(
          key: args.key,
          receivedData: args.receivedData,
          state: args.state,
        ),
      );
    },
    BarSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<BarSettingsRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.BarSettingsPage(
          key: args.key,
          bar: args.bar,
        ),
      );
    },
    CardFillRoute.name: (routeData) {
      final args = routeData.argsAs<CardFillRouteArgs>(
          orElse: () => const CardFillRouteArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.CardFillPage(
          key: args.key,
          receivedData: args.receivedData,
          onChangeCard: args.onChangeCard,
        ),
      );
    },
    CardFillWithNfc.name: (routeData) {
      final args = routeData.argsAs<CardFillWithNfcArgs>(
          orElse: () => const CardFillWithNfcArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.CardFillWithNfc(
          key: args.key,
          receivedData: args.receivedData,
          cardColor: args.cardColor,
          isOriginalCard: args.isOriginalCard,
          isMiFareUltralight: args.isMiFareUltralight,
          isOldCard: args.isOldCard,
          isActivated: args.isActivated,
        ),
      );
    },
    CardSecretFillRoute.name: (routeData) {
      final args = routeData.argsAs<CardSecretFillRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.CardSecretFillPage(
          key: args.key,
          receivedData: args.receivedData,
          state: args.state,
        ),
      );
    },
    CardSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<CardSettingsRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.CardSettingsPage(
          key: args.key,
          card: args.card,
        ),
      );
    },
    ChangePinCode.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.ChangePinCode(),
      );
    },
    CoinChartRoute.name: (routeData) {
      final args = routeData.argsAs<CoinChartRouteArgs>();
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.CoinChartPage(
          key: args.key,
          data: args.data,
        ),
      );
    },
    ContactUs.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.ContactUs(),
      );
    },
    CreatePinCode.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.CreatePinCode(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.DashboardPage(),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.OnboardingPage(),
      );
    },
    PinAfterSplash.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.PinAfterSplash(),
      );
    },
    PinCodeForAllRoutes.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.PinCodeForAllPages(),
      );
    },
    PinCodeForPrivateKey.name: (routeData) {
      final args = routeData.argsAs<PinCodeForPrivateKeyArgs>(
          orElse: () => const PinCodeForPrivateKeyArgs());
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.PinCodeForPrivateKey(
          key: args.key,
          bar: args.bar,
          isKeyVisible: args.isKeyVisible,
          card: args.card,
          isVisible: args.isVisible,
        ),
      );
    },
    PinCodeRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.PinCodePage(),
      );
    },
    PinRemove.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.PinRemove(),
      );
    },
    QrScannerRoute.name: (routeData) {
      final args = routeData.argsAs<QrScannerRouteArgs>(
          orElse: () => const QrScannerRouteArgs());
      return _i25.AutoRoutePage<String?>(
        routeData: routeData,
        child: _i21.QrScannerPage(
          key: args.key,
          isScannedReceiverAddress: args.isScannedReceiverAddress,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.SettingsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.SplashPage(),
      );
    },
    WalletProtectionRoute.name: (routeData) {
      return _i25.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.WalletProtectionPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutAppPage]
class AboutAppRoute extends _i25.PageRouteInfo<void> {
  const AboutAppRoute({List<_i25.PageRouteInfo>? children})
      : super(
          AboutAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutAppRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BarFillPage]
class BarFillRoute extends _i25.PageRouteInfo<BarFillRouteArgs> {
  BarFillRoute({
    _i26.Key? key,
    String? receivedData,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          BarFillRoute.name,
          args: BarFillRouteArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'BarFillRoute';

  static const _i25.PageInfo<BarFillRouteArgs> page =
      _i25.PageInfo<BarFillRouteArgs>(name);
}

class BarFillRouteArgs {
  const BarFillRouteArgs({
    this.key,
    this.receivedData,
  });

  final _i26.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'BarFillRouteArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i3.BarFillWithNfc]
class BarFillWithNfc extends _i25.PageRouteInfo<BarFillWithNfcArgs> {
  BarFillWithNfc({
    _i26.Key? key,
    String? receivedData,
    String? barColor,
    bool? isOriginalTag,
    required bool? isActivated,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          BarFillWithNfc.name,
          args: BarFillWithNfcArgs(
            key: key,
            receivedData: receivedData,
            barColor: barColor,
            isOriginalTag: isOriginalTag,
            isActivated: isActivated,
          ),
          initialChildren: children,
        );

  static const String name = 'BarFillWithNfc';

  static const _i25.PageInfo<BarFillWithNfcArgs> page =
      _i25.PageInfo<BarFillWithNfcArgs>(name);
}

class BarFillWithNfcArgs {
  const BarFillWithNfcArgs({
    this.key,
    this.receivedData,
    this.barColor,
    this.isOriginalTag,
    required this.isActivated,
  });

  final _i26.Key? key;

  final String? receivedData;

  final String? barColor;

  final bool? isOriginalTag;

  final bool? isActivated;

  @override
  String toString() {
    return 'BarFillWithNfcArgs{key: $key, receivedData: $receivedData, barColor: $barColor, isOriginalTag: $isOriginalTag, isActivated: $isActivated}';
  }
}

/// generated route for
/// [_i4.BarSecretFillPage]
class BarSecretFillRoute extends _i25.PageRouteInfo<BarSecretFillRouteArgs> {
  BarSecretFillRoute({
    _i27.Key? key,
    String? receivedData,
    required _i28.SendToState state,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          BarSecretFillRoute.name,
          args: BarSecretFillRouteArgs(
            key: key,
            receivedData: receivedData,
            state: state,
          ),
          initialChildren: children,
        );

  static const String name = 'BarSecretFillRoute';

  static const _i25.PageInfo<BarSecretFillRouteArgs> page =
      _i25.PageInfo<BarSecretFillRouteArgs>(name);
}

class BarSecretFillRouteArgs {
  const BarSecretFillRouteArgs({
    this.key,
    this.receivedData,
    required this.state,
  });

  final _i27.Key? key;

  final String? receivedData;

  final _i28.SendToState state;

  @override
  String toString() {
    return 'BarSecretFillRouteArgs{key: $key, receivedData: $receivedData, state: $state}';
  }
}

/// generated route for
/// [_i5.BarSettingsPage]
class BarSettingsRoute extends _i25.PageRouteInfo<BarSettingsRouteArgs> {
  BarSettingsRoute({
    _i29.Key? key,
    required _i30.BarModel bar,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          BarSettingsRoute.name,
          args: BarSettingsRouteArgs(
            key: key,
            bar: bar,
          ),
          initialChildren: children,
        );

  static const String name = 'BarSettingsRoute';

  static const _i25.PageInfo<BarSettingsRouteArgs> page =
      _i25.PageInfo<BarSettingsRouteArgs>(name);
}

class BarSettingsRouteArgs {
  const BarSettingsRouteArgs({
    this.key,
    required this.bar,
  });

  final _i29.Key? key;

  final _i30.BarModel bar;

  @override
  String toString() {
    return 'BarSettingsRouteArgs{key: $key, bar: $bar}';
  }
}

/// generated route for
/// [_i6.CardFillPage]
class CardFillRoute extends _i25.PageRouteInfo<CardFillRouteArgs> {
  CardFillRoute({
    _i29.Key? key,
    String? receivedData,
    void Function(({_i31.AbstractCard? card, int index}))? onChangeCard,
    List<_i25.PageRouteInfo>? children,
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

  static const _i25.PageInfo<CardFillRouteArgs> page =
      _i25.PageInfo<CardFillRouteArgs>(name);
}

class CardFillRouteArgs {
  const CardFillRouteArgs({
    this.key,
    this.receivedData,
    this.onChangeCard,
  });

  final _i29.Key? key;

  final String? receivedData;

  final void Function(({_i31.AbstractCard? card, int index}))? onChangeCard;

  @override
  String toString() {
    return 'CardFillRouteArgs{key: $key, receivedData: $receivedData, onChangeCard: $onChangeCard}';
  }
}

/// generated route for
/// [_i7.CardFillWithNfc]
class CardFillWithNfc extends _i25.PageRouteInfo<CardFillWithNfcArgs> {
  CardFillWithNfc({
    _i29.Key? key,
    String? receivedData,
    String? cardColor,
    bool? isOriginalCard,
    bool? isMiFareUltralight,
    bool? isOldCard,
    bool? isActivated,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          CardFillWithNfc.name,
          args: CardFillWithNfcArgs(
            key: key,
            receivedData: receivedData,
            cardColor: cardColor,
            isOriginalCard: isOriginalCard,
            isMiFareUltralight: isMiFareUltralight,
            isOldCard: isOldCard,
            isActivated: isActivated,
          ),
          initialChildren: children,
        );

  static const String name = 'CardFillWithNfc';

  static const _i25.PageInfo<CardFillWithNfcArgs> page =
      _i25.PageInfo<CardFillWithNfcArgs>(name);
}

class CardFillWithNfcArgs {
  const CardFillWithNfcArgs({
    this.key,
    this.receivedData,
    this.cardColor,
    this.isOriginalCard,
    this.isMiFareUltralight,
    this.isOldCard,
    this.isActivated,
  });

  final _i29.Key? key;

  final String? receivedData;

  final String? cardColor;

  final bool? isOriginalCard;

  final bool? isMiFareUltralight;

  final bool? isOldCard;

  final bool? isActivated;

  @override
  String toString() {
    return 'CardFillWithNfcArgs{key: $key, receivedData: $receivedData, cardColor: $cardColor, isOriginalCard: $isOriginalCard, isMiFareUltralight: $isMiFareUltralight, isOldCard: $isOldCard, isActivated: $isActivated}';
  }
}

/// generated route for
/// [_i8.CardSecretFillPage]
class CardSecretFillRoute extends _i25.PageRouteInfo<CardSecretFillRouteArgs> {
  CardSecretFillRoute({
    _i29.Key? key,
    String? receivedData,
    required _i28.SendToState state,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          CardSecretFillRoute.name,
          args: CardSecretFillRouteArgs(
            key: key,
            receivedData: receivedData,
            state: state,
          ),
          initialChildren: children,
        );

  static const String name = 'CardSecretFillRoute';

  static const _i25.PageInfo<CardSecretFillRouteArgs> page =
      _i25.PageInfo<CardSecretFillRouteArgs>(name);
}

class CardSecretFillRouteArgs {
  const CardSecretFillRouteArgs({
    this.key,
    this.receivedData,
    required this.state,
  });

  final _i29.Key? key;

  final String? receivedData;

  final _i28.SendToState state;

  @override
  String toString() {
    return 'CardSecretFillRouteArgs{key: $key, receivedData: $receivedData, state: $state}';
  }
}

/// generated route for
/// [_i9.CardSettingsPage]
class CardSettingsRoute extends _i25.PageRouteInfo<CardSettingsRouteArgs> {
  CardSettingsRoute({
    _i29.Key? key,
    required _i32.CardModel card,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          CardSettingsRoute.name,
          args: CardSettingsRouteArgs(
            key: key,
            card: card,
          ),
          initialChildren: children,
        );

  static const String name = 'CardSettingsRoute';

  static const _i25.PageInfo<CardSettingsRouteArgs> page =
      _i25.PageInfo<CardSettingsRouteArgs>(name);
}

class CardSettingsRouteArgs {
  const CardSettingsRouteArgs({
    this.key,
    required this.card,
  });

  final _i29.Key? key;

  final _i32.CardModel card;

  @override
  String toString() {
    return 'CardSettingsRouteArgs{key: $key, card: $card}';
  }
}

/// generated route for
/// [_i10.ChangePinCode]
class ChangePinCode extends _i25.PageRouteInfo<void> {
  const ChangePinCode({List<_i25.PageRouteInfo>? children})
      : super(
          ChangePinCode.name,
          initialChildren: children,
        );

  static const String name = 'ChangePinCode';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i11.CoinChartPage]
class CoinChartRoute extends _i25.PageRouteInfo<CoinChartRouteArgs> {
  CoinChartRoute({
    _i26.Key? key,
    required _i33.CoinResultModel? data,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          CoinChartRoute.name,
          args: CoinChartRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'CoinChartRoute';

  static const _i25.PageInfo<CoinChartRouteArgs> page =
      _i25.PageInfo<CoinChartRouteArgs>(name);
}

class CoinChartRouteArgs {
  const CoinChartRouteArgs({
    this.key,
    required this.data,
  });

  final _i26.Key? key;

  final _i33.CoinResultModel? data;

  @override
  String toString() {
    return 'CoinChartRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i12.ContactUs]
class ContactUs extends _i25.PageRouteInfo<void> {
  const ContactUs({List<_i25.PageRouteInfo>? children})
      : super(
          ContactUs.name,
          initialChildren: children,
        );

  static const String name = 'ContactUs';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i13.CreatePinCode]
class CreatePinCode extends _i25.PageRouteInfo<void> {
  const CreatePinCode({List<_i25.PageRouteInfo>? children})
      : super(
          CreatePinCode.name,
          initialChildren: children,
        );

  static const String name = 'CreatePinCode';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i14.DashboardPage]
class DashboardRoute extends _i25.PageRouteInfo<void> {
  const DashboardRoute({List<_i25.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i15.OnboardingPage]
class OnboardingRoute extends _i25.PageRouteInfo<void> {
  const OnboardingRoute({List<_i25.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i16.PinAfterSplash]
class PinAfterSplash extends _i25.PageRouteInfo<void> {
  const PinAfterSplash({List<_i25.PageRouteInfo>? children})
      : super(
          PinAfterSplash.name,
          initialChildren: children,
        );

  static const String name = 'PinAfterSplash';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i17.PinCodeForAllPages]
class PinCodeForAllRoutes extends _i25.PageRouteInfo<void> {
  const PinCodeForAllRoutes({List<_i25.PageRouteInfo>? children})
      : super(
          PinCodeForAllRoutes.name,
          initialChildren: children,
        );

  static const String name = 'PinCodeForAllRoutes';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i18.PinCodeForPrivateKey]
class PinCodeForPrivateKey
    extends _i25.PageRouteInfo<PinCodeForPrivateKeyArgs> {
  PinCodeForPrivateKey({
    _i29.Key? key,
    _i30.BarModel? bar,
    _i34.BarSettingState? isKeyVisible,
    _i32.CardModel? card,
    _i35.CardSettingState? isVisible,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          PinCodeForPrivateKey.name,
          args: PinCodeForPrivateKeyArgs(
            key: key,
            bar: bar,
            isKeyVisible: isKeyVisible,
            card: card,
            isVisible: isVisible,
          ),
          initialChildren: children,
        );

  static const String name = 'PinCodeForPrivateKey';

  static const _i25.PageInfo<PinCodeForPrivateKeyArgs> page =
      _i25.PageInfo<PinCodeForPrivateKeyArgs>(name);
}

class PinCodeForPrivateKeyArgs {
  const PinCodeForPrivateKeyArgs({
    this.key,
    this.bar,
    this.isKeyVisible,
    this.card,
    this.isVisible,
  });

  final _i29.Key? key;

  final _i30.BarModel? bar;

  final _i34.BarSettingState? isKeyVisible;

  final _i32.CardModel? card;

  final _i35.CardSettingState? isVisible;

  @override
  String toString() {
    return 'PinCodeForPrivateKeyArgs{key: $key, bar: $bar, isKeyVisible: $isKeyVisible, card: $card, isVisible: $isVisible}';
  }
}

/// generated route for
/// [_i19.PinCodePage]
class PinCodeRoute extends _i25.PageRouteInfo<void> {
  const PinCodeRoute({List<_i25.PageRouteInfo>? children})
      : super(
          PinCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinCodeRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i20.PinRemove]
class PinRemove extends _i25.PageRouteInfo<void> {
  const PinRemove({List<_i25.PageRouteInfo>? children})
      : super(
          PinRemove.name,
          initialChildren: children,
        );

  static const String name = 'PinRemove';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i21.QrScannerPage]
class QrScannerRoute extends _i25.PageRouteInfo<QrScannerRouteArgs> {
  QrScannerRoute({
    _i26.Key? key,
    bool? isScannedReceiverAddress,
    List<_i25.PageRouteInfo>? children,
  }) : super(
          QrScannerRoute.name,
          args: QrScannerRouteArgs(
            key: key,
            isScannedReceiverAddress: isScannedReceiverAddress,
          ),
          initialChildren: children,
        );

  static const String name = 'QrScannerRoute';

  static const _i25.PageInfo<QrScannerRouteArgs> page =
      _i25.PageInfo<QrScannerRouteArgs>(name);
}

class QrScannerRouteArgs {
  const QrScannerRouteArgs({
    this.key,
    this.isScannedReceiverAddress,
  });

  final _i26.Key? key;

  final bool? isScannedReceiverAddress;

  @override
  String toString() {
    return 'QrScannerRouteArgs{key: $key, isScannedReceiverAddress: $isScannedReceiverAddress}';
  }
}

/// generated route for
/// [_i22.SettingsPage]
class SettingsRoute extends _i25.PageRouteInfo<void> {
  const SettingsRoute({List<_i25.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i23.SplashPage]
class SplashRoute extends _i25.PageRouteInfo<void> {
  const SplashRoute({List<_i25.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}

/// generated route for
/// [_i24.WalletProtectionPage]
class WalletProtectionRoute extends _i25.PageRouteInfo<void> {
  const WalletProtectionRoute({List<_i25.PageRouteInfo>? children})
      : super(
          WalletProtectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletProtectionRoute';

  static const _i25.PageInfo<void> page = _i25.PageInfo<void>(name);
}
