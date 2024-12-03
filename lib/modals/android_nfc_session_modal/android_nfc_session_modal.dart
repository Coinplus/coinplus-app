import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../widgets/loading_button/loading_button.dart';

class AndroidNfcSessionModal extends StatelessWidget {
  const AndroidNfcSessionModal({super.key});

  @override
  Widget build(BuildContext context) {
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
                    backgroundColor: WidgetStateProperty.all(
                      Colors.grey.withOpacity(0.3),
                    ),
                  ),
              child: const Text('Cancel'),
            ).paddingHorizontal(60),
          ],
        ),
      ),
    );
  }
}
