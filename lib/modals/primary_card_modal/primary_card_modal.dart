import 'dart:developer';

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

class PrimaryCardModal extends StatelessWidget {
  const PrimaryCardModal({super.key, required this.walletAddress, required this.pageController});

  final String walletAddress;
  final PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(12),
        Assets.icons.notch.image(height: 4),
        const Gap(10),
        const Text(
          'Primary card',
          style: TextStyle(
            fontFamily: FontFamily.redHatMedium,
            fontSize: 17,
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        Lottie.asset('assets/lottie_animations/card_twist_black.json', repeat: false),
        const Text(
          'This is a primary card, please connect the backup wallet',
          style: TextStyle(fontFamily: FontFamily.redHatMedium, fontSize: 14, color: AppColors.primary),
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
            onPressed: () async {
              await router.maybePop();
              try {
                await connectBackupWalletIos(
                  mainWalletAddress: walletAddress,
                  pageController: pageController,
                );
              } catch (e) {
                log(e.toString());
              }
            },
            child: const Text(
              'Connect backup',
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
