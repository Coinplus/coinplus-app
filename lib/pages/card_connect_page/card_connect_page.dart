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
import 'package:gaimon/gaimon.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:iosish_shaker/iosish_shaker.dart';
import 'package:lottie/lottie.dart';
import 'package:mobx/mobx.dart';

import '../../all_alert_dialogs/already_saved_card_dialog/already_saved_card_dialog.dart';
import '../../constants/card_color.dart';
import '../../constants/card_record.dart';
import '../../constants/card_type.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../modals/card_blocked_modal/card_blocked_modal.dart';
import '../../modals/tapped_backup_card_modal/tapped_backup_card_modal.dart';
import '../../models/amplitude_event/amplitude_event_part_one/amplitude_event.dart';
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
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/card_color_detecting.dart';
import '../../utils/card_nfc_session.dart';
import '../../utils/custom_paint_lines.dart';
import '../../utils/data_utils.dart';
import '../../utils/responsive_gaps.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/snack_bar_method.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button/loading_button.dart';
import '../splash_screen/splash_screen.dart';

@RoutePage()
class CardConnectPage extends StatefulWidget {
  const CardConnectPage({
    super.key,
    this.receivedData,
    this.onChangeCard,
    this.cardColor,
  });

  final String? receivedData;
  final CardChangeCallBack? onChangeCard;
  final String? cardColor;

  @override
  State<CardConnectPage> createState() => _CardConnectPageState();
}

class _CardConnectPageState extends State<CardConnectPage> with TickerProviderStateMixin {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late int cardCarouselIndex = _balanceStore.cards.length - 1;
  final _flipCardController = FlipCardController();
  final _focusNode = FocusNode();
  final _addressState = AddressState(CardType.CARD);
  final _allSettingsState = AllSettingsState();
  final _connectivityStore = ConnectivityStore();
  late String btcAddress = '';
  late AnimationController _textFieldAnimationController;
  late final TextEditingController _btcAddressController = TextEditingController();
  final ShakerController _shakeAnimationController = ShakerController();

  late AnimationController _lottieController;

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  ValidationState get _validationStore => GetIt.I<ValidationState>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  @override
  void initState() {
    super.initState();
    _validationStore.initColor(widget.cardColor ?? '');
    _connectivityStore.initConnectivity();
    if (Platform.isAndroid) {
      nfcStop();
    }
    _toggleCard();
    _btcAddressController.addListener(() {
      _addressState.validateBTCAddress();
      _balanceStore.getCard(
        receivedData: widget.receivedData,
        textEditingController: _btcAddressController,
      );
    });
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
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_connectivityStore.updateConnectionStatus);
    if (widget.receivedData != null) {
      Future.delayed(const Duration(milliseconds: 300), () {
        _btcAddressController.text = widget.receivedData ?? '';
        _addressState.btcAddress = widget.receivedData!;
      });
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
    final gaps = ResponsiveGaps(context);
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
                highlightColor: Colors.transparent,
                onPressed: () async {
                  unawaited(
                    _flipCardController.controller!.value == 1 && _allSettingsState.isLineVisible
                        ? makeLineInvisible()
                        : router.maybePop(),
                  );
                  await Future.delayed(const Duration(milliseconds: 500));
                  _allSettingsState
                    ..isActive = false
                    ..isAccepted = true;
                },
                icon: Assets.icons.arrowBackIos.image(height: 30),
              ),
            ),
            const Gap(10),
            const Text(
              'Virtual card',
              style: TextStyle(
                fontSize: 28,
                fontFamily: FontFamily.redHatMedium,
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Observer(
            builder: (context) {
              return ReactionBuilder(
                builder: (context) {
                  return reaction(
                    (p0) => _addressState.isAddressValid,
                    (p0) async {
                      final cardData = await getCardData(_addressState.btcAddress);
                      if (cardData != null) {
                        if (cardData.backup != true) {
                          if (cardData.lost != true) {
                            await _validationStore.initColor(_validationStore.color);
                            _validationStore.validate();
                            await Future.delayed(
                              const Duration(seconds: 1),
                            );
                            _focusNode.unfocus();
                            Future.delayed(const Duration(milliseconds: 700), _toggleCard);
                            Future.delayed(
                              const Duration(milliseconds: 1400),
                              () => _addressState.isAddressVisible = true,
                            );
                            await _lottieController.forward(from: 0);
                          } else {
                            Gaimon.error();
                            await hasShownWallet().then((hasShown) {
                              if (hasShown) {
                                router.popUntilRouteWithName(DashboardRoute.name);
                              } else {
                                router.popUntilRouteWithName(OnboardingRoute.name);
                              }
                            });
                            _focusNode.unfocus();
                            _btcAddressController.clear();
                            return;
                          }
                        } else {
                          _focusNode.unfocus();
                          _btcAddressController.clear();
                          return;
                        }
                      } else {
                        await _validationStore.initColor(_validationStore.color);
                        _validationStore.validate();
                        await Future.delayed(
                          const Duration(seconds: 1),
                        );
                        _focusNode.unfocus();
                        Future.delayed(const Duration(milliseconds: 700), _toggleCard);
                        Future.delayed(
                          const Duration(milliseconds: 1400),
                          () => _addressState.isAddressVisible = true,
                        );
                        await _lottieController.forward(from: 0);
                      }
                    },
                  );
                },
                child: FlipCard(
                  flipOnTouch: false,
                  controller: _flipCardController,
                  front: Container(
                    height: context.height > 667 ? 455 : 350,
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
                        image: getFrontImageForCardColor(_validationStore.color).image,
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
                                                ? context.width * 0.11 // iPhone 14 Pro (ok)
                                                : context.height > 667
                                                    ? context.width * 0.17 //iPhone 13 Pro
                                                    : context.width * 0.23 // iPhone 7/8/SE (ok)
                                            : context.width * 0.15 //Samsung large display
                                        : context.width * 0.15, //iPhone 13 Pro Max,
                                  ),
                                  child: ScaleTap(
                                    enableFeedback: false,
                                    onPressed: () async {
                                      await recordAmplitudeEvent(
                                        AddressCopied(
                                          walletType: 'Card',
                                          walletAddress: _balanceStore.selectedCard!.address,
                                          activated: false,
                                          source: 'Balance',
                                        ),
                                      );
                                      if (Platform.isIOS) {
                                        await Clipboard.setData(
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
                                        await Clipboard.setData(
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
                                                      fontFamily: FontFamily.redHatMedium,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Observer(
                                                builder: (context) {
                                                  if (_balanceStore.loadings[_balanceStore.selectedCard?.address] ??
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
                                                              color: Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }
                                                  final visibleAddress = getSplitAddress(
                                                    _balanceStore.selectedCard!.address,
                                                  );
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
                                    horizontal: context.height < 932
                                        ? context.height < 867.4
                                            ? context.height > 844
                                                ? context.width * 0.11 // iPhone 14 Pro (ok)
                                                : context.height > 667
                                                    ? context.width * 0.17 //iPhone 13 Pro
                                                    : context.width * 0.23 // iPhone 7/8/SE (ok)
                                            : context.width * 0.15 //Samsung large display
                                        : context.width * 0.15, //iPhone 13 Pro Max,
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
                                                  final data = _marketPageStore.singleCoin?.result.first;
                                                  if (_balanceStore.selectedCard != null &&
                                                      _balanceStore.selectedCard!.finalBalance != null &&
                                                      data != null) {
                                                    final cardBalance = _balanceStore.selectedCard!.finalBalance!;

                                                    if (cardBalance.isNaN) {
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
                                                          '\$${myFormat.format(cardBalance / 100000000 * data.price)}',
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
                                  ? getBackImageForCardColor(_validationStore.color).image
                                  : getFilledBackImageForCardColor(
                                      _validationStore.color,
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
                                              Gap(gaps.secretStickersGap),
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
                                                      opacity: _allSettingsState.isLineVisible ? 1 : 0,
                                                      child: CustomPaint(
                                                        size: Size(
                                                          gaps.dynamicGap,
                                                          265,
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
                              Gap(gaps.betweenStickersAndTextFieldGap),
                              Opacity(
                                opacity: _allSettingsState.isLineVisible ? 0 : 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Gap(gaps.logoPositionGap),
                                    Row(
                                      children: [
                                        const Gap(15),
                                        if (!(_validationStore.color == '1' || _validationStore.color == 'WHITE'))
                                          Assets.icons.coinplusLogo.image(height: 32)
                                        else
                                          Assets.icons.coinplusLogoBlack.image(height: 32),
                                      ],
                                    ),
                                    if (context.height > 844) const Gap(24) else const Gap(21.5),
                                    ScaleTransition(
                                      scale: _textFieldAnimationController,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height: gaps.containerHeight,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                color: _focusNode.hasFocus ? Colors.blue : const Color(0xFFFBB270),
                                                width: _focusNode.hasFocus ? 1 : 3,
                                              ),
                                              borderRadius: BorderRadius.circular(
                                                context.height > 667 ? 28 : 25,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: gaps.containerWidth,
                                                  height: context.height * 0.14,
                                                  child: Observer(
                                                    builder: (context) {
                                                      return TextField(
                                                        inputFormatters: [
                                                          LengthLimitingTextInputFormatter(
                                                            35,
                                                          ),
                                                        ],
                                                        readOnly: !_validationStore.isValid && true,
                                                        textAlignVertical: TextAlignVertical.top,
                                                        autocorrect: false,
                                                        keyboardType: TextInputType.text,
                                                        textAlign: TextAlign.center,
                                                        onChanged: (value) async {
                                                          if (value.length > 25) {
                                                            _addressState.btcAddress = value;
                                                            btcAddress = value;
                                                            await _addressState.validateBTCAddress();
                                                            await hasShownWallet().then(
                                                              (hasShown) async {
                                                                if (hasShown) {
                                                                  await recordAmplitudeEvent(
                                                                    AddressFilled(
                                                                      source: 'Wallet',
                                                                      walletAddress: btcAddress,
                                                                      walletType: 'Card',
                                                                    ),
                                                                  );
                                                                } else {
                                                                  await recordAmplitudeEvent(
                                                                    AddressFilled(
                                                                      source: 'Onboarding',
                                                                      walletAddress: btcAddress,
                                                                      walletType: 'Card',
                                                                    ),
                                                                  );
                                                                }
                                                              },
                                                            );
                                                            if (_walletProtectState.isValidWalletAddress) {
                                                              final cardData = await getCardData(value);
                                                              if (cardData != null) {
                                                                if (cardData.backup != true) {
                                                                  if (cardData.lost == true) {
                                                                    Gaimon.error();
                                                                    _focusNode.unfocus();
                                                                    _btcAddressController.clear();
                                                                    await hasShownWallet().then((hasShown) {
                                                                      if (hasShown) {
                                                                        router.popUntilRouteWithName(
                                                                          DashboardRoute.name,
                                                                        );
                                                                      } else {
                                                                        router.popUntilRouteWithName(
                                                                          OnboardingRoute.name,
                                                                        );
                                                                      }
                                                                    });
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled: true,
                                                                      context: router.navigatorKey.currentContext!,
                                                                      shape: const RoundedRectangleBorder(
                                                                        borderRadius: BorderRadius.only(
                                                                          topLeft: Radius.circular(20),
                                                                          topRight: Radius.circular(20),
                                                                        ),
                                                                      ),
                                                                      builder: (context) {
                                                                        return const CardBlockedModal();
                                                                      },
                                                                    );
                                                                  } else {
                                                                    _validationStore.color = cardData.color!;
                                                                    _addressState.btcAddress = value;
                                                                    await _allSettingsState.initActivationStatus(
                                                                      status: cardData.activated ?? false,
                                                                    );
                                                                    await _addressState.validateBTCAddress();
                                                                  }
                                                                } else {
                                                                  _focusNode.unfocus();
                                                                  _btcAddressController.clear();
                                                                  await showModalBottomSheet(
                                                                    isScrollControlled: true,
                                                                    context: router.navigatorKey.currentContext!,
                                                                    shape: const RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.only(
                                                                        topLeft: Radius.circular(20),
                                                                        topRight: Radius.circular(20),
                                                                      ),
                                                                    ),
                                                                    builder: (context) {
                                                                      return const BackupCardTapped();
                                                                    },
                                                                  );
                                                                }
                                                              }
                                                            }
                                                          }
                                                        },
                                                        onEditingComplete: () {
                                                          if (btcAddress.length > 25) {
                                                            _addressState.validateBTCAddress();
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
                                                          hintText: 'Type in your card address',
                                                          fillColor: Colors.white,
                                                          hintMaxLines: 10,
                                                          hintStyle: TextStyle(
                                                            fontFamily: FontFamily.redHatLight,
                                                            fontSize: 13,
                                                            color: AppColors.primaryTextColor.withOpacity(
                                                              0.5,
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
                                                child: AnimatedSwitcher(
                                                  duration: const Duration(milliseconds: 200),
                                                  transitionBuilder: (child, animation) {
                                                    return ScaleTransition(scale: animation, child: child);
                                                  },
                                                  child: _validationStore.isValid
                                                      ? ScaleTap(
                                                          enableFeedback: false,
                                                          onPressed: () async {
                                                            unawaited(
                                                              recordAmplitudeEvent(
                                                                const QrButtonClicked(
                                                                  walletType: 'Card',
                                                                  source: 'Connect',
                                                                ),
                                                              ),
                                                            );
                                                            _focusNode.unfocus();
                                                            await Future.delayed(
                                                              const Duration(
                                                                milliseconds: 300,
                                                              ),
                                                            );
                                                            final res = await context.pushRoute<String?>(
                                                              QrScannerRoute(),
                                                            );
                                                            if (res == null) {
                                                              return;
                                                            } else {
                                                              _walletProtectState.onAddressChanges(res);
                                                            }
                                                            if (_walletProtectState.isValidWalletAddress) {
                                                              if (res.length > 25) {
                                                                _addressState.btcAddress = res;
                                                                btcAddress = res;
                                                                _btcAddressController.text = res;
                                                                await _addressState.validateBTCAddress();
                                                                await _balanceStore.setMainWalletAddress(
                                                                  walletAddress: res,
                                                                );
                                                                await hasShownWallet().then(
                                                                  (hasShown) async {
                                                                    if (hasShown) {
                                                                      await recordAmplitudeEvent(
                                                                        QrScanned(
                                                                          source: 'Wallet',
                                                                          walletAddress: btcAddress,
                                                                        ),
                                                                      );
                                                                    } else {
                                                                      await recordAmplitudeEvent(
                                                                        QrScanned(
                                                                          source: 'Onboarding',
                                                                          walletAddress: btcAddress,
                                                                        ),
                                                                      );
                                                                    }
                                                                  },
                                                                );
                                                                if (_walletProtectState.isValidWalletAddress) {
                                                                  final cardData = await getCardData(res);
                                                                  if (cardData != null) {
                                                                    if (cardData.backup != true) {
                                                                      if (cardData.lost == true) {
                                                                        _focusNode.unfocus();
                                                                        _btcAddressController.clear();
                                                                        Gaimon.error();
                                                                        await hasShownWallet().then((hasShown) {
                                                                          if (hasShown) {
                                                                            router.popUntilRouteWithName(
                                                                              DashboardRoute.name,
                                                                            );
                                                                          } else {
                                                                            router.popUntilRouteWithName(
                                                                              OnboardingRoute.name,
                                                                            );
                                                                          }
                                                                        });
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled: true,
                                                                          context: router.navigatorKey.currentContext!,
                                                                          shape: const RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(20),
                                                                              topRight: Radius.circular(20),
                                                                            ),
                                                                          ),
                                                                          builder: (context) {
                                                                            return const CardBlockedModal();
                                                                          },
                                                                        );
                                                                      } else {
                                                                        _validationStore.color = cardData.color!;
                                                                        _addressState.btcAddress = res;
                                                                        _btcAddressController.text = res;
                                                                        await _allSettingsState.initActivationStatus(
                                                                          status: cardData.activated ?? false,
                                                                        );
                                                                        await _addressState.validateBTCAddress();
                                                                      }
                                                                    } else {
                                                                      _focusNode.unfocus();
                                                                      _btcAddressController.clear();
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled: true,
                                                                        context: router.navigatorKey.currentContext!,
                                                                        shape: const RoundedRectangleBorder(
                                                                          borderRadius: BorderRadius.only(
                                                                            topLeft: Radius.circular(20),
                                                                            topRight: Radius.circular(20),
                                                                          ),
                                                                        ),
                                                                        builder: (context) {
                                                                          return const BackupCardTapped();
                                                                        },
                                                                      );
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            } else {
                                                              await Future.delayed(const Duration(milliseconds: 400));
                                                              await showCustomSnackBar(
                                                                message: 'This is not a valid bitcoin address',
                                                                context: context,
                                                              );
                                                            }
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
                                                          height: 35,
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
                                    if (!(_validationStore.color == '1' || _validationStore.color == 'WHITE'))
                                      Assets.icons.cardBackText.image(height: 55)
                                    else
                                      Assets.icons.cardBackTextBlack.image(height: 55),
                                    Gap(context.height * 0.02),
                                    if (!(_validationStore.color == '1' || _validationStore.color == 'WHITE'))
                                      SizedBox(
                                        width: 115,
                                        child: Assets.icons.cardBackLink.image(),
                                      )
                                    else
                                      SizedBox(
                                        width: 115,
                                        child: Assets.icons.cardBackLinkBlack.image(),
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
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Observer(
                builder: (context) {
                  return Shaker(
                    controller: _shakeAnimationController,
                    child: Stack(
                      children: [
                        FutureBuilder<bool?>(
                          future: _balanceStore.getCard(
                            receivedData: widget.receivedData,
                            textEditingController: _btcAddressController,
                          ),
                          builder: (context, snapshot) {
                            return AnimatedCrossFade(
                              firstChild: ReactionBuilder(
                                builder: (context) {
                                  return reaction((p1) => _allSettingsState.activationStatusFromDb, (p1) async {
                                    final cardData = await getCardData(btcAddress);
                                    if (cardData?.lost != null && cardData?.lost != true) {
                                      await _allSettingsState.initActivationStatus(status: p1);
                                    }
                                  });
                                },
                                child: Observer(
                                  builder: (context) {
                                    return AnimatedCrossFade(
                                      firstChild: Observer(
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
                                                          walletAddress: _balanceStore.selectedCard!.address,
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    unawaited(
                                                      recordAmplitudeEvent(
                                                        ActivatedCheckboxClicked(
                                                          source: 'Onboarding',
                                                          walletType: 'Card',
                                                          walletAddress: _balanceStore.selectedCard!.address,
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
                                                  color: _allSettingsState.isActivatedCheckBox
                                                      ? const Color(0xFF73C3A6)
                                                      : const Color(0xFFFF2E00).withOpacity(0.6),
                                                ),
                                                color: _allSettingsState.isActivatedCheckBox
                                                    ? const Color(0xFF73C3A6).withOpacity(0.1)
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
                                                    duration: const Duration(
                                                      milliseconds: 400,
                                                    ),
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
                                                    duration: const Duration(
                                                      milliseconds: 400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      crossFadeState: _allSettingsState.activationStatusFromDb == true
                                          ? CrossFadeState.showFirst
                                          : CrossFadeState.showSecond,
                                      duration: const Duration(milliseconds: 400),
                                    );
                                  },
                                ),
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
                                child: Observer(
                                  builder: (context) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: _allSettingsState.isActive
                                              ? const Color(0xFF73C3A6)
                                              : _allSettingsState.isAccepted
                                                  ? Colors.grey.withOpacity(0.3)
                                                  : const Color(0xFFFF2E00).withOpacity(0.6),
                                        ),
                                        color: _allSettingsState.isActive
                                            ? const Color(0xFF73C3A6).withOpacity(0.1)
                                            : _allSettingsState.isAccepted
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
                                    );
                                  },
                                ),
                              ),
                              crossFadeState: !_allSettingsState.isLineVisible
                                  ? CrossFadeState.showFirst
                                  : CrossFadeState.showSecond,
                              duration: const Duration(milliseconds: 400),
                            ).paddingHorizontal(16);
                          },
                        ),
                        Visibility(
                          visible: !_allSettingsState.isLineVisible,
                          child: Observer(
                            builder: (context) {
                              return Visibility(
                                visible: _allSettingsState.activationStatusFromDb,
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
                                              color: const Color(0xFFFF2E00).withOpacity(0.6),
                                            ),
                                            value: _allSettingsState.isActivatedCheckBox,
                                            onChanged: (_) {
                                              hasShownWallet().then(
                                                (hasShown) async {
                                                  if (hasShown) {
                                                    unawaited(
                                                      recordAmplitudeEvent(
                                                        ActivatedCheckboxClicked(
                                                          source: 'Wallet',
                                                          walletType: 'Card',
                                                          walletAddress: _balanceStore.selectedCard!.address,
                                                        ),
                                                      ),
                                                    );
                                                  } else {
                                                    unawaited(
                                                      recordAmplitudeEvent(
                                                        ActivatedCheckboxClicked(
                                                          source: 'Onboarding',
                                                          walletType: 'Card',
                                                          walletAddress: _balanceStore.selectedCard!.address,
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
                              );
                            },
                          ),
                        ),
                        Visibility(
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
                                      activeColor: const Color(0xFF73C3A6).withOpacity(0.5),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      side: BorderSide(
                                        color: _allSettingsState.isAccepted
                                            ? Colors.grey.withOpacity(0.5)
                                            : const Color(0xFFFF2E00).withOpacity(0.6),
                                      ),
                                      value: _allSettingsState.isActive,
                                      onChanged: (_) {
                                        unawaited(
                                          recordAmplitudeEvent(
                                            const WarningCheckboxClicked(),
                                          ),
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
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          const Spacer(),
          Observer(
            builder: (_) {
              return _allSettingsState.isLineVisible
                  ? LoadingButton(
                      onPressed: () async {
                        await hasShownWallet().then(
                          (hasShown) async {
                            if (hasShown) {
                              await recordAmplitudeEvent(
                                GotItClicked(
                                  source: 'Wallet',
                                  walletType: 'Card',
                                  walletAddress: _balanceStore.selectedCard!.address,
                                ),
                              );
                            } else {
                              await recordAmplitudeEvent(
                                GotItClicked(
                                  source: 'Onboarding',
                                  walletType: 'Card',
                                  walletAddress: _balanceStore.selectedCard!.address,
                                ),
                              );
                            }
                          },
                        );
                        if (_allSettingsState.isActive) {
                          final card = await getCardData(
                            _balanceStore.selectedCard!.address,
                          );
                          await _balanceStore.updateCardIndicatorIndex(
                            _balanceStore.cardCurrentIndex,
                          );
                          if (widget.receivedData == null) {
                            final card = await getCardData(_btcAddressController.text);
                            if (card != null) {
                              unawaited(
                                connectedCount(_btcAddressController.text),
                              );
                              if (_validationStore.color == '0' || _validationStore.color == 'ORANGE') {
                                _balanceStore.saveSelectedCardManually(
                                  color: CardColor.ORANGE,
                                  label: WalletType.COINPLUS_WALLET,
                                  name: 'Coinplus Bitcoin Wallet',
                                );
                              } else if (_validationStore.color == '1' || _validationStore.color == 'WHITE') {
                                _balanceStore.saveSelectedCardManually(
                                  color: CardColor.WHITE,
                                  label: WalletType.COINPLUS_WALLET,
                                  name: 'Coinplus Bitcoin Wallet',
                                );
                              } else if (_validationStore.color == '2' || _validationStore.color == 'BLACK') {
                                _balanceStore.saveSelectedCardManually(
                                  color: CardColor.BLACK,
                                  label: WalletType.COINPLUS_WALLET,
                                  name: 'Coinplus Bitcoin Wallet',
                                );
                              } else if (_validationStore.color == '3' || _validationStore.color == 'BACKUP') {
                                _balanceStore.saveSelectedCardManually(
                                  color: CardColor.BACKUP,
                                  label: WalletType.COINPLUS_WALLET,
                                  name: 'Coinplus Bitcoin Wallet',
                                );
                              } else if (_validationStore.color == 'OLD CARD') {
                                _balanceStore.saveSelectedCardManually(
                                  color: CardColor.ORANGE,
                                  label: WalletType.COINPLUS_WALLET,
                                  name: 'Coinplus Bitcoin Wallet',
                                );
                              } else {
                                _balanceStore.saveSelectedCardManually(
                                  color: CardColor.ORANGE,
                                  label: WalletType.COINPLUS_WALLET,
                                  name: 'Coinplus Bitcoin Wallet',
                                );
                              }
                            } else {
                              _balanceStore.saveSelectedCardManually(
                                color: CardColor.ORANGE,
                                label: WalletType.TRACKER_PLUS,
                                name: 'Bitcoin Wallet',
                              );
                            }
                          } else {
                            if (card != null) {
                              unawaited(connectedCount(widget.receivedData!));
                              if (_validationStore.color == '0' || _validationStore.color == 'ORANGE') {
                                _balanceStore.saveSelectedCardManually(
                                  color: CardColor.ORANGE,
                                  label: WalletType.COINPLUS_WALLET,
                                  name: 'Coinplus Bitcoin Wallet',
                                );
                              } else if (_validationStore.color == '1' || _validationStore.color == 'WHITE') {
                                _balanceStore.saveSelectedCardManually(
                                  color: CardColor.WHITE,
                                  label: WalletType.COINPLUS_WALLET,
                                  name: 'Coinplus Bitcoin Wallet',
                                );
                              } else if (_validationStore.color == '2' || _validationStore.color == 'BLACK') {
                                _balanceStore.saveSelectedCardManually(
                                  color: CardColor.BLACK,
                                  label: WalletType.COINPLUS_WALLET,
                                  name: 'Coinplus Bitcoin Wallet',
                                );
                              } else if (_validationStore.color == '3' || _validationStore.color == 'BACKUP') {
                                _balanceStore.saveSelectedCardManually(
                                  color: CardColor.BACKUP,
                                  label: WalletType.COINPLUS_WALLET,
                                  name: 'Coinplus Bitcoin Wallet',
                                );
                              } else if (_validationStore.color == 'OLD CARD') {
                                _balanceStore.saveSelectedCardManually(
                                  color: CardColor.ORANGE,
                                  label: WalletType.COINPLUS_WALLET,
                                  name: 'Coinplus Bitcoin Wallet',
                                );
                              } else {
                                _balanceStore.saveSelectedCardManually(
                                  color: CardColor.ORANGE,
                                  label: WalletType.COINPLUS_WALLET,
                                  name: 'Coinplus Bitcoin Wallet',
                                );
                              }
                            } else {
                              _balanceStore.saveSelectedCardManually(
                                color: CardColor.ORANGE,
                                label: WalletType.TRACKER_PLUS,
                                name: 'Bitcoin Wallet',
                              );
                            }
                          }
                          await hasShownWallet().then((hasShown) {
                            unawaited(
                              recordUserProperty(const CardManual()),
                            );
                            unawaited(
                              recordAmplitudeEventPartTwo(
                                CardAddedEvent(
                                  address: _balanceStore.selectedCard!.address,
                                ),
                              ),
                            );
                            _historyPageStore.saveAndPatchCardAddress(
                              _balanceStore.selectedCard!.address,
                            );
                            if (card?.backupPack == true) {
                              router.push(
                                BackupMyWalletRoute(
                                  walletAddress: _balanceStore.selectedCard!.address,
                                  backupPack: card?.backupPack ?? false,
                                  isWalletActivated: false,
                                  cardColor: card?.color ?? '0',
                                ),
                              );
                            } else {
                              if (hasShown) {
                                router.maybePop();
                              } else {
                                router.pushAndPopAll(
                                  const WalletProtectionRoute(),
                                );
                              }
                            }
                          });
                        } else {
                          await HapticFeedback.vibrate();
                          _allSettingsState.accept();
                          await _shakeAnimationController.shake();
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
                  : Observer(
                      builder: (context) {
                        return LoadingButton(
                          onPressed: _connectivityStore.connectionStatus == ConnectivityResult.none
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
                                                    walletAddress: _balanceStore.selectedCard!.address,
                                                  ),
                                                );
                                              } else {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Onboarding',
                                                    walletType: 'Card',
                                                    walletAddress: _balanceStore.selectedCard!.address,
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                          final cardIndex = _balanceStore.cards.indexWhere(
                                            (element) => element.address == _balanceStore.selectedCard?.address,
                                          );

                                          final barIndex = _balanceStore.bars.indexWhere(
                                            (element) => element.address == _balanceStore.selectedCard?.address,
                                          );
                                          if (cardIndex != -1 || barIndex != -1) {
                                            await alreadySavedCard(
                                              context,
                                              _balanceStore.selectedCard!.address,
                                            );
                                          } else {
                                            await _toggleCard();
                                            await Future.delayed(
                                              const Duration(
                                                milliseconds: 300,
                                              ),
                                            );
                                            _allSettingsState.makeVisible();
                                          }
                                        }
                                      : () async {
                                          if (_allSettingsState.activationStatusFromDb == true) {
                                            await HapticFeedback.vibrate();
                                            _allSettingsState.checkboxAccept();
                                            await _shakeAnimationController.shake();
                                          } else {
                                            final cardIndex = _balanceStore.cards.indexWhere(
                                              (element) => element.address == _balanceStore.selectedCard?.address,
                                            );
                                            final barIndex = _balanceStore.bars.indexWhere(
                                              (element) => element.address == _balanceStore.selectedCard?.address,
                                            );
                                            if (cardIndex != -1 || barIndex != -1) {
                                              await alreadySavedCard(
                                                context,
                                                _balanceStore.selectedCard!.address,
                                              );
                                            } else {
                                              if (_flipCardController.state!.isFront) {
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
    await Future.delayed(const Duration(milliseconds: 500));
    await _flipCardController.toggleCard();
  }

  Future<void> makeLineInvisible() async {
    await _toggleCard();
    await Future.delayed(const Duration(milliseconds: 350));
    _allSettingsState.makeInvisible();
  }
}
