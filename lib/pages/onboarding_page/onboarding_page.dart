import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../themes/app_fonts.dart';
import '../../widgets/loading_button.dart';
import 'form_factor_pages/form_factor_page.dart';
import 'form_factor_pages/scan_methods_page.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _controller = PageController();

  @override
  void initState() {
    _controller = PageController()..addListener(() {});
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Column(
        children: [
          const Spacer(
            flex: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Gap(16),
              SizedBox(
                height: 56,
                child: Assets.images.coinpluslogo.image(),
              ),
            ],
          ),
          const Spacer(
            flex: 2,
          ),
          const Text(
            'Hey there,\nlet’s connect your new wallet',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontFamily: FontFamily.RedHatSemiBold,
              color: AppColors.primaryTextColor,
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          LoadingButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return AnimatedOpacity(
                    duration: const Duration(milliseconds: 300),
                    opacity: 1,
                    child: Container(
                      height: 409,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const Gap(25),
                          Row(
                            children: [
                              const Gap(16),
                              IconButton(
                                onPressed: () {
                                  router.pop(context);
                                },
                                icon: const Icon(
                                  Icons.close_sharp,
                                  size: 25,
                                  color: Colors.black,
                                ),
                              ),
                              const Gap(28),
                              const Text(
                                'Start with your wallet',
                                style: TextStyle(
                                  fontFamily: FontFamily.RedHatSemiBold,
                                  fontSize: 17,
                                  color: AppColors.primaryTextColor,
                                ),
                              ).paddingHorizontal(),
                            ],
                          ),
                          const Gap(10),
                          const Divider(
                            thickness: 2,
                            height: 2,
                            indent: 15,
                            endIndent: 15,
                            color: Color(0xFFF1F1F1),
                          ),
                          SizedBox(
                            height: 290,
                            child: PageView(
                              controller: _controller,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                ScanMethodsPage(
                                  controller: _controller,
                                ),
                                FormFactorPage(
                                  controller: _controller,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: const Text(
              'Connect wallet',
              style: TextStyle(
                fontSize: 15,
                fontFamily: FontFamily.RedHatSemiBold,
              ),
            ),
          ).paddingHorizontal(63),
          const Gap(28),
          ScaleTap(
            enableFeedback: false,
            onPressed: () async {
              final url = Uri.parse('https://coinplus.com/shop/');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            child: const Text(
              "Don't have a card?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamily.RedHatSemiBold,
                fontSize: 15,
                color: AppColors.primaryTextColor,
              ),
            ),
          ).expandedHorizontally(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 1,
                width: 146,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: AppColors.dividerLight,
                ),
              ),
              const Text(
                'Or',
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: FontFamily.RedHatLight,
                  color: AppColors.primaryTextColor,
                ),
              ),
              Container(
                height: 1,
                width: 146,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: AppColors.dividerLight,
                ),
              ),
            ],
          ),
          const Spacer(),
          ScaleTap(
            enableFeedback: false,
            onPressed: () async {
              final res = await context.pushRoute<String?>(
                const QrScannerRoute(),
              );
              if (res != null) {
                await router.push(
                  CardFillRoute(receivedData: res),
                );
              }
            },
            child: const Text(
              'Try with QR scan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamily.RedHatMedium,
                color: AppColors.primaryTextColor,
                fontSize: 15,
              ),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
        ],
      ),
    );
  }
}
