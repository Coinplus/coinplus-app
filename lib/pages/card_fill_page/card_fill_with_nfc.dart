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
import 'package:nfc_manager/nfc_manager.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../store/accept_state/accept_state.dart';
import '../../store/address_and_balance_state/address_and_balance_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/checkbox_state/checkbox_state.dart';
import '../../store/qr_detect_state/qr_detect_state.dart';
import '../../store/secret_lines_state/secret_lines_state.dart';
import '../../utils/compute_private_key.dart';
import '../../utils/custom_paint_lines.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button.dart';
import '../splash_screen/splash_screen.dart';
import 'already_saved_card_dialog/already_saved_card_dialog.dart';

@RoutePage()
class CardFillWithNfc extends StatefulWidget {
  const CardFillWithNfc({
    super.key,
    this.receivedData,
  });

  final String? receivedData;

  @override
  State<CardFillWithNfc> createState() => _CardFillWithNfcState();
}

class _CardFillWithNfcState extends State<CardFillWithNfc> with TickerProviderStateMixin {
  final _flipCardController = FlipCardController();
  final _lineStore = LinesStore();
  final _focusNode = FocusNode();
  final _addressState = AddressState();
  final _acceptState = AcceptState();
  final _checkboxState = CheckboxState();
  late TextEditingController _btcAddressController = TextEditingController();
  late AnimationController _textFieldAnimationController;
  late final ShakeAnimationController _shakeAnimationController = ShakeAnimationController();

  late AnimationController _lottieController;
  final _validationStore = ValidationState();

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
      _focusNode.hasFocus ? _textFieldAnimationController.forward() : _textFieldAnimationController.animateBack(0);
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
    await Future.delayed(const Duration(milliseconds: 3000));
    await NfcManager.instance.stopSession();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _lottieController.dispose();
    _textFieldAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  _flipCardController.controller!.value == 1 && _lineStore.isLineVisible
                      ? makeLineInvisible()
                      : router.pop();
                },
                icon: Assets.icons.arrowBackIos.image(height: 22),
              ),
            ),
            const Gap(10),
            const Text(
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
          const Gap(3),
          Expanded(
            child: FlipCard(
              flipOnTouch: false,
              controller: _flipCardController,
              front: Stack(
                children: [
                  Center(
                    child: Container(
                      height: context.height == 667 ? 400 : 455,
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
                          image: Assets.images.card.front.image().image,
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
                                                  text: _balanceStore.selectedCard!.address.toString(),
                                                ),
                                              ).then(
                                                (_) {
                                                  HapticFeedback.mediumImpact();
                                                  showTopSnackBar(
                                                    displayDuration: const Duration(
                                                      milliseconds: 400,
                                                    ),
                                                    Overlay.of(
                                                      context,
                                                    ),
                                                    CustomSnackBar.success(
                                                      backgroundColor: const Color(
                                                        0xFF4A4A4A,
                                                      ).withOpacity(0.9),
                                                      message: 'Address was copied',
                                                      textStyle: const TextStyle(
                                                        fontFamily: FontFamily.redHatMedium,
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
                                                  text: _balanceStore.selectedCard!.address.toString(),
                                                ),
                                              ).then(
                                                (_) {
                                                  HapticFeedback.mediumImpact();
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
                                                padding: const EdgeInsets.only(
                                                  left: 8,
                                                  right: 8,
                                                  top: 12,
                                                  bottom: 12,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(
                                                    6,
                                                  ),
                                                  color: Colors.black.withOpacity(
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
                                                            fontFamily: FontFamily.redHatMedium,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Observer(
                                                      builder: (context) {
                                                        if (_balanceStore
                                                                .loadings[_balanceStore.selectedCard?.address] ??
                                                            false) {
                                                          return const Padding(
                                                            padding: EdgeInsets.all(
                                                              4,
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                  height: 10,
                                                                  width: 10,
                                                                  child: CircularProgressIndicator(
                                                                    color: Colors.grey,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }
                                                        return Text(
                                                          _balanceStore.selectedCard?.address ?? '',
                                                          overflow: TextOverflow.ellipsis,
                                                          style: const TextStyle(
                                                            fontFamily: FontFamily.redHatMedium,
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
                                                  borderRadius: BorderRadius.circular(
                                                    6,
                                                  ),
                                                  color: Colors.black.withOpacity(
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
                                                            fontFamily: FontFamily.redHatMedium,
                                                            color: Colors.white,
                                                            fontSize: 11,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Observer(
                                                      builder: (context) {
                                                        final myFormat = NumberFormat.decimalPatternDigits(
                                                          locale: 'en_us',
                                                          decimalDigits: 2,
                                                        );
                                                        final data = _balanceStore.coins;

                                                        if ((_balanceStore
                                                                    .loadings[_balanceStore.selectedCard?.address] ??
                                                                false) &&
                                                            data == null) {
                                                          return const Padding(
                                                            padding: EdgeInsets.all(
                                                              4,
                                                            ),
                                                            child: Row(
                                                              children: [
                                                                SizedBox(
                                                                  height: 10,
                                                                  width: 10,
                                                                  child: CircularProgressIndicator(
                                                                    color: Colors.grey,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }
                                                        return Text(
                                                          (_balanceStore.selectedCard != null
                                                                  ? '\$${myFormat.format((_balanceStore.selectedCard!.data!.balance - _balanceStore.selectedCard!.data!.spentTxoSum) / 100000000 * data!.price)}'
                                                                  : '')
                                                              .toString(),
                                                          style: const TextStyle(
                                                            fontFamily: FontFamily.redHatMedium,
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
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ).paddingHorizontal(
                                  context.height < 845 ? 0 : 20,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              back: ClipRRect(
                clipBehavior: Clip.hardEdge,
                child: Center(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      return AnimatedContainer(
                        curve: Curves.decelerate,
                        duration: const Duration(milliseconds: 300),
                        height: 455,
                        width: context.width - 54,
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
                            image: !_addressState.isAddressVisible
                                ? Assets.images.card.back.image().image
                                : Assets.images.card.filledBack.image().image,
                          ),
                        ),
                        child: Observer(
                          builder: (context) {
                            return Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                  child: !_addressState.isAddressVisible
                                      ? Row(
                                          children: [
                                            if (constraints.maxHeight < 551)
                                              SizedBox(
                                                width: constraints.maxWidth * 0.091,
                                              )
                                            else
                                              SizedBox(
                                                width: constraints.maxWidth * 0.125,
                                              ),
                                            Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Assets.images.card.secret1.image(
                                                  height: context.height * 0.212,
                                                ),
                                                const Gap(70),
                                                Assets.images.card.secret2.image(
                                                  height: context.height * 0.212,
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                      : BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 10,
                                            sigmaY: 10,
                                          ),
                                          child: Row(
                                            children: [
                                              Observer(
                                                builder: (context) {
                                                  return Opacity(
                                                    opacity: _lineStore.isLineVisible ? 1 : 0,
                                                    child: CustomPaint(
                                                      size: Size(
                                                        constraints.maxHeight < 551 ? 33 : 50,
                                                        255,
                                                      ),
                                                      painter: LineCustomPaint(),
                                                    ),
                                                  );
                                                },
                                              ),
                                              Opacity(
                                                opacity: _validationStore.isValid ? 0 : 1,
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.min,
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(15),
                                                        border: Border.all(
                                                          color: AppColors.primaryTextColor,
                                                          width: 1.5,
                                                        ),
                                                      ),
                                                      child: Assets.images.card.secret1.image(
                                                        height: context.height * 0.212,
                                                      ),
                                                    ),
                                                    const Gap(70),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(15),
                                                        border: Border.all(
                                                          color: AppColors.primaryTextColor,
                                                          width: 1.5,
                                                        ),
                                                      ),
                                                      child: Assets.images.card.secret2.image(
                                                        height: context.height * 0.212,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                ),
                                if (constraints.maxHeight < 551)
                                  SizedBox(width: constraints.maxWidth * 0.114)
                                else
                                  SizedBox(width: constraints.maxWidth * 0.107),
                                Opacity(
                                  opacity: _lineStore.isLineVisible ? 0 : 1,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Gap(34),
                                      Row(
                                        children: [
                                          const Gap(15),
                                          Assets.icons.coinplusLogo.image(height: 32),
                                        ],
                                      ),
                                      const Gap(22),
                                      ScaleTransition(
                                        scale: _textFieldAnimationController,
                                        child: Stack(
                                          children: [
                                            Container(
                                              height: context.height * 0.26,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                  color: _focusNode.hasFocus ? Colors.blue : const Color(0xFFFBB270),
                                                  width: _focusNode.hasFocus ? 1 : 3,
                                                ),
                                                borderRadius: BorderRadius.circular(27),
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  SizedBox(
                                                    width: context.height * 0.114,
                                                    height: context.height * 0.14,
                                                    child: Observer(
                                                      builder: (context) {
                                                        return TextField(
                                                          readOnly: !_validationStore.isValid && true,
                                                          textAlignVertical: TextAlignVertical.top,
                                                          autocorrect: false,
                                                          keyboardType: TextInputType.text,
                                                          textAlign: TextAlign.center,
                                                          onChanged: (value) {
                                                            if (value.length > 25) {
                                                              _validateBTCAddress();
                                                            }
                                                          },
                                                          controller: _btcAddressController,
                                                          maxLines: 15,
                                                          focusNode: _focusNode,
                                                          cursorColor: AppColors.primary,
                                                          cursorWidth: 1,
                                                          style: const TextStyle(
                                                            fontSize: 12,
                                                            color: AppColors.primaryTextColor,
                                                            fontFamily: FontFamily.redHatLight,
                                                          ),
                                                          onTapOutside: (_) {
                                                            WidgetsBinding.instance.focusManager.primaryFocus
                                                                ?.unfocus();
                                                          },
                                                          decoration: InputDecoration(
                                                            hintText: 'Write here your card address',
                                                            fillColor: Colors.white,
                                                            hintMaxLines: 10,
                                                            hintStyle: TextStyle(
                                                              fontFamily: FontFamily.redHatLight,
                                                              fontSize: 13,
                                                              color: AppColors.primaryTextColor.withOpacity(
                                                                0.4,
                                                              ),
                                                            ),
                                                            contentPadding: const EdgeInsets.symmetric(
                                                              horizontal: 10,
                                                              vertical: 16,
                                                            ),
                                                            prefixIconConstraints: const BoxConstraints(
                                                              minWidth: 25,
                                                              minHeight: 25,
                                                            ),
                                                            focusedBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                color: Colors.transparent,
                                                              ),
                                                              borderRadius: BorderRadius.circular(
                                                                24,
                                                              ),
                                                            ),
                                                            enabledBorder: OutlineInputBorder(
                                                              borderSide: const BorderSide(
                                                                color: Colors.transparent,
                                                              ),
                                                              borderRadius: BorderRadius.circular(
                                                                24,
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
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
                                                            final res = await context.pushRoute<String?>(
                                                              const QrScannerRoute(),
                                                            );
                                                            if (res == null) {
                                                              return;
                                                            }

                                                            _btcAddressController.text = res;
                                                            await _validateBTCAddress();
                                                          },
                                                          child: SizedBox(
                                                            height: 50,
                                                            child: Image.asset(
                                                              'assets/icons/qr_code.png',
                                                            ),
                                                          ),
                                                        )
                                                      : Lottie.asset(
                                                          'assets/animated_logo/address_validation_success.json',
                                                          height: 40,
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
                                                );
                                              },
                                            ),
                                            Observer(
                                              builder: (context) {
                                                return Visibility(
                                                  visible: !_validationStore.isValid,
                                                  child: Positioned(
                                                    left: 6,
                                                    right: 6,
                                                    top: 6,
                                                    child: Assets.icons.validationIndicatorGreenTop.image(),
                                                  ),
                                                );
                                              },
                                            ),
                                            Observer(
                                              builder: (context) {
                                                return Visibility(
                                                  visible: !_validationStore.isValid,
                                                  child: Positioned(
                                                    left: 6,
                                                    right: 6,
                                                    bottom: 6,
                                                    child: Assets.icons.validationIndicatorGreenBottom.image(),
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
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          const Gap(10),
          Observer(
            builder: (context) {
              return ShakeAnimationWidget(
                shakeRange: 0.3,
                isForward: false,
                shakeAnimationController: _shakeAnimationController,
                shakeAnimationType: ShakeAnimationType.LeftRightShake,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        AnimatedCrossFade(
                          firstChild: Container(
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
                                  const Text(
                                    'Coinplus virtual card',
                                    style: TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 16,
                                      color: AppColors.textHintsColor,
                                    ),
                                  ).expandedHorizontally(),
                                  const Gap(4),
                                  const Text(
                                    'This is the virtual copy of your physical Coinplus Card with its address and the balance shown above. You can save it in the app for further easy access and tracking.',
                                    style: TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      fontSize: 14,
                                      color: AppColors.textHintsColor,
                                    ),
                                  ).expandedHorizontally(),
                                ],
                              ),
                            ),
                          ),
                          secondChild: GestureDetector(
                            onTap: () {
                              _checkboxState.makeActive();
                              HapticFeedback.heavyImpact();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: _checkboxState.isActive
                                      ? const Color(0xFF73C3A6)
                                      : _acceptState.isAccepted
                                          ? Colors.grey.withOpacity(0.3)
                                          : const Color(0xFFFF2E00).withOpacity(0.6),
                                ),
                                color: _checkboxState.isActive
                                    ? const Color(0xFF73C3A6).withOpacity(0.1)
                                    : _acceptState.isAccepted
                                        ? Colors.white.withOpacity(0.7)
                                        : const Color(0xFFFF2E00).withOpacity(0.05),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Keep your card safe!',
                                      style: TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: AppColors.textHintsColor,
                                      ),
                                    ).expandedHorizontally(),
                                    const Gap(4),
                                    const Text(
                                      'Make sure to keep your card safe! You will need your \nSecret 1 and Secret 2 in the future to manage your crypto.',
                                      style: TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontSize: 14,
                                        color: AppColors.textHintsColor,
                                      ),
                                    ).expandedHorizontally(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          crossFadeState:
                              !_lineStore.isLineVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 400),
                        ),
                      ],
                    ).paddingHorizontal(16),
                    Visibility(
                      visible: _lineStore.isLineVisible,
                      child: Positioned(
                        right: 16,
                        child: Transform.scale(
                          scale: 1.2,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Observer(
                              builder: (context) {
                                return Checkbox(
                                  checkColor: const Color(0xFF73C3A6),
                                  activeColor: const Color(0xFF73C3A6).withOpacity(0.5),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(4),
                                    ),
                                  ),
                                  side: BorderSide(
                                    color: _acceptState.isAccepted
                                        ? Colors.grey.withOpacity(0.5)
                                        : const Color(0xFFFF2E00).withOpacity(0.6),
                                  ),
                                  value: _checkboxState.isActive,
                                  onChanged: (_) {
                                    _checkboxState.makeActive();
                                  },
                                  splashRadius: 15,
                                );
                              },
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
          if (context.height > 844)
            SizedBox(
              height: context.width * 0.15,
            )
          else
            SizedBox(
              height: context.width * 0.06,
            ),
          Observer(
            builder: (_) {
              return _lineStore.isLineVisible
                  ? LoadingButton(
                      onPressed: () async {
                        if (_checkboxState.isActive) {
                          _balanceStore.saveSelectedCard();
                          await hasShownWallet().then((hasShown) {
                            if (hasShown) {
                              router.pop();
                            } else {
                              router.pushAndPopAll(
                                const WalletProtectionRoute(),
                              );
                            }
                          });
                        } else {
                          await HapticFeedback.vibrate();
                          _acceptState.accept();
                          _shakeAnimationController.start();
                          await Future.delayed(
                            const Duration(
                              milliseconds: 600,
                            ),
                          );
                          _shakeAnimationController.stop();
                        }
                      },
                      child: const Text(
                        'Got it',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: FontFamily.redHatSemiBold,
                        ),
                      ),
                    ).paddingHorizontal(49)
                  : LoadingButton(
                      onPressed: _addressState.isAddressVisible
                          ? () async {
                              final cardIndex = _balanceStore.cards.indexWhere(
                                (element) => element.address == _balanceStore.selectedCard?.address,
                              );
                              if (cardIndex != -1) {
                                await alreadySavedCard(context);
                              } else {
                                await _toggleCard();
                                await Future.delayed(
                                  const Duration(milliseconds: 300),
                                );
                                _lineStore.makeVisible();
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
          if (context.height > 667) const Gap(50) else const Gap(20),
        ],
      ),
    );
  }

  Future<void> _validateBTCAddress() async {
    final btcAddress = _btcAddressController.text.trim();
    unawaited(
      _balanceStore.getSelectedCard(btcAddress),
    );
    if (isValidPublicAddress(btcAddress)) {
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
        const Duration(milliseconds: 1400),
        () => _addressState.isAddressVisible = true,
      );
      await _lottieController.forward(from: 0);
    } else {}
  }

  Future<void> _toggleCard() async {
    await Future.delayed(const Duration(milliseconds: 400));
    await _flipCardController.toggleCard();
  }

  Future<void> makeLineInvisible() async {
    await _toggleCard();
    await Future.delayed(const Duration(milliseconds: 350));
    _lineStore.makeVisible();
  }
}
