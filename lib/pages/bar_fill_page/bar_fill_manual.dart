import 'dart:async';
import 'dart:ui';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

import '../../constants/card_type.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event.dart';
import '../../models/amplitude_user_property_model/amplitude_user_property_model.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../services/amplitude_service.dart';
import '../../services/firebase_service.dart';
import '../../store/accept_state/accept_state.dart';
import '../../store/address_and_balance_state/address_and_balance_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/card_animation_state/card_animation_state.dart';
import '../../store/checkbox_state/checkbox_state.dart';
import '../../store/qr_detect_state/qr_detect_state.dart';
import '../../store/secret_lines_state/secret_lines_state.dart';
import '../../utils/compute_private_key.dart';
import '../../utils/custom_paint_lines_bar.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button.dart';
import '../card_fill_page/already_saved_card_dialog/already_saved_card_dialog.dart';
import '../splash_screen/splash_screen.dart';

@RoutePage()
class BarFillPage extends StatefulWidget {
  const BarFillPage({super.key, this.receivedData});

  final String? receivedData;

  @override
  State<BarFillPage> createState() => _BarFillPageState();
}

class _BarFillPageState extends State<BarFillPage> with TickerProviderStateMixin {
  late final ShakeAnimationController _shakeAnimationController = ShakeAnimationController();
  late final TextEditingController _btcAddressController = TextEditingController();
  late AnimationController _textFieldAnimationController;
  final _cardAnimationState = CardAnimationState();
  late AnimationController _lottieController;
  final _validationStore = ValidationState();
  final _addressState = AddressState(CardType.BAR);
  final _focusNode = FocusNode();
  final _lineStore = LinesStore();
  final _acceptState = AcceptState();
  final _checkboxState = CheckboxState();

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  @override
  void initState() {
    super.initState();
    _nfcStop();
    _toggleWidgets();
    _btcAddressController
      ..addListener(_validateBTCAddress)
      ..text = widget.receivedData ?? '';
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

  @override
  void dispose() {
    super.dispose();
    _textFieldAnimationController.dispose();
  }

  Future<void> onInitWithAddress() async {
    _lottieController.reset();
    await _validateBTCAddress();
  }

  Future<void> _toggleWidgets() async {
    await Future.delayed(const Duration(milliseconds: 600));
    _cardAnimationState.startLoading();
  }

  Future<void> _nfcStop() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    await NfcManager.instance.stopSession();
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
                  _lineStore.isLineVisible ? makeLineInvisible() : router.pop();
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
              Expanded(
                flex: 6,
                child: Observer(
                  builder: (context) {
                    final data = _balanceStore.coins;
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Center(
                        child: AnimatedCrossFade(
                          firstChild: AnimatedCrossFade(
                            firstChild: Container(
                              height: 475,
                              width: context.width - 34,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: _lineStore.isLineVisible
                                      ? Assets.images.bar.filledBar.image().image
                                      : Assets.images.bar.barFill.image().image,
                                ),
                              ),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                                child: Row(
                                  children: [
                                    Opacity(
                                      opacity: _lineStore.isLineVisible ? 1 : 0,
                                      child: CustomPaint(
                                        size: const Size(61, 245),
                                        painter: BarLinesCustomPaint(),
                                      ),
                                    ),
                                    Center(
                                      child: SizedBox(
                                        width: context.width * 0.6,
                                        child: Column(
                                          children: [
                                            const Gap(35),
                                            Stack(
                                              children: [
                                                Container(
                                                  height: 164,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      image: Assets.images.bar.hologramWithFrame.image().image,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Assets.images.bar.barSecret1.image(
                                                      height: 44,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Gap(10),
                                            Opacity(
                                              opacity: _lineStore.isLineVisible ? 0 : 1,
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
                                                                    ? '\$${myFormat.format((_balanceStore.selectedBar!.data!.balance - _balanceStore.selectedBar!.data!.spentTxoSum) / 100000000 * data!.price)}'
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
                                            const Gap(15),
                                            Opacity(
                                              opacity: _lineStore.isLineVisible ? 0 : 1,
                                              child: ScaleTap(
                                                enableFeedback: false,
                                                onPressed: _lineStore.isLineVisible
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
                                            const Gap(15),
                                            Opacity(
                                              opacity: _lineStore.isLineVisible ? 0 : 1,
                                              child: Assets.images.bar.barCoinplusLogo.image(
                                                height: 40,
                                              ),
                                            ),
                                            const Gap(15),
                                            Assets.images.bar.barSecret2.image(
                                              height: 43,
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
                              height: 475,
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
                                                            ? '\$${myFormat.format((_balanceStore.selectedBar!.data!.balance - _balanceStore.selectedBar!.data!.spentTxoSum) / 100000000 * data.price)}'
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
                                _lineStore.isLineVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                            duration: const Duration(milliseconds: 600),
                          ),
                          secondChild: Container(
                            height: 475,
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
                                      onChanged: (_) {
                                        _validateBTCAddress();
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
                                                      _btcAddressController.text = res;
                                                      await _validateBTCAddress();
                                                    },
                                                    icon: Assets.icons.qrCode.image(
                                                      height: 34,
                                                    ),
                                                  )
                                                : Padding(
                                                    padding: const EdgeInsets.all(8),
                                                    child: Lottie.asset(
                                                      'assets/animated_logo/address_validation_success.json',
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
              Flexible(
                flex: 2,
                child: Observer(
                  builder: (context) {
                    return ShakeAnimationWidget(
                      shakeRange: 0.3,
                      isForward: false,
                      shakeAnimationController: _shakeAnimationController,
                      shakeAnimationType: ShakeAnimationType.LeftRightShake,
                      child: Stack(
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
                                  mainAxisSize: MainAxisSize.min,
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
                            ),
                            secondChild: GestureDetector(
                              onTap: () {
                                _checkboxState.makeActive();
                                HapticFeedback.heavyImpact();
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
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
                                ],
                              ),
                            ),
                            crossFadeState:
                                !_lineStore.isLineVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                            duration: const Duration(milliseconds: 400),
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
                                          recordAmplitudeEvent(
                                            const WarningCheckboxClicked(),
                                          );
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
              ),
              if (context.height > 844)
                SizedBox(
                  height: context.width * 0.15,
                )
              else
                SizedBox(
                  height: context.width * 0.04,
                ),
              Observer(
                builder: (_) {
                  return _lineStore.isLineVisible
                      ? LoadingButton(
                          onPressed: () async {
                            if (_checkboxState.isActive) {
                              unawaited(signInAnonymously(address: _btcAddressController.text));
                              _balanceStore.saveSelectedBar();
                              await hasShownWallet().then((hasShown) {
                                recordUserProperty(const BarManual());
                                unawaited(
                                  recordAmplitudeEvent(BarAddedEvent(address: _balanceStore.selectedBar!.address)),
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
                              _acceptState.accept();
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
                      : LoadingButton(
                          onPressed: _addressState.isAddressVisible
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
                                  final cardIndex = _balanceStore.bars.indexWhere(
                                    (element) => element.address == _balanceStore.selectedBar?.address,
                                  );
                                  if (cardIndex != -1) {
                                    await alreadySavedBar(
                                      context: context,
                                      walletAddress: _balanceStore.selectedBar!.address,
                                    );
                                    _balanceStore.onBarAdded(_balanceStore.selectedBar!.address);
                                  } else {
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
              if (context.height > 667) const Gap(10) else const Gap(12),
            ],
          );
        },
      ),
    );
  }

  Future<void> _validateBTCAddress() async {
    final btcAddress = _btcAddressController.text.trim();
    unawaited(
      _balanceStore.getSelectedBar(btcAddress),
    );
    if (isValidPublicAddress(btcAddress)) {
      _validationStore.validate();
      await Future.delayed(
        const Duration(seconds: 1),
      );
      _focusNode.unfocus();
      Future.delayed(
        const Duration(milliseconds: 1200),
        () => _addressState.isAddressVisible = true,
      );
      await _lottieController.forward(from: 0);
    } else {}
  }

  Future<void> makeLineInvisible() async {
    await Future.delayed(const Duration(milliseconds: 350));
    _lineStore.makeVisible();
  }
}
