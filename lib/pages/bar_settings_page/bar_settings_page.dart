import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:styled_text/tags/styled_text_tag.dart';
import 'package:styled_text/widgets/styled_text.dart';

import '../../constants/card_color.dart';
import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../models/bar_model/bar_model.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../services/amplitude_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/bar_color_state/bar_setting_state.dart';
import '../../store/settings_button_state/settings_button_state.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/secure_storage_utils.dart';
import '../../utils/wallet_activation_status.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button/loading_button.dart';
import '../splash_screen/background.dart';
import 'change_bar_name.dart';
import 'remove_bar_modal.dart';

@RoutePage()
class BarSettingsPage extends HookWidget {
  const BarSettingsPage({super.key, required this.bar});

  final BarModel bar;

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  SettingsState get _settingsState => GetIt.I<SettingsState>();

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();

    final _cardSettingsState = useMemoized(() => BarSettingState(bar: bar));
    final _balanceStore = useMemoized(() => GetIt.I<BalanceStore>());
    final _isPinSet = getIsPinCodeSet();
    final _auth = LocalAuthentication();

    final isInactive = useState(false);
    final appLocked = useState(false);
    final isPaused = useState(false);
    final deepLinkRes = useRef<String?>(null);
    final isBiometricsRunning = useState(false);
    final isPrivateKeySet = useState(false);
    final privateKey = useState('');

    Future<void> fetchPrivateKey() async {
      final fetchedKey = await secureStorage.read(key: bar.address);
      if (fetchedKey != null) {
        privateKey.value = fetchedKey;
      }
    }

    Future<void> isPrivateSet() async {
      isPrivateKeySet.value = await getIsPrivateKeySet(bar.address);
    }

    useOnAppLifecycleStateChange((previous, current) async {
      appLocked.value = await getIsPinCodeSet();
      isInactive.value = [AppLifecycleState.inactive].contains(current);
      if (isInactive.value) {
        _cardSettingsState.isPrivateKeyVisible = false;
      }
      if (appLocked.value && isInactive.value == true && _walletProtectState.isModalOpened) {
        await router.pop();
      }
      isPaused.value = [AppLifecycleState.paused].contains(current);
      if (isPaused.value &&
          router.current.name == CardSettingsRoute.name &&
          !_walletProtectState.isBiometricsRunning &&
          !_walletProtectState.isLinkOpened) {
        if (appLocked.value) {
          if (router.stackData
              .indexWhere(
                (element) => element.name == PinCodeForAllRoutes.name,
              )
              .isNegative) {
            await router.push(const PinCodeForAllRoutes());
            isPaused.value = false;
            isInactive.value = false;
            if (deepLinkRes.value != null) {
              await router.push(BarFillRoute(receivedData: deepLinkRes.value));
              deepLinkRes.value = null;
            }
          }
        }
      }
    });
    useEffect(() {
      isPrivateSet();
      fetchPrivateKey();
      return null;
    });

    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            elevation: 0,
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            foregroundColor: Colors.white,
            systemOverlayStyle: const SystemUiOverlayStyle(
              systemNavigationBarColor: Colors.white,
              statusBarColor: Colors.transparent,
            ),
            title: const Text(
              'Bar settings',
              style: TextStyle(
                fontSize: 17,
                fontFamily: FontFamily.redHatMedium,
                color: Colors.black,
              ),
            ),
          ),
          body: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    onTap: () async {
                      await _walletProtectState.updateModalStatus(isOpened: true);
                      await showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return BarNameChangeModal(
                            bar: bar,
                          );
                        },
                      );
                      await _walletProtectState.updateModalStatus(isOpened: false);
                    },
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Bar name',
                          style: TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                        const Gap(6),
                        Text(
                          bar.name,
                          style: const TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 14,
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    trailing: Assets.icons.edit.image(
                      height: 24,
                    ),
                  ),
                  const Gap(16),
                  ListTile(
                    onTap: () async {
                      if (Platform.isIOS) {
                        await Clipboard.setData(
                          ClipboardData(
                            text: bar.address.toString(),
                          ),
                        ).then(
                          (_) {
                            HapticFeedback.mediumImpact();
                            showTopSnackBar(
                              displayDuration: const Duration(
                                milliseconds: 400,
                              ),
                              Overlay.of(context),
                              CustomSnackBar.success(
                                backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
                                message: 'Address was copied',
                                textStyle: const TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            );
                          },
                        );
                      } else {
                        await Clipboard.setData(
                          ClipboardData(
                            text: bar.address.toString(),
                          ),
                        ).then(
                          (_) {
                            HapticFeedback.mediumImpact();
                          },
                        );
                      }
                      final isCardActivated =
                          isBarWalletActivated(balanceStore: _balanceStore, settingsState: _settingsState);
                      unawaited(
                        recordAmplitudeEvent(
                          AddressCopied(
                            source: 'Bar Settings',
                            walletType: 'Bar',
                            walletAddress: bar.address,
                            activated: await isCardActivated,
                          ),
                        ),
                      );
                    },
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Address',
                          style: TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        const Gap(6),
                        Text(
                          bar.address.toString(),
                          style: const TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 14,
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    trailing: Assets.icons.contentCopy.image(
                      height: 24,
                    ),
                  ),
                  if (isPrivateKeySet.value)
                    Column(
                      children: [
                        Observer(
                          builder: (context) {
                            return Column(
                              children: [
                                const Gap(16),
                                ListTile(
                                  trailing: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Gap(13),
                                      if (_cardSettingsState.isPrivateKeyVisible)
                                        Assets.icons.contentCopy.image(
                                          height: 24,
                                        )
                                      else
                                        Assets.icons.show.image(
                                          height: 24,
                                          color: AppColors.textHintsColor,
                                        ),
                                    ],
                                  ),
                                  onLongPress: () async {
                                    await recordAmplitudeEventPartTwo(
                                      PrivateKeyRevealed(walletAddress: bar.address, walletType: 'Bar'),
                                    );
                                    await HapticFeedback.selectionClick();
                                    if (!_cardSettingsState.isPrivateKeyVisible) {
                                      if (_walletProtectState.isBiometricsEnabled) {
                                        if (await _isPinSet) {
                                          try {
                                            isBiometricsRunning.value = true;
                                            final isAuthorized = await _auth.authenticate(
                                              localizedReason: 'Authenticate using Face ID',
                                              options: const AuthenticationOptions(biometricOnly: true),
                                            );
                                            if (isAuthorized) {
                                              _cardSettingsState.makePrivateVisible();
                                              await Future.delayed(const Duration(milliseconds: 1200));
                                              isBiometricsRunning.value = false;
                                            }
                                          } catch (e) {
                                            if (e is PlatformException && e.code == 'NotAvailable') {
                                            } else if (e is PlatformException && e.code == 'NotEnrolled') {
                                              log('Biometrics not enrolled' as num);
                                            } else if (e is PlatformException && e.code == 'AuthenticationFailed') {
                                              log('Biometrics authentication failed or canceled' as num);
                                            } else {}
                                            return;
                                          }
                                        } else {
                                          isBiometricsRunning.value = false;
                                          _cardSettingsState.makePrivateVisible();
                                        }
                                      } else {
                                        if (await _isPinSet) {
                                          await router
                                              .push(PinCodeForPrivateKey(bar: bar, isKeyVisible: _cardSettingsState));
                                        } else {
                                          _cardSettingsState.makePrivateVisible();
                                        }
                                      }
                                    } else {
                                      _cardSettingsState.isPrivateKeyVisible = false;
                                    }
                                  },
                                  onTap: _cardSettingsState.isPrivateKeyVisible
                                      ? () {
                                          recordAmplitudeEventPartTwo(
                                            PrivateKeyCopied(walletAddress: bar.address, walletType: 'Bar'),
                                          );
                                          Clipboard.setData(
                                            ClipboardData(
                                              text: privateKey.value.toString(),
                                            ),
                                          ).then(
                                            (_) {
                                              HapticFeedback.mediumImpact();
                                              showTopSnackBar(
                                                displayDuration: const Duration(
                                                  milliseconds: 400,
                                                ),
                                                Overlay.of(context),
                                                CustomSnackBar.success(
                                                  backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
                                                  message: 'Private key was copied',
                                                  textStyle: const TextStyle(
                                                    fontFamily: FontFamily.redHatMedium,
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      : () {
                                          recordAmplitudeEventPartTwo(
                                            ClickedOnPrivateKey(walletAddress: bar.address, walletType: 'Bar'),
                                          );
                                          showTopSnackBar(
                                            displayDuration: const Duration(
                                              milliseconds: 400,
                                            ),
                                            Overlay.of(context),
                                            CustomSnackBar.success(
                                              backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
                                              message: 'Hold to reveal your Private key',
                                              textStyle: const TextStyle(
                                                fontFamily: FontFamily.redHatMedium,
                                                fontSize: 14,
                                                color: Colors.white,
                                              ),
                                            ),
                                          );
                                        },
                                  title: Observer(
                                    builder: (context) {
                                      return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Private key',
                                            style: TextStyle(
                                              fontFamily: FontFamily.redHatMedium,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.primaryTextColor,
                                            ),
                                          ),
                                          const Gap(6),
                                          if (_cardSettingsState.isPrivateKeyVisible)
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey.withOpacity(0.1),
                                                ),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              child: Text(
                                                privateKey.value.toString(),
                                                style: const TextStyle(
                                                  fontFamily: FontFamily.redHatMedium,
                                                  fontSize: 14,
                                                  color: AppColors.primaryTextColor,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            )
                                          else
                                            ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: ImageFiltered(
                                                imageFilter: ImageFilter.blur(
                                                  sigmaX: 5,
                                                  sigmaY: 5,
                                                ),
                                                child: Container(
                                                  padding: const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(
                                                      10,
                                                    ),
                                                    border: Border.all(
                                                      color: Colors.grey.withOpacity(0.1),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    'L24hTctc4WlPBJwyP8EzBogNhm2y7EUjkHpVBFD9rhYT5PLoTuY6',
                                                    style: TextStyle(
                                                      fontFamily: FontFamily.redHatMedium,
                                                      fontSize: 14,
                                                      color: AppColors.textHintsColor,
                                                      fontWeight: FontWeight.w300,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        ListTile(
                          title: ScaleTap(
                            enableFeedback: false,
                            onPressed: () async {
                              await recordAmplitudeEventPartTwo(const HelpCenterClicked(source: 'Wallet Settings'));
                              await FlutterWebBrowser.openWebPage(
                                url:
                                    'https://coinplus.gitbook.io/help-center/faq/how-to-send-crypto-from-the-activated-coinplus-wallet',
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
                            child: StyledText(
                              text:
                                  "If you don't know what to do with this Private key, please checkout our <p>Help center</p> article.",
                              tags: {
                                'p': StyledTextTag(
                                  style: const TextStyle(
                                    fontFamily: FontFamily.redHatMedium,
                                    decoration: TextDecoration.underline,
                                    fontSize: 14,
                                    color: Colors.blue,
                                  ),
                                ),
                              },
                              style: const TextStyle(
                                fontFamily: FontFamily.redHatMedium,
                                fontWeight: FontWeight.w300,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    const SizedBox(),
                  const Gap(16),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Date added',
                          style: TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        const Gap(6),
                        Text(
                          bar.createdAt,
                          style: const TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 14,
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),
                  Divider(
                    indent: 5,
                    endIndent: 5,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  const Gap(16),
                  ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Appearance',
                          style: TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        const Gap(6),
                        const Text(
                          'Choose a color theme for your bar',
                          style: TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 14,
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        const Gap(25),
                        Observer(
                          builder: (_) {
                            final colorWidgets = <Widget>[];

                            final colors = <CardColor>[
                              CardColor.SILVER,
                              CardColor.GOLD,
                            ];

                            for (var index = 0; index < colors.length; index++) {
                              colorWidgets.add(
                                ScaleTap(
                                  enableFeedback: false,
                                  onPressed: () {
                                    HapticFeedback.selectionClick();
                                    _cardSettingsState
                                      ..changeBarColor(colors[index])
                                      ..colorState();
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(
                                            width: 2,
                                            color: _cardSettingsState.selectedBarColor == colors[index]
                                                ? Colors.blue
                                                : Colors.transparent,
                                          ),
                                        ),
                                        child: getColorImage(colors[index]),
                                      ),
                                      Radio(
                                        activeColor: AppColors.secondaryButtons,
                                        value: index,
                                        groupValue: colors.indexOf(
                                          _cardSettingsState.selectedBarColor,
                                        ),
                                        onChanged: (selectedIndex) {
                                          _cardSettingsState.changeBarColor(
                                            colors[selectedIndex!],
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }

                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: colorWidgets,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Gap(10),
                  Divider(
                    indent: 5,
                    endIndent: 5,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  const Gap(10),
                  ListTile(
                    onTap: () async {
                      final isBarActivated =
                          isBarWalletActivated(balanceStore: _balanceStore, settingsState: _settingsState);
                      await recordAmplitudeEventPartTwo(
                        RemoveCardClicked(
                          walletAddress: bar.address,
                          walletType: 'Bar',
                          activated: await isBarActivated,
                        ),
                      );
                      await _walletProtectState.updateModalStatus(isOpened: true);
                      await showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        backgroundColor: Colors.white,
                        builder: (context) {
                          return RemoveBar(
                            bar: bar,
                          );
                        },
                      );
                      await _walletProtectState.updateModalStatus(isOpened: false);
                    },
                    trailing: Assets.icons.trash.image(
                      height: 24,
                    ),
                    title: const Text(
                      'Remove bar',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        color: Color(0xFFFD5340),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Gap(10),
                  Observer(
                    builder: (context) {
                      return LoadingButton(
                        onPressed: _cardSettingsState.isColorChanged
                            ? () async {
                                if (_cardSettingsState.selectedBarColor == CardColor.SILVER) {
                                  _balanceStore.changeCardColorAndSave(
                                    cardAddress: bar.address,
                                    color: CardColor.SILVER,
                                  );
                                  showTopSnackBar(
                                    displayDuration: const Duration(
                                      milliseconds: 600,
                                    ),
                                    Overlay.of(context),
                                    CustomSnackBar.success(
                                      backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
                                      message: 'Your card color was changed',
                                      textStyle: const TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                } else if (_cardSettingsState.selectedBarColor == CardColor.SILVER) {
                                  _balanceStore.changeCardColorAndSave(
                                    cardAddress: bar.address,
                                    color: CardColor.SILVER,
                                  );
                                  showTopSnackBar(
                                    displayDuration: const Duration(
                                      milliseconds: 600,
                                    ),
                                    Overlay.of(context),
                                    CustomSnackBar.success(
                                      backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
                                      message: 'Your card color was changed',
                                      textStyle: const TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                }
                                await router.pop();
                                await _balanceStore.getCardsInfo();
                              }
                            : null,
                        child: const Text(
                          'Save',
                          style: TextStyle(fontFamily: FontFamily.redHatMedium),
                        ),
                      ).paddingHorizontal(64);
                    },
                  ),
                  Gap(max(context.bottomPadding, 50)),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: isInactive.value && appLocked.value,
          child: !isBiometricsRunning.value ? const Background() : const SizedBox(),
        ),
      ],
    );
  }
}

Widget getColorImage(CardColor color) {
  switch (color) {
    case CardColor.SILVER:
      return Assets.images.bar.silverBar.image(height: 130);
    case CardColor.GOLD:
      return Assets.images.bar.silverBar.image(height: 130);
    default:
      throw Exception('color can be used only for card');
  }
}
