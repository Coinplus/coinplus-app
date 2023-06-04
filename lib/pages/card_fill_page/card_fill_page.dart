import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';

import '../../custom_widgets/loading_button.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../router.dart';

@RoutePage()
class CardFillPage extends HookWidget {
    const CardFillPage({
    Key? key,
    required this.receivedData,
  }) : super(key: key);
   final String receivedData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.scaffoldBackgroundColor,
        elevation: 0,
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Wrap(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(10),
              const Text(
                'Your card wallet',
                style: TextStyle(
                  fontSize: 32,
                  fontFamily: 'RedHatBold',
                ),
              ).paddingHorizontal(),
              Stack(
                children: [
                  Assets.images.formcard.image(),

                  Positioned(
                    top: 145,
                    left: 38,
                    right: 37,
                    child: Container(
                      height: 36,
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                      ),
                      child: TextFormField(
                        onTapOutside: (_) {
                          FocusScope.of(context).unfocus();
                        },
                        style: const TextStyle(
                          fontFamily: 'LexendThin',
                          fontSize: 13,
                        ),
                        initialValue: receivedData,
                        decoration: const InputDecoration(
                          hintText: 'Address',
                          hintStyle: TextStyle(fontFamily: 'RedHatMedium', fontSize: 14, color: AppColors.textHintsColor),
                          filled: true,
                          fillColor: Colors.transparent,
                          contentPadding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                        ),
                      ),
                    ),
                  ),
                   Visibility(
                    visible: receivedData.isNotEmpty,
                    child: const Positioned(
                      top: 144,
                      left: 48,
                      child: Text(
                        'Address',
                        style: TextStyle(
                          fontFamily: 'RedHatMedium',
                          fontSize: 10,
                          color: AppColors.primaryButtonColor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(20, 14, 40, 14),
                //height: 130,
                width: 343,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.containerBorderColor),
                ),
                child: const Center(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'Coinplus Virtual Card',
                            style: TextStyle(
                              fontFamily: 'RedHatMedium',
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: AppColors.textHintsColor,
                            ),
                          ),
                        ],
                      ),
                      Gap(4),
                      Text(
                        'This is the virtual copy of your physical Coinplus Card with its address and the balance shown above. You can save it in the app for further easy access and tracking.',
                        style: TextStyle(
                          fontFamily: 'RedHatMedium',
                          fontSize: 14,
                          color: AppColors.textHintsColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ).paddingHorizontal(),
              const Gap(18),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 2,
                      height: 120,
                      color: AppColors.importantDividerColor,
                    ),
                    const SizedBox(width: 16),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'IMPORTANT',
                            style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'RedHatMedium',
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF4F6486),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Only the physical card contains the keys that control your crypto assets. DO NOT LOSE THE PHYSICAL COINPLUS CARD. The virtual card provides only the convenience of tracking those assets.',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'RedHatMedium',
                              fontWeight: FontWeight.w500,
                              color: AppColors.textHintsColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(20),
              LoadingButton(
                onPressed: () {
                  context.pushRoute(
                    SecretFieldsRoute(qrData: ''),
                  );
                },
                child: const Text(
                  'Redeem',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'RedHatSemiBold',
                  ),
                ),
              ).paddingHorizontal(100),
              const Gap(20),
              ScaleTap(
                onPressed: () => context.popRoute(
                  const OnboardingRoute(),
                ),
                child: const Center(
                  child: Text(
                    'Back',
                    style: TextStyle(
                      fontFamily: 'RedHatSemiBold',
                      color: AppColors.primaryTextColor,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
