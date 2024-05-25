import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

import '../../../extensions/context_extension.dart';
import '../../../extensions/elevated_button_extensions.dart';
import '../../../extensions/widget_extension.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/nfc_state/nfc_state.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../../utils/card_nfc_session.dart';
import '../loading_button/loading_button.dart';

class CardScanMethodsPage extends HookWidget {
  const CardScanMethodsPage({
    super.key,
    this.isAvailable,
  });

  final NfcStore? isAvailable;

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  @override
  Widget build(BuildContext context) {
    final isMifareUltralight = useRef<bool?>(false);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (isAvailable!.isNfcSupported)
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
                  backgroundColor:
                      WidgetStateProperty.all(Colors.grey.withOpacity(0.1)),
                ),
            onPressed: Platform.isIOS
                ? () async {
                    unawaited(
                      recordAmplitudeEventPartTwo(
                        const TapToConnectClicked(tab: 'Card'),
                      ),
                    );
                    await _walletProtectState.updateNfcSessionStatus(
                      isStarted: true,
                    );
                    await router.maybePop();
                    await nfcSessionIos(
                      isMifareUltralight: isMifareUltralight.value,
                      walletProtectState: _walletProtectState,
                      isBarList: false,
                    );
                  }
                : () async {
                    unawaited(
                      recordAmplitudeEventPartTwo(
                        const TapToConnectClicked(tab: 'Card'),
                      ),
                    );
                    await _walletProtectState.updateNfcSessionStatus(
                      isStarted: true,
                    );
                    await nfcSessionAndroid(
                      isMifareUltralight: isMifareUltralight.value,
                      walletProtectState: _walletProtectState,
                    );
                    await router.maybePop();
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
                                  'It’s easy! Hold your phone near the Coinplus Card',
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
                                          fontFamily: FontFamily.redHatMedium,
                                          color: AppColors.primaryTextColor,
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
              children: [
                Assets.icons.nfcIcon.image(
                  height: 24,
                  width: 24,
                  color: AppColors.primaryButtonColor,
                ),
                const Gap(8),
                const Text(
                  'Tap to connect',
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: FontFamily.redHatMedium,
                    fontWeight: FontWeight.normal,
                    color: AppColors.primaryTextColor,
                  ),
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
                backgroundColor:
                    WidgetStateProperty.all(Colors.grey.withOpacity(0.1)),
              ),
          onPressed: () async {
            unawaited(
              recordAmplitudeEvent(
                const ConnectWitchQrClicked(source: 'Card'),
              ),
            );
            await router.maybePop(context);
            final res = await context.pushRoute<String?>(
              const QrScannerRoute(),
            );
            if (res != null) {
              unawaited(
                recordAmplitudeEvent(
                  QrScanned(source: 'Wallet', walletAddress: res),
                ),
              );
              await router.push(
                CardFillRoute(receivedData: res),
              );
            }
          },
          child: Row(
            children: [
              Assets.icons.qrCode.image(
                height: 24,
                width: 24,
                color: AppColors.primaryButtonColor,
              ),
              const Gap(8),
              const Text(
                'Connect with QR',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryTextColor,
                ),
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
                backgroundColor:
                    WidgetStateProperty.all(Colors.grey.withOpacity(0.1)),
              ),
          onPressed: () {
            router
              ..maybePop()
              ..push(CardFillRoute());
            unawaited(
              recordAmplitudeEvent(
                const ConnectManuallyClicked(source: 'Wallet'),
              ),
            );
          },
          child: Row(
            children: [
              Assets.icons.stylus.image(
                height: 24,
                width: 24,
                color: AppColors.primaryButtonColor,
              ),
              const Gap(8),
              const Text(
                'Connect manually',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryTextColor,
                ),
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
                backgroundColor:
                    WidgetStateProperty.all(Colors.grey.withOpacity(0.1)),
              ),
          onPressed: () async {
            unawaited(
              recordAmplitudeEvent(
                const BuyNewCardClicked(source: 'Wallet'),
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
                modalPresentationStyle: UIModalPresentationStyle.formSheet,
                dismissButtonStyle: SafariViewControllerDismissButtonStyle.done,
                modalPresentationCapturesStatusBarAppearance: true,
              ),
            );
          },
          child: Row(
            children: [
              Assets.icons.shop.image(
                height: 24,
                width: 24,
                color: AppColors.primaryButtonColor,
              ),
              const Gap(8),
              const Text(
                'Buy new card',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.normal,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
