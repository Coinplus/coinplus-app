import 'dart:async';
import 'dart:io';

import 'package:app_settings/app_settings.dart';
import 'package:auto_route/annotations.dart';
import 'package:did_change_authlocal/did_change_authlocal.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../models/amplitude_user_property_model/amplitude_user_property_model.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../services/amplitude_service.dart';
import '../../store/accelerometer_store/accelerometer_store.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/nfc_state/nfc_state.dart';
import '../../store/remote_config_store/remote_config_store.dart';
import '../../store/settings_button_state/settings_button_state.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/card_nfc_session.dart';
import '../../utils/secure_storage_utils.dart';
import '../../utils/storage_utils.dart';
import 'please_enable_biometrics.dart';
import 'remove_user_data/remove_user_data.dart';

@RoutePage()
class SettingsPage extends HookWidget {
  const SettingsPage({super.key});

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  AccelerometerStore get _accelerometerStore => GetIt.I<AccelerometerStore>();

  RemoteConfigStore get remoteConfigStore => GetIt.I<RemoteConfigStore>();

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    final _settingsState = SettingsState();
    final _auth = LocalAuthentication();
    final isAuthorised = useState(false);
    final _nfcState = useMemoized(NfcStore.new);

    Future<void> checkStatus() async {
      final messaging = FirebaseMessaging.instance;
      final settings = await messaging.requestPermission();
      final token = await secureStorage.read(key: 'fcm_token');
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        isAuthorised.value = true;

        if (token == null) {
          final newToken = await messaging.getToken();
          if (newToken != null) {
            await secureStorage.write(key: 'fcm_token', value: newToken);
            unawaited(recordAmplitudeEventPartTwo(const PushNotificationsOn()));
            unawaited(recordUserProperty(const NotificationsOn()));
          }
        }
      } else {
        isAuthorised.value = false;
        if (token != null) {
          await messaging.deleteToken();
          await secureStorage.delete(key: 'fcm_token');
          unawaited(deleteIdentifyProperties(const NotificationsOn()));
          unawaited(recordAmplitudeEventPartTwo(const PushNotificationsOff()));
        }
      }
    }

    useOnAppLifecycleStateChange((previous, current) async {
      if (current == AppLifecycleState.resumed) {
        await checkStatus();
      }
    });

    useEffect(
      () {
        _walletProtectState.checkBiometrics();
        checkStatus();
        _nfcState.checkNfcSupport();
        return null;
      },
      [],
    );

    final onToggleAppLock = useCallback(
      (isEnable) async {
        await recordAmplitudeEventPartTwo(const AppLockClicked());
        if (isEnable) {
          await router.push(const CreatePinCode());
        } else {
          await router.push(const PinRemove());
        }
        await _walletProtectState.checkPinCodeStatus();
        await _walletProtectState.checkBiometricStatus();
      },
      [_walletProtectState.isSetPinCode],
    );
    // ignore: avoid_positional_boolean_parameters
    final onToggleFaceId = useCallback<Future<void> Function(bool p1)>(
      (isEnable) async {
        if (!isEnable) {
          await _walletProtectState.disableBiometric();
          await recordAmplitudeEventPartTwo(const FaceIdDisabled());
        } else {
          if (_walletProtectState.canCheckBiometrics) {
            await _walletProtectState.authenticateWithBiometrics();
            final currentToken =
                await DidChangeAuthLocal.instance.getTokenBiometric();
            await StorageUtils.setString(
              key: 'biometricsToken',
              value: currentToken,
            );
            await recordAmplitudeEventPartTwo(const FaceIdEnabled());
          } else {
            await pleaseEnableBiometrics();
          }
        }
        await _walletProtectState.checkBiometricStatus();
      },
      [_walletProtectState.isBiometricsEnabled],
    );

    // ignore: avoid_positional_boolean_parameters
    final onToggleHideBalances = useCallback<Future<void> Function(bool p1)>(
      (isEnable) async {
        if (!isEnable) {
          await _walletProtectState.showBalances();
          _accelerometerStore.hasPerformedAction = false;
        } else {
          await _walletProtectState.hideBalances();
          await _accelerometerStore.disableAccelerometerFunction();
          _accelerometerStore.hasPerformedAction = false;
        }
        await _walletProtectState.checkHideBalancesToggleStatus();
      },
      [_walletProtectState.isSwitchedHideBalancesToggle],
    );

    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: Scrollbar(
        child: CustomScrollView(
          slivers: [
            const CupertinoSliverNavigationBar(
              border: Border(),
              stretch: true,
              backgroundColor: Colors.transparent,
              brightness: Brightness.light,
              largeTitle: Text(
                'Settings',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                  fontFamily: FontFamily.redHatMedium,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(15),
                  const Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Text(
                      'Security',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: FontFamily.redHatMedium,
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Gap(14),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Card(
                      color: const Color(0xFFF7F7FA),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Observer(
                        builder: (context) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () => onToggleAppLock(
                                  !_walletProtectState.isSetPinCode,
                                ),
                                splashFactory: InkSparkle.splashFactory,
                                highlightColor: Colors.transparent,
                                child: ListTile(
                                  minLeadingWidth: 10,
                                  leading: Assets.icons.lock.image(
                                    height: 24,
                                  ),
                                  trailing: Observer(
                                    builder: (context) {
                                      return CupertinoSwitch(
                                        value: _walletProtectState.isSetPinCode,
                                        onChanged: onToggleAppLock,
                                      );
                                    },
                                  ),
                                  title: const Text(
                                    'App lock',
                                    style: TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      fontSize: 15,
                                      color: AppColors.primaryTextColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              Observer(
                                builder: (_) {
                                  if (!_walletProtectState.isSetPinCode) {
                                    return const SizedBox();
                                  }
                                  return Column(
                                    children: [
                                      Divider(
                                        height: 1,
                                        indent: 5,
                                        endIndent: 5,
                                        thickness: 1,
                                        color: Colors.grey.withOpacity(0.1),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          router.push(const ChangePinCode());
                                          recordAmplitudeEventPartTwo(
                                            const ChangePasscodeClicked(),
                                          );
                                        },
                                        splashFactory: InkSparkle.splashFactory,
                                        highlightColor: Colors.transparent,
                                        child: ListTile(
                                          trailing: Assets.icons.arrowForwardIos
                                              .image(
                                            height: 20,
                                          ),
                                          splashColor: Colors.transparent,
                                          minLeadingWidth: 10,
                                          leading: Assets.icons.password.image(
                                            height: 24,
                                          ),
                                          title: const Text(
                                            'Change passcode',
                                            style: TextStyle(
                                              fontFamily:
                                                  FontFamily.redHatMedium,
                                              fontSize: 15,
                                              color: AppColors.primaryTextColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      FutureBuilder(
                                        future: _auth.isDeviceSupported(),
                                        builder: (context, snapshot) {
                                          if (snapshot.data == true) {
                                            return Column(
                                              children: [
                                                Divider(
                                                  height: 1,
                                                  indent: 0,
                                                  endIndent: 0,
                                                  thickness: 1,
                                                  color: Colors.grey
                                                      .withOpacity(0.1),
                                                ),
                                                InkWell(
                                                  onTap: () => onToggleFaceId(
                                                    !_walletProtectState
                                                        .isBiometricsEnabled,
                                                  ),
                                                  splashFactory:
                                                      InkSparkle.splashFactory,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  child: ListTile(
                                                    splashColor:
                                                        Colors.transparent,
                                                    minLeadingWidth: 10,
                                                    trailing: Observer(
                                                      builder: (_) {
                                                        return CupertinoSwitch(
                                                          value: _walletProtectState
                                                              .isBiometricsEnabled,
                                                          onChanged:
                                                              onToggleFaceId,
                                                        );
                                                      },
                                                    ),
                                                    leading: Platform.isAndroid
                                                        ? Assets.icons
                                                            .faceIdSettings
                                                            .image(
                                                            height: 24,
                                                          )
                                                        : _walletProtectState
                                                                    .availableBiometric ==
                                                                BiometricType
                                                                    .fingerprint
                                                            ? Assets.icons
                                                                .iphoneTouchId
                                                                .image(
                                                                height: 24,
                                                              )
                                                            : Assets.icons
                                                                .faceIdSettings
                                                                .image(
                                                                height: 24,
                                                              ),
                                                    title: Text(
                                                      Platform.isAndroid
                                                          ? 'Biometrics'
                                                          : _walletProtectState
                                                                      .availableBiometric ==
                                                                  BiometricType
                                                                      .fingerprint
                                                              ? 'Touch ID'
                                                              : 'Face ID',
                                                      style: const TextStyle(
                                                        fontFamily: FontFamily
                                                            .redHatMedium,
                                                        fontSize: 15,
                                                        color: AppColors
                                                            .primaryTextColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          } else {
                                            return const SizedBox();
                                          }
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                              Divider(
                                height: 1,
                                indent: 5,
                                endIndent: 5,
                                thickness: 1,
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              if (_nfcState.isNfcSupported)
                                InkWell(
                                  onTap: () async {
                                    await _walletProtectState
                                        .updateNfcSessionStatus(
                                      isStarted: true,
                                    );
                                    unawaited(
                                      recordAmplitudeEventPartTwo(
                                        const VerifyCardClicked(),
                                      ),
                                    );
                                    Platform.isAndroid
                                        ? checkNfcAndroid(
                                            walletProtectState:
                                                _walletProtectState,
                                            balanceStore: _balanceStore,
                                            settingsState: _settingsState,
                                          )
                                        : await checkNfcIos(
                                            walletProtectState:
                                                _walletProtectState,
                                            balanceStore: _balanceStore,
                                            settingsState: _settingsState,
                                          );
                                  },
                                  splashFactory: InkSparkle.splashFactory,
                                  highlightColor: Colors.transparent,
                                  child: ListTile(
                                    minLeadingWidth: 10,
                                    leading: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Assets.icons.verify.image(
                                          color: Colors.blue,
                                          height: 24,
                                        ),
                                      ],
                                    ),
                                    trailing: Assets.icons.arrowForwardIos
                                        .image(height: 20),
                                    title: const Text(
                                      'Verify Card Authenticity',
                                      style: TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontSize: 15,
                                        color: AppColors.primaryTextColor,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                              else
                                const SizedBox(),
                              Divider(
                                height: 1,
                                indent: 5,
                                endIndent: 5,
                                thickness: 1,
                                color: Colors.grey.withOpacity(0.1),
                              ),
                              InkWell(
                                onTap: () => onToggleHideBalances(
                                  _walletProtectState
                                      .isSwitchedHideBalancesToggle,
                                ),
                                splashFactory: InkSparkle.splashFactory,
                                highlightColor: Colors.transparent,
                                child: ListTile(
                                  splashColor: Colors.transparent,
                                  minLeadingWidth: 10,
                                  trailing: Observer(
                                    builder: (_) {
                                      return CupertinoSwitch(
                                        value: _walletProtectState
                                            .isSwitchedHideBalancesToggle,
                                        onChanged: (val) =>
                                            onToggleHideBalances(
                                          _walletProtectState
                                              .isSwitchedHideBalancesToggle,
                                        ),
                                      );
                                    },
                                  ),
                                  leading: Assets.icons.hide.image(
                                    height: 24,
                                  ),
                                  title: remoteConfigStore.showAlert
                                      ? const Text(
                                          'Flip Phone to Hide Balance',
                                          style: TextStyle(
                                            fontFamily: FontFamily.redHatMedium,
                                            fontSize: 15,
                                            color: AppColors.primaryTextColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        )
                                      : const Text(
                                          'Flip and Hide Balance',
                                          style: TextStyle(
                                            fontFamily: FontFamily.redHatMedium,
                                            fontSize: 15,
                                            color: AppColors.primaryTextColor,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const Gap(20),
                  const Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Text(
                      'Notifications',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: FontFamily.redHatMedium,
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Gap(14),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Card(
                      color: const Color(0xFFF7F7FA),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: InkWell(
                        onTap: () {
                          AppSettings.openAppSettings(
                            type: AppSettingsType.notification,
                          );
                        },
                        splashFactory: InkSparkle.splashFactory,
                        highlightColor: Colors.transparent,
                        child: ListTile(
                          minLeadingWidth: 10,
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (isAuthorised.value)
                                const Text(
                                  'On',
                                  style: TextStyle(
                                    fontFamily: FontFamily.redHatMedium,
                                    fontSize: 14,
                                    color: AppColors.primaryTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )
                              else
                                const Text(
                                  'Off',
                                  style: TextStyle(
                                    fontFamily: FontFamily.redHatMedium,
                                    fontSize: 14,
                                    color: AppColors.primaryTextColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              const Gap(5),
                              Assets.icons.arrowForwardIos.image(height: 20),
                            ],
                          ),
                          leading: Assets.icons.notifications.image(
                            height: 24,
                          ),
                          title: const Row(
                            children: [
                              Gap(2),
                              Text(
                                'Push notifications',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 15,
                                  color: AppColors.primaryTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(20),
                  const Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Text(
                      'Help & Support',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: FontFamily.redHatMedium,
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Gap(14),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Card(
                      color: const Color(0xFFF7F7FA),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              await recordAmplitudeEventPartTwo(
                                const HelpCenterClicked(source: 'Settings'),
                              );
                              await FlutterWebBrowser.openWebPage(
                                url: 'https://coinplus.gitbook.io/help-center',
                                customTabsOptions: const CustomTabsOptions(
                                  shareState: CustomTabsShareState.on,
                                  instantAppsEnabled: true,
                                  showTitle: true,
                                  urlBarHidingEnabled: true,
                                ),
                                safariVCOptions:
                                    const SafariViewControllerOptions(
                                  barCollapsingEnabled: true,
                                  modalPresentationStyle:
                                      UIModalPresentationStyle.formSheet,
                                  dismissButtonStyle:
                                      SafariViewControllerDismissButtonStyle
                                          .done,
                                  modalPresentationCapturesStatusBarAppearance:
                                      true,
                                ),
                              );
                            },
                            splashFactory: InkSparkle.splashFactory,
                            highlightColor: Colors.transparent,
                            child: ListTile(
                              trailing: Assets.icons.arrowForwardIos
                                  .image(height: 20),
                              minLeadingWidth: 10,
                              leading: Assets.icons.help.image(
                                height: 24,
                              ),
                              title: const Text(
                                'Help center',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 15,
                                  color: AppColors.primaryTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            indent: 0,
                            endIndent: 0,
                            thickness: 1,
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          InkWell(
                            onTap: () {
                              router.push(const ContactUs());
                              recordAmplitudeEventPartTwo(
                                const ContactUsClicked(),
                              );
                            },
                            splashFactory: InkSparkle.splashFactory,
                            highlightColor: Colors.transparent,
                            child: ListTile(
                              trailing: Assets.icons.arrowForwardIos
                                  .image(height: 20),
                              minLeadingWidth: 10,
                              leading: Assets.icons.contactUs.image(
                                height: 24,
                              ),
                              title: const Text(
                                'Contact us',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 15,
                                  color: AppColors.primaryTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(20),
                  const Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Text(
                      'Join community',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: FontFamily.redHatMedium,
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Gap(14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ScaleTap(
                        onPressed: () async {
                          await recordAmplitudeEventPartTwo(
                            const JoinCommunityClicked(social: 'Twitter'),
                          );
                          await FlutterWebBrowser.openWebPage(
                            url: 'https://twitter.com/coinplus',
                            customTabsOptions: const CustomTabsOptions(
                              shareState: CustomTabsShareState.on,
                              instantAppsEnabled: true,
                              showTitle: true,
                              urlBarHidingEnabled: true,
                            ),
                            safariVCOptions: const SafariViewControllerOptions(
                              barCollapsingEnabled: true,
                              modalPresentationStyle:
                                  UIModalPresentationStyle.formSheet,
                              dismissButtonStyle:
                                  SafariViewControllerDismissButtonStyle.done,
                              modalPresentationCapturesStatusBarAppearance:
                                  true,
                            ),
                          );
                        },
                        enableFeedback: false,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            color: const Color(0xFFF7F7FA),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Assets.icons.twitter.image(height: 23),
                            ),
                          ),
                        ),
                      ),
                      const Gap(12),
                      ScaleTap(
                        onPressed: () async {
                          await recordAmplitudeEventPartTwo(
                            const JoinCommunityClicked(social: 'Instagram'),
                          );
                          await FlutterWebBrowser.openWebPage(
                            url: 'https://www.instagram.com/coinplus.inc',
                            customTabsOptions: const CustomTabsOptions(
                              shareState: CustomTabsShareState.on,
                              instantAppsEnabled: true,
                              showTitle: true,
                              urlBarHidingEnabled: true,
                            ),
                            safariVCOptions: const SafariViewControllerOptions(
                              barCollapsingEnabled: true,
                              modalPresentationStyle:
                                  UIModalPresentationStyle.formSheet,
                              dismissButtonStyle:
                                  SafariViewControllerDismissButtonStyle.done,
                              modalPresentationCapturesStatusBarAppearance:
                                  true,
                            ),
                          );
                        },
                        enableFeedback: false,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            color: const Color(0xFFF7F7FA),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Assets.icons.instagram.image(height: 25),
                            ),
                          ),
                        ),
                      ),
                      const Gap(12),
                      ScaleTap(
                        onPressed: () async {
                          await recordAmplitudeEventPartTwo(
                            const JoinCommunityClicked(social: 'Facebook'),
                          );
                          await FlutterWebBrowser.openWebPage(
                            url: 'https://www.facebook.com/coin.plus',
                            customTabsOptions: const CustomTabsOptions(
                              shareState: CustomTabsShareState.on,
                              instantAppsEnabled: true,
                              showTitle: true,
                              urlBarHidingEnabled: true,
                            ),
                            safariVCOptions: const SafariViewControllerOptions(
                              barCollapsingEnabled: true,
                              modalPresentationStyle:
                                  UIModalPresentationStyle.formSheet,
                              dismissButtonStyle:
                                  SafariViewControllerDismissButtonStyle.done,
                              modalPresentationCapturesStatusBarAppearance:
                                  true,
                            ),
                          );
                        },
                        enableFeedback: false,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            color: const Color(0xFFF7F7FA),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Assets.icons.facebook.image(height: 25),
                            ),
                          ),
                        ),
                      ),
                      const Gap(12),
                      ScaleTap(
                        onPressed: () async {
                          await recordAmplitudeEventPartTwo(
                            const JoinCommunityClicked(social: 'Linkedin'),
                          );
                          await FlutterWebBrowser.openWebPage(
                            url: 'https://www.linkedin.com/company/coinplus/',
                            customTabsOptions: const CustomTabsOptions(
                              shareState: CustomTabsShareState.on,
                              instantAppsEnabled: true,
                              showTitle: true,
                              urlBarHidingEnabled: true,
                            ),
                            safariVCOptions: const SafariViewControllerOptions(
                              barCollapsingEnabled: true,
                              modalPresentationStyle:
                                  UIModalPresentationStyle.formSheet,
                              dismissButtonStyle:
                                  SafariViewControllerDismissButtonStyle.done,
                              modalPresentationCapturesStatusBarAppearance:
                                  true,
                            ),
                          );
                        },
                        enableFeedback: false,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            color: const Color(0xFFF7F7FA),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Assets.icons.linkedin.image(height: 25),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(12),
                      ScaleTap(
                        onPressed: () async {
                          await recordAmplitudeEventPartTwo(
                            const JoinCommunityClicked(social: 'Trust pilot'),
                          );
                          await FlutterWebBrowser.openWebPage(
                            url:
                                'https://www.trustpilot.com/review/coinplus.com',
                            customTabsOptions: const CustomTabsOptions(
                              shareState: CustomTabsShareState.on,
                              instantAppsEnabled: true,
                              showTitle: true,
                              urlBarHidingEnabled: true,
                            ),
                            safariVCOptions: const SafariViewControllerOptions(
                              barCollapsingEnabled: true,
                              modalPresentationStyle:
                                  UIModalPresentationStyle.formSheet,
                              dismissButtonStyle:
                                  SafariViewControllerDismissButtonStyle.done,
                              modalPresentationCapturesStatusBarAppearance:
                                  true,
                            ),
                          );
                        },
                        enableFeedback: false,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Container(
                            color: const Color(0xFFF7F7FA),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Assets.icons.star.image(height: 25),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(20),
                  const Padding(
                    padding: EdgeInsets.only(left: 35),
                    child: Text(
                      'About',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: FontFamily.redHatMedium,
                        color: AppColors.primaryTextColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const Gap(14),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Card(
                      color: const Color(0xFFF7F7FA),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              await FlutterWebBrowser.openWebPage(
                                url: 'https://coinplus.com/privacy-policy/',
                                customTabsOptions: const CustomTabsOptions(
                                  shareState: CustomTabsShareState.on,
                                  instantAppsEnabled: true,
                                  showTitle: true,
                                  urlBarHidingEnabled: true,
                                ),
                                safariVCOptions:
                                    const SafariViewControllerOptions(
                                  barCollapsingEnabled: true,
                                  modalPresentationStyle:
                                      UIModalPresentationStyle.formSheet,
                                  dismissButtonStyle:
                                      SafariViewControllerDismissButtonStyle
                                          .done,
                                  modalPresentationCapturesStatusBarAppearance:
                                      true,
                                ),
                              );
                              await recordAmplitudeEventPartTwo(
                                const PrivacyPolicyClicked(),
                              );
                            },
                            splashFactory: InkSparkle.splashFactory,
                            highlightColor: Colors.transparent,
                            child: ListTile(
                              trailing: Assets.icons.arrowForwardIos
                                  .image(height: 20),
                              minLeadingWidth: 10,
                              leading: Assets.icons.privacy.image(
                                height: 24,
                              ),
                              title: const Row(
                                children: [
                                  Gap(4),
                                  Text(
                                    'Privacy policy',
                                    style: TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      fontSize: 15,
                                      color: AppColors.primaryTextColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            indent: 0,
                            endIndent: 0,
                            thickness: 1,
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          InkWell(
                            onTap: () async {
                              await FlutterWebBrowser.openWebPage(
                                url: 'https://coinplus.com/terms-of-use/',
                                customTabsOptions: const CustomTabsOptions(
                                  shareState: CustomTabsShareState.on,
                                  instantAppsEnabled: true,
                                  showTitle: true,
                                  urlBarHidingEnabled: true,
                                ),
                                safariVCOptions:
                                    const SafariViewControllerOptions(
                                  barCollapsingEnabled: true,
                                  modalPresentationStyle:
                                      UIModalPresentationStyle.formSheet,
                                  dismissButtonStyle:
                                      SafariViewControllerDismissButtonStyle
                                          .done,
                                  modalPresentationCapturesStatusBarAppearance:
                                      true,
                                ),
                              );
                              await recordAmplitudeEventPartTwo(
                                const TermsOfUseClicked(),
                              );
                            },
                            splashFactory: InkSparkle.splashFactory,
                            highlightColor: Colors.transparent,
                            child: ListTile(
                              trailing: Assets.icons.arrowForwardIos
                                  .image(height: 20),
                              minLeadingWidth: 10,
                              leading: Assets.icons.terms.image(
                                height: 24,
                              ),
                              title: const Row(
                                children: [
                                  Gap(3),
                                  Text(
                                    'Terms of use',
                                    style: TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      fontSize: 15,
                                      color: AppColors.primaryTextColor,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            height: 1,
                            indent: 0,
                            endIndent: 0,
                            thickness: 1,
                            color: Colors.grey.withOpacity(0.1),
                          ),
                          InkWell(
                            onTap: () async {
                              await router.push(const AboutAppRoute());
                            },
                            splashFactory: InkSparkle.splashFactory,
                            highlightColor: Colors.transparent,
                            child: ListTile(
                              trailing: Assets.icons.arrowForwardIos
                                  .image(height: 20),
                              minLeadingWidth: 10,
                              leading: Assets.icons.info.image(
                                height: 24,
                                color: Colors.blue,
                              ),
                              title: const Text(
                                'About app',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 15,
                                  color: AppColors.primaryTextColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Card(
                      color: const Color(0xFFF7F7FA),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              await _walletProtectState.updateModalStatus(
                                isOpened: true,
                              );
                              await recordAmplitudeEventPartTwo(
                                const EraseMyDataClicked(),
                              );
                              await showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                backgroundColor: Colors.transparent,
                                builder: (context) {
                                  return const RemoveUserData();
                                },
                              );
                              await _walletProtectState.updateModalStatus(
                                isOpened: false,
                              );
                            },
                            splashFactory: InkSparkle.splashFactory,
                            highlightColor: Colors.transparent,
                            child: ListTile(
                              minLeadingWidth: 10,
                              leading: Assets.icons.identity.image(
                                height: 24,
                              ),
                              title: const Text(
                                'Erase my data',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 15,
                                  color: AppColors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(120),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
