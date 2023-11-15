import 'dart:convert';
import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/card_record.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/nav_bar_state/nav_bar_state.dart';
import '../../store/settings_button_state/settings_button_state.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/compute_private_key.dart';
import '../../utils/nxp_originality_check.dart';
import '../../utils/secure_storage_utils.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button.dart';
import '../onboarding_page/form_factor_page/bar_scan_methods_page.dart';
import '../onboarding_page/form_factor_page/card_scan_methods_page.dart';
import '../settings_page/settings_page.dart';
import '../splash_screen/background.dart';
import '../wallet_page/wallet_page.dart';
import 'already_activated_alert/already_activated_alert.dart';
import 'not_coinplus_card_alert/not_coinplus_card_alert.dart';
import 'trouble_tapping_card/trouble_tapping_card.dart';

@RoutePage()
class Dashboard extends HookWidget {
  const Dashboard({
    this.onCarouselScroll,
    this.onChangeCard,
    this.onCardSelected,
    super.key,
  });

  final CardChangeCallBack? onChangeCard;
  final ValueChanged<AbstractCard?>? onCardSelected;
  final ValueChanged<int>? onCarouselScroll;

  void useBranchSDK(BuildContext context) {
    useEffect(
      () {
        final streamSubscription = FlutterBranchSdk.initSession().listen(
          (data) {
            if (data.containsKey('+non_branch_link') && data['+non_branch_link'] != null) {
              final String url = data['+non_branch_link'];
              final splitting = url.split('/');
              final part = splitting[splitting.length - 1];
              if (isValidPublicAddress(part)) {
                router.push(CardFillRoute(receivedData: part));
              } else {
                showTopSnackBar(
                  displayDuration: const Duration(milliseconds: 400),
                  Overlay.of(context),
                  CustomSnackBar.success(
                    backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
                    message: 'This is not a valid Coinplus Bitcoin address',
                    textStyle: const TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                );
              }
            }
          },
        );

        return streamSubscription.cancel;
      },
      [],
    );
  }

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  SettingsState get _settingsState => GetIt.I<SettingsState>();

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  NavBarState get _navBarState => GetIt.I<NavBarState>();

  @override
  Widget build(BuildContext context) {
    void showBottomSheet() {
      showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              20,
            ),
            topRight: Radius.circular(
              20,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        builder: (_) {
          return const CardIssueOptionsSheet();
        },
      );
    }

    Future<void> notCoinplusCard() async {
      await notCoinplusCardAlert(
        context,
      );
    }

    useBranchSDK(context);
    final _pageController = usePageController();
    final currentCard = useRef<CardRecord>(
      (
        card: _balanceStore.cards.firstOrNull as AbstractCard?,
        index: 0,
      ),
    );

    final isPaused = useState(false);
    final isInactive = useState(false);
    final appLocked = useState(false);

    useOnAppLifecycleStateChange((previous, current) async {
      appLocked.value = await getIsPinCodeSet();
      isPaused.value = [AppLifecycleState.paused].contains(current);
      isInactive.value = [AppLifecycleState.inactive].contains(current);
      if (isPaused.value) {
        final isPinCodeSet = await getIsPinCodeSet();
        if (isPinCodeSet) {
          if (router.stackData
              .indexWhere(
                (element) => element.name == PinCodeRoute.name,
              )
              .isNegative) {
            await router.push(const PinCodeRoute());
          }
        }
      }
    });

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              WalletPage(
                onChangeCard: (val) => currentCard.value = val,
              ),
              const SettingsPage(),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(
                thickness: 0.5,
                endIndent: 1,
                indent: 0,
                color: Colors.grey.withOpacity(0.2),
              ),
              Theme(
                data: ThemeData(
                  canvasColor: Colors.white,
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                ),
                child: Observer(
                  builder: (context) {
                    return BottomNavigationBar(
                      selectedLabelStyle: const TextStyle(
                        fontSize: 11,
                        fontFamily: FontFamily.redHatMedium,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 11,
                        fontFamily: FontFamily.redHatMedium,
                      ),
                      onTap: (index) => [
                        HapticFeedback.lightImpact(),
                        _pageController.jumpToPage(
                          index,
                        ),
                        _navBarState.updateIndex(index),
                      ],
                      currentIndex: _navBarState.currentIndex,
                      elevation: 0,
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.black,
                      unselectedItemColor: Colors.black,
                      items: <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: Assets.icons.walletIcon.image(
                            height: 32,
                            color: _navBarState.currentIndex == 0 ? Colors.black : const Color(0xFfB8BEC5),
                          ),
                          label: 'Wallet',
                        ),
                        BottomNavigationBarItem(
                          icon: Assets.icons.pageInfo.image(
                            height: 32,
                            color: _navBarState.currentIndex == 1 ? Colors.black : const Color(0xFfB8BEC5),
                          ),
                          label: 'Settings',
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            child: isInactive.value && appLocked.value
                ? _walletProtectState.isBiometricsRunning
                    ? const SizedBox()
                    : Visibility(
                        child: !_walletProtectState.isNfcSessionStarted ? const Background() : const SizedBox(),
                      )
                : null,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: isInactive.value && appLocked.value
          ? !_walletProtectState.isNfcSessionStarted
              ? const SizedBox()
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (_navBarState.isInAddCard || _navBarState.isInAddBar)
                      FloatingActionButton(
                        shape: const CircleBorder(),
                        elevation: 3,
                        backgroundColor: Colors.deepOrangeAccent.withOpacity(0.9),
                        onPressed: null,
                        child: Assets.icons.plus.image(
                          color: Colors.white,
                          height: 32,
                        ),
                      )
                    else
                      FloatingActionButton(
                        shape: const CircleBorder(),
                        elevation: 3,
                        backgroundColor: Colors.deepOrangeAccent.withOpacity(0.9),
                        onPressed: null,
                        child: Assets.icons.sendReceive.image(
                          color: Colors.white,
                          height: 32,
                        ),
                      ),
                    const Gap(6),
                    const Text(
                      'Transactions',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        color: Colors.black,
                        fontSize: 11,
                      ),
                    ),
                    const Gap(6),
                  ],
                )
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ScaleTap(
                  enableFeedback: false,
                  onPressed: () async {
                    final selectedCard = currentCard.value.card;
                    final isBarList = currentCard.value.index == 1;

                    if (selectedCard == null || _pageController.page != 0) {
                      if (isBarList) {
                        await showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Assets.icons.notch.image(
                                    height: 4,
                                  ),
                                ),
                                const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(left: 20, top: 10),
                                      child: Text(
                                        'Add new wallet',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: FontFamily.redHatBold,
                                          fontSize: 17,
                                          color: AppColors.primaryTextColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(18),
                                const BarScanMethodsPage().paddingHorizontal(20),
                                const Gap(40),
                              ],
                            );
                          },
                        );
                      } else {
                        await showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: Assets.icons.notch.image(
                                    height: 4,
                                  ),
                                ),
                                const Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        left: 20,
                                        top: 10,
                                      ),
                                      child: Text(
                                        'Add new wallet',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: FontFamily.redHatBold,
                                          fontSize: 17,
                                          color: AppColors.primaryTextColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(18),
                                const CardScanMethodsPage().paddingHorizontal(
                                  20,
                                ),
                                const Gap(40),
                              ],
                            );
                          },
                        );
                      }
                      return;
                    }
                    await showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (_) {
                        final card = [
                          ..._balanceStore.cards,
                          ..._balanceStore.bars,
                        ].firstWhere(
                          (element) => (element as AbstractCard).address == selectedCard.address,
                        ) as AbstractCard;
                        return Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.icons.notch.image(width: 42),
                              const Gap(18),
                              LoadingButton(
                                style: context.theme
                                    .buttonStyle(
                                      textStyle: const TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        color: AppColors.primaryTextColor,
                                        fontSize: 15,
                                      ),
                                    )
                                    .copyWith(
                                      padding: const MaterialStatePropertyAll(
                                        EdgeInsets.all(10),
                                      ),
                                      backgroundColor: MaterialStateProperty.all(
                                        AppColors.silver,
                                      ),
                                    ),
                                onPressed: () async {
                                  await router.pop(const Dashboard());
                                  await showModalBottomSheet(
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    backgroundColor: Colors.white,
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (_) {
                                      return SizedBox(
                                        height: 780,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15),
                                          child: Column(
                                            children: [
                                              Assets.icons.notch.image(
                                                height: 4,
                                              ),
                                              Row(
                                                children: [
                                                  IconButton(
                                                    onPressed: router.pop,
                                                    icon: Assets.icons.close.image(),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        const Text(
                                                          'Receive BTC',
                                                          textAlign: TextAlign.center,
                                                          style: TextStyle(
                                                            fontFamily: FontFamily.redHatMedium,
                                                            fontSize: 17,
                                                            fontWeight: FontWeight.w700,
                                                          ),
                                                        ),
                                                        const Gap(6),
                                                        Assets.icons.bTCIcon.image(
                                                          height: 24,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 40,
                                                  ),
                                                ],
                                              ),
                                              const Gap(60),
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(14),
                                                  color: const Color(
                                                    0xFFF7F7FA,
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(
                                                        top: 12,
                                                        left: 62,
                                                        right: 62,
                                                        bottom: 17,
                                                      ),
                                                      child: QrImageView(
                                                        data: card.address,
                                                        size: 220,
                                                        gapless: false,
                                                      ),
                                                    ),
                                                    ScaleTap(
                                                      enableFeedback: false,
                                                      onPressed: () {
                                                        Clipboard.setData(
                                                          ClipboardData(
                                                            text: card.address.toString(),
                                                          ),
                                                        ).then(
                                                          (_) {
                                                            HapticFeedback.mediumImpact();
                                                            _settingsState.copyAddress();
                                                          },
                                                        );
                                                      },
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(
                                                          left: 12,
                                                          right: 12,
                                                          bottom: 12,
                                                        ),
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(
                                                              8,
                                                            ),
                                                            color: Colors.white,
                                                          ),
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(
                                                              top: 10,
                                                              bottom: 10,
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                Assets.icons.contentCopy.image(
                                                                  height: 32,
                                                                  color: AppColors.primaryButtonColor,
                                                                ),
                                                                const Gap(
                                                                  8,
                                                                ),
                                                                Observer(
                                                                  builder: (context) {
                                                                    return Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        const Text(
                                                                          'Your address',
                                                                          style: TextStyle(
                                                                            fontFamily: FontFamily.redHatMedium,
                                                                            fontSize: 16,
                                                                          ),
                                                                        ),
                                                                        AnimatedCrossFade(
                                                                          firstChild: const Row(
                                                                            children: [
                                                                              Text(
                                                                                'Copied',
                                                                                style: TextStyle(
                                                                                  fontFamily: FontFamily.redHatMedium,
                                                                                  color: Colors.green,
                                                                                ),
                                                                              ),
                                                                              Icon(
                                                                                Icons.check,
                                                                                color: Colors.green,
                                                                                size: 18,
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          secondChild: Text(
                                                                            card.address,
                                                                            style: const TextStyle(
                                                                              fontFamily: FontFamily.redHatMedium,
                                                                              fontSize: 14,
                                                                              color: Color(
                                                                                0xFF4F6486,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          crossFadeState: _settingsState.isAddressCopied
                                                                              ? CrossFadeState.showFirst
                                                                              : CrossFadeState.showSecond,
                                                                          duration: const Duration(
                                                                            milliseconds: 200,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const Gap(16),
                                              Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: const Color(
                                                      0xFF4A83E0,
                                                    ).withOpacity(
                                                      0.1,
                                                    ),
                                                  ),
                                                  borderRadius: BorderRadius.circular(14),
                                                  color: const Color(
                                                    0xFF4A83E0,
                                                  ).withOpacity(0.05),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(14),
                                                  child: Row(
                                                    children: [
                                                      Assets.icons.error.image(
                                                        height: 24,
                                                      ),
                                                      const Gap(10),
                                                      const Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Text(
                                                            'Please note',
                                                            style: TextStyle(
                                                              fontFamily: FontFamily.redHatMedium,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.w600,
                                                              color: Color(
                                                                0xFF4F6486,
                                                              ),
                                                            ),
                                                          ),
                                                          Gap(4),
                                                          Text(
                                                            'This address is exclusively for receiving \nBitcoin. You cannot receive any other \ncryptocurrency to this address.',
                                                            textAlign: TextAlign.left,
                                                            style: TextStyle(
                                                              fontFamily: FontFamily.redHatMedium,
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.normal,
                                                              color: Color(
                                                                0xFF4F6486,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const Spacer(),
                                              LoadingButton(
                                                onPressed: () {
                                                  Share.share(
                                                    card.address,
                                                  );
                                                },
                                                child: const Text(
                                                  'Share',
                                                  style: TextStyle(
                                                    fontFamily: FontFamily.redHatMedium,
                                                  ),
                                                ),
                                              ).paddingHorizontal(60),
                                              const Gap(20),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8,
                                      ),
                                      child: Assets.icons.receive.image(
                                        height: 24,
                                        width: 24,
                                        color: AppColors.primaryButtonColor,
                                      ),
                                    ),
                                    const Gap(8),
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Receive',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: FontFamily.redHatMedium,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.primaryTextColor,
                                          ),
                                        ),
                                        Text(
                                          'Receive crypto on this address',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: FontFamily.redHatMedium,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.textHintsColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(8),
                              Observer(
                                builder: (context) {
                                  Future<bool> isWalletActivated() async {
                                    return getIsWalletActivated(
                                      _balanceStore.cards[_settingsState.cardCurrentIndex].address,
                                    );
                                  }

                                  final isActivated = isWalletActivated();
                                  return LoadingButton(
                                    style: context.theme
                                        .buttonStyle(
                                          textStyle: const TextStyle(
                                            fontFamily: FontFamily.redHatMedium,
                                            color: AppColors.primaryTextColor,
                                            fontSize: 15,
                                          ),
                                        )
                                        .copyWith(
                                          padding: const MaterialStatePropertyAll(
                                            EdgeInsets.all(10),
                                          ),
                                          backgroundColor: MaterialStateProperty.all(
                                            AppColors.silver,
                                          ),
                                        ),
                                    onPressed: () async {
                                      if (await isActivated) {
                                        await router.pop();
                                        await alreadyActivatedWallet(context);
                                      } else {
                                        await router.pop();
                                        final okButton = LoadingButton(
                                          onPressed: router.pop,
                                          child: const Text(
                                            'Got it',
                                            style: TextStyle(
                                              fontFamily: FontFamily.redHatMedium,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ).paddingHorizontal(40);
                                        final sendButton = SizedBox(
                                          height: 48,
                                          child: LoadingButton(
                                            style: context.theme
                                                .buttonStyle(
                                                  textStyle: const TextStyle(
                                                    fontFamily: FontFamily.redHatMedium,
                                                    color: AppColors.primaryTextColor,
                                                    fontSize: 15,
                                                  ),
                                                )
                                                .copyWith(
                                                  backgroundColor: MaterialStateProperty.all(
                                                    AppColors.silver,
                                                  ),
                                                ),
                                            onPressed: Platform.isIOS
                                                ? () async {
                                                    _walletProtectState.isNfcSessionStart();
                                                    await router.pop();
                                                    await NfcManager.instance.startSession(
                                                      alertMessage: isBarList
                                                          ? 'It’s easy! Hold your phone near the top of your Bar’s box'
                                                          : "Please tap your card on the phone to verify it's legitimacy",
                                                      onDiscovered: (tag) async {
                                                        _walletProtectState.isNfcSessionStarted = false;
                                                        final ndef = Ndef.from(tag);
                                                        final records = ndef!.cachedMessage!.records;
                                                        dynamic walletAddress;
                                                        if (records.length >= 2) {
                                                          final hasJson = records[1].payload;
                                                          final payloadString = String.fromCharCodes(
                                                            hasJson,
                                                          );
                                                          final Map payloadData = await json.decode(
                                                            payloadString,
                                                          );
                                                          walletAddress = payloadData['a'];
                                                        } else {
                                                          final hasUrl = records[0].payload;
                                                          final payloadString = String.fromCharCodes(
                                                            hasUrl,
                                                          );
                                                          final parts = payloadString.split(
                                                            'air.coinplus.com/btc/',
                                                          );
                                                          walletAddress = parts[1];
                                                        }
                                                        if (card.address == walletAddress) {
                                                          final mifare = MiFare.from(tag);
                                                          final tagId = mifare!.identifier;
                                                          final signature = await mifare.sendMiFareCommand(
                                                            Uint8List.fromList(
                                                              [0x3C, 0x00],
                                                            ),
                                                          );
                                                          var isOriginalTag = false;
                                                          if (signature.length > 2) {
                                                            isOriginalTag = verifyOriginality(
                                                              tagId,
                                                              signature,
                                                            );
                                                          }
                                                          if (isOriginalTag) {
                                                            await NfcManager.instance.stopSession(
                                                              alertMessage: 'Complete',
                                                            );
                                                            await Future.delayed(
                                                              const Duration(
                                                                milliseconds: 2500,
                                                              ),
                                                            );
                                                            await router.push(
                                                              CardSecretFillRoute(
                                                                receivedData: walletAddress.toString(),
                                                              ),
                                                            );
                                                          } else {
                                                            await NfcManager.instance.stopSession();
                                                            await Future.delayed(
                                                              const Duration(
                                                                milliseconds: 2900,
                                                              ),
                                                            );
                                                            await notCoinplusCard();
                                                          }
                                                        } else {
                                                          await NfcManager.instance.stopSession(
                                                            errorMessage:
                                                                'You tapped the wrong card. Please check the wallet address of the card.',
                                                          );
                                                        }
                                                      },
                                                      onError: (_) {
                                                        return Future(() {
                                                          _walletProtectState.isNfcSessionStarted = false;
                                                          showBottomSheet();
                                                        });
                                                      },
                                                    );
                                                  }
                                                : () async {
                                                    _walletProtectState.isNfcSessionStart();
                                                    await router.pop();
                                                    await NfcManager.instance.startSession(
                                                      alertMessage: isBarList
                                                          ? 'It’s easy! Hold your phone near the top of your Bar’s box'
                                                          : "Please tap your card on the phone to verify it's legitimacy",
                                                      onDiscovered: (tag) async {
                                                        _walletProtectState.isNfcSessionStarted = false;
                                                        final ndef = Ndef.from(tag);
                                                        final records = ndef!.cachedMessage!.records;
                                                        dynamic walletAddress;
                                                        if (records.length >= 2) {
                                                          final hasJson = records[1].payload;
                                                          final payloadString = String.fromCharCodes(
                                                            hasJson,
                                                          );
                                                          final Map payloadData = await json.decode(
                                                            payloadString,
                                                          );
                                                          walletAddress = payloadData['a'];
                                                        } else {
                                                          final hasUrl = records[0].payload;
                                                          final payloadString = String.fromCharCodes(
                                                            hasUrl,
                                                          );
                                                          final parts = payloadString.split(
                                                            'air.coinplus.com/btc/',
                                                          );
                                                          walletAddress = parts[1];
                                                        }
                                                        if (card.address == walletAddress) {
                                                          final nfcA = NfcA.from(tag);
                                                          final uid = nfcA!.identifier;
                                                          final signature = await nfcA.transceive(
                                                            data: Uint8List.fromList(
                                                              [0x3C, 0x00],
                                                            ),
                                                          );
                                                          var isOriginalTag = false;
                                                          if (signature.length > 2) {
                                                            isOriginalTag = verifyOriginality(
                                                              uid,
                                                              signature,
                                                            );
                                                          }
                                                          if (isOriginalTag) {
                                                            await router.pop();
                                                            await router.push(
                                                              CardSecretFillRoute(
                                                                receivedData: walletAddress.toString(),
                                                              ),
                                                            );
                                                          } else {
                                                            await notCoinplusCardAlert(
                                                              context,
                                                            );
                                                          }
                                                        } else {
                                                          await router.pop();
                                                          await showModalBottomSheet(
                                                            context: context,
                                                            shape: const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(
                                                                  20,
                                                                ),
                                                                topRight: Radius.circular(
                                                                  20,
                                                                ),
                                                              ),
                                                            ),
                                                            backgroundColor: Colors.white,
                                                            builder: (context) {
                                                              return Padding(
                                                                padding: const EdgeInsets.all(
                                                                  8,
                                                                ),
                                                                child: Column(
                                                                  mainAxisSize: MainAxisSize.min,
                                                                  children: [
                                                                    Assets.icons.notch.image(
                                                                      height: 4,
                                                                    ),
                                                                    const Gap(
                                                                      30,
                                                                    ),
                                                                    Lottie.asset(
                                                                      'assets/animated_logo/warning.json',
                                                                      repeat: false,
                                                                      height: 120,
                                                                    ),
                                                                    const Gap(
                                                                      30,
                                                                    ),
                                                                    const Text(
                                                                      'You tapped the wrong card. Please check the wallet address of the card',
                                                                      textAlign: TextAlign.center,
                                                                      style: TextStyle(
                                                                        fontSize: 14,
                                                                        fontFamily: FontFamily.redHatMedium,
                                                                      ),
                                                                    ),
                                                                    const Gap(
                                                                      60,
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                          await NfcManager.instance.stopSession(
                                                            errorMessage:
                                                                'You tapped the wrong card. Please check the wallet address of the card.',
                                                          );
                                                        }
                                                      },
                                                      onError: (_) {
                                                        return Future(() {
                                                          _walletProtectState.isNfcSessionStarted = false;

                                                          showModalBottomSheet(
                                                            context: context,
                                                            shape: const RoundedRectangleBorder(
                                                              borderRadius: BorderRadius.only(
                                                                topLeft: Radius.circular(
                                                                  20,
                                                                ),
                                                                topRight: Radius.circular(
                                                                  20,
                                                                ),
                                                              ),
                                                            ),
                                                            backgroundColor: Colors.white,
                                                            builder: (context) {
                                                              return const CardIssueOptionsSheet();
                                                            },
                                                          );
                                                        });
                                                      },
                                                    );
                                                    await showModalBottomSheet(
                                                      context: context,
                                                      shape: const RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.only(
                                                          topLeft: Radius.circular(
                                                            20,
                                                          ),
                                                          topRight: Radius.circular(
                                                            20,
                                                          ),
                                                        ),
                                                      ),
                                                      backgroundColor: Colors.transparent,
                                                      builder: (context) {
                                                        return AnimatedOpacity(
                                                          duration: const Duration(
                                                            milliseconds: 300,
                                                          ),
                                                          opacity: 1,
                                                          child: Container(
                                                            height: 400,
                                                            decoration: const BoxDecoration(
                                                              color: Colors.white,
                                                              borderRadius: BorderRadius.vertical(
                                                                top: Radius.circular(
                                                                  20,
                                                                ),
                                                              ),
                                                            ),
                                                            child: Column(
                                                              children: [
                                                                const Gap(10),
                                                                Row(
                                                                  children: [
                                                                    const Gap(
                                                                      16,
                                                                    ),
                                                                    IconButton(
                                                                      onPressed: () async {
                                                                        await router.pop();
                                                                        await showModalBottomSheet(
                                                                          context: context,
                                                                          shape: const RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(
                                                                                20,
                                                                              ),
                                                                              topRight: Radius.circular(
                                                                                20,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          backgroundColor: Colors.white,
                                                                          builder: (context) {
                                                                            return const CardIssueOptionsSheet();
                                                                          },
                                                                        );
                                                                      },
                                                                      icon: const Icon(
                                                                        Icons.close_sharp,
                                                                        size: 25,
                                                                        color: Colors.black,
                                                                      ),
                                                                    ),
                                                                    const Expanded(
                                                                      child: Text(
                                                                        'Start with your wallet',
                                                                        textAlign: TextAlign.center,
                                                                        style: TextStyle(
                                                                          fontFamily: FontFamily.redHatSemiBold,
                                                                          fontSize: 17,
                                                                          color: AppColors.primaryTextColor,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      width: 60,
                                                                    ),
                                                                  ],
                                                                ),
                                                                const Gap(10),
                                                                const Divider(
                                                                  thickness: 2,
                                                                  height: 2,
                                                                  indent: 15,
                                                                  endIndent: 15,
                                                                  color: Color(
                                                                    0xFFF1F1F1,
                                                                  ),
                                                                ),
                                                                const Gap(42),
                                                                SizedBox(
                                                                  height: 120,
                                                                  width: 120,
                                                                  child: Lottie.asset(
                                                                    'assets/animated_logo/nfcanimation.json',
                                                                  ).expandedHorizontally(),
                                                                ),
                                                                const Gap(20),
                                                                const Text(
                                                                  'It’s easy! Hold your phone near the Coinplus Card \nor on top of your Coinplus Bar’s box',
                                                                  textAlign: TextAlign.center,
                                                                  style: TextStyle(
                                                                    fontSize: 14,
                                                                    fontFamily: FontFamily.redHatMedium,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  },
                                            child: const Text(
                                              'Send anyway',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: FontFamily.redHatMedium,
                                                fontWeight: FontWeight.normal,
                                                color: AppColors.primaryTextColor,
                                              ),
                                            ),
                                          ).paddingHorizontal(40),
                                        );
                                        return showDialog<void>(
                                          context: context,
                                          builder: (context) {
                                            return EmergeAlertDialog(
                                              emergeAlertDialogOptions: EmergeAlertDialogOptions(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(22),
                                                ),
                                                content: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    const Text(
                                                      'Recommended to Wait!',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily: FontFamily.redHatBold,
                                                        fontSize: 17,
                                                      ),
                                                    ),
                                                    const Gap(23),
                                                    Center(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Lottie.asset(
                                                            height: 140,
                                                            repeat: false,
                                                            'assets/animated_logo/please_wait.json',
                                                          ),
                                                        ],
                                                      ),
                                                    ).expandedHorizontally(),
                                                    const Gap(31),
                                                    const Text(
                                                      'The in-app send option will be available soon. To maintain the highest level of security, we encourage you to wait for the upcoming app update.',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily: FontFamily.redHatLight,
                                                        fontWeight: FontWeight.w700,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                    const Gap(18),
                                                    Center(child: okButton),
                                                    const Gap(8),
                                                    Center(child: sendButton),
                                                  ],
                                                ),
                                                elevation: 0,
                                              ),
                                            );
                                          },
                                        );
                                      }
                                    },
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            right: 8,
                                          ),
                                          child: Assets.icons.send.image(
                                            height: 24,
                                            width: 24,
                                            color: AppColors.primaryButtonColor,
                                          ),
                                        ),
                                        const Gap(8),
                                        const Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Send',
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontFamily: FontFamily.redHatMedium,
                                                fontWeight: FontWeight.w600,
                                                color: AppColors.primaryTextColor,
                                              ),
                                            ),
                                            Text(
                                              'Transfer crypto to another wallet',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontFamily: FontFamily.redHatMedium,
                                                fontWeight: FontWeight.normal,
                                                color: AppColors.textHintsColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              const Gap(8),
                              LoadingButton(
                                style: context.theme
                                    .buttonStyle(
                                      textStyle: const TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        color: AppColors.primaryTextColor,
                                        fontSize: 15,
                                      ),
                                    )
                                    .copyWith(
                                      padding: const MaterialStatePropertyAll(
                                        EdgeInsets.all(10),
                                      ),
                                      backgroundColor: MaterialStateProperty.all(
                                        AppColors.silver,
                                      ),
                                    ),
                                onPressed: () async {},
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8,
                                      ),
                                      child: Assets.icons.buy.image(
                                        height: 24,
                                        width: 24,
                                        color: AppColors.primaryButtonColor,
                                      ),
                                    ),
                                    const Gap(8),
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Buy with card',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: FontFamily.redHatMedium,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.primaryTextColor,
                                          ),
                                        ),
                                        Text(
                                          'Purchase crypto with cash',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: FontFamily.redHatMedium,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.textHintsColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(8),
                              LoadingButton(
                                style: context.theme
                                    .buttonStyle(
                                      textStyle: const TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        color: AppColors.primaryTextColor,
                                        fontSize: 15,
                                      ),
                                    )
                                    .copyWith(
                                      padding: const MaterialStatePropertyAll(
                                        EdgeInsets.all(10),
                                      ),
                                      backgroundColor: MaterialStateProperty.all(
                                        AppColors.silver,
                                      ),
                                    ),
                                onPressed: () async {
                                  await router.pop();
                                  final url = Uri.parse(
                                    'https://www.blockchain.com/explorer/addresses/btc/${card.address}',
                                  );
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  }
                                },
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 8,
                                      ),
                                      child: Assets.icons.history.image(
                                        height: 24,
                                        width: 24,
                                        color: AppColors.primaryButtonColor,
                                      ),
                                    ),
                                    const Gap(8),
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'History',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: FontFamily.redHatMedium,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.primaryTextColor,
                                          ),
                                        ),
                                        Text(
                                          'Check the list of your transactions',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontFamily: FontFamily.redHatMedium,
                                            fontWeight: FontWeight.normal,
                                            color: AppColors.textHintsColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(30),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Observer(
                    builder: (context) {
                      return FloatingActionButton(
                        shape: const CircleBorder(),
                        elevation: 3,
                        backgroundColor: Colors.deepOrangeAccent.withOpacity(0.9),
                        onPressed: null,
                        child: AnimatedCrossFade(
                          duration: const Duration(milliseconds: 1),
                          crossFadeState:
                              _navBarState.tabCurrentIndex == 0 ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                          firstChild: AnimatedCrossFade(
                            duration: const Duration(milliseconds: 1),
                            crossFadeState:
                                _navBarState.currentIndex == 1 ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                            firstChild: AnimatedCrossFade(
                              duration: const Duration(milliseconds: 1),
                              crossFadeState:
                                  _navBarState.isInAddCard ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                              firstChild: _balanceStore.cards.isEmpty
                                  ? Assets.icons.plus.image(
                                      color: Colors.white,
                                      height: 32,
                                    )
                                  : Assets.icons.sendReceive.image(
                                      color: Colors.white,
                                      height: 32,
                                    ),
                              secondChild: Assets.icons.plus.image(
                                color: Colors.white,
                                height: 32,
                              ),
                            ),
                            secondChild: Assets.icons.plus.image(
                              color: Colors.white,
                              height: 32,
                            ),
                          ),
                          secondChild: AnimatedCrossFade(
                            duration: const Duration(milliseconds: 1),
                            crossFadeState:
                                _navBarState.currentIndex == 1 ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                            firstChild: AnimatedCrossFade(
                              duration: const Duration(milliseconds: 1),
                              crossFadeState:
                                  _navBarState.isInAddBar ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                              firstChild: _balanceStore.bars.isEmpty
                                  ? Assets.icons.plus.image(
                                      color: Colors.white,
                                      height: 32,
                                    )
                                  : Assets.icons.sendReceive.image(
                                      color: Colors.white,
                                      height: 32,
                                    ),
                              secondChild: Assets.icons.plus.image(
                                color: Colors.white,
                                height: 32,
                              ),
                            ),
                            secondChild: Assets.icons.plus.image(
                              color: Colors.white,
                              height: 32,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const Gap(6),
                const Text(
                  'Transactions',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    color: Colors.black,
                    fontSize: 11,
                  ),
                ),
                const Gap(6),
              ],
            ),
    );
  }
}
