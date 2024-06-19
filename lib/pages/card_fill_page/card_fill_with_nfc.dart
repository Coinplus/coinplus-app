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
import 'package:mobx/mobx.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

import '../../constants/card_color.dart';
import '../../constants/card_type.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../models/amplitude_user_property_model/amplitude_user_property_model.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../services/amplitude_service.dart';
import '../../services/cloud_firestore_service.dart';
import '../../store/address_and_balance_state/address_and_balance_state.dart';
import '../../store/all_settings_state/all_settings_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/connectivity_store/connectivity_store.dart';
import '../../store/history_page_store/history_page_store.dart';
import '../../store/market_page_store/market_page_store.dart';
import '../../store/qr_detect_state/qr_detect_state.dart';
import '../../utils/card_color_detecting.dart';
import '../../utils/card_nfc_session.dart';
import '../../utils/custom_paint_lines.dart';
import '../../utils/data_utils.dart';
import '../../widgets/all_alert_dialogs/already_saved_card_dialog/already_saved_card_dialog.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button/loading_button.dart';
import '../splash_screen/splash_screen.dart';

@RoutePage()
class CardFillWithNfc extends StatefulWidget {
  const CardFillWithNfc({
    super.key,
    this.receivedData,
    this.cardColor,
    this.isOriginalCard,
    this.isMiFareUltralight,
    this.isOldCard,
    this.isActivated,
  });

  final String? receivedData;
  final String? cardColor;
  final bool? isOriginalCard;
  final bool? isMiFareUltralight;
  final bool? isOldCard;
  final bool? isActivated;

  @override
  State<CardFillWithNfc> createState() => _CardFillWithNfcState();
}

class _CardFillWithNfcState extends State<CardFillWithNfc>
    with TickerProviderStateMixin {
  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final _flipCardController = FlipCardController();
  final _focusNode = FocusNode();
  final _addressState = AddressState(CardType.CARD);
  final _allSettingsState = AllSettingsState();
  late String btcAddress = '';
  late final TextEditingController _btcAddressController =
      TextEditingController();
  late AnimationController _textFieldAnimationController;
  final ShakeAnimationController _shakeAnimationController =
      ShakeAnimationController();

  late AnimationController _lottieController;
  final _validationStore = ValidationState();
  final _connectivityStore = ConnectivityStore();

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  @override
  void initState() {
    super.initState();
    _toggleCard();
    if (Platform.isAndroid) {
      nfcStop();
    }
    _btcAddressController.addListener(_addressState.validateBTCAddress);
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
      Future.delayed(const Duration(milliseconds: 300), () {
        _btcAddressController.text = widget.receivedData ?? '';
        _addressState.btcAddress = widget.receivedData!;
      });
    }
    _connectivityStore.initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged
        .listen(_connectivityStore.updateConnectionStatus);
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
                onPressed: () async {
                  unawaited(
                    _flipCardController.controller!.value == 1 &&
                            _allSettingsState.isLineVisible
                        ? makeLineInvisible()
                        : router.maybePop(),
                  );
                  await Future.delayed(const Duration(milliseconds: 500));
                  _allSettingsState
                    ..isActive = false
                    ..isAccepted = true;
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Observer(
            builder: (context) {
              return ReactionBuilder(
                builder: (context) {
                  return reaction(
                    (p0) => _addressState.isAddressValid,
                    (p0) async {
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
                    },
                  );
                },
                child: FlipCard(
                  flipOnTouch: false,
                  controller: _flipCardController,
                  front: Container(
                    height: context.height > 667 ? 455 : 365,
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
                        image:
                            getFrontImageForCardColor(widget.cardColor).image,
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
                                    horizontal: context.height < 932
                                        ? context.height < 867.4
                                            ? context.height > 844
                                                ? context.width *
                                                    0.11 // iPhone 14 Pro (ok)
                                                : context.height > 667
                                                    ? context.width *
                                                        0.17 //iPhone 13 Pro
                                                    : context.width *
                                                        0.23 // iPhone 7/8/SE (ok)
                                            : context.width *
                                                0.15 //Samsung large display
                                        : context.width *
                                            0.15, //iPhone 13 Pro Max,
                                  ),
                                  child: ScaleTap(
                                    enableFeedback: false,
                                    onPressed: () async {
                                      await recordAmplitudeEvent(
                                        AddressCopied(
                                          walletType: 'Card',
                                          walletAddress: _balanceStore
                                              .selectedCard!.address,
                                          activated: false,
                                          source: 'Balance',
                                        ),
                                      );
                                      if (Platform.isIOS) {
                                        await Clipboard.setData(
                                          ClipboardData(
                                            text: _balanceStore
                                                .selectedCard!.address
                                                .toString(),
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
                                                  fontFamily:
                                                      FontFamily.redHatMedium,
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
                                            text: _balanceStore
                                                .selectedCard!.address
                                                .toString(),
                                          ),
                                        ).then(
                                          (_) {
                                            HapticFeedback.mediumImpact();
                                          },
                                        );
                                      }
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
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
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
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
                                                      padding: EdgeInsets.all(
                                                        4,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 10,
                                                            width: 10,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color:
                                                                  Colors.white,
                                                              strokeWidth: 3,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }
                                                  final visibleAddress =
                                                      getSplitAddress(
                                                    _balanceStore
                                                        .selectedCard!.address,
                                                  );
                                                  return Text(
                                                    visibleAddress,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: const TextStyle(
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                    horizontal: context.height < 932
                                        ? context.height < 867.4
                                            ? context.height > 844
                                                ? context.width *
                                                    0.11 // iPhone 14 Pro (ok)
                                                : context.height > 667
                                                    ? context.width *
                                                        0.17 //iPhone 13 Pro
                                                    : context.width *
                                                        0.23 // iPhone 7/8/SE (ok)
                                            : context.width *
                                                0.15 //Samsung large display
                                        : context.width *
                                            0.15, //iPhone 13 Pro Max,
                                  ),
                                  child: ScaleTap(
                                    enableFeedback: false,
                                    onPressed: () {},
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(6),
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
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      color: Colors.white,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Observer(
                                                builder: (context) {
                                                  final myFormat = NumberFormat
                                                      .decimalPatternDigits(
                                                    locale: 'en_us',
                                                    decimalDigits: 2,
                                                  );
                                                  final data = _marketPageStore
                                                      .singleCoin?.result.first;
                                                  if (_balanceStore
                                                              .selectedCard !=
                                                          null &&
                                                      _balanceStore
                                                              .selectedCard!
                                                              .finalBalance !=
                                                          null &&
                                                      data != null) {
                                                    final cardBalance =
                                                        _balanceStore
                                                            .selectedCard!
                                                            .finalBalance!;

                                                    if (cardBalance.isNaN) {
                                                      return const Padding(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              height: 10,
                                                              width: 10,
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color: Colors
                                                                    .white,
                                                                strokeWidth: 3,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }

                                                    return Row(
                                                      children: [
                                                        Text(
                                                          '\$${myFormat.format(cardBalance / 100000000 * data.price)}',
                                                          style:
                                                              const TextStyle(
                                                            fontFamily: FontFamily
                                                                .redHatMedium,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors.white,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ],
                                                    );
                                                  } else {
                                                    return const Padding(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 10,
                                                            width: 10,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color:
                                                                  Colors.white,
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
                  back: ClipRRect(
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: AnimatedContainer(
                          curve: Curves.decelerate,
                          duration: const Duration(milliseconds: 300),
                          height: context.height > 667 ? 455 : 365,
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
                                  ? getBackImageForCardColor(widget.cardColor)
                                      .image
                                  : getFilledBackImageForCardColor(
                                      widget.cardColor,
                                    ).image,
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
                                                    Gap(context.width * 0.08)
                                                  else if (context.height > 667)
                                                    Gap(context.width * 0.075)
                                                  else
                                                    Gap(
                                                      context.width * 0.125,
                                                    ) //iPhone 13 Pro
                                                else
                                                  Gap(
                                                    context.width * 0.103,
                                                  ) //Samsung large display
                                              else
                                                Gap(
                                                  context.width * 0.115,
                                                ), //iPhone 13 Pro Max
                                              Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Assets.images.card.secret1
                                                      .image(
                                                    height: context.height > 667
                                                        ? 180
                                                        : 150,
                                                  ),
                                                  if (context.height > 667)
                                                    const Gap(70)
                                                  else
                                                    const Gap(50),
                                                  Assets.images.card.secret2
                                                      .image(
                                                    height: context.height > 667
                                                        ? 180
                                                        : 150,
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
                                                      opacity: _allSettingsState
                                                              .isLineVisible
                                                          ? 1
                                                          : 0,
                                                      child: CustomPaint(
                                                        size: Size(
                                                          context.height > 852
                                                              ? context.height >
                                                                      844
                                                                  ? 42
                                                                  : context.height >
                                                                          667
                                                                      ? 28
                                                                      : 38
                                                              : 30,
                                                          265,
                                                        ),
                                                        painter:
                                                            LineCustomPaint(),
                                                      ),
                                                    );
                                                  },
                                                ),
                                                Opacity(
                                                  opacity:
                                                      _validationStore.isValid
                                                          ? 0
                                                          : 1,
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceAround,
                                                    children: [
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          border: Border.all(
                                                            color: AppColors
                                                                .primaryTextColor,
                                                            width: 1.5,
                                                          ),
                                                        ),
                                                        child: Assets
                                                            .images.card.secret1
                                                            .image(
                                                          height:
                                                              context.height >
                                                                      667
                                                                  ? 180
                                                                  : 150,
                                                        ),
                                                      ),
                                                      if (context.height > 667)
                                                        const Gap(70)
                                                      else
                                                        const Gap(50),
                                                      Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          border: Border.all(
                                                            color: AppColors
                                                                .primaryTextColor,
                                                            width: 1.5,
                                                          ),
                                                        ),
                                                        child: Assets
                                                            .images.card.secret2
                                                            .image(
                                                          height:
                                                              context.height >
                                                                      667
                                                                  ? 180
                                                                  : 150,
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
                                    Gap(context.width * 0.114)
                                  else if (context.height > 667)
                                    Gap(context.width * 0.1175)
                                  else
                                    Gap(context.width * 0.065)
                                else
                                  Gap(context.height * 0.05)
                              else
                                Gap(context.height * 0.049),
                              Opacity(
                                opacity:
                                    _allSettingsState.isLineVisible ? 0 : 1,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    if (context.height < 932)
                                      if (context.height < 867.4)
                                        if (context.height > 844)
                                          Gap(context.height * 0.035)
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
                                        if (!(widget.cardColor == '1'))
                                          Assets.icons.coinplusLogo
                                              .image(height: 32)
                                        else
                                          Assets.icons.coinplusLogoBlack
                                              .image(height: 32),
                                      ],
                                    ),
                                    if (context.height > 844)
                                      const Gap(24)
                                    else
                                      const Gap(21.5),
                                    ScaleTransition(
                                      scale: _textFieldAnimationController,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: context.height < 932
                                                ? context.height < 867.4
                                                    ? context.height > 844
                                                        ? context.height * 0.26
                                                        : context.height * 0.265
                                                    : context.height * 0.24
                                                : context.height * 0.24,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: _focusNode.hasFocus
                                                    ? Colors.blue
                                                    : widget.cardColor == '1'
                                                        ? const Color(
                                                            0xFFF0563C,
                                                          )
                                                        : const Color(
                                                            0xFFFBB270,
                                                          ),
                                                width:
                                                    _focusNode.hasFocus ? 1 : 3,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                context.height > 667 ? 28 : 25,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: context.height < 932
                                                      ? context.height < 867.4
                                                          ? context.height > 844
                                                              ? context.width *
                                                                  0.241
                                                              : context.height >
                                                                      667
                                                                  ? context
                                                                          .width *
                                                                      0.25
                                                                  : context
                                                                          .width *
                                                                      0.21
                                                          : context.width * 0.23
                                                      : context.width * 0.225,
                                                  height: context.height * 0.14,
                                                  child: Observer(
                                                    builder: (context) {
                                                      return TextField(
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                            35,
                                                          ),
                                                        ],
                                                        readOnly:
                                                            !_validationStore
                                                                    .isValid &&
                                                                true,
                                                        textAlignVertical:
                                                            TextAlignVertical
                                                                .top,
                                                        autocorrect: false,
                                                        keyboardType:
                                                            TextInputType.text,
                                                        textAlign:
                                                            TextAlign.center,
                                                        onChanged: (value) {
                                                          if (value.length >
                                                              25) {
                                                            _addressState
                                                              ..btcAddress =
                                                                  value
                                                              ..validateBTCAddress();
                                                            btcAddress = value;
                                                            hasShownWallet()
                                                                .then(
                                                              (hasShown) async {
                                                                if (hasShown) {
                                                                  await recordAmplitudeEvent(
                                                                    AddressFilled(
                                                                      source:
                                                                          'Wallet',
                                                                      walletAddress:
                                                                          btcAddress,
                                                                      walletType:
                                                                          'Card',
                                                                    ),
                                                                  );
                                                                } else {
                                                                  await recordAmplitudeEvent(
                                                                    AddressFilled(
                                                                      source:
                                                                          'Onboarding',
                                                                      walletAddress:
                                                                          btcAddress,
                                                                      walletType:
                                                                          'Card',
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            );
                                                          }
                                                        },
                                                        onEditingComplete: () {
                                                          if (btcAddress
                                                                  .length >
                                                              25) {
                                                            _addressState
                                                                .validateBTCAddress();
                                                          }
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
                                                          fontFamily: FontFamily
                                                              .redHatLight,
                                                        ),
                                                        onTapOutside: (_) {
                                                          WidgetsBinding
                                                              .instance
                                                              .focusManager
                                                              .primaryFocus
                                                              ?.unfocus();
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          hintText:
                                                              'Write here your card address',
                                                          fillColor:
                                                              Colors.white,
                                                          hintMaxLines: 10,
                                                          hintStyle: TextStyle(
                                                            fontFamily:
                                                                FontFamily
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
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                              24,
                                                            ),
                                                          ),
                                                          enabledBorder:
                                                              OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
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
                                                          unawaited(
                                                            recordAmplitudeEvent(
                                                              const QrButtonClicked(
                                                                walletType:
                                                                    'Card',
                                                                source:
                                                                    'Connect',
                                                              ),
                                                            ),
                                                          );
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
                                                            QrScannerRoute(),
                                                          );
                                                          if (res == null) {
                                                            return;
                                                          }
                                                          await hasShownWallet()
                                                              .then(
                                                            (hasShown) async {
                                                              if (hasShown) {
                                                                unawaited(
                                                                  recordAmplitudeEvent(
                                                                    QrScanned(
                                                                      source:
                                                                          'Wallet',
                                                                      walletAddress:
                                                                          res,
                                                                    ),
                                                                  ),
                                                                );
                                                              } else {
                                                                unawaited(
                                                                  recordAmplitudeEvent(
                                                                    QrScanned(
                                                                      source:
                                                                          'Onboarding',
                                                                      walletAddress:
                                                                          res,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                            },
                                                          );
                                                          setState(() {
                                                            _btcAddressController
                                                                .text = res;
                                                          });
                                                          _addressState
                                                              .btcAddress = res;

                                                          await _addressState
                                                              .validateBTCAddress();
                                                        },
                                                        child: SizedBox(
                                                          height: 50,
                                                          child: Image.asset(
                                                            'assets/icons/qr_code.png',
                                                          ),
                                                        ),
                                                      )
                                                    : Lottie.asset(
                                                        'assets/lottie_animations/address_validation_success.json',
                                                        height: 40,
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
                                    if (context.height > 844)
                                      Gap(context.height * 0.03)
                                    else
                                      context.height > 667
                                          ? Gap(context.height * 0.035)
                                          : Gap(context.height * 0.025),
                                    if (!(widget.cardColor == '1'))
                                      Assets.icons.cardBackText
                                          .image(height: 55)
                                    else
                                      Assets.icons.cardBackTextBlack
                                          .image(height: 55),
                                    Gap(context.height * 0.02),
                                    if (!(widget.cardColor == '1'))
                                      SizedBox(
                                        width: 115,
                                        child:
                                            Assets.icons.cardBackLink.image(),
                                      )
                                    else
                                      SizedBox(
                                        width: 115,
                                        child: Assets.icons.cardBackLinkBlack
                                            .image(),
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
                ),
              );
            },
          ),
          if (context.height > 667) const Gap(10) else const SizedBox(),
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
                          firstChild: AnimatedCrossFade(
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
                            secondChild: Observer(
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    hasShownWallet().then(
                                      (hasShown) async {
                                        if (hasShown) {
                                          unawaited(
                                            recordAmplitudeEvent(
                                              ActivatedCheckboxClicked(
                                                source: 'Wallet',
                                                walletType: 'Card',
                                                walletAddress: _balanceStore
                                                    .selectedCard!.address,
                                              ),
                                            ),
                                          );
                                        } else {
                                          unawaited(
                                            recordAmplitudeEvent(
                                              ActivatedCheckboxClicked(
                                                source: 'Onboarding',
                                                walletType: 'Card',
                                                walletAddress: _balanceStore
                                                    .selectedCard!.address,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    );
                                    _allSettingsState.makeActiveCheckbox();
                                    HapticFeedback.heavyImpact();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: _allSettingsState
                                                .isActivatedCheckBox
                                            ? const Color(0xFF73C3A6)
                                            : const Color(0xFFFF2E00)
                                                .withOpacity(0.6),
                                      ),
                                      color:
                                          _allSettingsState.isActivatedCheckBox
                                              ? const Color(0xFF73C3A6)
                                                  .withOpacity(0.1)
                                              : const Color(0xFFFF2E00)
                                                  .withOpacity(0.05),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Column(
                                        children: [
                                          const Text(
                                            'This card was previously activated!',
                                            style: TextStyle(
                                              fontFamily:
                                                  FontFamily.redHatMedium,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: AppColors.textHintsColor,
                                            ),
                                          ).expandedHorizontally(),
                                          const Gap(4),
                                          const Text(
                                            "This card has been used previously, and Secrets 1 and 2 were revealed. Others may have access to the funds. If you didn't activate the card yourself, please avoid using it.",
                                            style: TextStyle(
                                              fontFamily:
                                                  FontFamily.redHatMedium,
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
                            crossFadeState: widget.isActivated == true
                                ? CrossFadeState.showSecond
                                : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 400),
                          ),
                          secondChild: GestureDetector(
                            onTap: () {
                              unawaited(
                                recordAmplitudeEvent(
                                  const WarningCheckboxClicked(),
                                ),
                              );
                              _allSettingsState.makeActive();
                              HapticFeedback.heavyImpact();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: _allSettingsState.isActive
                                      ? const Color(0xFF73C3A6)
                                      : _allSettingsState.isAccepted
                                          ? Colors.grey.withOpacity(0.3)
                                          : const Color(0xFFFF2E00)
                                              .withOpacity(0.6),
                                ),
                                color: _allSettingsState.isActive
                                    ? const Color(0xFF73C3A6).withOpacity(0.1)
                                    : _allSettingsState.isAccepted
                                        ? Colors.white.withOpacity(0.7)
                                        : const Color(0xFFFF2E00)
                                            .withOpacity(0.05),
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
                          crossFadeState: !_allSettingsState.isLineVisible
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 400),
                        ),
                      ],
                    ).paddingHorizontal(16),
                    Visibility(
                      visible: !_allSettingsState.isLineVisible,
                      child: Visibility(
                        visible: widget.isActivated == true,
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
                                    activeColor: const Color(0xFF73C3A6)
                                        .withOpacity(0.5),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    side: BorderSide(
                                      color: const Color(0xFFFF2E00)
                                          .withOpacity(0.6),
                                    ),
                                    value:
                                        _allSettingsState.isActivatedCheckBox,
                                    onChanged: (_) {
                                      hasShownWallet().then(
                                        (hasShown) async {
                                          if (hasShown) {
                                            unawaited(
                                              recordAmplitudeEvent(
                                                ActivatedCheckboxClicked(
                                                  source: 'Wallet',
                                                  walletType: 'Card',
                                                  walletAddress: _balanceStore
                                                      .selectedCard!.address,
                                                ),
                                              ),
                                            );
                                          } else {
                                            unawaited(
                                              recordAmplitudeEvent(
                                                ActivatedCheckboxClicked(
                                                  source: 'Onboarding',
                                                  walletType: 'Card',
                                                  walletAddress: _balanceStore
                                                      .selectedCard!.address,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      );
                                      _allSettingsState.makeActiveCheckbox();
                                    },
                                    splashRadius: 15,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Observer(
                      builder: (context) {
                        return Visibility(
                          visible: _allSettingsState.isLineVisible,
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
                                      activeColor: const Color(0xFF73C3A6)
                                          .withOpacity(0.5),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      side: BorderSide(
                                        color: _allSettingsState.isAccepted
                                            ? Colors.grey.withOpacity(0.5)
                                            : const Color(0xFFFF2E00)
                                                .withOpacity(0.6),
                                      ),
                                      value: _allSettingsState.isActive,
                                      onChanged: (_) {
                                        recordAmplitudeEvent(
                                          const WarningCheckboxClicked(),
                                        );
                                        _allSettingsState.makeActive();
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
                  ],
                ),
              );
            },
          ),
          const Spacer(),
          Observer(
            builder: (_) {
              return _allSettingsState.isLineVisible
                  ? LoadingButton(
                      onPressed: () async {
                        if (_allSettingsState.isActive) {
                          if (widget.isOriginalCard == true) {
                            unawaited(connectedCount(widget.receivedData!));
                            if (widget.cardColor == '0') {
                              _balanceStore.saveSelectedCard(
                                color: CardColor.ORANGE,
                              );
                            } else if (widget.cardColor == '1') {
                              _balanceStore.saveSelectedCard(
                                color: CardColor.WHITE,
                              );
                            } else if (widget.cardColor == '2') {
                              _balanceStore.saveSelectedCard(
                                color: CardColor.BLACK,
                              );
                            } else {
                              _balanceStore.saveSelectedCard(
                                color: CardColor.ORANGE,
                              );
                            }
                          } else {
                            if (widget.isMiFareUltralight == true) {
                              if (widget.isOldCard == false ||
                                  widget.isOldCard == null) {
                                await recordUserProperty(const Tracker());
                                _balanceStore.saveSelectedCardManually(
                                  color: CardColor.ORANGE,
                                  label: WalletType.TRACKER_PLUS,
                                  name: 'Bitcoin Wallet',
                                );
                              } else {
                                unawaited(connectedCount(widget.receivedData!));
                                _balanceStore.saveSelectedCardManually(
                                  color: CardColor.ORANGE,
                                  label: WalletType.COINPLUS_WALLET,
                                  name: 'Coinplus Bitcoin Wallet',
                                );
                              }
                            } else {
                              await recordUserProperty(const Tracker());
                              _balanceStore.saveSelectedCardManually(
                                color: CardColor.TRACKER,
                                label: WalletType.TRACKER,
                                name: 'Bitcoin Wallet',
                              );
                            }
                          }
                          await hasShownWallet().then((hasShown) {
                            recordAmplitudeEventPartTwo(
                              CardAddedEvent(
                                address: _balanceStore.selectedCard!.address,
                              ),
                            );
                            recordUserProperty(const CardTap());
                            if (hasShown) {
                              router.maybePop();
                            } else {
                              router.pushAndPopAll(
                                const WalletProtectionRoute(),
                              );
                            }
                          });

                          await _historyPageStore.saveAndPatchCardAddress(
                            _balanceStore.selectedCard!.address,
                          );
                          // _balanceStore
                          //     .onCardAdded(_balanceStore.selectedCard!.address);
                        } else {
                          await HapticFeedback.vibrate();
                          _allSettingsState.accept();
                          _shakeAnimationController.start();
                          await Future.delayed(
                            const Duration(
                              milliseconds: 600,
                            ),
                          );
                          _shakeAnimationController.stop();
                        }
                        await hasShownWallet().then(
                          (hasShown) async {
                            if (hasShown) {
                              await recordAmplitudeEvent(
                                GotItClicked(
                                  source: 'Wallet',
                                  walletType: 'Card',
                                  walletAddress:
                                      _balanceStore.selectedCard!.address,
                                ),
                              );
                            } else {
                              await recordAmplitudeEvent(
                                GotItClicked(
                                  source: 'Onboarding',
                                  walletType: 'Card',
                                  walletAddress:
                                      _balanceStore.selectedCard!.address,
                                ),
                              );
                            }
                            await recordAmplitudeEventPartTwo(
                              CardAddedEvent(
                                address: _balanceStore.selectedCard!.address,
                              ),
                            );
                          },
                        );
                      },
                      child: const Text(
                        'Got it',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: FontFamily.redHatSemiBold,
                        ),
                      ),
                    ).paddingHorizontal(49)
                  : Observer(
                      builder: (context) {
                        return LoadingButton(
                          onPressed: _connectivityStore.connectionStatus ==
                                  ConnectivityResult.none
                              ? null
                              : _addressState.isAddressVisible
                                  ? _allSettingsState.isActivatedCheckBox
                                      ? () async {
                                          await hasShownWallet().then(
                                            (hasShown) async {
                                              if (hasShown) {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Wallet',
                                                    walletType: 'Card',
                                                    walletAddress: _balanceStore
                                                        .selectedCard!.address,
                                                  ),
                                                );
                                              } else {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Onboarding',
                                                    walletType: 'Card',
                                                    walletAddress: _balanceStore
                                                        .selectedCard!.address,
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                          final cardIndex =
                                              _balanceStore.cards.indexWhere(
                                            (element) =>
                                                element.address ==
                                                _balanceStore
                                                    .selectedCard?.address,
                                          );
                                          final barIndex =
                                              _balanceStore.bars.indexWhere(
                                            (element) =>
                                                element.address ==
                                                _balanceStore
                                                    .selectedCard?.address,
                                          );
                                          if (cardIndex != -1 ||
                                              barIndex != -1) {
                                            await alreadySavedCard(
                                              context,
                                              _balanceStore
                                                  .selectedCard!.address,
                                            );
                                            // _balanceStore.onCardAdded(
                                            //   _balanceStore
                                            //       .selectedCard!.address,
                                            // );
                                          } else {
                                            await _toggleCard();
                                            await Future.delayed(
                                              const Duration(milliseconds: 300),
                                            );
                                            _allSettingsState.makeVisible();
                                          }
                                        }
                                      : () async {
                                          await hasShownWallet().then(
                                            (hasShown) async {
                                              if (hasShown) {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Wallet',
                                                    walletType: 'Card',
                                                    walletAddress: _balanceStore
                                                        .selectedCard!.address,
                                                  ),
                                                );
                                              } else {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Onboarding',
                                                    walletType: 'Card',
                                                    walletAddress: _balanceStore
                                                        .selectedCard!.address,
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                          if (widget.isActivated == true) {
                                            await HapticFeedback.vibrate();
                                            _allSettingsState.checkboxAccept();
                                            _shakeAnimationController.start();
                                            await Future.delayed(
                                              const Duration(
                                                milliseconds: 600,
                                              ),
                                            );
                                            _shakeAnimationController.stop();
                                          } else {
                                            final cardIndex =
                                                _balanceStore.cards.indexWhere(
                                              (element) =>
                                                  element.address ==
                                                  _balanceStore
                                                      .selectedCard?.address,
                                            );
                                            final barIndex =
                                                _balanceStore.bars.indexWhere(
                                              (element) =>
                                                  element.address ==
                                                  _balanceStore
                                                      .selectedCard?.address,
                                            );

                                            if (cardIndex != -1 ||
                                                barIndex != -1) {
                                              await alreadySavedCard(
                                                context,
                                                _balanceStore
                                                    .selectedCard!.address,
                                              );
                                              // _balanceStore.onCardAdded(
                                              //   _balanceStore
                                              //       .selectedCard!.address,
                                              // );
                                            } else {
                                              if (_flipCardController
                                                  .state!.isFront) {
                                                await _toggleCard();
                                                _allSettingsState.makeVisible();
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
          ),
          const Spacer(flex: 2),
        ],
      ),
    );
  }

  Future<void> _toggleCard() async {
    await Future.delayed(const Duration(milliseconds: 400));
    await _flipCardController.toggleCard();
  }

  Future<void> makeLineInvisible() async {
    await _toggleCard();
    await Future.delayed(const Duration(milliseconds: 350));
    _allSettingsState.makeInvisible();
  }
}
