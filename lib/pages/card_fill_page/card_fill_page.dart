import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../store/address_and_balance_state/address_and_balance_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/qr_detect_state/qr_detect_state.dart';
import '../../utils/btc_validation.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button.dart';
import '../splash_screen/splash_screen.dart';
import 'edit_address_dialog/edit_address_dialog.dart';

@RoutePage()
class CardFillPage extends StatefulWidget {
  const CardFillPage({
    super.key,
    this.receivedData,
  });

  final String? receivedData;

  @override
  State<CardFillPage> createState() => _CardFillPageState();
}

class _CardFillPageState extends State<CardFillPage>
    with TickerProviderStateMixin {
  late TextEditingController _btcAddressController = TextEditingController();
  late AnimationController _textFieldAnimationController;
  final _flipCardController = FlipCardController();
  late AnimationController _lottieController;
  final _validationStore = QrDetectState();
  final _addressState = AddressState();
  final _focusNode = FocusNode();

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  @override
  void initState() {
    super.initState();
    _nfcStop();
    _toggleCard();
    _flipCardController.toggleCard();
    _btcAddressController.addListener(_validateBTCAddress);
    _btcAddressController = TextEditingController();
    _btcAddressController.text = widget.receivedData ?? '';
    _lottieController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _focusNode.addListener(() {
      _focusNode.hasFocus
          ? _textFieldAnimationController.forward()
          : _textFieldAnimationController.animateBack(0);
    });
    _textFieldAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 1,
      upperBound: 1.09,
    );
    if (widget.receivedData != null) {
      onInitWithAddress();
    }
  }

  Future<void> onInitWithAddress() async {
    _lottieController.reset();
    await _validateBTCAddress();
  }

  Future<void> _nfcStop() async {
    await Future.delayed(const Duration(milliseconds: 10000));
    await NfcManager.instance.stopSession();
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
    _lottieController.dispose();
    _textFieldAnimationController.dispose();
    _balanceStore.resetSelectedCard();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(20),
          Expanded(
            child: Stack(
              children: [
                FlipCard(
                  flipOnTouch: false,
                  controller: _flipCardController,
                  front: Stack(
                    children: [
                      Container(
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
                            image: Assets.images.front.image().image,
                          ),
                        ),
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Center(
                              child: Observer(
                                builder: (context) {
                                  return Visibility(
                                    visible: _addressState.isAddressVisible,
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: context.height * 0.22,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 65,
                                          ),
                                          child: ScaleTap(
                                            enableFeedback: false,
                                            onPressed: () {
                                              if (Platform.isIOS) {
                                                Clipboard.setData(
                                                  ClipboardData(
                                                    text: _balanceStore
                                                        .selectedCard!.address
                                                        .toString(),
                                                  ),
                                                ).then(
                                                  (_) {
                                                    HapticFeedback
                                                        .mediumImpact();
                                                    showTopSnackBar(
                                                      displayDuration:
                                                          const Duration(
                                                        milliseconds: 400,
                                                      ),
                                                      Overlay.of(
                                                        context,
                                                      ),
                                                      const CustomSnackBar
                                                          .success(
                                                        backgroundColor: Color(
                                                          0xFF4A4A4A,
                                                        ),
                                                        message:
                                                            'Address was copied',
                                                        textStyle: TextStyle(
                                                          fontFamily: FontFamily
                                                              .redHatMedium,
                                                          fontSize: 14,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              } else {
                                                Clipboard.setData(
                                                  ClipboardData(
                                                    text: _balanceStore
                                                        .selectedCard!.address
                                                        .toString(),
                                                  ),
                                                ).then(
                                                  (_) {
                                                    HapticFeedback
                                                        .mediumImpact();
                                                  },
                                                );
                                              }
                                            },
                                            child: ClipRRect(
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 5,
                                                  sigmaY: 5,
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 8,
                                                    right: 8,
                                                    top: 12,
                                                    bottom: 12,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      6,
                                                    ),
                                                    color: Colors.black
                                                        .withOpacity(
                                                      0.2,
                                                    ),
                                                  ),
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
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Observer(
                                                        builder: (context) {
                                                          if (_balanceStore
                                                                      .loadings[
                                                                  _balanceStore
                                                                      .selectedCard
                                                                      ?.address] ??
                                                              false) {
                                                            return const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                4,
                                                              ),
                                                              child:
                                                                  CupertinoActivityIndicator(
                                                                radius: 5,
                                                              ),
                                                            );
                                                          }
                                                          return Text(
                                                            _balanceStore
                                                                    .selectedCard
                                                                    ?.address ??
                                                                '',
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style:
                                                                const TextStyle(
                                                              fontFamily: FontFamily
                                                                  .redHatMedium,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 12,
                                                            ),
                                                          ).expandedHorizontally();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Gap(4),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 65,
                                          ),
                                          child: ScaleTap(
                                            enableFeedback: false,
                                            onPressed: () {},
                                            child: ClipRRect(
                                              child: BackdropFilter(
                                                filter: ImageFilter.blur(
                                                  sigmaX: 5,
                                                  sigmaY: 5,
                                                ),
                                                child: Container(
                                                  padding: const EdgeInsets.all(
                                                    8,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      6,
                                                    ),
                                                    color: Colors.black
                                                        .withOpacity(
                                                      0.2,
                                                    ),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      const Row(
                                                        children: [
                                                          Text(
                                                            'Balance',
                                                            style: TextStyle(
                                                              fontFamily: FontFamily
                                                                  .redHatMedium,
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 11,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Observer(
                                                        builder: (context) {
                                                          final data =
                                                              _balanceStore.coin
                                                                  ?.coins.first;

                                                          if (data == null) {
                                                            return const SizedBox();
                                                          }
                                                          if (_balanceStore
                                                                      .loadings[
                                                                  _balanceStore
                                                                      .selectedCard
                                                                      ?.address] ??
                                                              false) {
                                                            return const Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(
                                                                4,
                                                              ),
                                                              child:
                                                                  CupertinoActivityIndicator(
                                                                radius: 5,
                                                              ),
                                                            );
                                                          }
                                                          return Text(
                                                            (_balanceStore.selectedCard !=
                                                                        null
                                                                    ? '\$${(_balanceStore.selectedCard!.balance! / 100000000 * data.price).toStringAsFixed(2)}'
                                                                    : '')
                                                                .toString(),
                                                            style:
                                                                const TextStyle(
                                                              fontFamily: FontFamily
                                                                  .redHatMedium,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 20,
                                                            ),
                                                          ).expandedHorizontally();
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  back: Center(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        log(constraints.maxHeight.toString());
                        return Container(
                          height: 455,
                          width: context.width - 74,
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
                              image: Assets.images.back.image().image,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              if (constraints.maxHeight < 551)
                                SizedBox(width: constraints.maxWidth * 0.175)
                              else
                                SizedBox(width: constraints.maxWidth * 0.108),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Gap(35),
                                  Row(
                                    children: [
                                      const Gap(15),
                                      Assets.icons.coinplusLogo
                                          .image(height: 32),
                                    ],
                                  ),
                                  const Gap(22),
                                  ScaleTransition(
                                    scale: _textFieldAnimationController,
                                    child: Stack(
                                      children: [
                                        Container(
                                          height: 220,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: _focusNode.hasFocus
                                                  ? Colors.blue
                                                  : const Color(0xFFFBB270),
                                              width:
                                                  _focusNode.hasFocus ? 1 : 3,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(27),
                                          ),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: 95,
                                                height: 135,
                                                child: TextField(
                                                  textAlign: TextAlign.center,
                                                  onChanged: (_) {
                                                    _validateBTCAddress();
                                                  },
                                                  controller:
                                                      _btcAddressController,
                                                  maxLines: 15,
                                                  focusNode: _focusNode,
                                                  cursorColor:
                                                      AppColors.primary,
                                                  cursorWidth: 1,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: AppColors
                                                        .primaryTextColor,
                                                    fontFamily:
                                                        FontFamily.redHatLight,
                                                  ),
                                                  onTapOutside: (_) {
                                                    WidgetsBinding
                                                        .instance
                                                        .focusManager
                                                        .primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Write here your card address',
                                                    fillColor: Colors.white,
                                                    hintMaxLines: 10,
                                                    hintStyle: TextStyle(
                                                      fontFamily: FontFamily
                                                          .redHatLight,
                                                      fontSize: 13,
                                                      color: AppColors
                                                          .primaryTextColor
                                                          .withOpacity(
                                                        0.4,
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        const EdgeInsets
                                                            .symmetric(
                                                      horizontal: 10,
                                                      vertical: 16,
                                                    ),
                                                    prefixIconConstraints:
                                                        const BoxConstraints(
                                                      minWidth: 25,
                                                      minHeight: 25,
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
                                              child: _validationStore.isValid
                                                  ? ScaleTap(
                                                      onPressed: () async {
                                                        _focusNode.unfocus();
                                                        await Future.delayed(
                                                          const Duration(
                                                            milliseconds: 300,
                                                          ),
                                                        );
                                                        final res =
                                                            await context
                                                                .pushRoute<
                                                                    String?>(
                                                          const QrScannerRoute(),
                                                        );
                                                        if (res == null) {
                                                          return;
                                                        }

                                                        _btcAddressController
                                                            .text = res;
                                                        await _validateBTCAddress();
                                                      },
                                                      child: SizedBox(
                                                        height: 50,
                                                        child: Image.asset(
                                                          'assets/images/qr_code.png',
                                                        ),
                                                      ),
                                                    )
                                                  : Lottie.asset(
                                                      'assets/animated_logo/address_validation_success.json',
                                                      height: 40,
                                                      controller:
                                                          _lottieController,
                                                      onLoaded: (composition) {
                                                        Future.delayed(
                                                          const Duration(
                                                            milliseconds: 1000,
                                                          ),
                                                        );
                                                        _lottieController
                                                                .duration =
                                                            composition
                                                                .duration;
                                                      },
                                                    ),
                                            );
                                          },
                                        ),
                                        Observer(
                                          builder: (context) {
                                            return Visibility(
                                              visible:
                                                  !_validationStore.isValid,
                                              child: Positioned(
                                                left: 6,
                                                right: 6,
                                                top: 6,
                                                child: Assets.icons
                                                    .validationIndicatorGreenTop
                                                    .image(),
                                              ),
                                            );
                                          },
                                        ),
                                        Observer(
                                          builder: (context) {
                                            return Visibility(
                                              visible:
                                                  !_validationStore.isValid,
                                              child: Positioned(
                                                left: 6,
                                                right: 6,
                                                bottom: 6,
                                                child: Assets.icons
                                                    .validationIndicatorGreenBottom
                                                    .image(),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Gap(29),
                                  Assets.icons.cardBackText.image(height: 55),
                                  const Gap(18),
                                  SizedBox(
                                    width: 115,
                                    child: Assets.icons.cardBackLink.image(),
                                  ),
                                  const Gap(20),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(20),
          if (context.height > 667)
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                ),
                color: Colors.white.withOpacity(0.7),
              ),
              child: const Padding(
                padding: EdgeInsets.all(14),
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      switchInCurve: Curves.decelerate,
                      duration: Duration(milliseconds: 300),
                      child: Row(
                        children: [
                          Text(
                            'Coinplus Virtual Card',
                            style: TextStyle(
                              fontFamily: FontFamily.redHatMedium,
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: AppColors.textHintsColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(4),
                    Text(
                      'This is the virtual copy of your physical Coinplus Card with its address and the balance shown above. You can save it in the app for further easy access and tracking.',
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
          const Gap(20),
          Observer(
            builder: (_) {
              return LoadingButton(
                onPressed: _addressState.isAddressVisible
                    ? () {
                        try {
                          _balanceStore.saveSelectedCard();
                          hasShownWallet().then((hasShown) {
                            if (hasShown) {
                              router.pop(const Dashboard());
                            } else {
                              router.pushAndPopAll(
                                const WalletProtectionRoute(),
                              );
                            }
                          });
                        } catch (e) {
                          if (!router.stackData
                              .indexWhere(
                                (element) => element.name == Dashboard.name,
                              )
                              .isNegative) {
                            router.pop();
                            editAddressDialog(context);
                          }
                        }
                      }
                    : null,
                child: const Text(
                  'Save to wallet',
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

  Future<void> _validateBTCAddress() async {
    final btcAddress = _btcAddressController.text.trim();
    unawaited(
      _balanceStore.getSelectedCard(btcAddress),
    );
    if (isValidBTCAddress(btcAddress)) {
      _validationStore.validate();
      await Future.delayed(
        const Duration(seconds: 1),
      );
      _focusNode.unfocus();
      Future.delayed(
        const Duration(milliseconds: 700),
        _toggleCard,
      );
      Future.delayed(
        const Duration(milliseconds: 550),
        () => _addressState.isAddressVisible = true,
      );
      await _lottieController.forward(from: 0);
    } else {}
  }

  Future<void> _toggleCard() async {
    await Future.delayed(const Duration(milliseconds: 400));
    await _flipCardController.toggleCard();
  }
}
