// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i37;

import 'package:auto_route/auto_route.dart' as _i31;
import 'package:coinplus/models/abstract_card/abstract_card.dart' as _i33;
import 'package:coinplus/models/bar_model/bar_model.dart' as _i36;
import 'package:coinplus/models/card_model/card_model.dart' as _i40;
import 'package:coinplus/models/coins_dto/coin_model.dart' as _i39;
import 'package:coinplus/models/firebase_model/buy_card_model.dart' as _i38;
import 'package:coinplus/pages/bar_activation_page/bar_activation_page.dart' as _i4;
import 'package:coinplus/pages/bar_connect_page/bar_connect_page.dart' as _i5;
import 'package:coinplus/pages/bar_connect_page/bar_connect_with_nfc.dart' as _i6;
import 'package:coinplus/pages/bar_settings_page/bar_settings_page.dart' as _i7;
import 'package:coinplus/pages/buy_card_page/buy_card_page.dart' as _i8;
import 'package:coinplus/pages/card_activation_page/card_activation_page.dart' as _i9;
import 'package:coinplus/pages/card_connect_page/backup_my_wallet_flow/backup_my_wallet_page.dart' as _i3;
import 'package:coinplus/pages/card_connect_page/backup_my_wallet_flow/dont_have_backup_page.dart' as _i18;
import 'package:coinplus/pages/card_connect_page/backup_my_wallet_flow/secret_success_page.dart' as _i27;
import 'package:coinplus/pages/card_connect_page/card_connect_page.dart' as _i10;
import 'package:coinplus/pages/card_connect_page/card_connect_with_nfc/card_connect_with_nfc.dart' as _i11;
import 'package:coinplus/pages/card_settings_page/activate_card_for_backup.dart' as _i2;
import 'package:coinplus/pages/card_settings_page/card_settings_page.dart' as _i12;
import 'package:coinplus/pages/card_settings_page/lost_my_card_page.dart' as _i19;
import 'package:coinplus/pages/coin_chart_page/coin_chart_page.dart' as _i14;
import 'package:coinplus/pages/dashboard/dashboard.dart' as _i17;
import 'package:coinplus/pages/onboarding_page/onboarding_page.dart' as _i20;
import 'package:coinplus/pages/pin_code_page/change_pin_code_page.dart' as _i13;
import 'package:coinplus/pages/pin_code_page/create_pin_code_page.dart' as _i16;
import 'package:coinplus/pages/pin_code_page/pin_code_after_splash.dart' as _i21;
import 'package:coinplus/pages/pin_code_page/pin_code_for_all_pages.dart' as _i22;
import 'package:coinplus/pages/pin_code_page/pin_code_for_private_key.dart' as _i23;
import 'package:coinplus/pages/pin_code_page/pin_code_page.dart' as _i24;
import 'package:coinplus/pages/pin_code_page/remove_pin_code.dart' as _i25;
import 'package:coinplus/pages/qr_scanner_page/qr_scanner.dart' as _i26;
import 'package:coinplus/pages/settings_page/app_info_page/app_info_page.dart' as _i1;
import 'package:coinplus/pages/settings_page/contact_us/contact_us.dart' as _i15;
import 'package:coinplus/pages/settings_page/settings_page.dart' as _i28;
import 'package:coinplus/pages/splash_screen/splash_screen.dart' as _i29;
import 'package:coinplus/pages/wallet_protection_page/wallet_protection_page.dart' as _i30;
import 'package:coinplus/store/bar_color_state/bar_setting_state.dart' as _i41;
import 'package:coinplus/store/card_color_state/card_setting_state.dart' as _i42;
import 'package:flutter/cupertino.dart' as _i35;
import 'package:flutter/foundation.dart' as _i34;
import 'package:flutter/material.dart' as _i32;

abstract class $Router extends _i31.RootStackRouter {
  $Router({super.navigatorKey});

  @override
  final Map<String, _i31.PageFactory> pagesMap = {
    AboutAppRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AboutAppPage(),
      );
    },
    ActivateCardForBackup.name: (routeData) {
      final args = routeData.argsAs<ActivateCardForBackupArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.ActivateCardForBackup(
          key: args.key,
          card: args.card,
        ),
      );
    },
    BackupMyWalletRoute.name: (routeData) {
      final args = routeData.argsAs<BackupMyWalletRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.BackupMyWalletPage(
          key: args.key,
          walletAddress: args.walletAddress,
          backupPack: args.backupPack,
          isWalletActivated: args.isWalletActivated,
          cardColor: args.cardColor,
        ),
      );
    },
    BarActivationRoute.name: (routeData) {
      final args = routeData.argsAs<BarActivationRouteArgs>(orElse: () => const BarActivationRouteArgs());
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.BarActivationPage(
          key: args.key,
          receivedData: args.receivedData,
          hasBackup: args.hasBackup,
        ),
      );
    },
    BarConnectRoute.name: (routeData) {
      final args = routeData.argsAs<BarConnectRouteArgs>(orElse: () => const BarConnectRouteArgs());
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.BarConnectPage(
          key: args.key,
          receivedData: args.receivedData,
        ),
      );
    },
    BarConnectWithNfc.name: (routeData) {
      final args = routeData.argsAs<BarConnectWithNfcArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.BarConnectWithNfc(
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
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.BarSettingsPage(
          key: args.key,
          bar: args.bar,
        ),
      );
    },
    BuyCardRoute.name: (routeData) {
      final args = routeData.argsAs<BuyCardRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.BuyCardPage(
          key: args.key,
          method: args.method,
        ),
      );
    },
    CardActivationRoute.name: (routeData) {
      final args = routeData.argsAs<CardActivationRouteArgs>(orElse: () => const CardActivationRouteArgs());
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.CardActivationPage(
          key: args.key,
          receivedData: args.receivedData,
          backupPack: args.backupPack,
          s: args.s,
        ),
      );
    },
    CardConnectRoute.name: (routeData) {
      final args = routeData.argsAs<CardConnectRouteArgs>(orElse: () => const CardConnectRouteArgs());
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.CardConnectPage(
          key: args.key,
          receivedData: args.receivedData,
          onChangeCard: args.onChangeCard,
          cardColor: args.cardColor,
        ),
      );
    },
    CardConnectWithNfc.name: (routeData) {
      final args = routeData.argsAs<CardConnectWithNfcArgs>(orElse: () => const CardConnectWithNfcArgs());
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.CardConnectWithNfc(
          key: args.key,
          receivedData: args.receivedData,
          cardColor: args.cardColor,
          isOriginalNxp: args.isOriginalNxp,
          isMiFareUltralight: args.isMiFareUltralight,
          isOldCard: args.isOldCard,
          backupPack: args.backupPack,
          backup: args.backup,
          isActivated: args.isActivated,
          isBackupCard: args.isBackupCard,
          mainWalletAddress: args.mainWalletAddress,
          isFromBackupConnect: args.isFromBackupConnect,
        ),
      );
    },
    CardSettingsRoute.name: (routeData) {
      final args = routeData.argsAs<CardSettingsRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.CardSettingsPage(
          key: args.key,
          card: args.card,
        ),
      );
    },
    ChangePinCode.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i13.ChangePinCode(),
      );
    },
    CoinChartRoute.name: (routeData) {
      final args = routeData.argsAs<CoinChartRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i14.CoinChartPage(
          key: args.key,
          data: args.data,
        ),
      );
    },
    ContactUs.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ContactUs(),
      );
    },
    CreatePinCode.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i16.CreatePinCode(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i17.DashboardPage(),
      );
    },
    DontHaveBackupRoute.name: (routeData) {
      final args = routeData.argsAs<DontHaveBackupRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i18.DontHaveBackupPage(
          key: args.key,
          walletAddress: args.walletAddress,
          cardColor: args.cardColor,
        ),
      );
    },
    LostMyCardRoute.name: (routeData) {
      final args = routeData.argsAs<LostMyCardRouteArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.LostMyCardPage(
          key: args.key,
          backupCard: args.backupCard,
          mainCard: args.mainCard,
        ),
      );
    },
    OnboardingRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i20.OnboardingPage(),
      );
    },
    PinAfterSplash.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i21.PinAfterSplash(),
      );
    },
    PinCodeForAllRoutes.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i22.PinCodeForAllPages(),
      );
    },
    PinCodeForPrivateKey.name: (routeData) {
      final args = routeData.argsAs<PinCodeForPrivateKeyArgs>(orElse: () => const PinCodeForPrivateKeyArgs());
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i23.PinCodeForPrivateKey(
          key: args.key,
          bar: args.bar,
          isKeyVisible: args.isKeyVisible,
          card: args.card,
          isVisible: args.isVisible,
        ),
      );
    },
    PinCodeRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i24.PinCodePage(),
      );
    },
    PinRemove.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i25.PinRemove(),
      );
    },
    QrScannerRoute.name: (routeData) {
      final args = routeData.argsAs<QrScannerRouteArgs>(orElse: () => const QrScannerRouteArgs());
      return _i31.AutoRoutePage<String?>(
        routeData: routeData,
        child: _i26.QrScannerPage(
          key: args.key,
          isScannedReceiverAddress: args.isScannedReceiverAddress,
        ),
      );
    },
    SecretSuccess.name: (routeData) {
      final args = routeData.argsAs<SecretSuccessArgs>();
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i27.SecretSuccess(
          key: args.key,
          walletAddress: args.walletAddress,
          initialPageIndex: args.initialPageIndex,
        ),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i28.SettingsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i29.SplashPage(),
      );
    },
    WalletProtectionRoute.name: (routeData) {
      return _i31.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i30.WalletProtectionPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.AboutAppPage]
class AboutAppRoute extends _i31.PageRouteInfo<void> {
  const AboutAppRoute({List<_i31.PageRouteInfo>? children})
      : super(
          AboutAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutAppRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ActivateCardForBackup]
class ActivateCardForBackup extends _i31.PageRouteInfo<ActivateCardForBackupArgs> {
  ActivateCardForBackup({
    _i32.Key? key,
    required _i33.AbstractCard card,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          ActivateCardForBackup.name,
          args: ActivateCardForBackupArgs(
            key: key,
            card: card,
          ),
          initialChildren: children,
        );

  static const String name = 'ActivateCardForBackup';

  static const _i31.PageInfo<ActivateCardForBackupArgs> page = _i31.PageInfo<ActivateCardForBackupArgs>(name);
}

class ActivateCardForBackupArgs {
  const ActivateCardForBackupArgs({
    this.key,
    required this.card,
  });

  final _i32.Key? key;

  final _i33.AbstractCard card;

  @override
  String toString() {
    return 'ActivateCardForBackupArgs{key: $key, card: $card}';
  }
}

/// generated route for
/// [_i3.BackupMyWalletPage]
class BackupMyWalletRoute extends _i31.PageRouteInfo<BackupMyWalletRouteArgs> {
  BackupMyWalletRoute({
    _i32.Key? key,
    required String walletAddress,
    required bool? backupPack,
    required bool? isWalletActivated,
    required String? cardColor,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          BackupMyWalletRoute.name,
          args: BackupMyWalletRouteArgs(
            key: key,
            walletAddress: walletAddress,
            backupPack: backupPack,
            isWalletActivated: isWalletActivated,
            cardColor: cardColor,
          ),
          initialChildren: children,
        );

  static const String name = 'BackupMyWalletRoute';

  static const _i31.PageInfo<BackupMyWalletRouteArgs> page = _i31.PageInfo<BackupMyWalletRouteArgs>(name);
}

class BackupMyWalletRouteArgs {
  const BackupMyWalletRouteArgs({
    this.key,
    required this.walletAddress,
    required this.backupPack,
    required this.isWalletActivated,
    required this.cardColor,
  });

  final _i32.Key? key;

  final String walletAddress;

  final bool? backupPack;

  final bool? isWalletActivated;

  final String? cardColor;

  @override
  String toString() {
    return 'BackupMyWalletRouteArgs{key: $key, walletAddress: $walletAddress, backupPack: $backupPack, isWalletActivated: $isWalletActivated, cardColor: $cardColor}';
  }
}

/// generated route for
/// [_i4.BarActivationPage]
class BarActivationRoute extends _i31.PageRouteInfo<BarActivationRouteArgs> {
  BarActivationRoute({
    _i34.Key? key,
    String? receivedData,
    bool? hasBackup,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          BarActivationRoute.name,
          args: BarActivationRouteArgs(
            key: key,
            receivedData: receivedData,
            hasBackup: hasBackup,
          ),
          initialChildren: children,
        );

  static const String name = 'BarActivationRoute';

  static const _i31.PageInfo<BarActivationRouteArgs> page = _i31.PageInfo<BarActivationRouteArgs>(name);
}

class BarActivationRouteArgs {
  const BarActivationRouteArgs({
    this.key,
    this.receivedData,
    this.hasBackup,
  });

  final _i34.Key? key;

  final String? receivedData;

  final bool? hasBackup;

  @override
  String toString() {
    return 'BarActivationRouteArgs{key: $key, receivedData: $receivedData, hasBackup: $hasBackup}';
  }
}

/// generated route for
/// [_i5.BarConnectPage]
class BarConnectRoute extends _i31.PageRouteInfo<BarConnectRouteArgs> {
  BarConnectRoute({
    _i35.Key? key,
    String? receivedData,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          BarConnectRoute.name,
          args: BarConnectRouteArgs(
            key: key,
            receivedData: receivedData,
          ),
          initialChildren: children,
        );

  static const String name = 'BarConnectRoute';

  static const _i31.PageInfo<BarConnectRouteArgs> page = _i31.PageInfo<BarConnectRouteArgs>(name);
}

class BarConnectRouteArgs {
  const BarConnectRouteArgs({
    this.key,
    this.receivedData,
  });

  final _i35.Key? key;

  final String? receivedData;

  @override
  String toString() {
    return 'BarConnectRouteArgs{key: $key, receivedData: $receivedData}';
  }
}

/// generated route for
/// [_i6.BarConnectWithNfc]
class BarConnectWithNfc extends _i31.PageRouteInfo<BarConnectWithNfcArgs> {
  BarConnectWithNfc({
    _i35.Key? key,
    String? receivedData,
    String? barColor,
    bool? isOriginalTag,
    required bool? isActivated,
    List<_i31.PageRouteInfo>? children,
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

  static const _i31.PageInfo<BarConnectWithNfcArgs> page = _i31.PageInfo<BarConnectWithNfcArgs>(name);
}

class BarConnectWithNfcArgs {
  const BarConnectWithNfcArgs({
    this.key,
    this.receivedData,
    this.barColor,
    this.isOriginalTag,
    required this.isActivated,
  });

  final _i35.Key? key;

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
/// [_i7.BarSettingsPage]
class BarSettingsRoute extends _i31.PageRouteInfo<BarSettingsRouteArgs> {
  BarSettingsRoute({
    _i32.Key? key,
    required _i36.BarModel bar,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          BarSettingsRoute.name,
          args: BarSettingsRouteArgs(
            key: key,
            bar: bar,
          ),
          initialChildren: children,
        );

  static const String name = 'BarSettingsRoute';

  static const _i31.PageInfo<BarSettingsRouteArgs> page = _i31.PageInfo<BarSettingsRouteArgs>(name);
}

class BarSettingsRouteArgs {
  const BarSettingsRouteArgs({
    this.key,
    required this.bar,
  });

  final _i32.Key? key;

  final _i36.BarModel bar;

  @override
  String toString() {
    return 'BarSettingsRouteArgs{key: $key, bar: $bar}';
  }
}

/// generated route for
/// [_i8.BuyCardPage]
class BuyCardRoute extends _i31.PageRouteInfo<BuyCardRouteArgs> {
  BuyCardRoute({
    _i32.Key? key,
    required _i37.Future<_i38.BuyCardModel?> method,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          BuyCardRoute.name,
          args: BuyCardRouteArgs(
            key: key,
            method: method,
          ),
          initialChildren: children,
        );

  static const String name = 'BuyCardRoute';

  static const _i31.PageInfo<BuyCardRouteArgs> page = _i31.PageInfo<BuyCardRouteArgs>(name);
}

class BuyCardRouteArgs {
  const BuyCardRouteArgs({
    this.key,
    required this.method,
  });

  final _i32.Key? key;

  final _i37.Future<_i38.BuyCardModel?> method;

  @override
  String toString() {
    return 'BuyCardRouteArgs{key: $key, method: $method}';
  }
}

/// generated route for
/// [_i9.CardActivationPage]
class CardActivationRoute extends _i31.PageRouteInfo<CardActivationRouteArgs> {
  CardActivationRoute({
    _i32.Key? key,
    String? receivedData,
    bool? backupPack,
    int? s,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          CardActivationRoute.name,
          args: CardActivationRouteArgs(
            key: key,
            receivedData: receivedData,
            backupPack: backupPack,
            s: s,
          ),
          initialChildren: children,
        );

  static const String name = 'CardActivationRoute';

  static const _i31.PageInfo<CardActivationRouteArgs> page = _i31.PageInfo<CardActivationRouteArgs>(name);
}

class CardActivationRouteArgs {
  const CardActivationRouteArgs({
    this.key,
    this.receivedData,
    this.backupPack,
    this.s,
  });

  final _i32.Key? key;

  final String? receivedData;

  final bool? backupPack;

  final int? s;

  @override
  String toString() {
    return 'CardActivationRouteArgs{key: $key, receivedData: $receivedData, backupPack: $backupPack, s: $s}';
  }
}

/// generated route for
/// [_i10.CardConnectPage]
class CardConnectRoute extends _i31.PageRouteInfo<CardConnectRouteArgs> {
  CardConnectRoute({
    _i32.Key? key,
    String? receivedData,
    void Function(({_i33.AbstractCard? card, int index}))? onChangeCard,
    String? cardColor,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          CardConnectRoute.name,
          args: CardConnectRouteArgs(
            key: key,
            receivedData: receivedData,
            onChangeCard: onChangeCard,
            cardColor: cardColor,
          ),
          initialChildren: children,
        );

  static const String name = 'CardConnectRoute';

  static const _i31.PageInfo<CardConnectRouteArgs> page = _i31.PageInfo<CardConnectRouteArgs>(name);
}

class CardConnectRouteArgs {
  const CardConnectRouteArgs({
    this.key,
    this.receivedData,
    this.onChangeCard,
    this.cardColor,
  });

  final _i32.Key? key;

  final String? receivedData;

  final void Function(({_i33.AbstractCard? card, int index}))? onChangeCard;

  final String? cardColor;

  @override
  String toString() {
    return 'CardConnectRouteArgs{key: $key, receivedData: $receivedData, onChangeCard: $onChangeCard, cardColor: $cardColor}';
  }
}

/// generated route for
/// [_i11.CardConnectWithNfc]
class CardConnectWithNfc extends _i31.PageRouteInfo<CardConnectWithNfcArgs> {
  CardConnectWithNfc({
    _i32.Key? key,
    String? receivedData,
    String? cardColor,
    bool? isOriginalNxp,
    bool? isMiFareUltralight,
    bool? isOldCard,
    bool? backupPack,
    bool? backup,
    bool? isActivated,
    bool? isBackupCard,
    String? mainWalletAddress,
    bool? isFromBackupConnect,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          CardConnectWithNfc.name,
          args: CardConnectWithNfcArgs(
            key: key,
            receivedData: receivedData,
            cardColor: cardColor,
            isOriginalNxp: isOriginalNxp,
            isMiFareUltralight: isMiFareUltralight,
            isOldCard: isOldCard,
            backupPack: backupPack,
            backup: backup,
            isActivated: isActivated,
            isBackupCard: isBackupCard,
            mainWalletAddress: mainWalletAddress,
            isFromBackupConnect: isFromBackupConnect,
          ),
          initialChildren: children,
        );

  static const String name = 'CardConnectWithNfc';

  static const _i31.PageInfo<CardConnectWithNfcArgs> page = _i31.PageInfo<CardConnectWithNfcArgs>(name);
}

class CardConnectWithNfcArgs {
  const CardConnectWithNfcArgs({
    this.key,
    this.receivedData,
    this.cardColor,
    this.isOriginalNxp,
    this.isMiFareUltralight,
    this.isOldCard,
    this.backupPack,
    this.backup,
    this.isActivated,
    this.isBackupCard,
    this.mainWalletAddress,
    this.isFromBackupConnect,
  });

  final _i32.Key? key;

  final String? receivedData;

  final String? cardColor;

  final bool? isOriginalNxp;

  final bool? isMiFareUltralight;

  final bool? isOldCard;

  final bool? backupPack;

  final bool? backup;

  final bool? isActivated;

  final bool? isBackupCard;

  final String? mainWalletAddress;

  final bool? isFromBackupConnect;

  @override
  String toString() {
    return 'CardConnectWithNfcArgs{key: $key, receivedData: $receivedData, cardColor: $cardColor, isOriginalNxp: $isOriginalNxp, isMiFareUltralight: $isMiFareUltralight, isOldCard: $isOldCard, backupPack: $backupPack, backup: $backup, isActivated: $isActivated, isBackupCard: $isBackupCard, mainWalletAddress: $mainWalletAddress, isFromBackupConnect: $isFromBackupConnect}';
  }
}

/// generated route for
/// [_i12.CardSettingsPage]
class CardSettingsRoute extends _i31.PageRouteInfo<CardSettingsRouteArgs> {
  CardSettingsRoute({
    _i32.Key? key,
    required _i33.AbstractCard card,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          CardSettingsRoute.name,
          args: CardSettingsRouteArgs(
            key: key,
            card: card,
          ),
          initialChildren: children,
        );

  static const String name = 'CardSettingsRoute';

  static const _i31.PageInfo<CardSettingsRouteArgs> page = _i31.PageInfo<CardSettingsRouteArgs>(name);
}

class CardSettingsRouteArgs {
  const CardSettingsRouteArgs({
    this.key,
    required this.card,
  });

  final _i32.Key? key;

  final _i33.AbstractCard card;

  @override
  String toString() {
    return 'CardSettingsRouteArgs{key: $key, card: $card}';
  }
}

/// generated route for
/// [_i13.ChangePinCode]
class ChangePinCode extends _i31.PageRouteInfo<void> {
  const ChangePinCode({List<_i31.PageRouteInfo>? children})
      : super(
          ChangePinCode.name,
          initialChildren: children,
        );

  static const String name = 'ChangePinCode';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i14.CoinChartPage]
class CoinChartRoute extends _i31.PageRouteInfo<CoinChartRouteArgs> {
  CoinChartRoute({
    _i35.Key? key,
    required _i39.CoinResultModel? data,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          CoinChartRoute.name,
          args: CoinChartRouteArgs(
            key: key,
            data: data,
          ),
          initialChildren: children,
        );

  static const String name = 'CoinChartRoute';

  static const _i31.PageInfo<CoinChartRouteArgs> page = _i31.PageInfo<CoinChartRouteArgs>(name);
}

class CoinChartRouteArgs {
  const CoinChartRouteArgs({
    this.key,
    required this.data,
  });

  final _i35.Key? key;

  final _i39.CoinResultModel? data;

  @override
  String toString() {
    return 'CoinChartRouteArgs{key: $key, data: $data}';
  }
}

/// generated route for
/// [_i15.ContactUs]
class ContactUs extends _i31.PageRouteInfo<void> {
  const ContactUs({List<_i31.PageRouteInfo>? children})
      : super(
          ContactUs.name,
          initialChildren: children,
        );

  static const String name = 'ContactUs';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i16.CreatePinCode]
class CreatePinCode extends _i31.PageRouteInfo<void> {
  const CreatePinCode({List<_i31.PageRouteInfo>? children})
      : super(
          CreatePinCode.name,
          initialChildren: children,
        );

  static const String name = 'CreatePinCode';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i17.DashboardPage]
class DashboardRoute extends _i31.PageRouteInfo<void> {
  const DashboardRoute({List<_i31.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i18.DontHaveBackupPage]
class DontHaveBackupRoute extends _i31.PageRouteInfo<DontHaveBackupRouteArgs> {
  DontHaveBackupRoute({
    _i32.Key? key,
    required String walletAddress,
    required String? cardColor,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          DontHaveBackupRoute.name,
          args: DontHaveBackupRouteArgs(
            key: key,
            walletAddress: walletAddress,
            cardColor: cardColor,
          ),
          initialChildren: children,
        );

  static const String name = 'DontHaveBackupRoute';

  static const _i31.PageInfo<DontHaveBackupRouteArgs> page = _i31.PageInfo<DontHaveBackupRouteArgs>(name);
}

class DontHaveBackupRouteArgs {
  const DontHaveBackupRouteArgs({
    this.key,
    required this.walletAddress,
    required this.cardColor,
  });

  final _i32.Key? key;

  final String walletAddress;

  final String? cardColor;

  @override
  String toString() {
    return 'DontHaveBackupRouteArgs{key: $key, walletAddress: $walletAddress, cardColor: $cardColor}';
  }
}

/// generated route for
/// [_i19.LostMyCardPage]
class LostMyCardRoute extends _i31.PageRouteInfo<LostMyCardRouteArgs> {
  LostMyCardRoute({
    _i32.Key? key,
    required _i40.CardModel? backupCard,
    required _i33.AbstractCard? mainCard,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          LostMyCardRoute.name,
          args: LostMyCardRouteArgs(
            key: key,
            backupCard: backupCard,
            mainCard: mainCard,
          ),
          initialChildren: children,
        );

  static const String name = 'LostMyCardRoute';

  static const _i31.PageInfo<LostMyCardRouteArgs> page = _i31.PageInfo<LostMyCardRouteArgs>(name);
}

class LostMyCardRouteArgs {
  const LostMyCardRouteArgs({
    this.key,
    required this.backupCard,
    required this.mainCard,
  });

  final _i32.Key? key;

  final _i40.CardModel? backupCard;

  final _i33.AbstractCard? mainCard;

  @override
  String toString() {
    return 'LostMyCardRouteArgs{key: $key, backupCard: $backupCard, mainCard: $mainCard}';
  }
}

/// generated route for
/// [_i20.OnboardingPage]
class OnboardingRoute extends _i31.PageRouteInfo<void> {
  const OnboardingRoute({List<_i31.PageRouteInfo>? children})
      : super(
          OnboardingRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i21.PinAfterSplash]
class PinAfterSplash extends _i31.PageRouteInfo<void> {
  const PinAfterSplash({List<_i31.PageRouteInfo>? children})
      : super(
          PinAfterSplash.name,
          initialChildren: children,
        );

  static const String name = 'PinAfterSplash';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i22.PinCodeForAllPages]
class PinCodeForAllRoutes extends _i31.PageRouteInfo<void> {
  const PinCodeForAllRoutes({List<_i31.PageRouteInfo>? children})
      : super(
          PinCodeForAllRoutes.name,
          initialChildren: children,
        );

  static const String name = 'PinCodeForAllRoutes';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i23.PinCodeForPrivateKey]
class PinCodeForPrivateKey extends _i31.PageRouteInfo<PinCodeForPrivateKeyArgs> {
  PinCodeForPrivateKey({
    _i32.Key? key,
    _i36.BarModel? bar,
    _i41.BarSettingState? isKeyVisible,
    _i33.AbstractCard? card,
    _i42.CardSettingState? isVisible,
    List<_i31.PageRouteInfo>? children,
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

  static const _i31.PageInfo<PinCodeForPrivateKeyArgs> page = _i31.PageInfo<PinCodeForPrivateKeyArgs>(name);
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

  final _i36.BarModel? bar;

  final _i41.BarSettingState? isKeyVisible;

  final _i33.AbstractCard? card;

  final _i42.CardSettingState? isVisible;

  @override
  String toString() {
    return 'PinCodeForPrivateKeyArgs{key: $key, bar: $bar, isKeyVisible: $isKeyVisible, card: $card, isVisible: $isVisible}';
  }
}

/// generated route for
/// [_i24.PinCodePage]
class PinCodeRoute extends _i31.PageRouteInfo<void> {
  const PinCodeRoute({List<_i31.PageRouteInfo>? children})
      : super(
          PinCodeRoute.name,
          initialChildren: children,
        );

  static const String name = 'PinCodeRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i25.PinRemove]
class PinRemove extends _i31.PageRouteInfo<void> {
  const PinRemove({List<_i31.PageRouteInfo>? children})
      : super(
          PinRemove.name,
          initialChildren: children,
        );

  static const String name = 'PinRemove';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i26.QrScannerPage]
class QrScannerRoute extends _i31.PageRouteInfo<QrScannerRouteArgs> {
  QrScannerRoute({
    _i35.Key? key,
    bool? isScannedReceiverAddress,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          QrScannerRoute.name,
          args: QrScannerRouteArgs(
            key: key,
            isScannedReceiverAddress: isScannedReceiverAddress,
          ),
          initialChildren: children,
        );

  static const String name = 'QrScannerRoute';

  static const _i31.PageInfo<QrScannerRouteArgs> page = _i31.PageInfo<QrScannerRouteArgs>(name);
}

class QrScannerRouteArgs {
  const QrScannerRouteArgs({
    this.key,
    this.isScannedReceiverAddress,
  });

  final _i35.Key? key;

  final bool? isScannedReceiverAddress;

  @override
  String toString() {
    return 'QrScannerRouteArgs{key: $key, isScannedReceiverAddress: $isScannedReceiverAddress}';
  }
}

/// generated route for
/// [_i27.SecretSuccess]
class SecretSuccess extends _i31.PageRouteInfo<SecretSuccessArgs> {
  SecretSuccess({
    _i32.Key? key,
    required String walletAddress,
    int? initialPageIndex,
    List<_i31.PageRouteInfo>? children,
  }) : super(
          SecretSuccess.name,
          args: SecretSuccessArgs(
            key: key,
            walletAddress: walletAddress,
            initialPageIndex: initialPageIndex,
          ),
          initialChildren: children,
        );

  static const String name = 'SecretSuccess';

  static const _i31.PageInfo<SecretSuccessArgs> page = _i31.PageInfo<SecretSuccessArgs>(name);
}

class SecretSuccessArgs {
  const SecretSuccessArgs({
    this.key,
    required this.walletAddress,
    this.initialPageIndex,
  });

  final _i32.Key? key;

  final String walletAddress;

  final int? initialPageIndex;

  @override
  String toString() {
    return 'SecretSuccessArgs{key: $key, walletAddress: $walletAddress, initialPageIndex: $initialPageIndex}';
  }
}

/// generated route for
/// [_i28.SettingsPage]
class SettingsRoute extends _i31.PageRouteInfo<void> {
  const SettingsRoute({List<_i31.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i29.SplashPage]
class SplashRoute extends _i31.PageRouteInfo<void> {
  const SplashRoute({List<_i31.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}

/// generated route for
/// [_i30.WalletProtectionPage]
class WalletProtectionRoute extends _i31.PageRouteInfo<void> {
  const WalletProtectionRoute({List<_i31.PageRouteInfo>? children})
      : super(
          WalletProtectionRoute.name,
          initialChildren: children,
        );

  static const String name = 'WalletProtectionRoute';

  static const _i31.PageInfo<void> page = _i31.PageInfo<void>(name);
}
