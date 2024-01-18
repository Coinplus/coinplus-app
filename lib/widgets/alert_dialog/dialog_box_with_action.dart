import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../loading_button.dart';

class DialogBoxWithAction extends HookWidget {
  /// Dialog box with single ok button.
  const DialogBoxWithAction({
    required this.text,
    required this.title,
    required this.primaryActionText,
    required this.primaryAction,
    this.style,
    this.secondaryActionText,
    this.secondaryAction,
    this.lottieAsset,
    this.titlePadding = const EdgeInsets.only(top: 32, left: 32, right: 32),
    this.lottieHeight = 120,
    this.widget,
    super.key,
  });

  final Widget title;
  final String text;
  final TextStyle? style;
  final String primaryActionText;
  final String? secondaryActionText;
  final VoidCallback primaryAction;
  final VoidCallback? secondaryAction;
  final EdgeInsets? titlePadding;
  final double lottieHeight;
  final String? lottieAsset;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.only(bottom: 16, right: 24, left: 24),
      alignment: Alignment.center,
      titlePadding: titlePadding,
      contentPadding: const EdgeInsets.only(bottom: 24, right: 24, left: 24, top: 16),
      title: title,
      backgroundColor: Colors.white,
      elevation: 0,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (lottieAsset != null)
            Lottie.asset(
              lottieAsset!,
              height: lottieHeight,
              repeat: false,
            ),
          const Gap(20),
          widget ?? const SizedBox(),
          Text(
            text,
            textAlign: TextAlign.center,
            maxLines: 4,
            style: const TextStyle(
              fontFamily: FontFamily.redHatLight,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
        ],
      ),
      actions: [
        LoadingButton(
          onPressed: primaryAction,
          child: Text(
            primaryActionText,
            style: const TextStyle(
              fontFamily: FontFamily.redHatMedium,
              fontSize: 15,
              fontWeight: FontWeight.w600,
            ),
          ),
        ).paddingHorizontal(),
        const SizedBox(
          height: 10,
        ),
        if (secondaryActionText != null)
          LoadingButton(
            onPressed: secondaryAction,
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
                    Colors.grey.withOpacity(0.2),
                  ),
                ),
            child: Text(
              secondaryActionText!,
              style: const TextStyle(
                fontFamily: FontFamily.redHatMedium,
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ).paddingHorizontal(),
      ],
    );
  }
}
