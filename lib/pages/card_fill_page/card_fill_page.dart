import 'dart:async';
import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:blur_container/blur_container.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../custom_widgets/loading_button.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/card_model/card_model.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../store/address_and_balance_state/address_and_balance_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/card_animation_state/card_animation_state.dart';
import '../../store/validator_animation_state/validator_animation_state.dart';
import 'skip_button_alert/skip_button_alert.dart';

@RoutePage()
class CardFillPage extends StatefulWidget {
  const CardFillPage({super.key, required this.receivedData});

  final String receivedData;

  @override
  State<CardFillPage> createState() => _CardFillPageState();
}

class _CardFillPageState extends State<CardFillPage>
    with TickerProviderStateMixin {
  late TextEditingController _textController = TextEditingController();
  late AnimationController _textFieldAnimationController;
  final _cardAnimationStore = CardAnimationState();
  final _flipCardController = FlipCardController();
  late AnimationController _lottieController;
  final _validationStore = ValidationState();
  final _addressState = AddressState();
  final _balanceStore = BalanceStore();
  final _focusNode = FocusNode();


  @override
  void initState() {
    super.initState();
    _toggleCard();
    _toggleWidgets();
    _flipCardController.toggleCard();
    _focusNode.addListener(() {
      _focusNode.hasFocus
          ? _textFieldAnimationController.forward()
          : _textFieldAnimationController.animateBack(0);
    });

    _textController = TextEditingController();
    _textController.text = widget.receivedData;
    _lottieController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _textFieldAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
      lowerBound: 1,
      upperBound: 1.3,
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
    _focusNode.dispose();
    _textController.dispose();
    _lottieController.dispose();
    _textFieldAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _addressState.isAddressVisible ? log('visible') : Container();
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        surfaceTintColor: Colors.transparent,
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
        children: [
          Positioned(
            top: 15,
            left: MediaQuery.of(context).size.width * 0.15,
            right: MediaQuery.of(context).size.width * 0.15,
            child: SizedBox(
              height: 1000,
              child: ListView(
                shrinkWrap: true,
                children: [
                  FlipCard(
                    flipOnTouch: false,
                    controller: _flipCardController,
                    front: Observer(
                      builder: (context) {
                        return AnimatedSwitcher(
                          switchInCurve: Curves.slowMiddle,
                          duration: const Duration(milliseconds: 300),
                          child: _cardAnimationStore.showFirstWidget
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Assets.images.inactiveCard.image(),
                                )
                              : Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(14),
                                      child: Assets.images.viewFront.image(),
                                    ),
                                    if (_addressState.isAddressVisible)
                                      Positioned(
                                        top: 255,
                                        left: 10,
                                        right: 10,
                                        child: BlurContainerWidget(
                                          height: 40,
                                          padding: const EdgeInsets.all(4),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Colors.black.withOpacity(0.3),
                                          child: Column(
                                            children: [
                                              const Row(
                                                children: [
                                                  Text(
                                                    'Address',
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      color: Colors.white,
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
                                                            fontSize: 11,
                                                          ),
                                                        );
                                                      } else {
                                                        return const Padding(
                                                          padding:
                                                              EdgeInsets.all(4),
                                                          child:
                                                              CupertinoActivityIndicator(
                                                            radius: 5,
                                                          ),
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
                                      const SizedBox(),
                                    if (_addressState.isAddressVisible)
                                      Positioned(
                                        top: 300,
                                        left: 10,
                                        right: 10,
                                        child: BlurContainerWidget(
                                          height: 55,
                                          padding: const EdgeInsets.all(5),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Colors.black.withOpacity(0.3),
                                          child: Column(
                                            children: [
                                              const Row(
                                                children: [
                                                  Text(
                                                    'Balance',
                                                    style: TextStyle(
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      color: Colors.white,
                                                      fontSize: 11,
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
                                                      log('future_builder');
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
                                                            fontSize: 20,
                                                          ),
                                                        );
                                                      } else {
                                                        return const Padding(
                                                          padding:
                                                              EdgeInsets.all(4),
                                                          child:
                                                              CupertinoActivityIndicator(
                                                            radius: 5,
                                                          ),
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
                                      const SizedBox(),
                                  ],
                                ),
                        );
                      },
                    ),
                    back: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Assets.images.viewBack.image(),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.width * 0.646,
                          left: 0,
                          right: 0,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.141,
                            ),
                            child: ScaleTransition(
                              scale: _textFieldAnimationController,
                              child: TextField(
                                controller: _textController,
                                maxLines: 2,
                                focusNode: _focusNode,
                                cursorColor: AppColors.primaryButtonColor,
                                cursorWidth: 1,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: FontFamily.redHatMedium,
                                ),
                                onTapOutside: (_) {
                                  WidgetsBinding
                                      .instance.focusManager.primaryFocus
                                      ?.unfocus();
                                },
                                decoration: InputDecoration(
                                  hintText: 'Write here your card address ',
                                  hintMaxLines: 2,
                                  hintStyle: TextStyle(
                                    fontFamily: FontFamily.redHatLight,
                                    fontSize: 12,
                                    color:
                                        AppColors.primaryTextColor.withOpacity(
                                      0.4,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 5,
                                    vertical: 16,
                                  ),
                                  prefixIconConstraints: const BoxConstraints(
                                    minWidth: 25,
                                    minHeight: 25,
                                  ),
                                  prefixIcon: Observer(
                                    builder: (context) {
                                      return Padding(
                                        padding: const EdgeInsets.all(
                                          4,
                                        ),
                                        child: _validationStore.isValid
                                            ? Lottie.asset(
                                                'assets/animated_logo/address_validation_success.json',
                                                height: 24,
                                                controller: _lottieController,
                                                onLoaded: (composition) {
                                                  Future.delayed(
                                                    const Duration(
                                                      milliseconds: 1000,
                                                    ),
                                                  );
                                                  _lottieController
                                                    ..duration =
                                                        composition.duration
                                                    ..forward()
                                                    ..addListener(
                                                      _addressState
                                                          .addressVisibility,
                                                    );
                                                },
                                              )
                                            : ScaleTap(
                                                enableFeedback: false,
                                                onPressed: () async {
                                                  _focusNode.unfocus();
                                                  await Future.delayed(const Duration(milliseconds: 300));
                                                  final res = await context
                                                      .pushRoute<String?>(
                                                    const QrScannerRoute(),
                                                  );

                                                  _textController.text = res!;
                                                  _balanceStore.address = res;
                                                  _validationStore
                                                      .startLoading();
                                                  await Future.delayed(
                                                    const Duration(
                                                      milliseconds: 1200,
                                                    ),
                                                  );
                                                  _focusNode.unfocus();
                                                  await _toggleCard();
                                                },
                                                child:
                                                    Assets.images.qrCode.image(
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
                                      color: AppColors.primaryButtonColor,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.68,
            left: 10,
            right: 10,
            child: BlurContainerWidget(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey.withOpacity(0.3),
              ),
              child: const Padding(
                padding: EdgeInsets.all(14),
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
            ).paddingHorizontal(16),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 1.8,
            left: 10,
            right: 10,
            child: LoadingButton(
              onPressed: () {
                router.push(const WalletProtectionRoute());
              },
              child: const Text(
                'Save to wallet',
                style: TextStyle(
                  fontSize: 17,
                  fontFamily: FontFamily.redHatSemiBold,
                ),
              ),
            ).paddingHorizontal(49),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 1.98,
            left: 0,
            right: 0,
            child: ScaleTap(
              enableFeedback: false,
              onPressed: () {
                showMyDialog(context);
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
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _toggleWidgets() async {
    await Future.delayed(const Duration(milliseconds: 600));
    _cardAnimationStore.startLoading();
  }

  Future<void> _toggleCard() async {
    await Future.delayed(const Duration(milliseconds: 800));
    await _flipCardController.toggleCard();
  }
}
