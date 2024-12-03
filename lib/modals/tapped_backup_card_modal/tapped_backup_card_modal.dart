import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../extensions/context_extension.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../utils/card_nfc_session.dart';
import '../../widgets/loading_button/loading_button.dart';
import '../android_nfc_session_modal/android_nfc_session_modal.dart';

class BackupCardTapped extends StatelessWidget {
  const BackupCardTapped({super.key, this.isFromManualPage = false});

  final bool isFromManualPage;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(12),
        Assets.icons.notch.image(height: 4),
        const Gap(20),
        const Text(
          'Backup card',
          style: TextStyle(
            fontFamily: FontFamily.redHatMedium,
            fontSize: 17,
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        Lottie.asset('assets/lottie_animations/card_twist_black.json', repeat: false),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 31),
          child: Text(
            'This is a backup card, please connect the primary wallet first',
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: FontFamily.redHatMedium, fontSize: 14, color: AppColors.primary),
          ),
        ),
        const Gap(24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: LoadingButton(
            style: context.theme
                .buttonStyle(
                  textStyle: const TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    color: AppColors.primaryTextColor,
                    fontSize: 15,
                  ),
                )
                .copyWith(),
            onPressed: isFromManualPage
                ? router.maybePop
                : () async {
                    await router.maybePop();
                    try {
                      if(Platform.isIOS) {
                        await nfcSessionIos();
                      } else {
                        await nfcSessionAndroid();
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
                      }

                    } catch (e) {
                      log(e.toString());
                    }
                  },
            child: const Text(
              'Connect primary',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const Gap(40),
      ],
    );
  }
}
