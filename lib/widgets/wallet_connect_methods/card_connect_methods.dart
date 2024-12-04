import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../extensions/context_extension.dart';
import '../../../extensions/elevated_button_extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event_part_one/amplitude_event.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../../utils/card_nfc_session.dart';
import '../../modals/android_nfc_session_modal/android_nfc_session_modal.dart';
import '../../modals/card_blocked_modal/card_blocked_modal.dart';
import '../../services/cloud_firestore_service.dart';
import '../../store/all_settings_state/all_settings_state.dart';
import '../loading_button/loading_button.dart';

class CardScanMethodsPage extends HookWidget {
  const CardScanMethodsPage({
    super.key,
    this.isAvailable,
  });

  final AllSettingsState? isAvailable;

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
                  backgroundColor: WidgetStateProperty.all(Colors.grey.withOpacity(0.1)),
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
                        return const AndroidNfcSessionModal();
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
                backgroundColor: WidgetStateProperty.all(Colors.grey.withOpacity(0.1)),
              ),
          onPressed: () async {
            unawaited(
              recordAmplitudeEvent(
                const ConnectWitchQrClicked(source: 'Card'),
              ),
            );
            await router.maybePop(context);
            final res = await context.pushRoute<String?>(
              QrScannerRoute(),
            );
            if (res != null) {
              unawaited(
                recordAmplitudeEvent(
                  QrScanned(source: 'Wallet', walletAddress: res),
                ),
              );
              _walletProtectState.onAddressChanges(res);

              final cardData = await getCardData(res);

              if (_walletProtectState.isValidWalletAddress) {
                if (cardData != null) {
                  if (cardData.lost != true) {
                    await router.push(
                      CardConnectRoute(receivedData: res, cardColor: cardData.color),
                    );
                  } else {
                    await showModalBottomSheet(
                      isScrollControlled: true,
                      context: router.navigatorKey.currentContext!,
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
                      builder: (context) {
                        return const CardBlockedModal();
                      },
                    );
                  }
                } else {
                  await router.push(
                    CardConnectRoute(receivedData: res, cardColor: cardData?.color ?? '0'),
                  );
                }
              }
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
                backgroundColor: WidgetStateProperty.all(Colors.grey.withOpacity(0.1)),
              ),
          onPressed: () {
            router
              ..maybePop()
              ..push(CardConnectRoute());
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
                backgroundColor: WidgetStateProperty.all(Colors.grey.withOpacity(0.1)),
              ),
          onPressed: () async {
            await router.maybePop();
            unawaited(
              recordAmplitudeEvent(
                const BuyNewCardClicked(source: 'Wallet'),
              ),
            );
            await router.push(BuyCardRoute(method: getBuyCardPlusButtonLink()));
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
