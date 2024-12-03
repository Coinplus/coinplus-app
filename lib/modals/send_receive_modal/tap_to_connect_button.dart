import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../providers/screen_service.dart';
import '../../services/amplitude_service.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/card_nfc_session.dart';
import '../../widgets/loading_button/loading_button.dart';
import '../android_nfc_session_modal/android_nfc_session_modal.dart';

class TapToConnectButton extends StatelessWidget {
  const TapToConnectButton({super.key});

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  @override
  Widget build(BuildContext context) {
    const isMifareUltralight = false;
    return LoadingButton(
      style: router.navigatorKey.currentContext!.theme
          .buttonStyle(
            textStyle: const TextStyle(
              fontFamily: FontFamily.redHatMedium,
              color: AppColors.primaryTextColor,
              fontSize: 15,
            ),
          )
          .copyWith(
            padding: const WidgetStatePropertyAll(
              EdgeInsets.all(10),
            ),
            backgroundColor: WidgetStateProperty.all(
              Colors.grey.withOpacity(0.1),
            ),
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
                isMifareUltralight: isMifareUltralight,
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
                isMifareUltralight: isMifareUltralight,
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
          Padding(
            padding: const EdgeInsets.only(
              right: 8,
            ),
            child: Assets.icons.nfcIcon.image(
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
                'Tap to connect',
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTextColor,
                ),
              ),
              Text(
                'Connect your wallet',
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
  }
}
