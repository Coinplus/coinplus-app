// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i34;

import 'package:auto_route/auto_route.dart' as _i28;
import 'package:coinplus/models/abstract_card/abstract_card.dart' as _i36;
import 'package:coinplus/models/bar_model/bar_model.dart' as _i33;
import 'package:coinplus/models/card_model/card_model.dart' as _i37;
import 'package:coinplus/models/coins_dto/coin_model.dart' as _i39;
import 'package:coinplus/models/eth_card_model/eth_card_model.dart' as _i38;
import 'package:coinplus/models/firebase_model/buy_card_model.dart' as _i35;
import 'package:coinplus/pages/bar_activation_page/bar_activation_page.dart'
    as _i2;
import 'package:coinplus/pages/bar_connect_page/bar_connect_page.dart' as _i3;
import 'package:coinplus/pages/bar_connect_page/bar_connect_with_nfc.dart'
    as _i4;
import 'package:coinplus/pages/bar_settings_page/bar_settings_page.dart' as _i5;
import 'package:coinplus/pages/buy_card_page/buy_card_page.dart' as _i6;
import 'package:coinplus/pages/card_activation_page/card_activation_page.dart'
    as _i7;
import 'package:coinplus/pages/card_connect_page/card_connect_page.dart' as _i8;
import 'package:coinplus/pages/card_connect_page/card_connect_with_nfc/card_connect_with_nfc.dart'
    as _i9;
import 'package:coinplus/pages/card_settings_page/bitcoin_flow/card_settings_page.dart'
    as _i10;
import 'package:coinplus/pages/card_settings_page/ethereum_flow/eth_card_settings_page.dart'
    as _i16;
import 'package:coinplus/pages/coin_chart_page/coin_chart_page.dart' as _i12;
import 'package:coinplus/pages/dashboard/dashboard.dart' as _i15;
import 'package:coinplus/pages/onboarding_page/onboarding_page.dart' as _i17;
import 'package:coinplus/pages/pin_code_page/change_pin_code_page.dart' as _i11;
import 'package:coinplus/pages/pin_code_page/create_pin_code_page.dart' as _i14;
import 'package:coinplus/pages/pin_code_page/pin_code_after_splash.dart'
    as _i18;
import 'package:coinplus/pages/pin_code_page/pin_code_for_all_pages.dart'
    as _i19;
import 'package:coinplus/pages/pin_code_page/pin_code_for_eth_private_key.dart'
    as _i20;
import 'package:coinplus/pages/pin_code_page/pin_code_for_private_key.dart'
    as _i21;
import 'package:coinplus/pages/pin_code_page/pin_code_page.dart' as _i22;
import 'package:coinplus/pages/pin_code_page/remove_pin_code.dart' as _i23;
import 'package:coinplus/pages/qr_scanner_page/qr_scanner.dart' as _i24;
import 'package:coinplus/pages/send_page/send_to/send_to_state.dart' as _i30;
import 'package:coinplus/pages/settings_page/app_info_page/app_info_page.dart'
    as _i1;
import 'package:coinplus/pages/settings_page/contact_us/contact_us.dart'
    as _i13;
import 'package:coinplus/pages/settings_page/settings_page.dart' as _i25;
import 'package:coinplus/pages/splash_screen/splash_screen.dart' as _i26;
import 'package:coinplus/pages/wallet_protection_page/wallet_protection_page.dart'
    as _i27;
import 'package:coinplus/store/bar_color_state/bar_setting_state.dart' as _i40;
import 'package:coinplus/store/card_color_state/card_setting_state.dart'
    as _i42;
import 'package:coinplus/store/card_color_state/eth_card_settings_state.dart'
    as _i41;
import 'package:flutter/cupertino.dart' as _i31;
import 'package:flutter/foundation.dart' as _i29;
import 'package:flutter/material.dart' as _i32;

abstract class $Router extends _i28.RootStackRouter {
  $Router({super.navigatorKey});

  @override
  final Map<String, _i28.PageFactory> pagesMap = {
    AboutAppRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutAppPage(),
      );
    },
    BarActivationRoute.name: (routeData) {
      final args = routeData.argsAs<BarActivationRouteArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.BarActivationPage(
          key: args.key,
          receivedData: args.receivedData,
          state: args.state,
        ),
      );
    },
    BarConnectRoute.name: (routeData) {
      final args = routeData.argsAs<BarConnectRouteArgs>(
          orElse: () => const BarConnectRouteArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.BarConnectPage(
          key: args.key,
          receivedData: args.receivedData,
        ),
      );
    },
    BarConnectWithNfc.name: (routeData) {
      final args = routeData.argsAs<BarConnectWithNfcArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.BarConnectWithNfc(
          key: args.key,
          receivedData: args.receivedData,
          barColor: args.barColor,
          isOriginalTag: args.isOriginalTag,
          isActivated: args.isActivated,
        ),
      );
    },
    BarSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<BarSettingsRouteArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.BarSettingsPage(
          key: args.key,
          bar: args.bar,
        ),
      );
    },
    BuyCardRoute.name: (routeData) {
      final args = routeData.argsAs<BuyCardRouteArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.BuyCardPage(
          key: args.key,
          method: args.method,
        ),
      );
    },
    CardActivationRoute.name: (routeData) {
      final args = routeData.argsAs<CardActivationRouteArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.CardActivationPage(
          key: args.key,
          receivedData: args.receivedData,
          state: args.state,
        ),
      );
    },
    CardConnectRoute.name: (routeData) {
      final args = routeData.argsAs<CardConnectRouteArgs>(
          orElse: () => const CardConnectRouteArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.CardConnectPage(
          key: args.key,
          receivedData: args.receivedData,
          onChangeCard: args.onChangeCard,
        ),
      );
    },
    CardConnectWithNfc.name: (routeData) {
      final args = routeData.argsAs<CardConnectWithNfcArgs>(
          orElse: () => const CardConnectWithNfcArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.CardConnectWithNfc(
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
    CardSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<CardSettingsRouteArgs>(
          orElse: () => const CardSettingsRouteArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.CardSettingsPage(
          key: args.key,
          card: args.card,
          ethCard: args.ethCard,
        ),
      );
    },
    ChangePinCode.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.ChangePinCode(),
      );
    },
    CoinChartRoute.name: (routeData) {
      final args = routeData.argsAs<CoinChartRouteArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.CoinChartPage(
          key: args.key,
          data: args.data,
        ),
      );
    },
    ContactUs.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ContactUs(),
      );
    },
    CreatePinCode.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.CreatePinCode(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.DashboardPage(),
      );
    },
    EthCardSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<EthCardSettingsRouteArgs>();
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i16.EthCardSettingsPage(
          key: args.key,
          ethCard: args.ethCard,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.OnboardingPage(),
      );
    },
    PinAfterSplash.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i18.PinAfterSplash(),
      );
    },
    PinCodeForAllRoutes.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i19.PinCodeForAllPages(),
      );
    },
    PinCodeForEthPrivateKey.name: (routeData) {
      final args = routeData.argsAs<PinCodeForEthPrivateKeyArgs>(
          orElse: () => const PinCodeForEthPrivateKeyArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i20.PinCodeForEthPrivateKey(
          key: args.key,
          bar: args.bar,
          isKeyVisible: args.isKeyVisible,
          ethCard: args.ethCard,
          isVisible: args.isVisible,
        ),
      );
    },
    PinCodeForPrivateKey.name: (routeData) {
      final args = routeData.argsAs<PinCodeForPrivateKeyArgs>(
          orElse: () => const PinCodeForPrivateKeyArgs());
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i21.PinCodeForPrivateKey(
          key: args.key,
          bar: args.bar,
          isKeyVisible: args.isKeyVisible,
          card: args.card,
          isVisible: args.isVisible,
        ),
      );
    },
    PinCodeRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.PinCodePage(),
      );
    },
    PinRemove.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i23.PinRemove(),
      );
    },
    QrScannerRoute.name: (routeData) {
      final args = routeData.argsAs<QrScannerRouteArgs>(
          orElse: () => const QrScannerRouteArgs());
      return _i28.AutoRoutePage<String?>(
        routeData: routeData,
        child: _i24.QrScannerPage(
          key: args.key,
          isScannedReceiverAddress: args.isScannedReceiverAddress,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.SettingsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i26.SplashPage(),
      );
    },
    WalletProtectionRoute.name: (routeData) {
      return _i28.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i27.WalletProtectionPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutAppPage]
class AboutAppRoute extends _i28.PageRouteInfo<void> {
  const AboutAppRoute({List<_i28.PageRouteInfo>? children})
      : super(
          AboutAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutAppRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i2.BarActivationPage]
class BarActivationRoute extends _i28.PageRouteInfo<BarActivationRouteArgs> {
  BarActivationRoute({
    _i29.Key? key,
    String? receivedData,
    required _i30.SendToState state,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          BarActivationRoute.name,
          args: BarActivationRouteArgs(
            key: key,
            receivedData: receivedData,
            state: state,
          ),
          initialChildren: children,
        );

  static const String name = 'BarActivationRoute';

  static const _i28.PageInfo<BarActivationRouteArgs> page =
      _i28.PageInfo<BarActivationRouteArgs>(name);
}

class BarActivationRouteArgs {
  const BarActivationRouteArgs({
    this.key,
    this.receivedData,
    required this.state,
  });

  final _i29.Key? key;

  final String? receivedData;

  final _i30.SendToState state;

  @override
  String toString() {
    return 'BarActivationRouteArgs{key: $key, receivedData: $receivedData, state: $state}';
  }
}

/// generated route for
/// [_i3.BarConnectPage]
class BarConnectRoute extends _i28.PageRouteInfo<BarConnectRouteArgs> {
  BarConnectRoute({
    _i31.Key? key,
    String? receivedData,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          BarConnectRoute.name,
          args: BarConnectRouteArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'BarConnectRoute';

  static const _i28.PageInfo<BarConnectRouteArgs> page =
      _i28.PageInfo<BarConnectRouteArgs>(name);
}

class BarConnectRouteArgs {
  const BarConnectRouteArgs({
    this.key,
    this.receivedData,
  });

  final _i31.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'BarConnectRouteArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i4.BarConnectWithNfc]
class BarConnectWithNfc extends _i28.PageRouteInfo<BarConnectWithNfcArgs> {
  BarConnectWithNfc({
    _i31.Key? key,
    String? receivedData,
    String? barColor,
    bool? isOriginalTag,
    required bool? isActivated,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          BarConnectWithNfc.name,
          args: BarConnectWithNfcArgs(
            key: key,
            receivedData: receivedData,
            barColor: barColor,
            isOriginalTag: isOriginalTag,
            isActivated: isActivated,
          ),
          initialChildren: children,
        );

  static const String name = 'BarConnectWithNfc';

  static const _i28.PageInfo<BarConnectWithNfcArgs> page =
      _i28.PageInfo<BarConnectWithNfcArgs>(name);
}

class BarConnectWithNfcArgs {
  const BarConnectWithNfcArgs({
    this.key,
    this.receivedData,
    this.barColor,
    this.isOriginalTag,
    required this.isActivated,
  });

  final _i31.Key? key;

  final String? receivedData;

  final String? barColor;

  final bool? isOriginalTag;

  final bool? isActivated;

  @override
  String toString() {
    return 'BarConnectWithNfcArgs{key: $key, receivedData: $receivedData, barColor: $barColor, isOriginalTag: $isOriginalTag, isActivated: $isActivated}';
  }
}

/// generated route for
/// [_i5.BarSettingsPage]
class BarSettingsRoute extends _i28.PageRouteInfo<BarSettingsRouteArgs> {
  BarSettingsRoute({
    _i32.Key? key,
    required _i33.BarModel bar,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          BarSettingsRoute.name,
          args: BarSettingsRouteArgs(
            key: key,
            bar: bar,
          ),
          initialChildren: children,
        );

  static const String name = 'BarSettingsRoute';

  static const _i28.PageInfo<BarSettingsRouteArgs> page =
      _i28.PageInfo<BarSettingsRouteArgs>(name);
}

class BarSettingsRouteArgs {
  const BarSettingsRouteArgs({
    this.key,
    required this.bar,
  });

  final _i32.Key? key;

  final _i33.BarModel bar;

  @override
  String toString() {
    return 'BarSettingsRouteArgs{key: $key, bar: $bar}';
  }
}

/// generated route for
/// [_i6.BuyCardPage]
class BuyCardRoute extends _i28.PageRouteInfo<BuyCardRouteArgs> {
  BuyCardRoute({
    _i32.Key? key,
    required _i34.Future<_i35.BuyCardModel?> method,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          BuyCardRoute.name,
          args: BuyCardRouteArgs(
            key: key,
            method: method,
          ),
          initialChildren: children,
        );

  static const String name = 'BuyCardRoute';

  static const _i28.PageInfo<BuyCardRouteArgs> page =
      _i28.PageInfo<BuyCardRouteArgs>(name);
}

class BuyCardRouteArgs {
  const BuyCardRouteArgs({
    this.key,
    required this.method,
  });

  final _i32.Key? key;

  final _i34.Future<_i35.BuyCardModel?> method;

  @override
  String toString() {
    return 'BuyCardRouteArgs{key: $key, method: $method}';
  }
}

/// generated route for
/// [_i7.CardActivationPage]
class CardActivationRoute extends _i28.PageRouteInfo<CardActivationRouteArgs> {
  CardActivationRoute({
    _i32.Key? key,
    String? receivedData,
    required _i30.SendToState state,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          CardActivationRoute.name,
          args: CardActivationRouteArgs(
            key: key,
            receivedData: receivedData,
            state: state,
          ),
          initialChildren: children,
        );

  static const String name = 'CardActivationRoute';

  static const _i28.PageInfo<CardActivationRouteArgs> page =
      _i28.PageInfo<CardActivationRouteArgs>(name);
}

class CardActivationRouteArgs {
  const CardActivationRouteArgs({
    this.key,
    this.receivedData,
    required this.state,
  });

  final _i32.Key? key;

  final String? receivedData;

  final _i30.SendToState state;

  @override
  String toString() {
    return 'CardActivationRouteArgs{key: $key, receivedData: $receivedData, state: $state}';
  }
}

/// generated route for
/// [_i8.CardConnectPage]
class CardConnectRoute extends _i28.PageRouteInfo<CardConnectRouteArgs> {
  CardConnectRoute({
    _i32.Key? key,
    String? receivedData,
    void Function(({_i36.AbstractCard? card, int index}))? onChangeCard,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          CardConnectRoute.name,
          args: CardConnectRouteArgs(
            key: key,
            receivedData: receivedData,
            onChangeCard: onChangeCard,
          ),
          initialChildren: children,
        );

  static const String name = 'CardConnectRoute';

  static const _i28.PageInfo<CardConnectRouteArgs> page =
      _i28.PageInfo<CardConnectRouteArgs>(name);
}

class CardConnectRouteArgs {
  const CardConnectRouteArgs({
    this.key,
    this.receivedData,
    this.onChangeCard,
  });

  final _i32.Key? key;

  final String? receivedData;

  final void Function(({_i36.AbstractCard? card, int index}))? onChangeCard;

  @override
  String toString() {
    return 'CardConnectRouteArgs{key: $key, receivedData: $receivedData, onChangeCard: $onChangeCard}';
  }
}

/// generated route for
/// [_i9.CardConnectWithNfc]
class CardConnectWithNfc extends _i28.PageRouteInfo<CardConnectWithNfcArgs> {
  CardConnectWithNfc({
    _i32.Key? key,
    String? receivedData,
    String? cardColor,
    bool? isOriginalCard,
    bool? isMiFareUltralight,
    bool? isOldCard,
    bool? isActivated,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          CardConnectWithNfc.name,
          args: CardConnectWithNfcArgs(
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

  static const String name = 'CardConnectWithNfc';

  static const _i28.PageInfo<CardConnectWithNfcArgs> page =
      _i28.PageInfo<CardConnectWithNfcArgs>(name);
}

class CardConnectWithNfcArgs {
  const CardConnectWithNfcArgs({
    this.key,
    this.receivedData,
    this.cardColor,
    this.isOriginalCard,
    this.isMiFareUltralight,
    this.isOldCard,
    this.isActivated,
  });

  final _i32.Key? key;

  final String? receivedData;

  final String? cardColor;

  final bool? isOriginalCard;

  final bool? isMiFareUltralight;

  final bool? isOldCard;

  final bool? isActivated;

  @override
  String toString() {
    return 'CardConnectWithNfcArgs{key: $key, receivedData: $receivedData, cardColor: $cardColor, isOriginalCard: $isOriginalCard, isMiFareUltralight: $isMiFareUltralight, isOldCard: $isOldCard, isActivated: $isActivated}';
  }
}

/// generated route for
/// [_i10.CardSettingsPage]
class CardSettingsRoute extends _i28.PageRouteInfo<CardSettingsRouteArgs> {
  CardSettingsRoute({
    _i32.Key? key,
    _i37.CardModel? card,
    _i38.EthCardModel? ethCard,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          CardSettingsRoute.name,
          args: CardSettingsRouteArgs(
            key: key,
            card: card,
            ethCard: ethCard,
          ),
          initialChildren: children,
        );

  static const String name = 'CardSettingsRoute';

  static const _i28.PageInfo<CardSettingsRouteArgs> page =
      _i28.PageInfo<CardSettingsRouteArgs>(name);
}

class CardSettingsRouteArgs {
  const CardSettingsRouteArgs({
    this.key,
    this.card,
    this.ethCard,
  });

  final _i32.Key? key;

  final _i37.CardModel? card;

  final _i38.EthCardModel? ethCard;

  @override
  String toString() {
    return 'CardSettingsRouteArgs{key: $key, card: $card, ethCard: $ethCard}';
  }
}

/// generated route for
/// [_i11.ChangePinCode]
class ChangePinCode extends _i28.PageRouteInfo<void> {
  const ChangePinCode({List<_i28.PageRouteInfo>? children})
      : super(
          ChangePinCode.name,
          initialChildren: children,
        );

  static const String name = 'ChangePinCode';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i12.CoinChartPage]
class CoinChartRoute extends _i28.PageRouteInfo<CoinChartRouteArgs> {
  CoinChartRoute({
    _i31.Key? key,
    required _i39.CoinResultModel? data,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          CoinChartRoute.name,
          args: CoinChartRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'CoinChartRoute';

  static const _i28.PageInfo<CoinChartRouteArgs> page =
      _i28.PageInfo<CoinChartRouteArgs>(name);
}

class CoinChartRouteArgs {
  const CoinChartRouteArgs({
    this.key,
    required this.data,
  });

  final _i31.Key? key;

  final _i39.CoinResultModel? data;

  @override
  String toString() {
    return 'CoinChartRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i13.ContactUs]
class ContactUs extends _i28.PageRouteInfo<void> {
  const ContactUs({List<_i28.PageRouteInfo>? children})
      : super(
          ContactUs.name,
          initialChildren: children,
        );

  static const String name = 'ContactUs';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i14.CreatePinCode]
class CreatePinCode extends _i28.PageRouteInfo<void> {
  const CreatePinCode({List<_i28.PageRouteInfo>? children})
      : super(
          CreatePinCode.name,
          initialChildren: children,
        );

  static const String name = 'CreatePinCode';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i15.DashboardPage]
class DashboardRoute extends _i28.PageRouteInfo<void> {
  const DashboardRoute({List<_i28.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i16.EthCardSettingsPage]
class EthCardSettingsRoute
    extends _i28.PageRouteInfo<EthCardSettingsRouteArgs> {
  EthCardSettingsRoute({
    _i32.Key? key,
    required _i38.EthCardModel ethCard,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          EthCardSettingsRoute.name,
          args: EthCardSettingsRouteArgs(
            key: key,
            ethCard: ethCard,
          ),
          initialChildren: children,
        );

  static const String name = 'EthCardSettingsRoute';

  static const _i28.PageInfo<EthCardSettingsRouteArgs> page =
      _i28.PageInfo<EthCardSettingsRouteArgs>(name);
}

class EthCardSettingsRouteArgs {
  const EthCardSettingsRouteArgs({
    this.key,
    required this.ethCard,
  });

  final _i32.Key? key;

  final _i38.EthCardModel ethCard;

  @override
  String toString() {
    return 'EthCardSettingsRouteArgs{key: $key, ethCard: $ethCard}';
  }
}

/// generated route for
/// [_i17.OnboardingPage]
class OnboardingRoute extends _i28.PageRouteInfo<void> {
  const OnboardingRoute({List<_i28.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i18.PinAfterSplash]
class PinAfterSplash extends _i28.PageRouteInfo<void> {
  const PinAfterSplash({List<_i28.PageRouteInfo>? children})
      : super(
          PinAfterSplash.name,
          initialChildren: children,
        );

  static const String name = 'PinAfterSplash';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i19.PinCodeForAllPages]
class PinCodeForAllRoutes extends _i28.PageRouteInfo<void> {
  const PinCodeForAllRoutes({List<_i28.PageRouteInfo>? children})
      : super(
          PinCodeForAllRoutes.name,
          initialChildren: children,
        );

  static const String name = 'PinCodeForAllRoutes';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i20.PinCodeForEthPrivateKey]
class PinCodeForEthPrivateKey
    extends _i28.PageRouteInfo<PinCodeForEthPrivateKeyArgs> {
  PinCodeForEthPrivateKey({
    _i32.Key? key,
    _i33.BarModel? bar,
    _i40.BarSettingState? isKeyVisible,
    _i38.EthCardModel? ethCard,
    _i41.EthCardSettingState? isVisible,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          PinCodeForEthPrivateKey.name,
          args: PinCodeForEthPrivateKeyArgs(
            key: key,
            bar: bar,
            isKeyVisible: isKeyVisible,
            ethCard: ethCard,
            isVisible: isVisible,
          ),
          initialChildren: children,
        );

  static const String name = 'PinCodeForEthPrivateKey';

  static const _i28.PageInfo<PinCodeForEthPrivateKeyArgs> page =
      _i28.PageInfo<PinCodeForEthPrivateKeyArgs>(name);
}

class PinCodeForEthPrivateKeyArgs {
  const PinCodeForEthPrivateKeyArgs({
    this.key,
    this.bar,
    this.isKeyVisible,
    this.ethCard,
    this.isVisible,
  });

  final _i32.Key? key;

  final _i33.BarModel? bar;

  final _i40.BarSettingState? isKeyVisible;

  final _i38.EthCardModel? ethCard;

  final _i41.EthCardSettingState? isVisible;

  @override
  String toString() {
    return 'PinCodeForEthPrivateKeyArgs{key: $key, bar: $bar, isKeyVisible: $isKeyVisible, ethCard: $ethCard, isVisible: $isVisible}';
  }
}

/// generated route for
/// [_i21.PinCodeForPrivateKey]
class PinCodeForPrivateKey
    extends _i28.PageRouteInfo<PinCodeForPrivateKeyArgs> {
  PinCodeForPrivateKey({
    _i32.Key? key,
    _i33.BarModel? bar,
    _i40.BarSettingState? isKeyVisible,
    _i37.CardModel? card,
    _i42.CardSettingState? isVisible,
    List<_i28.PageRouteInfo>? children,
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

  static const _i28.PageInfo<PinCodeForPrivateKeyArgs> page =
      _i28.PageInfo<PinCodeForPrivateKeyArgs>(name);
}

class PinCodeForPrivateKeyArgs {
  const PinCodeForPrivateKeyArgs({
    this.key,
    this.bar,
    this.isKeyVisible,
    this.card,
    this.isVisible,
  });

  final _i32.Key? key;

  final _i33.BarModel? bar;

  final _i40.BarSettingState? isKeyVisible;

  final _i37.CardModel? card;

  final _i42.CardSettingState? isVisible;

  @override
  String toString() {
    return 'PinCodeForPrivateKeyArgs{key: $key, bar: $bar, isKeyVisible: $isKeyVisible, card: $card, isVisible: $isVisible}';
  }
}

/// generated route for
/// [_i22.PinCodePage]
class PinCodeRoute extends _i28.PageRouteInfo<void> {
  const PinCodeRoute({List<_i28.PageRouteInfo>? children})
      : super(
          PinCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinCodeRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i23.PinRemove]
class PinRemove extends _i28.PageRouteInfo<void> {
  const PinRemove({List<_i28.PageRouteInfo>? children})
      : super(
          PinRemove.name,
          initialChildren: children,
        );

  static const String name = 'PinRemove';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i24.QrScannerPage]
class QrScannerRoute extends _i28.PageRouteInfo<QrScannerRouteArgs> {
  QrScannerRoute({
    _i31.Key? key,
    bool? isScannedReceiverAddress,
    List<_i28.PageRouteInfo>? children,
  }) : super(
          QrScannerRoute.name,
          args: QrScannerRouteArgs(
            key: key,
            isScannedReceiverAddress: isScannedReceiverAddress,
          ),
          initialChildren: children,
        );

  static const String name = 'QrScannerRoute';

  static const _i28.PageInfo<QrScannerRouteArgs> page =
      _i28.PageInfo<QrScannerRouteArgs>(name);
}

class QrScannerRouteArgs {
  const QrScannerRouteArgs({
    this.key,
    this.isScannedReceiverAddress,
  });

  final _i31.Key? key;

  final bool? isScannedReceiverAddress;

  @override
  String toString() {
    return 'QrScannerRouteArgs{key: $key, isScannedReceiverAddress: $isScannedReceiverAddress}';
  }
}

/// generated route for
/// [_i25.SettingsPage]
class SettingsRoute extends _i28.PageRouteInfo<void> {
  const SettingsRoute({List<_i28.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i26.SplashPage]
class SplashRoute extends _i28.PageRouteInfo<void> {
  const SplashRoute({List<_i28.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}

/// generated route for
/// [_i27.WalletProtectionPage]
class WalletProtectionRoute extends _i28.PageRouteInfo<void> {
  const WalletProtectionRoute({List<_i28.PageRouteInfo>? children})
      : super(
          WalletProtectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletProtectionRoute';

  static const _i28.PageInfo<void> page = _i28.PageInfo<void>(name);
}
