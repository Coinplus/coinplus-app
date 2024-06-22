import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
import 'package:nxp_originality_verifier/nxp_originality_verifier.dart';

import '../../constants/button_settings.dart';
import '../../extensions/context_extension.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../services/amplitude_service.dart';
import '../../services/cloud_firestore_service.dart';
import '../../services/firebase_service.dart';
import '../../store/nfc_state/nfc_state.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/deep_link_util.dart';
import '../../widgets/all_alert_dialogs/not_coinplus_card_alert/not_coinplus_card_alert.dart';
import '../../widgets/connect_manually_button/connect_manually_button.dart';
import '../../widgets/loading_button/loading_button.dart';

@RoutePage()
class OnboardingPage extends HookWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  @override
  Widget build(BuildContext context) {
    final _nfcState = useMemoized(NfcStore.new);
    final deepLinkRes = useRef<String?>(null);
    final resumed = useState(false);
    final isMifareUltralight = useRef<bool?>(false);

    useOnAppLifecycleStateChange(
      (previous, current) =>
          resumed.value = [AppLifecycleState.resumed].contains(current),
    );

    useEffect(
      () {
        _nfcState.checkNfcSupport();
        final streamSubscription = FlutterBranchSdk.initSession().listen(
          (data) async {
            deepLinkRes.value = onLinkPassed(data);
            if (deepLinkRes.value != null &&
                router.current.name != CardFillWithNfc.name &&
                router.current.name != CardFillRoute.name &&
                router.current.name != BarFillRoute.name &&
                router.current.name != BarFillWithNfc.name) {
              await router.push(CardFillRoute(receivedData: deepLinkRes.value));
              await recordAmplitudeEvent(
                DeeplinkClicked(
                  source: 'Onboarding',
                  walletAddress: deepLinkRes.value!,
                  walletType: 'Card',
                ),
              );
              deepLinkRes.value = null;
            }
          },
        );

        return streamSubscription.cancel;
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.transparent,
        ),
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Observer(
        builder: (context) {
          return Column(
            children: [
              const Spacer(flex: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(16),
                  SizedBox(
                    height: 56,
                    child: Assets.images.coinpluslogo.image(),
                  ),
                ],
              ),
              const Spacer(flex: 2),
              const Text(
                'Hey there,\nlet’s connect your new wallet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: FontFamily.redHatSemiBold,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const Spacer(flex: 3),
              if (_nfcState.isNfcSupported)
                LoadingButton(
                  onPressed: Platform.isIOS
                      ? () async {
                          await recordAmplitudeEvent(
                            const ConnectWalletClicked(),
                          );
                          await router.maybePop();
                          await NfcManager.instance.startSession(
                            alertMessage:
                                'It’s easy! Hold your phone near the Coinplus Card or on top of your Coinplus Bar’s box',
                            onDiscovered: (tag) async {
                              final ndef = Ndef.from(tag);
                              final records = ndef!.cachedMessage!.records;
                              dynamic walletAddress;
                              dynamic cardColor;
                              dynamic formFactor;
                              dynamic isOriginalTag = false;
                              if (records.length >= 2) {
                                final hasJson = records[1].payload;
                                final payloadString =
                                    String.fromCharCodes(hasJson);
                                final Map payloadData =
                                    await json.decode(payloadString);
                                walletAddress = payloadData['a'];
                                cardColor = payloadData['c'];
                                formFactor = payloadData['t'];
                              } else {
                                final hasUrl = records[0].payload;
                                final payloadString =
                                    String.fromCharCodes(hasUrl);
                                final parts = payloadString
                                    .split('air.coinplus.com/btc/');
                                walletAddress = parts[1];
                              }
                              await signInAnonymously();
                              await recordAmplitudeEvent(
                                NfcTapped(
                                  source: 'Onboarding',
                                  walletAddress: walletAddress,
                                ),
                              );
                              final card = await getCardData(walletAddress);
                              final mifare = MiFare.from(tag);
                              final tagId = mifare!.identifier;
                              final formattedTagId = tagId
                                  .map(
                                    (e) => e.toRadixString(16).padLeft(2, '0'),
                                  )
                                  .join(':')
                                  .toUpperCase();
                              Uint8List? signature;
                              try {
                                final response = await mifare.sendMiFareCommand(
                                  Uint8List.fromList(
                                    [0x3C, 0x00],
                                  ),
                                );
                                signature = Uint8List.fromList(response);
                              } catch (e) {
                                signature = null;
                              }
                              if (signature != null && signature.length > 2) {
                                isOriginalTag = OriginalityVerifier().verify(
                                  tagId,
                                  signature,
                                );
                              }
                              if (isOriginalTag && card != null) {
                                await NfcManager.instance.stopSession();
                                if (card.nfcId == formattedTagId) {
                                  await Future.delayed(
                                    const Duration(milliseconds: 2700),
                                  );
                                  if (formFactor == 'c') {
                                    await router.push(
                                      CardFillWithNfc(
                                        isOriginalCard: isOriginalTag,
                                        receivedData: walletAddress,
                                        cardColor: cardColor,
                                        isActivated: card.activated,
                                      ),
                                    );
                                  } else if (formFactor == 'b') {
                                    await router.push(
                                      BarFillWithNfc(
                                        isOriginalTag: isOriginalTag,
                                        receivedData: walletAddress,
                                        barColor: cardColor,
                                        isActivated: card.activated,
                                      ),
                                    );
                                  }
                                } else {
                                  await NfcManager.instance.stopSession();
                                  await Future.delayed(
                                    const Duration(milliseconds: 2700),
                                  );
                                  await notCoinplusCardAlert(
                                    context:
                                        router.navigatorKey.currentContext!,
                                    walletAddress: walletAddress,
                                    walletType: 'Card',
                                    source: 'Onboarding',
                                  );
                                }
                              } else {
                                await NfcManager.instance.stopSession();
                                await Future.delayed(
                                  const Duration(milliseconds: 2700),
                                );
                                if (tag.data.containsKey('mifare')) {
                                  isMifareUltralight.value = true;
                                  if (card != null &&
                                      card.possibleOldCard == true) {
                                    if (card.nfcId == formattedTagId) {
                                      //Connect as Coinplus Bitcoin Wallet
                                      await router.push(
                                        CardFillWithNfc(
                                          isOldCard: card.possibleOldCard,
                                          isMiFareUltralight:
                                              isMifareUltralight.value,
                                          isOriginalCard: false,
                                          receivedData: walletAddress,
                                          isActivated: card.activated,
                                        ),
                                      );
                                    } else {
                                      //Fake card
                                      await NfcManager.instance.stopSession();
                                      await Future.delayed(
                                        const Duration(milliseconds: 2700),
                                      );
                                      await notCoinplusCardAlert(
                                        context:
                                            router.navigatorKey.currentContext!,
                                        walletAddress: walletAddress,
                                        walletType: 'Card',
                                        source: 'Onboarding',
                                      );
                                    }
                                  } else {
                                    //Connect as TrackerPlus
                                    await router.push(
                                      CardFillWithNfc(
                                        isOldCard: card?.possibleOldCard,
                                        isMiFareUltralight:
                                            isMifareUltralight.value,
                                        isOriginalCard: false,
                                        receivedData: walletAddress,
                                        isActivated: card?.activated,
                                      ),
                                    );
                                  }
                                } else {
                                  //Connect as Tracker
                                  await router.push(
                                    CardFillWithNfc(
                                      isOriginalCard: false,
                                      isMiFareUltralight: false,
                                      receivedData: walletAddress,
                                    ),
                                  );
                                }
                              }
                              await _walletProtectState.updateNfcSessionStatus(
                                isStarted: false,
                              );
                            },
                            onError: (_) => Future(() async {
                              await recordAmplitudeEvent(
                                const NfcClosed(source: 'Onboarding'),
                              );
                              await _walletProtectState.updateNfcSessionStatus(
                                isStarted: false,
                              );
                            }),
                          );
                        }
                      : () async {
                          await recordAmplitudeEvent(
                            const ConnectWalletClicked(),
                          );
                          await router.maybePop();
                          await NfcManager.instance.startSession(
                            onDiscovered: (tag) async {
                              final ndef = Ndef.from(tag);
                              final records = ndef!.cachedMessage!.records;
                              dynamic walletAddress;
                              dynamic cardColor;
                              dynamic formFactor;

                              if (records.length >= 2) {
                                final hasJson = records[1].payload;
                                final payloadString =
                                    String.fromCharCodes(hasJson);
                                final Map payloadData =
                                    await json.decode(payloadString);
                                walletAddress = payloadData['a'];
                                cardColor = payloadData['c'];
                                formFactor = payloadData['t'];
                              } else {
                                final hasUrl = records[0].payload;
                                final payloadString =
                                    String.fromCharCodes(hasUrl);
                                final parts = payloadString
                                    .split('air.coinplus.com/btc/');
                                walletAddress = parts[1];
                              }
                              await recordAmplitudeEvent(
                                NfcTapped(
                                  source: 'Onboarding',
                                  walletAddress: walletAddress,
                                ),
                              );
                              final nfcA = NfcA.from(tag);
                              final uid = nfcA!.identifier;

                              Uint8List? signature;
                              var isOriginalTag = false;

                              try {
                                final response = await nfcA.transceive(
                                  data: Uint8List.fromList([0x3C, 0x00]),
                                );
                                signature = Uint8List.fromList(response);
                                if (signature.length > 2) {
                                  isOriginalTag = OriginalityVerifier().verify(
                                    uid,
                                    signature,
                                  );
                                }
                              } catch (e) {
                                signature = null;
                              }
                              await router.maybePop();
                              final card = await getCardData(walletAddress);
                              final formattedTagId = uid
                                  .map(
                                    (e) => e.toRadixString(16).padLeft(2, '0'),
                                  )
                                  .join(':')
                                  .toUpperCase();
                              if (isOriginalTag && card != null) {
                                await NfcManager.instance.stopSession();
                                if (card.nfcId == formattedTagId) {
                                  await Future.delayed(
                                    const Duration(milliseconds: 2700),
                                  );
                                  if (formFactor == 'c') {
                                    await router.push(
                                      CardFillWithNfc(
                                        isOriginalCard: isOriginalTag,
                                        receivedData: walletAddress,
                                        cardColor: cardColor,
                                      ),
                                    );
                                  } else if (formFactor == 'b') {
                                    await router.push(
                                      BarFillWithNfc(
                                        isOriginalTag: isOriginalTag,
                                        receivedData: walletAddress,
                                        barColor: cardColor,
                                        isActivated: card.activated,
                                      ),
                                    );
                                  }
                                } else {
                                  await notCoinplusCardAlert(
                                    context:
                                        router.navigatorKey.currentContext!,
                                    walletAddress: walletAddress,
                                    walletType: 'Card',
                                    source: 'Onboarding',
                                  );
                                }
                              } else {
                                if (tag.data.containsKey('mifareultralight')) {
                                  isMifareUltralight.value = true;
                                  if (card != null &&
                                      card.possibleOldCard == true) {
                                    if (card.nfcId == formattedTagId) {
                                      await router.push(
                                        CardFillWithNfc(
                                          isOldCard: card.possibleOldCard,
                                          isMiFareUltralight:
                                              isMifareUltralight.value,
                                          isOriginalCard: false,
                                          receivedData: walletAddress,
                                        ),
                                      );
                                    } else {
                                      await notCoinplusCardAlert(
                                        context:
                                            router.navigatorKey.currentContext!,
                                        walletAddress: walletAddress,
                                        walletType: 'Card',
                                        source: 'Onboarding',
                                      );
                                    }
                                  } else {
                                    await router.push(
                                      CardFillWithNfc(
                                        isOldCard: card?.possibleOldCard,
                                        isMiFareUltralight:
                                            isMifareUltralight.value,
                                        isOriginalCard: false,
                                        receivedData: walletAddress,
                                      ),
                                    );
                                  }
                                } else {
                                  await router.push(
                                    CardFillWithNfc(
                                      isOriginalCard: false,
                                      isMiFareUltralight: false,
                                      receivedData: walletAddress,
                                    ),
                                  );
                                }
                              }
                              await _walletProtectState.updateNfcSessionStatus(
                                isStarted: false,
                              );
                            },
                            onError: (_) => Future(() async {
                              await recordAmplitudeEvent(
                                const NfcClosed(source: 'Onboarding'),
                              );
                              await _walletProtectState.updateNfcSessionStatus(
                                isStarted: false,
                              );
                            }),
                          );

                          await showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
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
                                        40,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      const Gap(10),
                                      Assets.icons.notch.image(
                                        height: 4,
                                      ),
                                      const Gap(15),
                                      const Text(
                                        'Ready to Scan',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: FontFamily.redHatSemiBold,
                                          fontSize: 22,
                                          color: AppColors.primaryTextColor,
                                        ),
                                      ),
                                      const Gap(40),
                                      SizedBox(
                                        height: 150,
                                        width: 150,
                                        child: Lottie.asset(
                                          'assets/lottie_animations/nfcanimation.json',
                                        ).expandedHorizontally(),
                                      ),
                                      const Gap(25),
                                      const Text(
                                        'It’s easy! Hold your phone near the Coinplus Card \nor on top of your Coinplus Bar’s box',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: FontFamily.redHatMedium,
                                        ),
                                      ).paddingHorizontal(50),
                                      const Gap(20),
                                      LoadingButton(
                                        onPressed: () async {
                                          await router.maybePop();
                                        },
                                        style: context.theme
                                            .buttonStyle(
                                              textStyle: const TextStyle(
                                                fontFamily:
                                                    FontFamily.redHatMedium,
                                                color:
                                                    AppColors.primaryTextColor,
                                                fontSize: 15,
                                              ),
                                            )
                                            .copyWith(
                                              backgroundColor:
                                                  WidgetStateProperty.all(
                                                Colors.grey.withOpacity(0.3),
                                              ),
                                            ),
                                        child: const Text('Cancel'),
                                      ).paddingHorizontal(60),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Gap(5),
                      const Text(
                        'Connect wallet',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: FontFamily.redHatSemiBold,
                        ),
                      ),
                      const Gap(5),
                      Assets.icons.nfcIcon.image(
                        height: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ).paddingHorizontal(63)
              else
                const SizedBox(),
              const Gap(10),
              const ConnectManuallyButton(),
              const Spacer(flex: 3),
              LoadingButton(
                onPressed: () async {
                  unawaited(
                    recordAmplitudeEvent(
                      const BuyNewCardClicked(source: 'Onboarding'),
                    ),
                  );
                  await FlutterWebBrowser.openWebPage(
                    url: 'https://coinplus.com/shop/',
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
                      modalPresentationCapturesStatusBarAppearance: true,
                    ),
                  );
                },
                style: context.theme
                    .buttonStyle(
                      buttonType: ButtonTypes.TRANSPARENT,
                      textStyle: const TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        color: AppColors.primaryTextColor,
                        fontSize: 15,
                      ),
                    )
                    .copyWith(
                      overlayColor: WidgetStateProperty.all(
                        Colors.grey.withOpacity(0.1),
                      ),
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Buy new card'),
                    const Gap(16),
                    Assets.icons.shop.image(
                      height: 24,
                    ),
                  ],
                ),
              ).paddingHorizontal(64),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
