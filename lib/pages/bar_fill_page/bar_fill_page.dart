import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';

import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../store/card_animation_state/card_animation_state.dart';
import '../../widgets/loading_button.dart';

@RoutePage()
class BarFillPage extends StatefulWidget {
  const BarFillPage({super.key});

  @override
  State<BarFillPage> createState() => _BarFillPageState();
}

class _BarFillPageState extends State<BarFillPage> {
  final _cardAnimationState = CardAnimationState();

  @override
  void initState() {
    super.initState();
    _toggleWidgets();
  }

  Future<void> _toggleWidgets() async {
    await Future.delayed(const Duration(milliseconds: 800));
    _cardAnimationState.startLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text(
              'Virtual card',
              style: TextStyle(
                fontSize: 32,
                fontFamily: FontFamily.redHatBold,
              ),
            ).paddingHorizontal(14),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          const Gap(50),
          Observer(
            builder: (context) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 1500),
                child: _cardAnimationState.showFirstWidget
                    ? Assets.images.inactiveBar.image(
                        height: 312,
                      )
                    : LayoutBuilder(
                        builder: (context, constraint) {
                          return Stack(
                            children: [
                              Assets.images.barFrontView.image(
                                height: 312,
                              ),
                              Positioned(
                                top: 153,
                                left: 20,
                                right: 20,
                                child: TextFormField(
                                  maxLines: 2,
                                  cursorColor: AppColors.primaryButtonColor,
                                  cursorWidth: 1,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontFamily: FontFamily.redHatLight,
                                  ),
                                  onTapOutside: (_) {
                                    WidgetsBinding
                                        .instance.focusManager.primaryFocus
                                        ?.unfocus();
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Write here your card \naddress ',
                                    hintMaxLines: 2,
                                    hintStyle: TextStyle(
                                      fontFamily: FontFamily.redHatLight,
                                      fontSize: 10,
                                      color: AppColors.primaryTextColor
                                          .withOpacity(
                                        0.4,
                                      ),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 20,
                                    ),
                                    prefixIconConstraints: const BoxConstraints(
                                      minWidth: 20,
                                      minHeight: 20,
                                    ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: ScaleTap(
                                        enableFeedback: false,
                                        onPressed: () async {
                                          final res =
                                              await context.pushRoute<String?>(
                                            const QrScannerRoute(),
                                          );

                                          await Future.delayed(
                                            const Duration(
                                              milliseconds: 1200,
                                            ),
                                          );
                                        },
                                        child: Assets.images.qrCode.image(
                                          height: 24,
                                          color: AppColors.secondaryButtons,
                                        ),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: AppColors.primaryButtonColor,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
              ).paddingHorizontal();
            },
          ),
          const Gap(31),
          Container(
            padding: const EdgeInsets.all(14),
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
                        'Fill in the address of your physical card \nwallet',
                        style: TextStyle(
                          fontFamily: FontFamily.redHatMedium,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.textHintsColor,
                        ),
                      ),
                    ],
                  ),
                  Gap(4),
                  Text(
                    'Please fill the address from your physical card into the address input field, or scan the QR code.',
                    style: TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 14,
                      color: AppColors.textHintsColor,
                    ),
                  ),
                ],
              ),
            ),
          ).paddingHorizontal(),
          const Gap(55),
          LoadingButton(
            onPressed: () {},
            child: const Text(
              'Save to wallet',
              style: TextStyle(
                fontSize: 17,
                fontFamily: FontFamily.redHatSemiBold,
              ),
            ),
          ).paddingHorizontal(67),
          const Gap(20),
          ScaleTap(
            onPressed: () => router.pushAndPopAll(const OnboardingRoute()),
            child: const Center(
              child: Text(
                'Back',
                style: TextStyle(
                  fontFamily: FontFamily.redHatSemiBold,
                  color: AppColors.primaryTextColor,
                  fontSize: 17,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
