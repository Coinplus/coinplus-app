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
import 'package:lottie/lottie.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../router.gr.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/address_and_balance_state/address_and_balance_state.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../store/qr_detect_state/qr_detect_state.dart';
import '../../../store/secret_lines_state/secret_lines_state.dart';
import '../../../utils/compute_private_key.dart';
import '../../../utils/custom_paint_lines.dart';
import '../../../widgets/custom_snack_bar/snack_bar.dart';
import '../../../widgets/custom_snack_bar/top_snack.dart';
import '../card_color_detecting/card_color_detecting.dart';

class CardWidgetNfcFill extends StatefulWidget {
  const CardWidgetNfcFill({
    super.key,
    required this.flipCardController,
    required this.addressState,
    required this.balanceStore,
    required this.linesStore,
    required this.validationState,
    required this.focusNode,
    required this.lottieController,
    required this.btcAddressController,
    required this.textFieldAnimationController,
    required this.cardColor,
  });

  final FlipCardController flipCardController;
  final AddressState addressState;
  final BalanceStore balanceStore;
  final LinesStore linesStore;
  final ValidationState validationState;
  final FocusNode focusNode;
  final AnimationController lottieController;
  final TextEditingController btcAddressController;
  final AnimationController textFieldAnimationController;
  final String? cardColor;

  @override
  State<CardWidgetNfcFill> createState() => _CardWidgetNfcFillState();
}

class _CardWidgetNfcFillState extends State<CardWidgetNfcFill> {
  @override
  Widget build(BuildContext context) {
    return FlipCard(
      flipOnTouch: false,
      controller: widget.flipCardController,
      front: Stack(
        children: [
          Center(
            child: Container(
              height: context.height > 667 ? 455 : 400,
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
                  image: getFrontImageForCardColor(widget.cardColor).image,
                ),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Center(
                    child: Observer(
                      builder: (context) {
                        return Visibility(
                          visible: widget.addressState.isAddressVisible,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: context.height * 0.22,
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.height > 667 ? 65 : 75,
                                ),
                                child: ScaleTap(
                                  enableFeedback: false,
                                  onPressed: () async {
                                    await recordAmplitudeEvent(
                                      AddressCopied(
                                        walletType: 'Card',
                                        walletAddress: widget.balanceStore.selectedCard!.address,
                                        activated: false,
                                        source: 'Balance',
                                      ),
                                    );
                                    if (Platform.isIOS) {
                                      await Clipboard.setData(
                                        ClipboardData(
                                          text: widget.balanceStore.selectedCard!.address.toString(),
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
                                      await Clipboard.setData(
                                        ClipboardData(
                                          text: widget.balanceStore.selectedCard!.address.toString(),
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
                                          color: widget.cardColor == '1'
                                              ? Colors.black.withOpacity(0.3)
                                              : Colors.black.withOpacity(0.2),
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
                                                if (widget.balanceStore
                                                        .loadings[widget.balanceStore.selectedCard?.address] ??
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
                                                final visibleAddress =
                                                    _getVisibleAddress(widget.balanceStore.selectedCard!.address);
                                                return Text(
                                                  visibleAddress,
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
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.height > 667 ? 65 : 75,
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
                                          color: widget.cardColor == '1'
                                              ? Colors.black.withOpacity(0.3)
                                              : Colors.black.withOpacity(0.2),
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
                                                final data = widget.balanceStore.coins;

                                                if (widget.balanceStore.selectedCard != null &&
                                                    widget.balanceStore.selectedCard!.data != null &&
                                                    data != null) {
                                                  final cardBalance = widget.balanceStore.selectedCard!.data!.balance;
                                                  final cardTxoSum =
                                                      widget.balanceStore.selectedCard!.data!.spentTxoSum;
                                                  final currentBalance = cardBalance - cardTxoSum;

                                                  if (currentBalance.isNaN) {
                                                    return const Padding(
                                                      padding: EdgeInsets.all(4),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 10,
                                                            width: 10,
                                                            child: CircularProgressIndicator(
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }

                                                  return Row(
                                                    children: [
                                                      Text(
                                                        '\$${myFormat.format(currentBalance / 100000000 * data.price)}',
                                                        style: const TextStyle(
                                                          fontFamily: FontFamily.redHatMedium,
                                                          fontWeight: FontWeight.w700,
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  return const Padding(
                                                    padding: EdgeInsets.all(4),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          height: 10,
                                                          width: 10,
                                                          child: CircularProgressIndicator(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                }
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
        child: Center(
          child: Observer(
            builder: (context) {
              return AnimatedContainer(
                curve: Curves.decelerate,
                duration: const Duration(milliseconds: 300),
                height: context.height > 667 ? 455 : 400,
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
                    image: !widget.addressState.isAddressVisible
                        ? getBackImageForCardColor(widget.cardColor).image
                        : getFilledBackImageForCardColor(widget.cardColor).image,
                  ),
                ),
                child: Observer(
                  builder: (context) {
                    return Row(
                      children: [
                        AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                          child: !widget.addressState.isAddressVisible
                              ? Row(
                                  children: [
                                    if (context.height < 932)
                                      if (context.height < 867.4)
                                        if (context.height > 844)
                                          Gap(context.width * 0.115)
                                        else if (context.height > 667)
                                          Gap(context.width * 0.075)
                                        else
                                          Gap(context.width * 0.125) //iPhone 13 Pro
                                      else
                                        Gap(context.width * 0.1) //Samsung large display
                                    else
                                      Gap(context.width * 0.115), //iPhone 13 Pro Max
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Assets.images.card.secret1.image(
                                          height: context.height > 667 ? 180 : 150,
                                        ),
                                        if (context.height > 667) const Gap(70) else const Gap(50),
                                        Assets.images.card.secret2.image(
                                          height: context.height > 667 ? 180 : 150,
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
                                            opacity: widget.linesStore.isLineVisible ? 1 : 0,
                                            child: CustomPaint(
                                              size: Size(
                                                context.height > 844
                                                    ? 42
                                                    : context.height > 667
                                                        ? 28
                                                        : 38,
                                                255,
                                              ),
                                              painter: LineCustomPaint(),
                                            ),
                                          );
                                        },
                                      ),
                                      Opacity(
                                        opacity: widget.validationState.isValid ? 0 : 1,
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
                                                height: context.height > 667 ? 180 : 150,
                                              ),
                                            ),
                                            if (context.height > 667) const Gap(70) else const Gap(50),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(15),
                                                border: Border.all(
                                                  color: AppColors.primaryTextColor,
                                                  width: 1.5,
                                                ),
                                              ),
                                              child: Assets.images.card.secret2.image(
                                                height: context.height > 667 ? 180 : 150,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ),
                        if (context.height < 932)
                          if (context.height < 867.4)
                            if (context.height > 844)
                              Gap(context.width * 0.105)
                            else if (context.height > 667)
                              Gap(context.width * 0.1175)
                            else
                              Gap(context.width * 0.065)
                          else
                            Gap(context.height * 0.051)
                        else
                          Gap(context.height * 0.049),
                        Opacity(
                          opacity: widget.linesStore.isLineVisible ? 0 : 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (context.height < 932)
                                if (context.height < 867.4)
                                  if (context.height > 844)
                                    Gap(context.height * 0.04)
                                  else if (context.height > 667)
                                    Gap(context.height * 0.04)
                                  else
                                    Gap(context.height * 0.03)
                                else
                                  Gap(context.height * 0.035)
                              else
                                Gap(context.height * 0.035),
                              Row(
                                children: [
                                  const Gap(15),
                                  if (widget.cardColor == '1')
                                    Assets.icons.coinplusLogoBlack.image(height: 32)
                                  else
                                    Assets.icons.coinplusLogo.image(height: 32),
                                ],
                              ),
                              const Gap(22),
                              ScaleTransition(
                                scale: widget.textFieldAnimationController,
                                child: Stack(
                                  children: [
                                    Container(
                                      height: context.height < 932
                                          ? context.height < 867.4
                                              ? context.height > 844
                                                  ? context.height * 0.24
                                                  : context.height * 0.265
                                              : context.height * 0.255
                                          : context.height * 0.24,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: widget.focusNode.hasFocus
                                              ? Colors.blue
                                              : widget.cardColor == '1'
                                                  ? const Color(0xFFF0563C)
                                                  : const Color(0xFFFBB270),
                                          width: widget.focusNode.hasFocus ? 1 : 3,
                                        ),
                                        borderRadius: BorderRadius.circular(28),
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            width: context.height < 932
                                                ? context.height < 867.4
                                                    ? context.height > 844
                                                        ? context.width * 0.225
                                                        : context.height > 667
                                                            ? context.width * 0.25
                                                            : context.width * 0.21
                                                    : context.width * 0.24
                                                : context.width * 0.225,
                                            height: context.height * 0.14,
                                            child: Observer(
                                              builder: (context) {
                                                return TextField(
                                                  readOnly: !widget.validationState.isValid && true,
                                                  textAlignVertical: TextAlignVertical.top,
                                                  autocorrect: false,
                                                  keyboardType: TextInputType.text,
                                                  textAlign: TextAlign.center,
                                                  onChanged: (value) {
                                                    if (value.length > 25) {
                                                      _validateBTCAddress();
                                                    }
                                                  },
                                                  controller: widget.btcAddressController,
                                                  maxLines: 15,
                                                  focusNode: widget.focusNode,
                                                  cursorColor: AppColors.primary,
                                                  cursorWidth: 1,
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: AppColors.primaryTextColor,
                                                    fontFamily: FontFamily.redHatLight,
                                                  ),
                                                  onTapOutside: (_) {
                                                    WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
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
                                          child: widget.validationState.isValid
                                              ? ScaleTap(
                                                  onPressed: () async {
                                                    widget.focusNode.unfocus();
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

                                                    widget.btcAddressController.text = res;
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
                                                  controller: widget.lottieController,
                                                  onLoaded: (composition) {
                                                    Future.delayed(
                                                      const Duration(
                                                        milliseconds: 1000,
                                                      ),
                                                    );
                                                    widget.lottieController.duration = composition.duration;
                                                  },
                                                ),
                                        );
                                      },
                                    ),
                                    Observer(
                                      builder: (context) {
                                        return Visibility(
                                          visible: !widget.validationState.isValid,
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
                                          visible: !widget.validationState.isValid,
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
                              if (context.height > 844)
                                Gap(context.height * 0.03)
                              else
                                context.height > 667 ? Gap(context.height * 0.035) : Gap(context.height * 0.025),
                              if (widget.cardColor == '1')
                                Assets.icons.cardBackTextBlack.image(height: 55)
                              else
                                Assets.icons.cardBackText.image(height: 55),
                              Gap(context.height * 0.02),
                              SizedBox(
                                width: 115,
                                child: widget.cardColor == '1'
                                    ? Assets.icons.cardBackLinkBlack.image()
                                    : Assets.icons.cardBackLink.image(),
                              ),
                              Gap(context.height * 0.025),
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
    );
  }

  Future<void> _validateBTCAddress() async {
    final btcAddress = widget.btcAddressController.text.trim();
    unawaited(
      widget.balanceStore.getSelectedCard(btcAddress),
    );
    if (isValidPublicAddress(btcAddress)) {
      widget.validationState.validate();
      await Future.delayed(
        const Duration(seconds: 1),
      );
      widget.focusNode.unfocus();
      Future.delayed(
        const Duration(milliseconds: 700),
        _toggleCard,
      );
      Future.delayed(
        const Duration(milliseconds: 1400),
        () => widget.addressState.isAddressVisible = true,
      );
      await widget.lottieController.forward(from: 0);
    } else {}
  }

  Future<void> _toggleCard() async {
    await Future.delayed(const Duration(milliseconds: 400));
    await widget.flipCardController.toggleCard();
  }

  String _getVisibleAddress(String fullAddress) {
    final start = fullAddress.substring(0, 5);
    final end = fullAddress.substring(fullAddress.length - 5);
    return '$start ... $end';
  }
}
