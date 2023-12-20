import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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

import '../../constants/card_color.dart';
import '../../constants/card_record.dart';
import '../../constants/card_type.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../services/cloud_firestore_service.dart';
import '../../services/firebase_service.dart';
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
class CardFillPage extends StatefulWidget {
  const CardFillPage({
    super.key,
    this.receivedData,
    this.onChangeCard,
  });

  final String? receivedData;
  final CardChangeCallBack? onChangeCard;

  @override
  State<CardFillPage> createState() => _CardFillPageState();
}

class _CardFillPageState extends State<CardFillPage> with TickerProviderStateMixin {
  ConnectivityResult _connectionStatus = ConnectivityResult.none;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late int cardCarouselIndex = _balanceStore.cards.length - 1;
  final _flipCardController = FlipCardController();
  final _lineStore = LinesStore();
  final _focusNode = FocusNode();
  final _addressState = AddressState();
  final _acceptState = AcceptState();
  final _checkboxState = CheckboxState();
  late String btcAddress = '';
  late UniqueKey uniqueKey = UniqueKey();
  late TextEditingController _btcAddressController = TextEditingController();
  late AnimationController _textFieldAnimationController;
  final ShakeAnimationController _shakeAnimationController = ShakeAnimationController();

  late AnimationController _lottieController;

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  ValidationState get _validationStore => GetIt.I<ValidationState>();

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _nfcStop();
    _toggleCard();
    _btcAddressController.addListener(() {
      _validateBTCAddress();
      _balanceStore.getCard(receivedData: widget.receivedData, textEditingController: _btcAddressController);
    });

    _btcAddressController = TextEditingController();
    _btcAddressController.text = widget.receivedData ?? '';
    _validationStore
      ..isValid = true
      ..isInvalidAddress = true;
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
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    if (widget.receivedData != null) {
      onInitWithAddress();
      _balanceStore.getCard(receivedData: widget.receivedData, textEditingController: _btcAddressController);
    }
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    _focusNode.dispose();
    _lottieController.dispose();
    _textFieldAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
                onPressed: () async {
                  unawaited(
                    _flipCardController.controller!.value == 1 && _lineStore.isLineVisible
                        ? makeLineInvisible()
                        : router.pop(),
                  );
                  await Future.delayed(const Duration(milliseconds: 500));
                  _checkboxState.isActive = false;
                  _acceptState.isAccepted = true;
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
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Observer(
            builder: (context) {
              return Expanded(
                child: FlipCard(
                  flipOnTouch: false,
                  controller: _flipCardController,
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
                              image: Assets.images.card.front.image().image,
                            ),
                          ),
                          child: Center(
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
                                        padding: EdgeInsets.symmetric(
                                          horizontal: context.height > 667 ? 65 : 85,
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
                                        padding: EdgeInsets.symmetric(
                                          horizontal: context.height > 667 ? 65 : 85,
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

                                                        if (_balanceStore.selectedCard != null &&
                                                            _balanceStore.selectedCard!.data != null &&
                                                            data != null) {
                                                          final cardBalance = _balanceStore.selectedCard!.data!.balance;
                                                          final cardTxoSum =
                                                              _balanceStore.selectedCard!.data!.spentTxoSum;
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
                          ),
                        ),
                      ),
                    ],
                  ),
                  back: ClipRRect(
                    clipBehavior: Clip.hardEdge,
                    child: Center(
                      child: AnimatedContainer(
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
                            image: !_addressState.isAddressVisible
                                ? Assets.images.card.back.image().image
                                : Assets.images.card.filledBack.image().image,
                          ),
                        ),
                        child: Row(
                          children: [
                            Observer(
                              builder: (context) {
                                return AnimatedContainer(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                  child: !_addressState.isAddressVisible
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
                                                    opacity: _lineStore.isLineVisible ? 1 : 0,
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
                                );
                              },
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
                              opacity: _lineStore.isLineVisible ? 0 : 1,
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
                                      Assets.icons.coinplusLogo.image(height: 32),
                                    ],
                                  ),
                                  if (context.height > 844) const Gap(24) else const Gap(21.5),
                                  ScaleTransition(
                                    scale: _textFieldAnimationController,
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
                                              color: _focusNode.hasFocus ? Colors.blue : const Color(0xFFFBB270),
                                              width: _focusNode.hasFocus ? 1 : 3,
                                            ),
                                            borderRadius: BorderRadius.circular(context.height > 667 ? 28 : 25),
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
                                                      readOnly: !_validationStore.isValid && true,
                                                      textAlignVertical: TextAlignVertical.top,
                                                      autocorrect: false,
                                                      keyboardType: TextInputType.text,
                                                      textAlign: TextAlign.center,
                                                      onChanged: (value) {
                                                        if (value.length > 25) {
                                                          _validateBTCAddress();
                                                        }
                                                        btcAddress = value;
                                                      },
                                                      onEditingComplete: () {
                                                        if (btcAddress.length > 25) {
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
                                                        setState(() {
                                                          _btcAddressController.text = res;
                                                        });
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
                                        Observer(
                                          builder: (context) {
                                            return Visibility(
                                              visible: !_validationStore.isInvalidAddress,
                                              child: Positioned(
                                                left: 6,
                                                right: 6,
                                                top: 6,
                                                child:
                                                    Assets.icons.validationIndicatorGreenTop.image(color: Colors.red),
                                              ),
                                            );
                                          },
                                        ),
                                        Observer(
                                          builder: (context) {
                                            return Visibility(
                                              visible: !_validationStore.isInvalidAddress,
                                              child: Positioned(
                                                left: 6,
                                                right: 6,
                                                bottom: 6,
                                                child: Assets.icons.validationIndicatorGreenBottom
                                                    .image(color: Colors.red),
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
                                  Assets.icons.cardBackText.image(height: 55),
                                  Gap(context.height * 0.02),
                                  SizedBox(
                                    width: 115,
                                    child: Assets.icons.cardBackLink.image(),
                                  ),
                                  Gap(context.height * 0.025),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          if (context.height > 844) Gap(context.height * 0.001) else Gap(context.height * 0.02),
          Observer(
            builder: (context) {
              return ShakeAnimationWidget(
                shakeRange: 0.3,
                isForward: false,
                shakeAnimationController: _shakeAnimationController,
                shakeAnimationType: ShakeAnimationType.LeftRightShake,
                child: Stack(
                  children: [
                    AnimatedCrossFade(
                      firstChild: FutureBuilder<bool?>(
                        future: _balanceStore.getCard(
                          receivedData: widget.receivedData,
                          textEditingController: _btcAddressController,
                        ),
                        builder: (context, snapshot) {
                          bool? isActivated = false;
                          isActivated = snapshot.data;
                          return AnimatedCrossFade(
                            firstChild: Observer(
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    _checkboxState.makeActiveCheckbox();
                                    HapticFeedback.heavyImpact();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: _checkboxState.isActivatedCheckBox
                                            ? const Color(0xFF73C3A6)
                                            : _acceptState.isCheckboxAccepted
                                                ? Colors.grey.withOpacity(0.3)
                                                : const Color(0xFFFF2E00).withOpacity(0.6),
                                      ),
                                      color: _checkboxState.isActivatedCheckBox
                                          ? const Color(0xFF73C3A6).withOpacity(0.1)
                                          : _acceptState.isCheckboxAccepted
                                              ? Colors.white.withOpacity(0.7)
                                              : const Color(0xFFFF2E00).withOpacity(0.05),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Column(
                                        children: [
                                          const Text(
                                            'This card was previously activated!',
                                            style: TextStyle(
                                              fontFamily: FontFamily.redHatMedium,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: AppColors.textHintsColor,
                                            ),
                                          ).expandedHorizontally(),
                                          const Gap(4),
                                          const Text(
                                            "This card has been used previously, and Secrets 1 and 2 were revealed. Others may have access to the funds. If you didn't activate the card yourself, please avoid using it.",
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
                                );
                              },
                            ),
                            secondChild: Observer(
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
                                        AnimatedCrossFade(
                                          firstChild: const Text(
                                            'Fill in the address of your physical card wallet',
                                            style: TextStyle(
                                              fontFamily: FontFamily.redHatMedium,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: AppColors.textHintsColor,
                                            ),
                                          ).expandedHorizontally(),
                                          secondChild: const Text(
                                            'Coinplus Virtual Card',
                                            style: TextStyle(
                                              fontFamily: FontFamily.redHatMedium,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: AppColors.textHintsColor,
                                            ),
                                          ).expandedHorizontally(),
                                          crossFadeState: _addressState.isAddressVisible
                                              ? CrossFadeState.showSecond
                                              : CrossFadeState.showFirst,
                                          duration: const Duration(milliseconds: 400),
                                        ),
                                        const Gap(4),
                                        AnimatedCrossFade(
                                          firstChild: const Text(
                                            'Please fill the address from your physical card into the address input field, or scan the QR code.',
                                            style: TextStyle(
                                              fontFamily: FontFamily.redHatMedium,
                                              fontSize: 14,
                                              color: AppColors.textHintsColor,
                                            ),
                                          ).expandedHorizontally(),
                                          secondChild: const Text(
                                            'This is the virtual copy of your physical Coinplus Card with its address and the balance shown above. You can save it in the app for further easy access and tracking.',
                                            style: TextStyle(
                                              fontFamily: FontFamily.redHatMedium,
                                              fontSize: 14,
                                              color: AppColors.textHintsColor,
                                            ),
                                          ).expandedHorizontally(),
                                          crossFadeState: _addressState.isAddressVisible
                                              ? CrossFadeState.showSecond
                                              : CrossFadeState.showFirst,
                                          duration: const Duration(milliseconds: 400),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            crossFadeState: isActivated == true ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                            duration: const Duration(milliseconds: 400),
                          );
                        },
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
                                  'Make sure to keep your card safe! You will need your Secret 1 and Secret 2 in the future to manage your crypto.',
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
                      crossFadeState: !_lineStore.isLineVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 400),
                    ).paddingHorizontal(16),
                    Visibility(
                      visible: !_lineStore.isLineVisible,
                      child: FutureBuilder<bool?>(
                        future: _balanceStore.getCard(
                          receivedData: widget.receivedData,
                          textEditingController: _btcAddressController,
                        ),
                        builder: (context, snapshot) {
                          final isActivated = snapshot.data;
                          return Visibility(
                            visible: isActivated == true,
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
                                          color: _acceptState.isCheckboxAccepted
                                              ? Colors.grey.withOpacity(0.5)
                                              : const Color(0xFFFF2E00).withOpacity(0.6),
                                        ),
                                        value: _checkboxState.isActivatedCheckBox,
                                        onChanged: (_) {
                                          _checkboxState.makeActiveCheckbox();
                                        },
                                        splashRadius: 15,
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
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
          if (context.height > 844) Gap(context.height * 0.04) else Gap(context.height * 0.03),
          Observer(
            builder: (_) {
              return _lineStore.isLineVisible
                  ? LoadingButton(
                      onPressed: () async {
                        if (_checkboxState.isActive) {
                          unawaited(signInAnonymously(address: _btcAddressController.text));
                          if (widget.receivedData == null) {
                            final card = await getCardData(_btcAddressController.text);
                            if (card != null) {
                              unawaited(connectedCount(_btcAddressController.text));
                              _balanceStore.saveSelectedCardAsTracker(
                                color: CardColor.ORANGE,
                                label: WalletType.COINPLUS_WALLET,
                                name: 'Coinplus Bitcoin Wallet',
                              );
                            } else {
                              _balanceStore.saveSelectedCardAsTracker(
                                color: CardColor.ORANGE,
                                label: WalletType.TRACKER_PLUS,
                                name: 'Bitcoin Wallet',
                              );
                            }
                          } else {
                            final card = await getCardData(widget.receivedData!);
                            if (card != null) {
                              unawaited(connectedCount(widget.receivedData!));
                              _balanceStore.saveSelectedCardAsTracker(
                                color: CardColor.ORANGE,
                                label: WalletType.COINPLUS_WALLET,
                                name: 'Coinplus Bitcoin Wallet',
                              );
                            } else {
                              _balanceStore.saveSelectedCardAsTracker(
                                color: CardColor.ORANGE,
                                label: WalletType.TRACKER_PLUS,
                                name: 'Bitcoin Wallet',
                              );
                            }
                          }
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
                  : FutureBuilder<bool?>(
                      future: _balanceStore.getCard(
                        receivedData: widget.receivedData,
                        textEditingController: _btcAddressController,
                      ),
                      builder: (context, snapshot) {
                        final isActivated = snapshot.data;
                        return Observer(
                          builder: (context) {
                            return LoadingButton(
                              onPressed: _connectionStatus == ConnectivityResult.none
                                  ? null
                                  : _addressState.isAddressVisible
                                      ? _checkboxState.isActivatedCheckBox
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
                                          : () async {
                                              if (isActivated == true) {
                                                await HapticFeedback.vibrate();
                                                _acceptState.checkboxAccept();
                                                _shakeAnimationController.start();
                                                await Future.delayed(
                                                  const Duration(
                                                    milliseconds: 600,
                                                  ),
                                                );
                                                _shakeAnimationController.stop();
                                              } else {
                                                final cardIndex = _balanceStore.cards.indexWhere(
                                                  (element) => element.address == _balanceStore.selectedCard?.address,
                                                );
                                                if (cardIndex != -1) {
                                                  await alreadySavedCard(context);
                                                } else {
                                                  if (_flipCardController.state!.isFront) {
                                                    await _toggleCard();
                                                    _lineStore.makeVisible();
                                                  }
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
                        );
                      },
                    );
            },
          ),
          if (context.height > 844) Gap(context.height * 0.1) else Gap(context.height * 0.05),
        ],
      ),
    );
  }

  Future<void> _validateBTCAddress() async {
    final btcAddress = _btcAddressController.text.trim();
    if (btcAddress.length >= 26) {
      await _balanceStore.getSelectedCard(btcAddress);
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
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException {
      return;
    }
    if (!mounted) {
      return Future.value();
    }
    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    setState(() {
      _connectionStatus = result;
    });
  }

  Future<void> onInitWithAddress() async {
    _lottieController.reset();
    await _validateBTCAddress();
  }

  Future<void> _nfcStop() async {
    await Future.delayed(const Duration(milliseconds: 10000));
    await NfcManager.instance.stopSession();
  }

  Future<void> _toggleCard() async {
    await Future.delayed(const Duration(milliseconds: 400));
    await _flipCardController.toggleCard();
  }

  Future<void> makeLineInvisible() async {
    await _toggleCard();
    await Future.delayed(const Duration(milliseconds: 350));
    _lineStore.makeInvisible();
  }
}
