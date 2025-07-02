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
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shimmer/shimmer.dart';
import 'package:styled_text/styled_text.dart';

import '../../constants/card_color.dart';
import '../../constants/card_type.dart';
import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../modals/android_nfc_session_modal/android_nfc_session_modal.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../models/amplitude_event/amplitude_event_part_one/amplitude_event.dart';
import '../../models/amplitude_event/amplitude_event_part_three/amplitude_event_part_three.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../services/amplitude_service.dart';
import '../../services/cloud_firestore_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/card_color_state/card_setting_state.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/card_nfc_session.dart';
import '../../utils/secure_storage_utils.dart';
import '../../utils/wallet_activation_status.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button/loading_button.dart';
import '../splash_screen/background.dart';
import 'change_card_name.dart';
import 'lost_card_action_slider.dart';
import 'remove_card_modal.dart';

@RoutePage()
class CardSettingsPage extends HookWidget {
  const CardSettingsPage({super.key, required this.card});

  final AbstractCard card;

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    final _cardSettingsState = useMemoized(() => CardSettingState(card: card));
    final _balanceStore = useMemoized(() => GetIt.I<BalanceStore>());
    final _secureStorage = SecureStorageService();
    final _isPinSet = _secureStorage.getIsPinCodeSet();
    final _auth = LocalAuthentication();
    final isInactive = useState(false);
    final appLocked = useState(false);
    final isPaused = useState(false);
    final deepLinkRes = useRef<String?>(null);
    final isPrivateKeySet = useState(false);
    final isBiometricsRunning = useState(false);
    final privateKey = useState('');

    Future<void> fetchPrivateKey() async {
      final fetchedKey = await _secureStorage.read(key: card.address);
      if (fetchedKey != null) {
        privateKey.value = fetchedKey;
      }
    }

    Future<void> isPrivateSet() async {
      isPrivateKeySet.value = await _secureStorage.getIsPrivateKeySet(card.address);
    }

    useOnAppLifecycleStateChange((previous, current) async {
      appLocked.value = await _secureStorage.getIsPinCodeSet();
      isInactive.value = [AppLifecycleState.inactive].contains(current);
      if (isInactive.value) {
        _cardSettingsState.isPrivateKeyVisible = false;
      }
      if (appLocked.value && isInactive.value == true && _walletProtectState.isModalOpened) {
        await router.maybePop();
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
              await router.push(CardConnectRoute(receivedData: deepLinkRes.value));
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

    List<Widget> getColorWidgets() {
      final colorWidgets = <Widget>[];

      final colors = <CardColor>[
        CardColor.ORANGE,
        CardColor.WHITE,
        CardColor.BLACK,
      ];

      for (var index = 0; index < colors.length; index++) {
        colorWidgets.add(
          ScaleTap(
            enableFeedback: false,
            onPressed: () {
              _cardSettingsState.changeCardColor(colors[index]);
            },
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 2,
                      color: _cardSettingsState.selectedCardColor == colors[index] ? Colors.blue : Colors.transparent,
                    ),
                  ),
                  child: getColorImage(colors[index]),
                ),
                Radio(
                  activeColor: Colors.blue,
                  value: index,
                  groupValue: colors.indexOf(_cardSettingsState.selectedCardColor),
                  onChanged: (selectedIndex) {
                    _cardSettingsState.changeCardColor(colors[selectedIndex!]);
                  },
                ),
              ],
            ),
          ),
        );
      }
      return colorWidgets;
    }

    return Stack(
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: false,
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
              'Card settings',
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
                  if ((card.label == WalletType.COINPLUS_WALLET) &&
                      (card.color != CardColor.BACKUP) &&
                      card.blockchain != 'ETH')
                    Column(
                      children: [
                        FutureBuilder(
                          future: getCardData(card.address),
                          builder: (context, snapshot) {
                            return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder: (child, animation) {
                                return FadeTransition(opacity: animation, child: child);
                              },
                              child: snapshot.connectionState == ConnectionState.waiting || !snapshot.hasData
                                  ? Padding(
                                      key: const ValueKey('loading'),
                                      padding: const EdgeInsets.symmetric(horizontal: 14),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(16),
                                          color: Colors.grey.withValues(alpha: 0.08),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: Column(
                                            children: [
                                              Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!,
                                                highlightColor: Colors.grey[100]!,
                                                child: Row(
                                                  children: [
                                                    Shimmer.fromColors(
                                                      baseColor: Colors.grey[300]!,
                                                      highlightColor: Colors.grey[100]!,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(8),
                                                          color: Colors.grey,
                                                        ),
                                                        child: Assets.icons.lostCardIcon.image(height: 26),
                                                      ),
                                                    ),
                                                    const Gap(8),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Colors.white,
                                                      ),
                                                      child: const Text(
                                                        'Lost my card',
                                                        style: TextStyle(
                                                          fontFamily: FontFamily.redHatMedium,
                                                          fontSize: 16,
                                                          color: Colors.transparent,
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Gap(16),
                                              Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!,
                                                highlightColor: Colors.grey[100]!,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(50),
                                                    color: Colors.grey,
                                                  ),
                                                  height: 60,
                                                  width: double.infinity,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                  : Padding(
                                      key: const ValueKey('loaded'),
                                      padding: const EdgeInsets.symmetric(horizontal: 14),
                                      child: Stack(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(16),
                                              color: Colors.grey.withValues(alpha: 0.09),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(12),
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      Assets.icons.lostCardIcon.image(height: 26),
                                                      const Gap(8),
                                                      Text(
                                                        snapshot.data!.lost ?? false ? 'Card is lost' : 'Lost my card',
                                                        style: const TextStyle(
                                                          fontFamily: FontFamily.redHatMedium,
                                                          fontSize: 16,
                                                          color: AppColors.primary,
                                                          fontWeight: FontWeight.w700,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  const Gap(16),
                                                  LostCardActionSlider(
                                                    card: card,
                                                    lostStatus: snapshot.data!.lost ?? false,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            right: 10,
                                            top: 10,
                                            child: snapshot.data?.lost == true
                                                ? ScaleTap(
                                                    enableFeedback: false,
                                                    onPressed: () async {
                                                      await recordAmplitudeEventPartThree(
                                                        CardFound(
                                                          walletAddress: card.address,
                                                          backupAddress: _balanceStore.backupSingleCard?.address ?? '',
                                                        ),
                                                      );
                                                      if (Platform.isIOS) {
                                                        await checkFoundCardIos(
                                                          mainWalletAddress: card.address,
                                                          backupWalletAddress:
                                                              _balanceStore.backupSingleCard?.address ?? '',
                                                        );
                                                      } else {
                                                        try {
                                                          await checkFoundCardAndroid(
                                                            mainWalletAddress: card.address,
                                                            backupWalletAddress:
                                                                _balanceStore.backupSingleCard?.address ?? '',
                                                          );
                                                          await showModalBottomSheet(
                                                            context: router.navigatorKey.currentContext!,
                                                            shape: const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(20),
                                                                topRight: Radius.circular(20),
                                                              ),
                                                            ),
                                                            backgroundColor: Colors.transparent,
                                                            builder: (context) {
                                                              return const AndroidNfcSessionModal();
                                                            },
                                                          );
                                                        } catch (e) {
                                                          return;
                                                        }
                                                      }
                                                    },
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Colors.greenAccent,
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8),
                                                        child: Text(
                                                          'Card found',
                                                          style: TextStyle(
                                                            fontFamily: FontFamily.redHatMedium,
                                                            fontSize: 14,
                                                            color: Colors.black.withValues(alpha: 0.5),
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                          ),
                                        ],
                                      ),
                                    ),
                            );
                          },
                        ),
                        const Gap(16),
                      ],
                    ),
                  ListTile(
                    onTap: () async {
                      await _walletProtectState.updateModalStatus(
                        isOpened: true,
                      );
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
                          return CardNameChangeModal(
                            card: card,
                          );
                        },
                      );
                      await _walletProtectState.updateModalStatus(
                        isOpened: false,
                      );
                    },
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Card name',
                          style: TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                        const Gap(6),
                        Text(
                          card.name,
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
                            text: card.address.toString(),
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
                                backgroundColor: const Color(0xFF4A4A4A).withValues(alpha: 0.9),
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
                            text: card.address.toString(),
                          ),
                        ).then(
                          (_) {
                            HapticFeedback.mediumImpact();
                          },
                        );
                      }
                      final isCardActivated = isCardWalletActivated();
                      unawaited(
                        recordAmplitudeEvent(
                          AddressCopied(
                            source: 'Card Settings',
                            walletType: 'Card',
                            walletAddress: card.address,
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
                          card.address.toString(),
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
                                  enableFeedback: false,
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
                                      PrivateKeyRevealed(
                                        walletAddress: card.address,
                                        walletType: 'Card',
                                      ),
                                    );
                                    await HapticFeedback.selectionClick();
                                    if (!_cardSettingsState.isPrivateKeyVisible) {
                                      if (_walletProtectState.isBiometricsEnabled) {
                                        if (await _isPinSet) {
                                          try {
                                            isBiometricsRunning.value = true;
                                            final isAuthorized = await _auth.authenticate(
                                              localizedReason: 'Authenticate using Face ID',
                                              options: const AuthenticationOptions(
                                                biometricOnly: true,
                                              ),
                                            );
                                            if (isAuthorized) {
                                              _cardSettingsState.makePrivateVisible();
                                              await Future.delayed(
                                                const Duration(
                                                  milliseconds: 1200,
                                                ),
                                              );
                                              isBiometricsRunning.value = false;
                                            }
                                          } catch (e) {
                                            if (e is PlatformException && e.code == 'NotAvailable') {
                                            } else if (e is PlatformException && e.code == 'NotEnrolled') {
                                              log(
                                                'Biometrics not enrolled' as num,
                                              );
                                            } else if (e is PlatformException && e.code == 'AuthenticationFailed') {
                                              log(
                                                'Biometrics authentication failed or canceled' as num,
                                              );
                                            } else {
                                              log(
                                                'Unhandled exception: $e' as num,
                                              );
                                            }
                                            return;
                                          }
                                        } else {
                                          isBiometricsRunning.value = false;
                                          _cardSettingsState.makePrivateVisible();
                                        }
                                      } else {
                                        if (await _isPinSet) {
                                          await router.push(
                                            PinCodeForPrivateKey(
                                              card: card,
                                              isVisible: _cardSettingsState,
                                            ),
                                          );
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
                                            PrivateKeyCopied(
                                              walletAddress: card.address,
                                              walletType: 'Card',
                                            ),
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
                                                  backgroundColor: const Color(0xFF4A4A4A).withValues(alpha: 0.9),
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
                                            ClickedOnPrivateKey(
                                              walletAddress: card.address,
                                              walletType: 'Card',
                                            ),
                                          );
                                          showTopSnackBar(
                                            displayDuration: const Duration(
                                              milliseconds: 400,
                                            ),
                                            Overlay.of(context),
                                            CustomSnackBar.success(
                                              backgroundColor: const Color(0xFF4A4A4A).withValues(alpha: 0.9),
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
                                                  color: Colors.grey.withValues(alpha: 0.1),
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
                                                      color: Colors.grey.withValues(alpha: 0.1),
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
                              await recordAmplitudeEventPartTwo(
                                const HelpCenterClicked(
                                  source: 'Wallet Settings',
                                ),
                              );
                              await router.push(
                                WebViewRoute(
                                  link:
                                      'https://coinplus.gitbook.io/help-center/faq/how-to-send-crypto-from-the-activated-coinplus-wallet',
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
                          card.createdAt,
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
                    color: Colors.grey.withValues(alpha: 0.2),
                  ),
                  if (card.color != CardColor.BACKUP)
                    if (card.label != WalletType.TRACKER &&
                        card.label != WalletType.COINPLUS_LEGACY_WALLET &&
                        card.label != WalletType.TRACKER_PLUS &&
                        card.color != CardColor.GATE_BLACK &&
                        card.blockchain != 'ETH')
                      Column(
                        children: [
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
                                  'Choose a color theme for your card',
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
                                    return Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: getColorWidgets(),
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
                            color: Colors.grey.withValues(alpha: 0.2),
                          ),
                          const Gap(10),
                        ],
                      ),
                  ListTile(
                    enableFeedback: false,
                    onTap: () async {
                      if (card.blockchain == 'BTC') {
                        final isCardActivated = isCardWalletActivated();
                        await recordAmplitudeEventPartTwo(
                          RemoveCardClicked(
                            walletAddress: card.address,
                            walletType: 'Card',
                            activated: await isCardActivated,
                          ),
                        );
                      } else if (card.blockchain == 'ETH') {
                        final isCardActivated = isEthCardWalletActivated();
                        await recordAmplitudeEventPartTwo(
                          RemoveCardClicked(
                            walletAddress: card.address,
                            walletType: 'Card',
                            activated: await isCardActivated,
                          ),
                        );
                      }
                      await _walletProtectState.updateModalStatus(
                        isOpened: true,
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
                          return RemoveCard(
                            card: card,
                          );
                        },
                      );
                      await _walletProtectState.updateModalStatus(
                        isOpened: false,
                      );
                    },
                    trailing: Assets.icons.trash.image(
                      height: 24,
                    ),
                    title: const Text(
                      'Remove card',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        color: Color(0xFFFD5340),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const Gap(10),
                  if (card.label != WalletType.TRACKER)
                    Observer(
                      builder: (context) {
                        return LoadingButton(
                          onPressed: _cardSettingsState.isColorChanged
                              ? () async {
                                  if (_cardSettingsState.selectedCardColor == CardColor.ORANGE) {
                                    await recordAmplitudeEventPartTwo(
                                      CardColorCHanged(
                                        walletAddress: card.address,
                                        color: 'ORANGE',
                                      ),
                                    );
                                    _balanceStore.changeCardColorAndSave(
                                      cardAddress: card.address,
                                      color: CardColor.ORANGE,
                                    );
                                    showTopSnackBar(
                                      displayDuration: const Duration(
                                        milliseconds: 600,
                                      ),
                                      Overlay.of(context),
                                      CustomSnackBar.success(
                                        backgroundColor: const Color(0xFF4A4A4A).withValues(alpha: 0.9),
                                        message: 'Your card color was changed',
                                        textStyle: const TextStyle(
                                          fontFamily: FontFamily.redHatMedium,
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  } else if (_cardSettingsState.selectedCardColor == CardColor.WHITE) {
                                    await recordAmplitudeEventPartTwo(
                                      CardColorCHanged(
                                        walletAddress: card.address,
                                        color: 'WHITE',
                                      ),
                                    );
                                    _balanceStore.changeCardColorAndSave(
                                      cardAddress: card.address,
                                      color: CardColor.WHITE,
                                    );
                                    showTopSnackBar(
                                      displayDuration: const Duration(
                                        milliseconds: 600,
                                      ),
                                      Overlay.of(context),
                                      CustomSnackBar.success(
                                        backgroundColor: const Color(0xFF4A4A4A).withValues(alpha: 0.9),
                                        message: 'Your card color was changed',
                                        textStyle: const TextStyle(
                                          fontFamily: FontFamily.redHatMedium,
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  } else if (_cardSettingsState.selectedCardColor == CardColor.BLACK) {
                                    await recordAmplitudeEventPartTwo(
                                      CardColorCHanged(
                                        walletAddress: card.address,
                                        color: 'BLACK',
                                      ),
                                    );
                                    _balanceStore.changeCardColorAndSave(
                                      cardAddress: card.address,
                                      color: CardColor.BLACK,
                                    );
                                    showTopSnackBar(
                                      displayDuration: const Duration(
                                        milliseconds: 600,
                                      ),
                                      Overlay.of(context),
                                      CustomSnackBar.success(
                                        backgroundColor: const Color(0xFF4A4A4A).withValues(alpha: 0.9),
                                        message: 'Your card color was changed',
                                        textStyle: const TextStyle(
                                          fontFamily: FontFamily.redHatMedium,
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  }
                                  await router.maybePop();
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
    case CardColor.ORANGE:
      return Assets.images.card.orangeCardFront.image(height: 130);
    case CardColor.WHITE:
      return Assets.images.card.whiteCardFront.image(height: 130);
    case CardColor.BLACK:
      return Assets.images.card.brownCardFront.image(height: 130);
    default:
      return const SizedBox.shrink();
  }
}
