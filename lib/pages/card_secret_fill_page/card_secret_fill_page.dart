import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

import '../../constants/card_color.dart';
import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../modals/send_to/send_to_state.dart';
import '../../models/amplitude_event/amplitude_event.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../models/amplitude_user_property_model/amplitude_user_property_model.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../services/amplitude_service.dart';
import '../../services/cloud_firestore_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/history_page_store/history_page_store.dart';
import '../../store/qr_detect_state/qr_detect_state.dart';
import '../../utils/card_nfc_session.dart';
import '../../utils/compute_private_key.dart';
import '../../utils/secrets_validation.dart';
import '../../utils/secure_storage_utils.dart';
import '../../widgets/all_alert_dialogs/secrets_fail/secrets_fail.dart';
import '../../widgets/all_alert_dialogs/secrets_success/secrets_success.dart';
import '../../widgets/loading_button/loading_button.dart';

@RoutePage()
class CardSecretFillPage extends StatefulWidget {
  const CardSecretFillPage({
    super.key,
    this.receivedData,
    required this.state,
  });

  final String? receivedData;
  final SendToState state;

  @override
  State<CardSecretFillPage> createState() => _CardSecretFillPageState();
}

class _CardSecretFillPageState extends State<CardSecretFillPage>
    with TickerProviderStateMixin {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  late String secret1B58 = '';
  late String secret2B58 = '';
  late final TextEditingController _secretOneController =
      TextEditingController();
  late final TextEditingController _secretTwoController =
      TextEditingController();
  late AnimationController _lottieController;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late AnimationController _secretOneAnimationController;
  late AnimationController _secretTwoAnimationController;
  final _flipCardController = FlipCardController();
  late AnimationController _secretOneLottieController;
  late AnimationController _secretTwoLottieController;
  final _validationStore = ValidationState();
  final _secretOneFocusNode = FocusNode();
  final _secretTwoFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _toggleCard();
    _secretOneTextField();
    _secretOneController.text = secret1B58;
    _secretTwoController.text = secret2B58;
    if (Platform.isAndroid) {
      nfcStop();
    }
    _lottieController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.15),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    _flipCardController.toggleCard();
    _secretOneLottieController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _secretTwoLottieController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _secretOneFocusNode.addListener(() {
      _secretOneFocusNode.hasFocus
          ? _secretOneAnimationController.forward()
          : _secretOneAnimationController.animateBack(0);
    });
    _secretOneAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 1,
      upperBound: 1.09,
    );
    _secretTwoFocusNode.addListener(() {
      if (_secretTwoFocusNode.hasFocus) {
        _secretTwoAnimationController.forward();
        _controller.forward();
      } else {
        _secretTwoAnimationController.animateBack(0);
        _controller.reverse();
      }
    });
    _secretTwoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 1,
      upperBound: 1.09,
    );
    if (widget.receivedData != null) {
      onInitWithSecretOne();
      onInitWithSecretTwo();
    }
  }

  Future<void> onInitWithSecretOne() async {
    _secretOneLottieController.reset();
    await _validateSecretOne(_validationStore.walletAddress);
  }

  Future<void> onInitWithSecretTwo() async {
    _secretTwoLottieController.reset();
    await _validateSecretTwo(_validationStore.walletAddress);
  }

  @override
  void dispose() {
    _secretOneLottieController.dispose();
    _secretTwoLottieController.dispose();
    _secretOneAnimationController.dispose();
    _secretTwoAnimationController.dispose();
    super.dispose();
    _secretOneFocusNode.dispose();
    _secretTwoFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final card = _balanceStore.cards[_historyPageStore.cardActivationIndex];
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Theme(
              data: ThemeData(
                canvasColor: Colors.white,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: IconButton(
                onPressed: () {
                  recordAmplitudeEvent(
                    const BackButtonClicked(source: 'Card Secrets Screen'),
                  );
                  router.maybePop();
                },
                icon: Assets.icons.arrowBackIos.image(height: 22),
              ),
            ),
            const Gap(10),
            Text(
              'Virtual card',
              style: TextStyle(
                fontSize: 32,
                fontFamily: FontFamily.redHatBold,
                color: Colors.black.withOpacity(0.9),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: AnimatedBuilder(
              animation: _slideAnimation,
              builder: (ctx, child) => SlideTransition(
                position: _slideAnimation,
                child: FlipCard(
                  flipOnTouch: false,
                  controller: _flipCardController,
                  front: Center(
                    child: Container(
                      height: 455,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 15,
                          ),
                        ],
                        image: DecorationImage(
                          image: getFrontImageForCardColor(card.color).image,
                        ),
                      ),
                    ),
                  ),
                  back: ClipRRect(
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Center(
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return AnimatedContainer(
                              curve: Curves.decelerate,
                              duration: const Duration(milliseconds: 300),
                              height: 455,
                              width: context.width - 64,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 15,
                                  ),
                                ],
                                image: DecorationImage(
                                  image: getBackImageForCardColor(card.color)
                                      .image,
                                ),
                              ),
                              child: Row(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                        sigmaX: 8,
                                        sigmaY: 8,
                                      ),
                                      child: Row(
                                        children: [
                                          if (context.height > 844)
                                            SizedBox(
                                              width:
                                                  constraints.maxWidth * 0.082,
                                            )
                                          else
                                            SizedBox(
                                              width:
                                                  constraints.maxWidth * 0.075,
                                            ),
                                          Observer(
                                            builder: (context) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  ScaleTransition(
                                                    scale:
                                                        _secretOneAnimationController,
                                                    child: AnimatedCrossFade(
                                                      secondChild: Stack(
                                                        children: [
                                                          Container(
                                                            height: 180,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              border:
                                                                  Border.all(
                                                                color: _secretOneFocusNode
                                                                        .hasFocus
                                                                    ? Colors
                                                                        .blue
                                                                    : const Color(
                                                                        0xFFB5B5B5,
                                                                      ).withOpacity(
                                                                        0.6,
                                                                      ),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                10,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                SizedBox(
                                                                  width: 85,
                                                                  height: 100,
                                                                  child:
                                                                      TextField(
                                                                    inputFormatters: [
                                                                      LengthLimitingTextInputFormatter(
                                                                        30,
                                                                      ),
                                                                    ],
                                                                    textAlignVertical:
                                                                        TextAlignVertical
                                                                            .top,
                                                                    autocorrect:
                                                                        false,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    onChanged: (
                                                                      value,
                                                                    ) {
                                                                      if (value
                                                                              .length ==
                                                                          30) {
                                                                        _validateSecretOne(
                                                                          card.address,
                                                                        );
                                                                      } else if (value
                                                                              .length <
                                                                          30) {
                                                                        _validationStore
                                                                            .invalidSecretOne();
                                                                        _secretOneLottieController
                                                                            .reset();
                                                                      }

                                                                      secret1B58 =
                                                                          value;
                                                                    },
                                                                    controller:
                                                                        _secretOneController,
                                                                    maxLines:
                                                                        15,
                                                                    focusNode:
                                                                        _secretOneFocusNode,
                                                                    cursorColor:
                                                                        AppColors
                                                                            .primary,
                                                                    cursorWidth:
                                                                        1,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: AppColors
                                                                          .primaryTextColor,
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .redHatLight,
                                                                    ),
                                                                    onTapOutside:
                                                                        (
                                                                      _,
                                                                    ) {
                                                                      WidgetsBinding
                                                                          .instance
                                                                          .focusManager
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    decoration:
                                                                        InputDecoration(
                                                                      filled:
                                                                          true,
                                                                      hintText:
                                                                          'Write here your \nsecret 1',
                                                                      fillColor:
                                                                          Colors
                                                                              .white,
                                                                      hintMaxLines:
                                                                          10,
                                                                      hintStyle:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            FontFamily.redHatLight,
                                                                        fontSize:
                                                                            13,
                                                                        color: AppColors
                                                                            .primaryTextColor
                                                                            .withOpacity(
                                                                          0.8,
                                                                        ),
                                                                      ),
                                                                      contentPadding:
                                                                          const EdgeInsets
                                                                              .symmetric(
                                                                        horizontal:
                                                                            10,
                                                                        vertical:
                                                                            16,
                                                                      ),
                                                                      prefixIconConstraints:
                                                                          const BoxConstraints(
                                                                        minWidth:
                                                                            25,
                                                                        minHeight:
                                                                            25,
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                          24,
                                                                        ),
                                                                      ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                          24,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Observer(
                                                            builder: (context) {
                                                              return Positioned(
                                                                top: 25,
                                                                left: 0,
                                                                right: 0,
                                                                child: !_validationStore
                                                                        .isSecret1Valid
                                                                    ? ScaleTap(
                                                                        onPressed:
                                                                            () async {
                                                                          _secretOneFocusNode
                                                                              .unfocus();
                                                                          await Future
                                                                              .delayed(
                                                                            const Duration(
                                                                              milliseconds: 300,
                                                                            ),
                                                                          );
                                                                          final res =
                                                                              await context.pushRoute<String?>(
                                                                            QrScannerRoute(),
                                                                          );
                                                                          if (res ==
                                                                              null) {
                                                                            return;
                                                                          }
                                                                          unawaited(
                                                                            recordAmplitudeEvent(
                                                                              const QrButtonClicked(
                                                                                walletType: 'Card',
                                                                                source: 'Secret',
                                                                              ),
                                                                            ),
                                                                          );
                                                                          _secretOneController.text =
                                                                              res.replaceAll(
                                                                            '\n',
                                                                            '',
                                                                          );
                                                                          secret1B58 =
                                                                              _secretOneController.text;
                                                                          await _validateSecretOne(
                                                                            card.address,
                                                                          );
                                                                        },
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/icons/qr_code.png',
                                                                          ),
                                                                        ),
                                                                      )
                                                                    : Lottie
                                                                        .asset(
                                                                        'assets/lottie_animations/address_validation_success.json',
                                                                        height:
                                                                            40,
                                                                        controller:
                                                                            _secretOneLottieController,
                                                                        onLoaded:
                                                                            (composition) {
                                                                          Future
                                                                              .delayed(
                                                                            const Duration(
                                                                              milliseconds: 1000,
                                                                            ),
                                                                          );
                                                                          _secretOneLottieController.duration =
                                                                              composition.duration;
                                                                        },
                                                                      ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      firstChild: Assets
                                                          .images.card.secret1
                                                          .image(
                                                        height: 180,
                                                      ),
                                                      duration: const Duration(
                                                        milliseconds: 500,
                                                      ),
                                                      crossFadeState:
                                                          !_validationStore
                                                                  .secretOneVisibility
                                                              ? CrossFadeState
                                                                  .showFirst
                                                              : CrossFadeState
                                                                  .showSecond,
                                                    ),
                                                  ),
                                                  if (context.height > 667)
                                                    const Gap(70)
                                                  else
                                                    const Gap(50),
                                                  ScaleTransition(
                                                    scale:
                                                        _secretTwoAnimationController,
                                                    child: AnimatedCrossFade(
                                                      secondChild: Stack(
                                                        children: [
                                                          Container(
                                                            height: 180,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              border:
                                                                  Border.all(
                                                                color: _secretTwoFocusNode
                                                                        .hasFocus
                                                                    ? Colors
                                                                        .blue
                                                                    : const Color(
                                                                        0xFFB5B5B5,
                                                                      ).withOpacity(
                                                                        0.6,
                                                                      ),
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                10,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                SizedBox(
                                                                  width: 85,
                                                                  height: 100,
                                                                  child:
                                                                      TextField(
                                                                    inputFormatters: [
                                                                      LengthLimitingTextInputFormatter(
                                                                        30,
                                                                      ),
                                                                    ],
                                                                    textAlignVertical:
                                                                        TextAlignVertical
                                                                            .top,
                                                                    autocorrect:
                                                                        false,
                                                                    keyboardType:
                                                                        TextInputType
                                                                            .text,
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    onChanged:
                                                                        (value) {
                                                                      if (value
                                                                              .length ==
                                                                          30) {
                                                                        _validateSecretTwo(
                                                                          card.address,
                                                                        );
                                                                      } else if (value
                                                                              .length <
                                                                          30) {
                                                                        _validationStore
                                                                            .invalidSecretTwo();
                                                                        _secretTwoLottieController
                                                                            .reset();
                                                                      }

                                                                      secret2B58 =
                                                                          value;
                                                                    },
                                                                    controller:
                                                                        _secretTwoController,
                                                                    maxLines:
                                                                        15,
                                                                    focusNode:
                                                                        _secretTwoFocusNode,
                                                                    cursorColor:
                                                                        AppColors
                                                                            .primary,
                                                                    cursorWidth:
                                                                        1,
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          12,
                                                                      color: AppColors
                                                                          .primaryTextColor,
                                                                      fontFamily:
                                                                          FontFamily
                                                                              .redHatLight,
                                                                    ),
                                                                    onTapOutside:
                                                                        (_) {
                                                                      WidgetsBinding
                                                                          .instance
                                                                          .focusManager
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    decoration:
                                                                        InputDecoration(
                                                                      hintText:
                                                                          'Write here your \nsecret 2',
                                                                      fillColor:
                                                                          Colors
                                                                              .white,
                                                                      hintMaxLines:
                                                                          10,
                                                                      hintStyle:
                                                                          TextStyle(
                                                                        fontFamily:
                                                                            FontFamily.redHatLight,
                                                                        fontSize:
                                                                            13,
                                                                        color: AppColors
                                                                            .primaryTextColor
                                                                            .withOpacity(
                                                                          0.8,
                                                                        ),
                                                                      ),
                                                                      contentPadding:
                                                                          const EdgeInsets
                                                                              .symmetric(
                                                                        horizontal:
                                                                            10,
                                                                        vertical:
                                                                            16,
                                                                      ),
                                                                      prefixIconConstraints:
                                                                          const BoxConstraints(
                                                                        minWidth:
                                                                            25,
                                                                        minHeight:
                                                                            25,
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                          24,
                                                                        ),
                                                                      ),
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderSide:
                                                                            const BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                          24,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Observer(
                                                            builder: (context) {
                                                              return Positioned(
                                                                top: 25,
                                                                left: 0,
                                                                right: 0,
                                                                child: !_validationStore
                                                                        .isSecret2Valid
                                                                    ? ScaleTap(
                                                                        onPressed:
                                                                            () async {
                                                                          _secretOneFocusNode
                                                                              .unfocus();
                                                                          await Future
                                                                              .delayed(
                                                                            const Duration(
                                                                              milliseconds: 300,
                                                                            ),
                                                                          );
                                                                          final res =
                                                                              await context.pushRoute<String?>(
                                                                            QrScannerRoute(),
                                                                          );
                                                                          if (res ==
                                                                              null) {
                                                                            return;
                                                                          }
                                                                          unawaited(
                                                                            recordAmplitudeEvent(
                                                                              const QrButtonClicked(
                                                                                walletType: 'Card',
                                                                                source: 'Secret',
                                                                              ),
                                                                            ),
                                                                          );
                                                                          _secretTwoController.text =
                                                                              res.replaceAll(
                                                                            '\n',
                                                                            '',
                                                                          );
                                                                          secret2B58 =
                                                                              _secretTwoController.text;
                                                                          await _validateSecretTwo(
                                                                            card.address,
                                                                          );
                                                                        },
                                                                        child:
                                                                            SizedBox(
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              Image.asset(
                                                                            'assets/icons/qr_code.png',
                                                                          ),
                                                                        ),
                                                                      )
                                                                    : Lottie
                                                                        .asset(
                                                                        'assets/lottie_animations/address_validation_success.json',
                                                                        height:
                                                                            40,
                                                                        controller:
                                                                            _secretTwoLottieController,
                                                                        onLoaded:
                                                                            (composition) {
                                                                          Future
                                                                              .delayed(
                                                                            const Duration(
                                                                              milliseconds: 1000,
                                                                            ),
                                                                          );
                                                                          _secretTwoLottieController.duration =
                                                                              composition.duration;
                                                                        },
                                                                      ),
                                                              );
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      firstChild: Assets
                                                          .images.card.secret2
                                                          .image(
                                                        height: 180,
                                                      ),
                                                      duration: const Duration(
                                                        milliseconds: 500,
                                                      ),
                                                      crossFadeState:
                                                          !_validationStore
                                                                  .secretTwoVisibility
                                                              ? CrossFadeState
                                                                  .showFirst
                                                              : CrossFadeState
                                                                  .showSecond,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (context.height > 667)
            Observer(
              builder: (context) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                    color: Colors.white.withOpacity(0.7),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            AnimatedCrossFade(
                              firstChild: const Text(
                                'Write your Secret 1',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: AppColors.textHintsColor,
                                ),
                              ).expandedHorizontally(),
                              secondChild: const Text(
                                'Write your Secret 2',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: AppColors.textHintsColor,
                                ),
                              ).expandedHorizontally(),
                              crossFadeState:
                                  _validationStore.secretTwoVisibility
                                      ? CrossFadeState.showSecond
                                      : CrossFadeState.showFirst,
                              duration: const Duration(milliseconds: 400),
                            ),
                            const Gap(4),
                            AnimatedCrossFade(
                              firstChild: const Text(
                                'Remove the Secret1 label from you card and scan the QR code.',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 14,
                                  color: AppColors.textHintsColor,
                                ),
                              ).expandedHorizontally(),
                              secondChild: const Text(
                                'Remove the Secret2 label from you card and scan the QR code.',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 14,
                                  color: AppColors.textHintsColor,
                                ),
                              ).expandedHorizontally(),
                              crossFadeState:
                                  _validationStore.secretTwoVisibility
                                      ? CrossFadeState.showSecond
                                      : CrossFadeState.showFirst,
                              duration: const Duration(milliseconds: 400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ).paddingHorizontal(16);
              },
            ),
          const Gap(40),
          Observer(
            builder: (context) {
              return LoadingButton(
                onPressed: !_validationStore.isSecret2Valid
                    ? null
                    : () async {
                        await recordAmplitudeEventPartTwo(
                          ContinueCLicked(
                            walletAddress: _validationStore.walletAddress,
                            walletType: 'Card',
                          ),
                        );
                        unawaited(
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) {
                              return Center(
                                child: SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: Lottie.asset(
                                    'assets/lottie_animations/loading_animation.json',
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                        try {
                          final wif = await getWif(secret1B58, secret2B58);
                          final publicKey = wifToPublicKey(wif);
                          _validationStore.setWalletAddress(
                            publicKey: publicKey!,
                          );
                          if (card.address == publicKey) {
                            unawaited(toggleActivation(card.address));
                            unawaited(incrementActivationCount(card.address));
                            await savePrivateKeyInSecureStorage(
                              key: card.address,
                              value: wif,
                            );
                            await router.maybePop();
                            await isWalletActivated(
                              isSet: true,
                              address: card.address,
                            );
                            await HapticFeedback.heavyImpact();
                            await recordAmplitudeEventPartTwo(
                              ValidationSuccessful(
                                walletAddress: card.address,
                                walletType: 'Card',
                              ),
                            );
                            await secretsSuccessAlert(
                              context: context,
                              walletAddress: _validationStore.walletAddress,
                              walletType: 'Card',
                              isBarList: false,
                              state: widget.state,
                            );
                            await recordUserProperty(const CardHolder());
                          } else {
                            await router.maybePop();
                            await recordAmplitudeEventPartTwo(
                              ValidationFailed(
                                walletAddress: card.address,
                                walletType: 'Card',
                              ),
                            );
                            await recordUserProperty(const ActivationFailed());
                            unawaited(activationFailureCount(card.address));
                            await secretsFailDialog(
                              context: context,
                              walletAddress: _validationStore.walletAddress,
                              walletType: 'Card',
                            );
                          }
                        } catch (e) {
                          await recordAmplitudeEventPartTwo(
                            ValidationFailed(
                              walletAddress: card.address,
                              walletType: 'Card',
                            ),
                          );
                          await recordUserProperty(const ActivationFailed());
                          unawaited(activationFailureCount(card.address));
                          await secretsFailDialog(
                            context: context,
                            walletAddress: _validationStore.walletAddress,
                            walletType: 'Card',
                          );
                        }
                      },
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: FontFamily.redHatSemiBold,
                  ),
                ),
              ).paddingHorizontal(49);
            },
          ),
          const Gap(50),
        ],
      ),
    );
  }

  Future<void> showLoadingDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Center(
          child: SizedBox(
            height: 80,
            width: 80,
            child: Lottie.asset(
              'assets/lottie_animations/loading_animation.json',
              controller: _lottieController,
              onLoaded: (composition) {
                Future.delayed(
                  const Duration(
                    milliseconds: 1000,
                  ),
                );
                _lottieController.duration = composition.duration;
              },
            ),
          ),
        );
      },
    );
  }

  DecorationImage getBackImageForCardColor(CardColor color) {
    switch (color) {
      case CardColor.ORANGE:
        return DecorationImage(
          image: Assets.images.card.filledBack.image().image,
        );
      case CardColor.WHITE:
        return DecorationImage(
          image: Assets.images.card.filledBackWhite.image().image,
        );
      case CardColor.BLACK:
        return DecorationImage(
          image: Assets.images.card.filledBackBrown.image().image,
        );
      default:
        return DecorationImage(
          image: Assets.images.card.filledBack.image().image,
        );
    }
  }

  DecorationImage getFrontImageForCardColor(CardColor color) {
    switch (color) {
      case CardColor.ORANGE:
        return DecorationImage(
          image: Assets.images.card.orangeCardFront.image().image,
        );
      case CardColor.WHITE:
        return DecorationImage(
          image: Assets.images.card.whiteCardFront.image().image,
        );
      case CardColor.BLACK:
        return DecorationImage(
          image: Assets.images.card.brownCardFront.image().image,
        );
      default:
        return DecorationImage(
          image: Assets.images.card.orangeCardFront.image().image,
        );
    }
  }

  Future<void> _validateSecretOne(String walletAddress) async {
    final secretOne = _secretOneController.text.trim();
    if (isValidSecret(secretOne)) {
      _secretOneFocusNode.unfocus();
      _validationStore.validateSecretOne();
      await Future.delayed(const Duration());
      await _secretOneLottieController.forward(from: 0);
      _validationStore.makeSecretTwoVisible();
      await Future.delayed(const Duration(milliseconds: 100));
      _secretTwoFocusNode.requestFocus();

      await recordAmplitudeEvent(
        Secret1Validated(walletAddress: walletAddress, walletType: 'Card'),
      );
    }
  }

  Future<void> _validateSecretTwo(String walletAddress) async {
    final secretTwo = _secretTwoController.text.trim();
    if (isValidSecret(secretTwo)) {
      _validationStore.validateSecretTwo();
      await Future.delayed(
        const Duration(),
      );
      _secretTwoFocusNode.unfocus();
      await recordAmplitudeEvent(
        Secret2Validated(walletAddress: walletAddress, walletType: 'Card'),
      );

      await _secretTwoLottieController.forward(from: 0);
    }
  }

  Future<void> _secretOneTextField() async {
    await Future.delayed(const Duration(milliseconds: 1100));
    _validationStore.makeSecretOneVisible();
  }

  Future<void> _toggleCard() async {
    await Future.delayed(const Duration(milliseconds: 400));
    await _flipCardController.toggleCard();
  }
}
