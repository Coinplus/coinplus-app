import 'package:auto_route/auto_route.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
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
import '../../models/card_model/card_model.dart';
import '../../router.gr.dart';
import '../../store/address_and_balance_state/address_and_balance_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/card_animation_state/card_animation_state.dart';
import '../../store/validator_animation_state/validator_animation_state.dart';
import 'show_skip_alert.dart';

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
  late AnimationController _textFieldAnimationController;

  late TextEditingController _textController = TextEditingController();
  final _validationState = ValidationState();
  final _cardAnimationState = CardAnimationState();
  final _balanceStore = BalanceStore();
  final _focusNode = FocusNode();
  final balanceStore = BalanceStore();
  final _addressState = AddressState();

  @override
  void initState() {
    super.initState();
    toggleCard();
    _toggleWidgets();
    _focusNode.addListener(() {
      _focusNode.hasFocus
          ? _textFieldAnimationController.forward()
          : _textFieldAnimationController.animateBack(0);
    });
    Future.delayed(const Duration(milliseconds: 1000), _focusNode.requestFocus);
    _textController = TextEditingController();
    _textController.text = widget.receivedData;
    _lottieController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _textFieldAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
      lowerBound: 1,
      upperBound: 1.4,
    );
  }

  @override
  void didUpdateWidget(CardFillPage oldWidget) {
    super.didUpdateWidget(oldWidget);
    _lottieController
      ..reset()
      ..forward();
  }

  @override
  void dispose() {
    _lottieController.dispose();
    toggleCard();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Row(
          children: [
            Text(
              'Virtual card',
              style: TextStyle(
                fontSize: 32,
                fontFamily: FontFamily.redHatBold,
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              const Gap(50),
              Observer(
                builder: (context) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 400),
                    child: _cardAnimationState.showFirstWidget
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Assets.images.inactiveCard.image(
                              height: 355,
                            ),
                          )
                        : Column(
                            children: [
                              FlipCard(
                                flipOnTouch: false,
                                key: cardKey,
                                fill: Fill.fillBack,
                                front: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Assets.images.viewFront.image(
                                        height: 355,
                                      ),
                                    ),
                                    if (_addressState.isAddressVisible)
                                      Positioned(
                                        top: 212,
                                        left: 10,
                                        right: 10,
                                        child: BlurryContainer(
                                          padding: const EdgeInsets.all(4),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          height: 40,
                                          width: 176,
                                          color: Colors.black.withOpacity(0.3),
                                          child: Column(
                                            children: [
                                              const Row(
                                                children: [
                                                  DefaultTextStyle(
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      color: Colors.white,
                                                    ),
                                                    child: Text(
                                                      'Address',
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  FutureBuilder<CardModel>(
                                                    future: _balanceStore
                                                        .fetchCardInfo(),
                                                    builder:
                                                        (context, snapshot) {
                                                      final data = snapshot
                                                          .data?.address;
                                                      if (snapshot.hasData) {
                                                        return Text(
                                                          data!.toString(),
                                                          style:
                                                              const TextStyle(
                                                            fontFamily: FontFamily
                                                                .redHatMedium,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.white,
                                                            fontSize: 10,
                                                          ),
                                                        );
                                                      } else if (snapshot
                                                          .hasError) {
                                                        return const Text(
                                                          'Error',
                                                        );
                                                      } else {
                                                        return const CupertinoActivityIndicator(
                                                          radius: 5,
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    else
                                      Container(),
                                    if (_addressState.isAddressVisible)
                                      Positioned(
                                        top: 260,
                                        left: 10,
                                        right: 10,
                                        child: BlurryContainer(
                                          padding: const EdgeInsets.all(4),
                                          height: 44,
                                          width: 176,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Colors.black.withOpacity(0.3),
                                          child: Column(
                                            children: [
                                              const Row(
                                                children: [
                                                  DefaultTextStyle(
                                                    style: TextStyle(
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                    ),
                                                    child: Text('Balance'),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  FutureBuilder<CardModel>(
                                                    future: _balanceStore
                                                        .fetchCardInfo(),
                                                    builder:
                                                        (context, snapshot) {
                                                      final data = snapshot
                                                          .data?.balance;
                                                      if (snapshot.hasData) {
                                                        return Text(
                                                          '\$${data!.toString()}.00',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily: FontFamily
                                                                .redHatMedium,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.white,
                                                            fontSize: 18,
                                                          ),
                                                        );
                                                      } else if (snapshot
                                                          .hasError) {
                                                        return const Text(
                                                          'Error',
                                                        );
                                                      } else {
                                                        return const CupertinoActivityIndicator(
                                                          radius: 5,
                                                        );
                                                      }
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      )
                                    else
                                      Container(),
                                  ],
                                ),
                                back: LayoutBuilder(
                                  builder: (context, constraint) {
                                    return Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          child: Assets.images.viewBack.image(),
                                        ),
                                        Positioned(
                                          top: constraint.maxHeight * 0.593,
                                          left: 0,
                                          right: 0,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal:
                                                  constraint.maxHeight * .127,
                                            ),
                                            child: ScaleTransition(
                                              scale:
                                                  _textFieldAnimationController,
                                              child: TextField(
                                                controller: _textController,
                                                maxLines: 2,
                                                focusNode: _focusNode,
                                                cursorColor: AppColors
                                                    .primaryButtonColor,
                                                cursorWidth: 1,
                                                style: const TextStyle(
                                                  fontSize: 10,
                                                  fontFamily:
                                                      FontFamily.redHatMedium,
                                                ),
                                                onTapOutside: (_) {
                                                  WidgetsBinding.instance
                                                      .focusManager.primaryFocus
                                                      ?.unfocus();
                                                },
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Write here your card address ',
                                                  hintMaxLines: 2,
                                                  hintStyle: TextStyle(
                                                    fontFamily:
                                                        FontFamily.redHatLight,
                                                    fontSize: 10,
                                                    color: AppColors
                                                        .primaryTextColor
                                                        .withOpacity(
                                                      0.4,
                                                    ),
                                                  ),
                                                  contentPadding:
                                                      const EdgeInsets
                                                          .symmetric(
                                                    vertical: 14,
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
                                                            const EdgeInsets
                                                                .all(
                                                          4,
                                                        ),
                                                        child:
                                                            _validationState
                                                                    .isValid
                                                                ? Lottie.asset(
                                                                    'assets/animated_logo/address_validation_success.json',
                                                                    height: 24,
                                                                    controller:
                                                                        _lottieController,
                                                                    onLoaded:
                                                                        (composition) async {
                                                                      await Future
                                                                          .delayed(
                                                                        const Duration(
                                                                          milliseconds:
                                                                              1000,
                                                                        ),
                                                                      );
                                                                      _lottieController
                                                                        ..duration =
                                                                            composition.duration
                                                                        ..forward();
                                                                      _addressState
                                                                          .addressVisibility();
                                                                    },
                                                                  )
                                                                : ScaleTap(
                                                                    enableFeedback:
                                                                        false,
                                                                    onPressed:
                                                                        () async {
                                                                      final res =
                                                                          await context
                                                                              .pushRoute<String?>(
                                                                        const QrScannerRoute(),
                                                                      );

                                                                      _textController
                                                                              .text =
                                                                          res!;
                                                                      _balanceStore
                                                                              .address =
                                                                          res;
                                                                      _validationState
                                                                          .startLoading();
                                                                      await Future
                                                                          .delayed(
                                                                        const Duration(
                                                                          milliseconds:
                                                                              1200,
                                                                        ),
                                                                      );
                                                                      _focusNode
                                                                          .unfocus();
                                                                      await toggleCard();
                                                                    },
                                                                    child: Assets
                                                                        .images
                                                                        .qrCode
                                                                        .image(
                                                                      height:
                                                                          24,
                                                                      color: AppColors
                                                                          .secondaryButtons,
                                                                    ),
                                                                  ),
                                                      );
                                                    },
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: AppColors
                                                          .primaryButtonColor,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5,
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color: Colors.transparent,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5,
                                                    ),
                                                  ),
                                                ),
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
            ],
          ),
          Positioned(
            bottom: 40,
            left: 10,
            right: 10,
            child: Observer(
              builder: (context) {
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      ),
                      child: _addressState.isAddressVisible
                          ? BlurryContainer(
                              color: Colors.white.withOpacity(0.7),
                              padding: const EdgeInsets.all(14),
                              borderRadius: BorderRadius.circular(8),
                              child: const Center(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        DefaultTextStyle(
                                          style: TextStyle(
                                            fontFamily: FontFamily.redHatMedium,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: AppColors.textHintsColor,
                                          ),
                                          child: Text(
                                            'Coinplus Virtual Card',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Gap(4),
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontSize: 14,
                                        color: AppColors.textHintsColor,
                                      ),
                                      child: Text(
                                        'This is the virtual copy of your physical Coinplus Card with its address and the balance shown above. You can save it in the app for further easy access and tracking.',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : BlurryContainer(
                              color: Colors.white.withOpacity(0.7),
                              padding: const EdgeInsets.all(14),
                              borderRadius: BorderRadius.circular(8),
                              child: const Center(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        DefaultTextStyle(
                                          style: TextStyle(
                                            fontFamily: FontFamily.redHatMedium,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: AppColors.textHintsColor,
                                          ),
                                          child: Text(
                                            'Fill in the address of your physical card \nwallet',
                                          ),
                                        ),
                                      ],
                                    ),
                                    Gap(4),
                                    DefaultTextStyle(
                                      style: TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontSize: 14,
                                        color: AppColors.textHintsColor,
                                      ),
                                      child: Text(
                                        'Please fill the address from your physical card into the address input field, or scan the QR code.',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                    ).paddingHorizontal(16),
                    const Gap(34),
                    LoadingButton(
                      onPressed: () {},
                      child: const Text(
                        'Save to wallet',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: FontFamily.redHatSemiBold,
                        ),
                      ),
                    ).paddingHorizontal(47),
                    const Gap(25),
                    if (_addressState.isAddressVisible)
                      ScaleTap(
                        onPressed: () async {
                          await showSkipAlert(context);
                        },
                        child: const Center(
                          child: DefaultTextStyle(
                            style: TextStyle(
                              fontFamily: FontFamily.redHatSemiBold,
                              color: AppColors.primaryTextColor,
                              fontSize: 17,
                            ),
                            child: Text(
                              'Skip',
                            ),
                          ),
                        ),
                      )
                    else
                      const SizedBox(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _toggleWidgets() async {
    await Future.delayed(const Duration(milliseconds: 400));
    _cardAnimationState.startLoading();
  }

  Future<void> toggleCard() async {
    await Future.delayed(const Duration(milliseconds: 600));
    await cardKey.currentState?.toggleCard();
  }
}
