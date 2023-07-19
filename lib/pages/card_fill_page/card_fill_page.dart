import 'package:auto_route/auto_route.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../custom_widgets/loading_button.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../store/card_animation_state/card_animation_state.dart';
import '../../store/validator_animation_state/validator_animation_state.dart';

@RoutePage()
class CardFillPage extends StatefulWidget {
  const CardFillPage({
    Key? key,
    required this.receivedData,
  }) : super(key: key);
  final String receivedData;

  @override
  State<CardFillPage> createState() => _CardFillPageState();
}

class _CardFillPageState extends State<CardFillPage>
    with TickerProviderStateMixin {
  late GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  late AnimationController _lottieController;
  late TextEditingController _textController = TextEditingController();
  final _validationState = ValidationState();
  final _cardAnimationState = CardAnimationState();

  Future<void> toggleCard() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    await cardKey.currentState?.toggleCard();
  }

  @override
  void initState() {
    super.initState();

    toggleCard();
    _toggleWidgets();
    _textController = TextEditingController();
    _lottieController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void didUpdateWidget(CardFillPage oldWidget) {
    _lottieController
      ..reset()
      ..forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _textController.dispose();
    _lottieController.dispose();
    toggleCard();
    super.dispose();
  }

  Future<void> _toggleWidgets() async {
    await Future.delayed(const Duration(milliseconds: 800));
    _cardAnimationState.startLoading();
  }

  @override
  Widget build(BuildContext context) {
    _textController.text = widget.receivedData;
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
      backgroundColor: AppColors.scaffoldBackgroundColor,
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
                    ? Assets.images.inactiveCard.image(
                        height: 355,
                      )
                    : Column(
                        children: [
                          FlipCard(
                            flipOnTouch: false,
                            key: cardKey,
                            fill: Fill.fillBack,
                            front: Assets.images.frontView.image(
                              height: 355,
                            ),
                            back: LayoutBuilder(
                              builder: (context, constraint) {
                                return Stack(
                                  children: [
                                    Assets.images.viewBack.image(),
                                    Positioned(
                                      top: constraint.maxHeight * 0.594,
                                      left: constraint.maxHeight * .117,
                                      right: constraint.maxHeight * .119,
                                      child: TextFormField(
                                        controller: _textController,
                                        maxLines: 2,
                                        cursorColor:
                                            AppColors.primaryButtonColor,
                                        cursorWidth: 1,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontFamily: FontFamily.redHatLight,
                                        ),
                                        onTapOutside: (_) {
                                          WidgetsBinding.instance.focusManager
                                              .primaryFocus
                                              ?.unfocus();
                                        },
                                        decoration: InputDecoration(
                                          hintText:
                                              'Write here your card address ',
                                          hintMaxLines: 2,
                                          hintStyle: TextStyle(
                                            fontFamily: FontFamily.redHatLight,
                                            fontSize: 10,
                                            color: AppColors.primaryTextColor
                                                .withOpacity(
                                              0.4,
                                            ),
                                          ),
                                          contentPadding:
                                              const EdgeInsets.symmetric(
                                            vertical: 13,
                                          ),
                                          prefixIconConstraints:
                                              const BoxConstraints(
                                            minWidth: 25,
                                            minHeight: 25,
                                          ),
                                          prefixIcon: Observer(
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(4),
                                                child: _validationState.isValid
                                                    ? Lottie.asset(
                                                        'assets/animated_logo/address_validation_success.json',
                                                        height: 24,
                                                        controller:
                                                            _lottieController,
                                                        onLoaded:
                                                            (composition) async {
                                                          await Future.delayed(
                                                            const Duration(
                                                              milliseconds:
                                                                  1000,
                                                            ),
                                                          );
                                                          _lottieController
                                                            ..duration =
                                                                composition
                                                                    .duration
                                                            ..forward();
                                                        },
                                                      )
                                                    : ScaleTap(
                                                        enableFeedback: false,
                                                        onPressed: () async {
                                                          final res =
                                                              await context
                                                                  .pushRoute<
                                                                      String?>(
                                                            const QrScannerRoute(),
                                                          );

                                                          _textController.text =
                                                              res!;
                                                          _validationState
                                                              .startLoading();
                                                          await Future.delayed(
                                                            const Duration(
                                                              milliseconds:
                                                                  1200,
                                                            ),
                                                          );
                                                          await toggleCard();
                                                        },
                                                        child: Assets
                                                            .images.qrCode
                                                            .image(
                                                          height: 24,
                                                          color: AppColors
                                                              .secondaryButtons,
                                                        ),
                                                      ),
                                              );
                                            },
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color:
                                                  AppColors.primaryButtonColor,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ).paddingHorizontal(80),
                        ],
                      ),
              );
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
            onPressed: _toggleWidgets,
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
