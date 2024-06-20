import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';

class PendingTransactionWidget extends StatelessWidget {
  const PendingTransactionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleTap(
      scaleMinValue: 0.99,
      enableFeedback: false,
      onPressed: () {
        showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.white,
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
          context: context,
          builder: (_) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 20,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Assets.icons.notch.image(
                    height: 4,
                  ),
                  const Gap(
                    28,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: const Text(
                      'Sent',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ).expandedHorizontally(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: const Text(
                      'May 14, 2024 12:36 AM',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        color: Color(0xFF838995),
                        fontSize: 12,
                      ),
                    ).expandedHorizontally(),
                  ),
                  const Gap(
                    17,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 5,
                          blurRadius: 10,
                          color: Colors.grey.withOpacity(0.1),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 32,
                            width: 32,
                            child: Assets.icons.bTCIcon.image(),
                          ),
                          const Gap(10),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '-0.00008522 BTC',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    r'$5.254',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: FontFamily.redHatMedium,
                                      fontSize: 16,
                                      color: Color(0xFF838995),
                                    ),
                                  ),
                                  Text(
                                    r' (1 BTC = $60,123.05)',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: FontFamily.redHatMedium,
                                      fontSize: 16,
                                      color: Color(0xFF838995),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Gap(
                    24,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total worth',
                              style: TextStyle(
                                fontFamily: FontFamily.redHatMedium,
                                fontSize: 14,
                                color: AppColors.primary,
                              ),
                            ),
                            Text(
                              r'$5.254',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: FontFamily.redHatMedium,
                                fontSize: 16,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 30,
                          thickness: 1,
                          color: Color(0xFFEEEFF4),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Current value',
                              style: TextStyle(
                                fontFamily: FontFamily.redHatMedium,
                                fontSize: 14,
                                color: AppColors.primary,
                              ),
                            ),
                            Text(
                              r'$5.453',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: FontFamily.redHatMedium,
                                fontSize: 16,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(
                    50,
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 10,
              ),
              child: Row(
                children: [
                  Text(
                    '14 May 2024',
                    style: TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 13,
                      color: AppColors.textHintsColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.grey.withOpacity(0.1),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 17,
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Assets.icons.bTCIcon.image(
                                height: 32,
                              ),
                              const Gap(15),
                              const Text(
                                'Sent',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 15,
                                  color: AppColors.primaryTextColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Assets.icons.outboundRed.image(
                                height: 20,
                              ),
                            ],
                          ),
                          const Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                '-0.00008522 BTC',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 16,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                r'$5.254',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 16,
                                  color: Color(
                                    0xFF838995,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Divider(
                        endIndent: 0,
                        indent: 0,
                        color: Color(0xFFEEEFF4),
                        thickness: 1,
                      ),
                      const Gap(6),
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                            child: Lottie.asset(
                              'assets/lottie_animations/pending.json',
                              repeat: true,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
