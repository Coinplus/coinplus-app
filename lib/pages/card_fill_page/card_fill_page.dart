import 'dart:async';

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
import 'package:shared_preferences/shared_preferences.dart';

import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../store/address_and_balance_state/address_and_balance_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/card_animation_state/card_animation_state.dart';
import '../../store/qr_detect_state/qr_detect_state.dart';
import '../../widgets/loading_button.dart';
import 'skip_button_alert/skip_button_alert.dart';

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
  final _cardAnimationStore = CardAnimationState();
  final _flipCardController = FlipCardController();
  late AnimationController _lottieController;
  final _validationStore = QrDetectState();
  final _addressState = AddressState();
  final _focusNode = FocusNode();

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  @override
  void initState() {
    super.initState();
    _toggleCard();
    _toggleWidgets();
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
      upperBound: 1.3,
    );
    if (widget.receivedData != null) {
      onInitWithAddress();
    }
  }

  Future<void> onInitWithAddress() async {
    _lottieController.reset();
    await _validateBTCAddress();
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
      body: Column(
        children: [
          Expanded(
            child: Stack(
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
                            ? Assets.images.inactiveCard.image()
                            : Stack(
                                children: [
                                  Assets.images.viewFront.image(),
                                  if (_addressState.isAddressVisible)
                                    Positioned(
                                      top: 255,
                                      left: 10,
                                      right: 10,
                                      child: Container(
                                        height: 40,
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Colors.black.withOpacity(0.4),
                                        ),
                                        child: Column(
                                          children: [
                                            const Row(
                                              children: [
                                                Text(
                                                  'Address',
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    fontFamily:
                                                        FontFamily.redHatMedium,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Observer(
                                              builder: (context) {
                                                if (_balanceStore.loadings[
                                                        _balanceStore
                                                            .selectedCard
                                                            ?.address] ??
                                                    false) {
                                                  return const Padding(
                                                    padding: EdgeInsets.all(4),
                                                    child:
                                                        CupertinoActivityIndicator(
                                                      radius: 5,
                                                    ),
                                                  );
                                                }
                                                return Text(
                                                  _balanceStore.selectedCard
                                                          ?.address ??
                                                      '',
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        FontFamily.redHatMedium,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                  ),
                                                ).expandedHorizontally();
                                              },
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
                                      child: Container(
                                        height: 55,
                                        padding: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          color: Colors.black.withOpacity(0.4),
                                        ),
                                        child: Column(
                                          children: [
                                            const Row(
                                              children: [
                                                Text(
                                                  'Balance',
                                                  style: TextStyle(
                                                    fontFamily:
                                                        FontFamily.redHatMedium,
                                                    color: Colors.white,
                                                    fontSize: 11,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Observer(
                                              builder: (context) {
                                                if (_balanceStore.loadings[
                                                        _balanceStore
                                                            .selectedCard
                                                            ?.address] ??
                                                    false) {
                                                  return const Padding(
                                                    padding: EdgeInsets.all(4),
                                                    child:
                                                        CupertinoActivityIndicator(
                                                      radius: 5,
                                                    ),
                                                  );
                                                }
                                                return Text(
                                                  (_balanceStore.selectedCard !=
                                                              null
                                                          ? '\$${_balanceStore.selectedCard?.balance}.00'
                                                          : '')
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontFamily:
                                                        FontFamily.redHatMedium,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.white,
                                                    fontSize: 20,
                                                  ),
                                                ).expandedHorizontally();
                                              },
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
                      Assets.images.viewBackCard.image(),
                      Positioned(
                        top: MediaQuery.of(context).size.width * 0.705,
                        left: 33,
                        right: 33,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.141,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color(0xFFFBB270),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: ScaleTransition(
                              scale: _textFieldAnimationController,
                              child: TextField(
                                onChanged: (_) {
                                  _validateBTCAddress();
                                },
                                controller: _btcAddressController,
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
                                  fillColor: Colors.white,
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
                                            ? ScaleTap(
                                                enableFeedback: false,
                                                onPressed: () async {
                                                  _focusNode.unfocus();
                                                  await Future.delayed(
                                                    const Duration(
                                                      milliseconds: 300,
                                                    ),
                                                  );
                                                  final res = await context
                                                      .pushRoute<String?>(
                                                    const QrScannerRoute(),
                                                  );
                                                  if (res == null) {
                                                    return;
                                                  }

                                                  _btcAddressController.text =
                                                      res;
                                                  await _validateBTCAddress();
                                                },
                                                child:
                                                    Assets.images.qrCode.image(
                                                  height: 24,
                                                  color: AppColors
                                                      .secondaryButtons,
                                                ),
                                              )
                                            : Lottie.asset(
                                                'assets/animated_logo/address_validation_success.json',
                                                height: 24,
                                                controller: _lottieController,
                                                onLoaded: (composition) {
                                                  Future.delayed(
                                                    const Duration(
                                                      milliseconds: 1000,
                                                    ),
                                                  );
                                                  _lottieController.duration =
                                                      composition.duration;
                                                },
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
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
          const Gap(20),
          LoadingButton(
            onPressed: () {
              try {
                _balanceStore.saveSelectedCard();
                router.push(const WalletProtectionRoute());
              } catch (e) {
                if (!router.stackData
                    .indexWhere((element) => element.name == WalletRoute.name)
                    .isNegative) {
                  router.pop();
                }
              }
            },
            child: const Text(
              'Save to wallet',
              style: TextStyle(
                fontSize: 17,
                fontFamily: FontFamily.redHatSemiBold,
              ),
            ),
          ).paddingHorizontal(49),
          const Gap(20),
          ScaleTap(
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
          const Gap(30),
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
        const Duration(milliseconds: 600),
        _toggleCard,
      );
      Future.delayed(
        const Duration(milliseconds: 550),
        () => _addressState.isAddressVisible = true,
      );
      await _lottieController.forward(from: 0);
    } else {}
  }

  bool isValidBTCAddress(String address) {
    final btcAddressRegex = RegExp(r'^(bc1|[13])[a-zA-HJ-NP-Z0-9]{25,39}$');
    return btcAddressRegex.hasMatch(address);
  }

  Future<void> saveStringToLocalStorage(String key, String value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
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
