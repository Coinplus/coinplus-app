import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../extensions/context_extension.dart';
import '../../../extensions/elevated_button_extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../widgets/loading_button.dart';

class CardAndBarScanMethodsPage extends StatefulWidget {
  const CardAndBarScanMethodsPage({super.key});



  @override
  State<CardAndBarScanMethodsPage> createState() => _CardAndBarScanMethodsPageState();
}

class _CardAndBarScanMethodsPageState extends State<CardAndBarScanMethodsPage> with TickerProviderStateMixin{





  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
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
                  backgroundColor: MaterialStateProperty.all(AppColors.silver),
                ),
            onPressed: () async {
              await router.pop(context);
              final res = await context.pushRoute<String?>(
                const QrScannerRoute(),
              );
              if (res != null) {
                await router.push(
                  CardFillRoute(receivedData: res),
                );
              }
            },
            child: Row(
              children: [
                Assets.images.qrCode.image(
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
          const Gap(10),
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
                  backgroundColor: MaterialStateProperty.all(AppColors.silver),
                ),
            onPressed: () {
            },
            child: Row(
              children: [
                Assets.images.stylus.image(
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
        ],
      ),
    );
  }
}
