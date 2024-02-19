import 'dart:async';

import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/button_settings.dart';
import '../../../extensions/context_extension.dart';
import '../../../extensions/elevated_button_extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/store.dart';
import '../../../utils/secure_storage_utils.dart';
import '../../../utils/storage_utils.dart';
import '../../../widgets/loading_button/loading_button.dart';

class RemoveUserData extends StatelessWidget {
  const RemoveUserData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(10),
          Assets.icons.notch.image(height: 4),
          const Gap(16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  'Are you sure?',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                    color: AppColors.primaryTextColor,
                  ),
                ),
              ],
            ),
          ),
          const Gap(30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              'Deleting your data will permanently erase all app data, including activated wallet private keys. Once the data is deleted, the app will be closed.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontFamily: FontFamily.redHatMedium,
                color: AppColors.primary,
              ),
            ),
          ),
          const Gap(25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ActionSlider.standard(
              direction: TextDirection.rtl,
              height: 60,
              loadingIcon: Lottie.asset(
                'assets/lottie_animations/loading_animation.json',
                repeat: true,
                height: 30,
              ),
              successIcon: const Icon(
                Icons.check_rounded,
                color: Colors.white,
              ),
              action: (controller) async {
                controller.loading();
                await Future.delayed(const Duration(seconds: 1));
                controller.success();
                unawaited(recordAmplitudeEventPartTwo(const EraseMyDataConfirmed()));
                await StorageUtils.clear();
                await secureStorage.deleteAll();
                reRegisterStoreGetIt();
                await router.pushAndPopAll(const OnboardingRoute());
                await router.pop();
              },
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 1,
                  spreadRadius: 1,
                ),
              ],
              toggleColor: Colors.red,
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ),
              child: const Text(
                'Slide to delete',
                style: TextStyle(fontFamily: FontFamily.redHatMedium),
              ),
            ),
          ),
          const Gap(15),
          LoadingButton(
            onPressed: () async {
              await router.pop();
            },
            style: context.theme
                .buttonStyle(
                  buttonType: ButtonTypes.TRANSPARENT,
                  textStyle: const TextStyle(
                    fontFamily: FontFamily.redHatSemiBold,
                    color: AppColors.primaryTextColor,
                    fontSize: 17,
                  ),
                )
                .copyWith(
                  padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                ),
            child: const Text(
              'Not now',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
          ),
          const Gap(30),
        ],
      ),
    );
  }
}
