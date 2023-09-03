import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:collection/collection.dart';
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

import '../../constants/buttons/button_settings.dart';
import '../../extensions/context_extension.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../store/address_and_balance_state/address_and_balance_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/qr_detect_state/qr_detect_state.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button.dart';
import '../splash_screen/splash_screen.dart';
import 'edit_address_dialog/edit_address_dialog.dart';
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
      upperBound: 1.2,
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
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              const Gap(20),
              Expanded(
                flex: 4,
                child: Stack(
                  children: [
                    FlipCard(
                      flipOnTouch: false,
                      controller: _flipCardController,
                      front: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
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
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 65,
                                              ),
                                              child: ScaleTap(
                                                enableFeedback: false,
                                                onPressed: () {
                                                  if (Platform.isIOS) {
                                                    Clipboard.setData(
                                                      ClipboardData(
                                                        text: _balanceStore
                                                            .selectedCard!
                                                            .address
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
                                                            backgroundColor:
                                                                Color(
                                                              0xFF4A4A4A,
                                                            ),
                                                            message:
                                                                'Address was copied',
                                                            textStyle:
                                                                TextStyle(
                                                              fontFamily: FontFamily
                                                                  .redHatMedium,
                                                              fontSize: 14,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                  } else {
                                                    Clipboard.setData(
                                                      ClipboardData(
                                                        text: _balanceStore
                                                            .selectedCard!
                                                            .address
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
                                                            BorderRadius
                                                                .circular(
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
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 11,
                                                                  fontFamily:
                                                                      FontFamily
                                                                          .redHatMedium,
                                                                  color: Colors
                                                                      .white,
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
                                                                  fontFamily:
                                                                      FontFamily
                                                                          .redHatMedium,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .white,
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
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                                      padding:
                                                          const EdgeInsets.all(
                                                        8,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
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
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      FontFamily
                                                                          .redHatMedium,
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 11,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Observer(
                                                            builder: (context) {
                                                              final coin =
                                                                  _balanceStore
                                                                      .coins
                                                                      .firstWhereOrNull(
                                                                (element) =>
                                                                    element
                                                                        .id ==
                                                                    'bitcoin',
                                                              );
                                                              if (coin ==
                                                                  null) {
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
                                                                        ? '\$${(_balanceStore.selectedCard!.balance! / 100000000 * coin.currentPrice).toStringAsFixed(2)}'
                                                                        : '')
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                  fontFamily:
                                                                      FontFamily
                                                                          .redHatMedium,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                      .white,
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
                        child: Container(
                          width: context.width - 74,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Assets.images.back.image().image,
                            ),
                          ),
                          child: LayoutBuilder(
                            builder: (_, constraints) {
                              return Center(
                                child: SizedBox(
                                  height: constraints.maxHeight * 0.5,
                                  width: constraints.maxWidth * 0.54,
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 12,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                color: const Color(0xFFFBB270),
                                                width: 2,
                                              ),
                                            ),
                                            child: Column(
                                              children: [
                                                const Spacer(flex: 7),
                                                Assets.images.secret1.image(),
                                                const Spacer(flex: 5),
                                                Assets.images.secret2.image(),
                                                const Spacer(flex: 7),
                                              ],
                                            ),
                                          ),
                                        ),
                                        const Gap(6),
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: const Color(0xFFFBB270),
                                              width: 2,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: ScaleTransition(
                                            scale:
                                                _textFieldAnimationController,
                                            child: TextField(
                                              onChanged: (_) {
                                                _validateBTCAddress();
                                              },
                                              controller: _btcAddressController,
                                              maxLines: 2,
                                              minLines: 1,
                                              focusNode: _focusNode,
                                              cursorColor:
                                                  AppColors.primaryButtonColor,
                                              cursorWidth: 1,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                color:
                                                    AppColors.primaryTextColor,
                                                fontFamily:
                                                    FontFamily.redHatLight,
                                              ),
                                              onTapOutside: (_) {
                                                WidgetsBinding.instance
                                                    .focusManager.primaryFocus
                                                    ?.unfocus();
                                              },
                                              decoration: InputDecoration(
                                                fillColor: Colors.white,
                                                hintText:
                                                    'Write here your card address ',
                                                hintMaxLines: 2,
                                                hintStyle: TextStyle(
                                                  fontFamily:
                                                      FontFamily.redHatLight,
                                                  fontSize: 12,
                                                  color: AppColors
                                                      .primaryTextColor
                                                      .withOpacity(
                                                    0.4,
                                                  ),
                                                ),
                                                contentPadding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 5,
                                                  vertical: 16,
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
                                                          const EdgeInsets.all(
                                                        4,
                                                      ),
                                                      child: _validationStore
                                                              .isValid
                                                          ? ScaleTap(
                                                              enableFeedback:
                                                                  false,
                                                              onPressed:
                                                                  () async {
                                                                _focusNode
                                                                    .unfocus();
                                                                await Future
                                                                    .delayed(
                                                                  const Duration(
                                                                    milliseconds:
                                                                        300,
                                                                  ),
                                                                );
                                                                final res =
                                                                    await context
                                                                        .pushRoute<
                                                                            String?>(
                                                                  const QrScannerRoute(),
                                                                );
                                                                if (res ==
                                                                    null) {
                                                                  return;
                                                                }

                                                                _btcAddressController
                                                                    .text = res;
                                                                await _validateBTCAddress();
                                                              },
                                                              child: Assets
                                                                  .images.qrCode
                                                                  .image(
                                                                height: 35,
                                                                color: AppColors
                                                                    .secondaryButtons,
                                                              ),
                                                            )
                                                          : Lottie.asset(
                                                              'assets/animated_logo/address_validation_success.json',
                                                              height: 24,
                                                              controller:
                                                                  _lottieController,
                                                              onLoaded:
                                                                  (composition) {
                                                                Future.delayed(
                                                                  const Duration(
                                                                    milliseconds:
                                                                        1000,
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
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                  borderSide: const BorderSide(
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
                                                  borderSide: const BorderSide(
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
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
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
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        AnimatedSwitcher(
                          switchInCurve: Curves.decelerate,
                          duration: const Duration(milliseconds: 300),
                          child: Observer(
                            builder: (context) {
                              return Row(
                                children: [
                                  if (_addressState.isAddressVisible)
                                    const Text(
                                      'Coinplus Virtual Card',
                                      style: TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: AppColors.textHintsColor,
                                      ),
                                    )
                                  else
                                    const Text(
                                      'Fill in the address of your physical card \nwallet',
                                      style: TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: AppColors.textHintsColor,
                                      ),
                                    ),
                                ],
                              );
                            },
                          ),
                        ),
                        const Gap(4),
                        if (_addressState.isAddressVisible)
                          const Text(
                            'This is the virtual copy of your physical Coinplus Card with its address and the balance shown above. You can save it in the app for further easy access and tracking.',
                            style: TextStyle(
                              fontFamily: FontFamily.redHatMedium,
                              fontSize: 14,
                              color: AppColors.textHintsColor,
                            ),
                          )
                        else
                          const Text(
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
                                  router.push(const WalletProtectionRoute());
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
              Observer(
                builder: (_) {
                  return LoadingButton(
                    onPressed: _addressState.isAddressVisible
                        ? () {
                            showMyDialog(context);
                          }
                        : () {
                            router.pop(const OnboardingRoute());
                          },
                    style: context.theme
                        .buttonStyle(
                          buttonType: ButtonTypes.TRANSPARENT,
                          textStyle: const TextStyle(
                            fontFamily: FontFamily.redHatSemiBold,
                            color: AppColors.primaryTextColor,
                            fontSize: 17,
                          ),
                        )
                        .copyWith(
                          padding:
                              const MaterialStatePropertyAll(EdgeInsets.zero),
                        ),
                    child: const Text('Skip'),
                  );
                },
              ),
              Gap(max(context.bottomPadding, 12)),
            ],
          );
        },
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
    final btcAddressRegex = RegExp(r'^(bc1|[13])[a-zA-HJ-NP-Z0-9]{33,39}$');
    return btcAddressRegex.hasMatch(address);
  }

  Future<void> _toggleCard() async {
    await Future.delayed(const Duration(milliseconds: 400));
    await _flipCardController.toggleCard();
  }
}
