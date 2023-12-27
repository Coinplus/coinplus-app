import 'dart:async';
import 'dart:io';

import 'package:auto_route/annotations.dart';
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
import '../../models/amplitude_event/amplitude_event.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../services/amplitude_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/settings_button_state/settings_button_state.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/card_nfc_session.dart';
import 'please_enable_biometrics.dart';

@RoutePage()
class SettingsPage extends HookWidget {
  const SettingsPage({super.key});

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  SettingsState get _settingsState => GetIt.I<SettingsState>();

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    final _auth = LocalAuthentication();
    useEffect(() {
      _walletProtectState.checkBiometrics();
      return null;
    });
    final onToggleAppLock = useCallback(
      (isEnable) async {
        await recordAmplitudeEvent(const AppLockClicked());
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
        } else {
          if (_walletProtectState.canCheckBiometrics) {
            await _walletProtectState.authenticateWithBiometrics();
            await recordAmplitudeEvent(const FaceIdEnabled());
          } else {
            await pleaseEnableBiometrics(context, _walletProtectState);
            await recordAmplitudeEvent(const FaceIdDisabled());
          }
        }
        await _walletProtectState.checkBiometricStatus();
      },
      [_walletProtectState.isBiometricsEnabled],
    );
    // ignore: avoid_positional_boolean_parameters
    final onToggleNotifications = useCallback<Future<void> Function(bool p1)>(
      (isEnable) async {
        if (!isEnable) {
          unawaited(recordAmplitudeEvent(const PushNotificationsOn()));
          await _walletProtectState.enableNotification();
        } else {
          await _walletProtectState.disableNotification();
          unawaited(recordAmplitudeEvent(const PushNotificationsOff()));
        }
        await _walletProtectState.checkNotificationToggleStatus();
      },
      [_walletProtectState.isSwitchedNotificationsToggle],
    );

    return CupertinoPageScaffold(
      backgroundColor: Colors.white,
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            border: Border(),
            stretch: true,
            backgroundColor: Colors.white,
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
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => onToggleAppLock(!_walletProtectState.isSetPinCode),
                          splashFactory: InkSparkle.splashFactory,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            minLeadingWidth: 10,
                            leading: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Gap(3),
                                Assets.icons.lock.image(
                                  height: 22,
                                ),
                              ],
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
                                    recordAmplitudeEvent(const ChangePasscodeClicked());
                                  },
                                  splashFactory: InkSparkle.splashFactory,
                                  highlightColor: Colors.transparent,
                                  child: ListTile(
                                    trailing: Assets.icons.arrowForwardIos.image(
                                      height: 20,
                                    ),
                                    splashColor: Colors.transparent,
                                    minLeadingWidth: 10,
                                    leading: Assets.icons.password.image(
                                      height: 22,
                                    ),
                                    title: const Text(
                                      'Change passcode',
                                      style: TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
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
                                            color: Colors.grey.withOpacity(0.1),
                                          ),
                                          InkWell(
                                            onTap: () => onToggleFaceId(!_walletProtectState.isBiometricsEnabled),
                                            splashFactory: InkSparkle.splashFactory,
                                            highlightColor: Colors.transparent,
                                            child: ListTile(
                                              splashColor: Colors.transparent,
                                              minLeadingWidth: 10,
                                              trailing: Observer(
                                                builder: (_) {
                                                  return CupertinoSwitch(
                                                    value: _walletProtectState.isBiometricsEnabled,
                                                    onChanged: onToggleFaceId,
                                                  );
                                                },
                                              ),
                                              leading: Platform.isAndroid
                                                  ? Assets.icons.faceIdSettings.image(
                                                      height: 22,
                                                    )
                                                  : _walletProtectState.availableBiometric == BiometricType.face
                                                      ? Assets.icons.iphoneTouchId.image(
                                                          height: 22,
                                                        )
                                                      : Assets.icons.faceIdSettings.image(
                                                          height: 22,
                                                        ),
                                              title: Text(
                                                Platform.isAndroid ? 'Biometrics' : 'Face ID',
                                                style: const TextStyle(
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
                        InkWell(
                          onTap: () async {
                            await _walletProtectState.updateNfcSessionStatus(isStarted: true);
                            unawaited(recordAmplitudeEvent(const VerifyCardClicked()));
                            Platform.isAndroid
                                ? checkNfcAndroid(
                                    walletProtectState: _walletProtectState,
                                    balanceStore: _balanceStore,
                                    settingsState: _settingsState,
                                  )
                                : await checkNfcIos(
                                    walletProtectState: _walletProtectState,
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
                                  height: 22,
                                ),
                              ],
                            ),
                            trailing: Assets.icons.arrowForwardIos.image(height: 20),
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
                        ),
                      ],
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
                    child: Observer(
                      builder: (context) {
                        return InkWell(
                          onTap: () {
                            onToggleNotifications(_walletProtectState.isSwitchedNotificationsToggle);
                          },
                          splashFactory: InkSplash.splashFactory,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            minLeadingWidth: 10,
                            trailing: CupertinoSwitch(
                              value: _walletProtectState.isSwitchedNotificationsToggle,
                              onChanged: (_) {
                                onToggleNotifications(_walletProtectState.isSwitchedNotificationsToggle);
                              },
                            ),
                            leading: Assets.icons.notifications.image(
                              height: 22,
                            ),
                            title: const Text(
                              'Push notifications',
                              style: TextStyle(
                                fontFamily: FontFamily.redHatMedium,
                                fontSize: 15,
                                color: AppColors.primaryTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
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
                            await recordAmplitudeEvent(const HelpCenterClicked(source: 'Settings'));
                            await FlutterWebBrowser.openWebPage(
                              url: 'https://coinplus.gitbook.io/help-center',
                              customTabsOptions: const CustomTabsOptions(
                                shareState: CustomTabsShareState.on,
                                instantAppsEnabled: true,
                                showTitle: true,
                                urlBarHidingEnabled: true,
                              ),
                              safariVCOptions: const SafariViewControllerOptions(
                                barCollapsingEnabled: true,
                                modalPresentationStyle: UIModalPresentationStyle.formSheet,
                                dismissButtonStyle: SafariViewControllerDismissButtonStyle.done,
                                modalPresentationCapturesStatusBarAppearance: true,
                              ),
                            );
                          },
                          splashFactory: InkSparkle.splashFactory,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            trailing: Assets.icons.arrowForwardIos.image(height: 20),
                            minLeadingWidth: 10,
                            leading: Assets.icons.help.image(
                              height: 22,
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
                            recordAmplitudeEvent(const ContactUsClicked());
                          },
                          splashFactory: InkSparkle.splashFactory,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            trailing: Assets.icons.arrowForwardIos.image(height: 20),
                            minLeadingWidth: 10,
                            leading: Assets.icons.contactUs.image(
                              height: 22,
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
                      onPressed: () {
                        recordAmplitudeEvent(const JoinCommunityClicked(social: 'Twitter'));
                      },
                      enableFeedback: false,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          color: const Color(0xFFF7F7FA),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Assets.icons.twitter.image(height: 25),
                          ),
                        ),
                      ),
                    ),
                    const Gap(12),
                    ScaleTap(
                      onPressed: () {
                        recordAmplitudeEvent(const JoinCommunityClicked(social: 'Discord'));
                      },
                      enableFeedback: false,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          color: const Color(0xFFF7F7FA),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Assets.icons.discord.image(height: 25),
                          ),
                        ),
                      ),
                    ),
                    const Gap(12),
                    ScaleTap(
                      onPressed: () {
                        recordAmplitudeEvent(const JoinCommunityClicked(social: 'Reddit'));
                      },
                      enableFeedback: false,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          color: const Color(0xFFF7F7FA),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Assets.icons.reddit.image(height: 25),
                          ),
                        ),
                      ),
                    ),
                    const Gap(12),
                    ScaleTap(
                      onPressed: () {
                        recordAmplitudeEvent(const JoinCommunityClicked(social: 'Trust Pilot'));
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
                              safariVCOptions: const SafariViewControllerOptions(
                                barCollapsingEnabled: true,
                                modalPresentationStyle: UIModalPresentationStyle.formSheet,
                                dismissButtonStyle: SafariViewControllerDismissButtonStyle.done,
                                modalPresentationCapturesStatusBarAppearance: true,
                              ),
                            );
                            await recordAmplitudeEvent(const PrivacyPolicyClicked());
                          },
                          splashFactory: InkSparkle.splashFactory,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            trailing: Assets.icons.arrowForwardIos.image(height: 20),
                            minLeadingWidth: 10,
                            leading: Assets.icons.privacy.image(
                              height: 22,
                            ),
                            title: const Text(
                              'Privacy policy',
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
                          onTap: () async {
                            await FlutterWebBrowser.openWebPage(
                              url: 'https://coinplus.com/terms-of-use/',
                              customTabsOptions: const CustomTabsOptions(
                                shareState: CustomTabsShareState.on,
                                instantAppsEnabled: true,
                                showTitle: true,
                                urlBarHidingEnabled: true,
                              ),
                              safariVCOptions: const SafariViewControllerOptions(
                                barCollapsingEnabled: true,
                                modalPresentationStyle: UIModalPresentationStyle.formSheet,
                                dismissButtonStyle: SafariViewControllerDismissButtonStyle.done,
                                modalPresentationCapturesStatusBarAppearance: true,
                              ),
                            );
                            await recordAmplitudeEvent(const TermsOfUseClicked());
                          },
                          splashFactory: InkSparkle.splashFactory,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            trailing: Assets.icons.arrowForwardIos.image(height: 20),
                            minLeadingWidth: 10,
                            leading: Assets.icons.terms.image(
                              height: 22,
                            ),
                            title: const Text(
                              'Terms of use',
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
                          onTap: () async {
                            await router.push(const AboutAppRoute());
                          },
                          splashFactory: InkSparkle.splashFactory,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            trailing: Assets.icons.arrowForwardIos.image(height: 20),
                            minLeadingWidth: 10,
                            leading: Assets.icons.info.image(
                              height: 22,
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
                const Gap(120),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
