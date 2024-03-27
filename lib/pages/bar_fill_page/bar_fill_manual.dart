import 'dart:async';
import 'dart:io';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
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
import '../../store/address_and_balance_state/address_and_balance_state.dart';
import '../../store/all_settings_state/all_settings_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/connectivity_store/connectivity_store.dart';
import '../../store/history_page_store/history_page_store.dart';
import '../../store/market_page_store/market_page_store.dart';
import '../../store/qr_detect_state/qr_detect_state.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/card_nfc_session.dart';
import '../../utils/custom_paint_lines_bar.dart';
import '../../widgets/all_alert_dialogs/already_saved_card_dialog/already_saved_card_dialog.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button/loading_button.dart';
import '../splash_screen/splash_screen.dart';

@RoutePage()
class BarFillPage extends StatefulWidget {
  const BarFillPage({super.key, this.receivedData});

  final String? receivedData;

  @override
  State<BarFillPage> createState() => _BarFillPageState();
}

class _BarFillPageState extends State<BarFillPage> with TickerProviderStateMixin {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late final ShakeAnimationController _shakeAnimationController = ShakeAnimationController();
  late final TextEditingController _btcAddressController = TextEditingController();
  late AnimationController _textFieldAnimationController;
  late AnimationController _lottieController;
  final _validationStore = ValidationState();
  final _allSettingsState = AllSettingsState();
  final _addressState = AddressState(CardType.BAR);
  final _connectivityStore = ConnectivityStore();
  late String btcAddress = '';
  final _focusNode = FocusNode();

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      nfcStop();
    }
    _btcAddressController.addListener(_addressState.validateBTCAddress);
    _lottieController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _focusNode.addListener(() {
      _focusNode.hasFocus ? _textFieldAnimationController.forward() : _textFieldAnimationController.animateBack(0);
    });
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_connectivityStore.updateConnectionStatus);
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
  }

  @override
  void dispose() {
    super.dispose();
    _connectivitySubscription.cancel();
    _lottieController.dispose();
    _textFieldAnimationController.dispose();
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
                  _allSettingsState.isLineVisible ? makeLineInvisible() : router.pop();
                },
                icon: Assets.icons.arrowBackIos.image(height: 22),
              ),
            ),
            const Gap(10),
            Text(
              'Virtual bar',
              style: TextStyle(
                fontSize: 32,
                fontFamily: FontFamily.redHatBold,
                color: Colors.black.withOpacity(0.9),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ReactionBuilder(
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
                        const Duration(milliseconds: 1000),
                        () => _addressState.isAddressVisible = true,
                      );
                      await _lottieController.forward(from: 0);
                    },
                  );
                },
                child: Observer(
                  builder: (context) {
                    final data = _marketPageStore.singleCoin?.result.first;
                    return Padding(
                      padding: EdgeInsets.only(bottom: context.height > 667 ? 20 : 0),
                      child: Center(
                        child: AnimatedCrossFade(
                          firstChild: AnimatedCrossFade(
                            firstChild: Container(
                              height: context.height > 667 ? 475 : 400,
                              width: context.width - 34,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: _allSettingsState.isLineVisible
                                      ? Assets.images.bar.filledBar.image().image
                                      : Assets.images.bar.barFill.image().image,
                                ),
                              ),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                                child: Row(
                                  children: [
                                    Opacity(
                                      opacity: _allSettingsState.isLineVisible ? 1 : 0,
                                      child: CustomPaint(
                                        size: Size(61, context.height > 667 ? 245 : 280),
                                        painter: BarLinesCustomPaint(),
                                      ),
                                    ),
                                    Center(
                                      child: SizedBox(
                                        width: context.width * 0.6,
                                        child: Column(
                                          children: [
                                            if (context.height > 667) const Gap(35) else const Gap(20),
                                            Stack(
                                              children: [
                                                Container(
                                                  height: context.height > 667 ? 164 : 140,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: Assets.images.bar.hologramWithFrame.image().image,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Assets.images.bar.barSecret1.image(
                                                      height: context.height > 667 ? 44 : 40,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Gap(10),
                                            Opacity(
                                              opacity: _allSettingsState.isLineVisible ? 0 : 1,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                    children: [
                                                      const Text(
                                                        'Balance',
                                                        style: TextStyle(
                                                          fontSize: 15,
                                                          fontFamily: FontFamily.redHatMedium,
                                                        ),
                                                      ),
                                                      Observer(
                                                        builder: (context) {
                                                          final myFormat = NumberFormat.decimalPatternDigits(
                                                            locale: 'en_us',
                                                            decimalDigits: 2,
                                                          );
                                                          if (_balanceStore
                                                                  .loadings[_balanceStore.selectedBar?.address] ??
                                                              false) {
                                                            return const Padding(
                                                              padding: EdgeInsets.all(
                                                                4,
                                                              ),
                                                              child: CupertinoActivityIndicator(
                                                                radius: 5,
                                                              ),
                                                            );
                                                          }
                                                          return Text(
                                                            (_balanceStore.selectedBar != null
                                                                    ? '\$${myFormat.format((_balanceStore.selectedBar!.data!.netTxoCount) / 100000000 * data!.price)}'
                                                                    : '')
                                                                .toString(),
                                                            style: TextStyle(
                                                              fontFamily: FontFamily.redHatMedium,
                                                              fontWeight: FontWeight.w700,
                                                              color: Colors.black.withOpacity(0.7),
                                                              fontSize: 20,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            if (context.height > 667) const Gap(15) else const SizedBox(),
                                            Opacity(
                                              opacity: _allSettingsState.isLineVisible ? 0 : 1,
                                              child: ScaleTap(
                                                enableFeedback: false,
                                                onPressed: _allSettingsState.isLineVisible
                                                    ? null
                                                    : () async {
                                                        await recordAmplitudeEvent(
                                                          AddressCopied(
                                                            walletType: 'Bar',
                                                            walletAddress: _balanceStore.selectedBar!.address,
                                                            activated: false,
                                                            source: 'Balance',
                                                          ),
                                                        );
                                                        await Clipboard.setData(
                                                          ClipboardData(
                                                            text: _balanceStore.selectedBar!.address.toString(),
                                                          ),
                                                        ).then(
                                                          (_) {
                                                            HapticFeedback.mediumImpact();
                                                            showTopSnackBar(
                                                              displayDuration: const Duration(
                                                                milliseconds: 400,
                                                              ),
                                                              Overlay.of(context),
                                                              CustomSnackBar.success(
                                                                backgroundColor:
                                                                    const Color(0xFF4A4A4A).withOpacity(0.9),
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
                                                      },
                                                child: Container(
                                                  height: 33,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: Assets.images.bar.barAddress.image().image,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Observer(
                                                      builder: (context) {
                                                        if (_balanceStore
                                                                .loadings[_balanceStore.selectedBar?.address] ??
                                                            false) {
                                                          return const Padding(
                                                            padding: EdgeInsets.all(4),
                                                            child: CupertinoActivityIndicator(
                                                              radius: 5,
                                                            ),
                                                          );
                                                        }
                                                        return Text(
                                                          _balanceStore.selectedBar?.address ?? '',
                                                          style: const TextStyle(
                                                            fontFamily: FontFamily.redHatMedium,
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.black,
                                                            fontSize: 10,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            if (context.height > 667) const Gap(15) else const SizedBox(),
                                            Opacity(
                                              opacity: _allSettingsState.isLineVisible ? 0 : 1,
                                              child: Assets.images.bar.barCoinplusLogo.image(
                                                height: 40,
                                              ),
                                            ),
                                            if (context.height > 667) const Gap(15) else const Gap(25),
                                            Assets.images.bar.barSecret2.image(
                                              height: context.height > 667 ? 43 : 36,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            secondChild: Container(
                              height: context.height > 667 ? 475 : 400,
                              width: context.width - 34,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: Assets.images.bar.barFill.image().image,
                                ),
                              ),
                              child: Center(
                                child: SizedBox(
                                  width: context.width * 0.6,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Gap(context.height * 0.035),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              const Text(
                                                'Balance',
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily: FontFamily.redHatMedium,
                                                ),
                                              ),
                                              Observer(
                                                builder: (context) {
                                                  final myFormat = NumberFormat.decimalPatternDigits(
                                                    locale: 'en_us',
                                                    decimalDigits: 2,
                                                  );
                                                  if ((_balanceStore.loadings[_balanceStore.selectedBar?.address] ??
                                                          false) ||
                                                      data == null) {
                                                    return const Padding(
                                                      padding: EdgeInsets.all(
                                                        4,
                                                      ),
                                                      child: SizedBox(
                                                        height: 15,
                                                        width: 15,
                                                        child: CircularProgressIndicator(
                                                          color: Colors.grey,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  return Text(
                                                    (_balanceStore.selectedBar != null
                                                            ? '\$${myFormat.format((_balanceStore.selectedBar!.data!.netTxoCount) / 100000000 * data.price)}'
                                                            : '')
                                                        .toString(),
                                                    style: TextStyle(
                                                      fontFamily: FontFamily.redHatMedium,
                                                      fontWeight: FontWeight.w700,
                                                      color: Colors.black.withOpacity(0.7),
                                                      fontSize: 20,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      const Gap(15),
                                      ScaleTap(
                                        enableFeedback: false,
                                        onPressed: () {
                                          Clipboard.setData(
                                            ClipboardData(
                                              text: _balanceStore.selectedBar!.address.toString(),
                                            ),
                                          ).then(
                                            (_) {
                                              HapticFeedback.mediumImpact();
                                              showTopSnackBar(
                                                displayDuration: const Duration(
                                                  milliseconds: 400,
                                                ),
                                                Overlay.of(context),
                                                CustomSnackBar.success(
                                                  backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
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
                                        },
                                        child: Container(
                                          height: 33,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: Assets.images.bar.barAddress.image().image,
                                            ),
                                          ),
                                          child: Center(
                                            child: Observer(
                                              builder: (context) {
                                                if (_balanceStore.loadings[_balanceStore.selectedBar?.address] ??
                                                    false) {
                                                  return const Padding(
                                                    padding: EdgeInsets.all(
                                                      4,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
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
                                                  _balanceStore.selectedBar?.address ?? '',
                                                  style: const TextStyle(
                                                    fontFamily: FontFamily.redHatMedium,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                    fontSize: 10,
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
                              ),
                            ),
                            crossFadeState:
                                _allSettingsState.isLineVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                            duration: const Duration(milliseconds: 600),
                          ),
                          secondChild: Container(
                            height: context.height > 667 ? 475 : 400,
                            width: context.width - 64,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Assets.images.bar.barFill.image().image,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Gap(context.height * 0.06),
                                  ScaleTransition(
                                    scale: _textFieldAnimationController,
                                    child: TextField(
                                      autocorrect: false,
                                      keyboardType: TextInputType.text,
                                      onChanged: (value) {
                                        _addressState
                                          ..btcAddress = value
                                          ..validateBTCAddress();
                                        btcAddress = value;
                                      },
                                      controller: _btcAddressController,
                                      maxLines: 2,
                                      minLines: 1,
                                      focusNode: _focusNode,
                                      cursorColor: Colors.blue,
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
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintText: 'Write here your bar address ',
                                        hintMaxLines: 1,
                                        hintStyle: TextStyle(
                                          fontFamily: FontFamily.redHatLight,
                                          fontSize: 12,
                                          color: AppColors.primaryTextColor.withOpacity(
                                            0.8,
                                          ),
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 10,
                                        ),
                                        prefixIconConstraints: const BoxConstraints(
                                          minWidth: 27,
                                          minHeight: 27,
                                        ),
                                        prefixIcon: Observer(
                                          builder: (context) {
                                            return _validationStore.isValid
                                                ? IconButton(
                                                    onPressed: () async {
                                                      unawaited(
                                                        recordAmplitudeEvent(
                                                          const QrButtonClicked(walletType: 'Bar', source: 'Connect'),
                                                        ),
                                                      );
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

                                                      await hasShownWallet().then(
                                                        (hasShown) async {
                                                          if (hasShown) {
                                                            unawaited(
                                                              recordAmplitudeEvent(
                                                                QrScanned(source: 'Wallet', walletAddress: res),
                                                              ),
                                                            );
                                                          } else {
                                                            unawaited(
                                                              recordAmplitudeEvent(
                                                                QrScanned(source: 'Onboarding', walletAddress: res),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      );
                                                      setState(() {
                                                        _btcAddressController.text = res;
                                                      });
                                                      _addressState.btcAddress = res;
                                                      await _addressState.validateBTCAddress();
                                                    },
                                                    icon: Assets.icons.qrCode.image(
                                                      height: 34,
                                                    ),
                                                  )
                                                : Padding(
                                                    padding: const EdgeInsets.all(8),
                                                    child: Lottie.asset(
                                                      'assets/lottie_animations/address_validation_success.json',
                                                      height: 30,
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
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.blue,
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
                                  ).paddingHorizontal(60),
                                ],
                              ),
                            ),
                          ),
                          crossFadeState:
                              _addressState.isAddressVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 400),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
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
                                            hasShownWallet().then(
                                              (hasShown) async {
                                                if (hasShown) {
                                                  unawaited(
                                                    recordAmplitudeEvent(
                                                      ActivatedCheckboxClicked(
                                                        source: 'Wallet',
                                                        walletType: 'Card',
                                                        walletAddress: _balanceStore.selectedBar!.address,
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  unawaited(
                                                    recordAmplitudeEvent(
                                                      ActivatedCheckboxClicked(
                                                        source: 'Onboarding',
                                                        walletType: 'Card',
                                                        walletAddress: _balanceStore.selectedBar!.address,
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
                                                    'This bar was previously activated!',
                                                    style: TextStyle(
                                                      fontFamily: FontFamily.redHatMedium,
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16,
                                                      color: AppColors.textHintsColor,
                                                    ),
                                                  ).expandedHorizontally(),
                                                  const Gap(4),
                                                  const Text(
                                                    "This bar has been used previously, and Secrets 1 and 2 were revealed. Others may have access to the funds. If you didn't activate the bar yourself, please avoid using it.",
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
                                                    'Fill in the address of your physical bar wallet',
                                                    style: TextStyle(
                                                      fontFamily: FontFamily.redHatMedium,
                                                      fontWeight: FontWeight.w700,
                                                      fontSize: 16,
                                                      color: AppColors.textHintsColor,
                                                    ),
                                                  ).expandedHorizontally(),
                                                  secondChild: const Text(
                                                    'Coinplus Virtual Bar',
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
                                                    'Please fill the address from your physical bar into the address input field, or scan the QR code.',
                                                    style: TextStyle(
                                                      fontFamily: FontFamily.redHatMedium,
                                                      fontSize: 14,
                                                      color: AppColors.textHintsColor,
                                                    ),
                                                  ).expandedHorizontally(),
                                                  secondChild: const Text(
                                                    'This is the virtual copy of your physical Coinplus Bar with its address and the balance shown above. You can save it in the app for further easy access and tracking.',
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
                                    crossFadeState:
                                        isActivated == true ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                                    duration: const Duration(milliseconds: 400),
                                  );
                                },
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
                                          'Keep your bar safe!',
                                          style: TextStyle(
                                            fontFamily: FontFamily.redHatMedium,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: AppColors.textHintsColor,
                                          ),
                                        ).expandedHorizontally(),
                                        const Gap(4),
                                        const Text(
                                          'Make sure to keep your bar safe! You will need your Secret 1 and Secret 2 in the future to manage your crypto.',
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
                            ).paddingHorizontal(16),
                            Visibility(
                              visible: !_allSettingsState.isLineVisible,
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
                                                              walletAddress: _balanceStore.selectedBar!.address,
                                                            ),
                                                          ),
                                                        );
                                                      } else {
                                                        unawaited(
                                                          recordAmplitudeEvent(
                                                            ActivatedCheckboxClicked(
                                                              source: 'Onboarding',
                                                              walletType: 'Card',
                                                              walletAddress: _balanceStore.selectedBar!.address,
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
              if (context.height > 667) const Gap(20) else const Gap(5),
              Observer(
                builder: (_) {
                  return _allSettingsState.isLineVisible
                      ? LoadingButton(
                          onPressed: () async {
                            if (_allSettingsState.isActive) {
                              _balanceStore.saveSelectedBar(color: CardColor.SILVER);
                              unawaited(_historyPageStore.saveAndPatchBarAddress(_balanceStore.selectedBar!.address));
                              _balanceStore.onBarAdded(_balanceStore.selectedBar!.address);
                              await hasShownWallet().then((hasShown) {
                                recordUserProperty(const BarManual());
                                unawaited(
                                  recordAmplitudeEventPartTwo(
                                    BarAddedEvent(address: _balanceStore.selectedBar!.address),
                                  ),
                                );
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
                                      walletType: 'Bar',
                                      walletAddress: _btcAddressController.text,
                                    ),
                                  );
                                } else {
                                  await recordAmplitudeEvent(
                                    GotItClicked(
                                      source: 'Onboarding',
                                      walletType: 'Bar',
                                      walletAddress: _btcAddressController.text,
                                    ),
                                  );
                                }
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
                      : FutureBuilder(
                          future: _balanceStore.getCard(
                            receivedData: widget.receivedData,
                            textEditingController: _btcAddressController,
                          ),
                          builder: (context, snapshot) {
                            final isActivated = snapshot.data;
                            return Observer(
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
                                                            walletType: 'Bar',
                                                            walletAddress: _btcAddressController.text,
                                                          ),
                                                        );
                                                      } else {
                                                        await recordAmplitudeEvent(
                                                          SaveToWalletClicked(
                                                            source: 'Onboarding',
                                                            walletType: 'Bar',
                                                            walletAddress: _btcAddressController.text,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  );
                                                  final barIndex = _balanceStore.bars.indexWhere(
                                                    (element) => element.address == _balanceStore.selectedBar?.address,
                                                  );
                                                  final cardIndex = _balanceStore.cards.indexWhere(
                                                    (element) => element.address == _balanceStore.selectedBar?.address,
                                                  );
                                                  if (cardIndex != -1 || barIndex != -1) {
                                                    await alreadySavedBar(
                                                      context,
                                                      _walletProtectState,
                                                      _balanceStore.selectedBar!.address,
                                                    );
                                                    _balanceStore.onBarAdded(_balanceStore.selectedBar!.address);
                                                  } else {
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
                                                            walletType: 'Bar',
                                                            walletAddress: _balanceStore.selectedBar!.address,
                                                          ),
                                                        );
                                                      } else {
                                                        await recordAmplitudeEvent(
                                                          SaveToWalletClicked(
                                                            source: 'Onboarding',
                                                            walletType: 'Bar',
                                                            walletAddress: _balanceStore.selectedBar!.address,
                                                          ),
                                                        );
                                                      }
                                                    },
                                                  );
                                                  if (isActivated == true) {
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
                                                    final cardIndex = _balanceStore.cards.indexWhere(
                                                      (element) =>
                                                          element.address == _balanceStore.selectedBar?.address,
                                                    );
                                                    final barIndex = _balanceStore.bars.indexWhere(
                                                      (element) =>
                                                          element.address == _balanceStore.selectedBar?.address,
                                                    );
                                                    if (cardIndex != -1 || barIndex != -1) {
                                                      await alreadySavedCard(
                                                        context,
                                                        _balanceStore.selectedBar!.address,
                                                      );
                                                      _balanceStore.onCardAdded(_balanceStore.selectedBar!.address);
                                                    } else {
                                                      _allSettingsState.makeVisible();
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
            ],
          );
        },
      ),
    );
  }

  Future<void> makeLineInvisible() async {
    await Future.delayed(const Duration(milliseconds: 350));
    _allSettingsState.makeInvisible();
  }
}
