import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
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
  String enteredPin = '';
  String repeatPin = '';

  @override
  void initState() {
    super.initState();
    enteredPin = _enterPinCodeController.text;
    repeatPin = _repeatPinCodeController.text;
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Create passcode',
          style: TextStyle(fontFamily: FontFamily.redHatMedium, fontSize: 18),
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
              const Text(
                'Create passcode',
                style: TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  fontSize: 20,
                  color: AppColors.primary,
                ),
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: PinCodeTextField(
                  obscuringWidget: const Text(
                    '●',
                    style: TextStyle(fontSize: 15),
                  ),
                  onCompleted: (value) {
                    enteredPin = value;
                    _pageController.jumpToPage(1);
                  },
                  textCapitalization: TextCapitalization.characters,
                  autoFocus: true,
                  enableActiveFill: true,
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
                  animationDuration: const Duration(milliseconds: 300),
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
                    crossFadeState:
                        _walletProtectState.isCreatedPinMatch ? CrossFadeState.showSecond : CrossFadeState.showFirst,
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
                    obscuringWidget: const Text(
                      '●',
                      style: TextStyle(fontSize: 15),
                    ),
                    onCompleted: (value) async {
                      repeatPin = value;
                      if (enteredPin == repeatPin) {
                        await savePinCode(pinCode: value);
                        await isPinCodeSet(isSet: true);
                        await _walletProtectState.isBiometricAvailable();
                        await router.pushAndPopAll(Dashboard());
                      } else {
                        await HapticFeedback.vibrate();
                        _shakeAnimationController.start();
                        await _walletProtectState.dontMatch();
                        _pageController.jumpToPage(0);
                        await Future.delayed(const Duration(milliseconds: 600));
                        _shakeAnimationController.stop();
                      }
                    },
                    textCapitalization: TextCapitalization.characters,
                    autoFocus: true,
                    enableActiveFill: true,
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
                    animationDuration: const Duration(milliseconds: 300),
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
