import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gaimon/gaimon.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../services/amplitude_service.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/secure_storage_utils.dart';

@RoutePage()
class CreatePinCode extends StatefulWidget {
  const CreatePinCode({super.key});

  @override
  State<CreatePinCode> createState() => _CreatePinCodeState();
}

class _CreatePinCodeState extends State<CreatePinCode> {
  final _walletProtectState = WalletProtectState();
  late PageController _pageController = PageController(keepPage: false);
  final _enterPinCodeController = TextEditingController();
  final _repeatPinCodeController = TextEditingController();
  late final _shakeAnimationController = ShakeAnimationController();
  final _enterFocusNode = FocusNode();
  final _reEnterFocusNode = FocusNode();

  String enteredPin = '';
  String repeatPin = '';

  @override
  void initState() {
    super.initState();
    enteredPin = _enterPinCodeController.text;
    repeatPin = _repeatPinCodeController.text;
    _pageController = PageController();
    _walletProtectState.checkBiometrics();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.transparent,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        title: Row(
          children: [
            Theme(
              data: ThemeData(
                canvasColor: Colors.white,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: IconButton(
                onPressed: router.maybePop,
                icon: Assets.icons.arrowBackIos.image(height: 22),
              ),
            ),
            const Expanded(
              child: Text(
                'Create passcode',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
            const Gap(46),
          ],
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Column(
            children: [
              const Gap(80),
              Assets.images.coinpluslogo.image(
                height: 50,
              ),
              const Gap(50),
              Observer(
                builder: (context) {
                  return AnimatedCrossFade(
                    firstChild: const Text(
                      'Enter your passcode',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontSize: 20,
                        color: AppColors.primary,
                      ),
                    ),
                    secondChild: const Text(
                      'Incorrect passcode',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontSize: 20,
                        color: AppColors.red,
                      ),
                    ),
                    crossFadeState: _walletProtectState.isCreatedPinMatch
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 1),
                  );
                },
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: PinCodeTextField(
                  autoDismissKeyboard: false,
                  focusNode: _enterFocusNode,
                  obscuringWidget: const Text(
                    '●',
                    style: TextStyle(fontSize: 15),
                  ),
                  autoDisposeControllers: false,
                  onCompleted: (value) {
                    enteredPin = value;
                    _pageController.jumpToPage(1);
                    _enterFocusNode.unfocus();
                    _reEnterFocusNode.requestFocus();
                  },
                  textCapitalization: TextCapitalization.characters,
                  autoFocus: true,
                  backgroundColor: Colors.white,
                  pinTheme: PinTheme(
                    disabledBorderWidth: 2,
                    errorBorderWidth: 2,
                    fieldWidth: 42,
                    fieldOuterPadding: const EdgeInsets.only(left: 5),
                    errorBorderColor: Colors.white,
                    disabledColor: Colors.white,
                    fieldHeight: 45,
                    activeFillColor: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    inactiveBorderWidth: 2,
                    selectedColor: Colors.grey,
                    selectedFillColor: Colors.white,
                    borderWidth: 2,
                    activeColor: Colors.grey,
                    selectedBorderWidth: 2,
                    activeBorderWidth: 2,
                    shape: PinCodeFieldShape.box,
                    inactiveFillColor: Colors.white,
                    inactiveColor: Colors.grey,
                  ),
                  useHapticFeedback: true,
                  keyboardAppearance: Brightness.light,
                  keyboardType: TextInputType.number,
                  showCursor: false,
                  length: 6,
                  obscureText: true,
                  pastedTextStyle: const TextStyle(fontSize: 12),
                  animationType: AnimationType.fade,
                  animationDuration: const Duration(milliseconds: 50),
                  onChanged: (value) {},
                  appContext: context,
                ),
              ),
              const Gap(20),
              const Text(
                'Enter your passcode. Be sure to remember it \nso you can unlock your wallet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatLight,
                  fontSize: 14,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Gap(80),
              Assets.images.coinpluslogo.image(
                height: 50,
              ),
              const Gap(50),
              Observer(
                builder: (context) {
                  return AnimatedCrossFade(
                    firstChild: const Text(
                      'Repeat passcode',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontSize: 20,
                        color: AppColors.primary,
                      ),
                    ),
                    secondChild: const Text(
                      'Incorrect passcode',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontSize: 20,
                        color: AppColors.red,
                      ),
                    ),
                    crossFadeState: _walletProtectState.isCreatedPinMatch
                        ? CrossFadeState.showSecond
                        : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 1),
                  );
                },
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ShakeAnimationWidget(
                  isForward: false,
                  shakeRange: 0.4,
                  shakeAnimationController: _shakeAnimationController,
                  shakeAnimationType: ShakeAnimationType.LeftRightShake,
                  child: PinCodeTextField(
                    autoDismissKeyboard: false,
                    focusNode: _reEnterFocusNode,
                    obscuringWidget: const Text(
                      '●',
                      style: TextStyle(fontSize: 15),
                    ),
                    autoDisposeControllers: false,
                    onCompleted: (value) async {
                      repeatPin = value;
                      if (enteredPin == repeatPin) {
                        if (_walletProtectState.canCheckBiometrics) {
                          await _walletProtectState
                              .authenticateWithBiometrics();
                        }
                        await savePinCode(pinCode: value);
                        await Future.delayed(const Duration(milliseconds: 100));
                        await router.pushAndPopAll(const DashboardRoute());
                        await recordAmplitudeEvent(
                          const AppLockEnabled(),
                        );
                      } else {
                        Gaimon.error();
                        _shakeAnimationController.start();
                        unawaited(_walletProtectState.dontMatch());
                        _pageController.jumpToPage(0);
                        _reEnterFocusNode.unfocus();
                        _enterFocusNode.requestFocus();
                        await Future.delayed(const Duration(milliseconds: 600));
                        _shakeAnimationController.stop();
                      }
                    },
                    textCapitalization: TextCapitalization.characters,
                    backgroundColor: Colors.white,
                    pinTheme: PinTheme(
                      disabledBorderWidth: 2,
                      errorBorderWidth: 2,
                      fieldWidth: 42,
                      fieldOuterPadding: const EdgeInsets.only(left: 5),
                      errorBorderColor: Colors.white,
                      disabledColor: Colors.white,
                      fieldHeight: 45,
                      activeFillColor: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      inactiveBorderWidth: 2,
                      selectedColor: Colors.grey,
                      selectedFillColor: Colors.white,
                      borderWidth: 2,
                      activeColor: Colors.grey,
                      selectedBorderWidth: 2,
                      activeBorderWidth: 2,
                      shape: PinCodeFieldShape.box,
                      inactiveFillColor: Colors.white,
                      inactiveColor: Colors.grey,
                    ),
                    useHapticFeedback: true,
                    keyboardAppearance: Brightness.light,
                    keyboardType: TextInputType.number,
                    showCursor: false,
                    length: 6,
                    obscureText: true,
                    pastedTextStyle: const TextStyle(fontSize: 12),
                    animationType: AnimationType.fade,
                    animationDuration: const Duration(milliseconds: 50),
                    onChanged: (value) {},
                    appContext: context,
                  ),
                ),
              ),
              const Gap(20),
              const Text(
                'Re-enter your passcode. Be sure to remember it \nso you can unlock your wallet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatLight,
                  fontSize: 14,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
