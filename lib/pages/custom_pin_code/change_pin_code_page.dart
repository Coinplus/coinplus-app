import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../store/wallet_protect_state/change_pin_code_state.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/secure_storage_utils.dart';

@RoutePage()
class ChangePinCode extends StatelessWidget {
  const ChangePinCode({super.key});

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  @override
  Widget build(BuildContext context) {
    final _changePinCodeState = ChangePinCodeState();
    final _pageController = PageController();
    final _enteredPinShakeController = ShakeAnimationController();
    final _reEnteredPinShakeController = ShakeAnimationController();
    final _enterPinCodeController = TextEditingController();
    final _enteredPinFocusNode = FocusNode();
    final _repeatPinCodeController = TextEditingController();
    var enteredPin = _enterPinCodeController.text;
    var newPin = _repeatPinCodeController.text;
    var repeatPin = _repeatPinCodeController.text;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.transparent,
        ),
        title: const Text(
          'Change passcode',
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
              Observer(
                builder: (context) {
                  return AnimatedCrossFade(
                    firstChild: const Text(
                      'Enter your current passcode',
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
                        _changePinCodeState.isNewPinMatched ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 1),
                  );
                },
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ShakeAnimationWidget(
                  shakeAnimationController: _enteredPinShakeController,
                  shakeAnimationType: ShakeAnimationType.LeftRightShake,
                  isForward: false,
                  child: PinCodeTextField(
                    controller: _enterPinCodeController,
                    focusNode: _enteredPinFocusNode,
                    autoDisposeControllers: false,
                    obscuringWidget: const Text(
                      '●',
                      style: TextStyle(fontSize: 15),
                    ),
                    onCompleted: (value) async {
                      final savedPinCode = await getSavedPinCode();
                      enteredPin = value;
                      if (enteredPin == savedPinCode) {
                        _pageController.jumpToPage(1);
                      } else {
                        await HapticFeedback.vibrate();
                        _enteredPinFocusNode.requestFocus();
                        _enteredPinShakeController.start();
                        _enterPinCodeController.text = '';
                        await _changePinCodeState.newPinMatch();
                        await Future.delayed(
                          const Duration(
                            milliseconds: 600,
                          ),
                        );
                        _enteredPinShakeController.stop();
                      }
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
                    animationDuration: const Duration(milliseconds: 300),
                    onChanged: (value) {},
                    appContext: context,
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
          Column(
            children: [
              const Gap(80),
              Assets.images.coinpluslogo.image(
                height: 50,
              ),
              const Gap(50),
              const Text(
                'Write new passcode',
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
                  autoDisposeControllers: false,
                  onCompleted: (value) async {
                    newPin = value;
                    _pageController.jumpToPage(2);
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
                  animationDuration: const Duration(milliseconds: 300),
                  onChanged: (value) {},
                  appContext: context,
                ),
              ),
              const Gap(20),
              const Text(
                'Enter your new passcode. Be sure to remember it \nso you can unlock your wallet',
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
                      'Re-enter your new passcode',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontSize: 20,
                        color: AppColors.primary,
                      ),
                    ),
                    secondChild: const Text(
                      "Passcodes don't match. Please try again",
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontSize: 20,
                        color: AppColors.red,
                      ),
                    ),
                    crossFadeState:
                        _changePinCodeState.isNewPinMatched ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                    duration: const Duration(milliseconds: 1),
                  );
                },
              ),
              const Gap(30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ShakeAnimationWidget(
                  shakeAnimationController: _reEnteredPinShakeController,
                  shakeAnimationType: ShakeAnimationType.LeftRightShake,
                  isForward: false,
                  child: PinCodeTextField(
                    obscuringWidget: const Text(
                      '●',
                      style: TextStyle(fontSize: 15),
                    ),
                    autoDisposeControllers: false,
                    onCompleted: (value) async {
                      repeatPin = value;
                      if (repeatPin == newPin) {
                        await savePinCode(pinCode: value);
                        await _walletProtectState.isBiometricAvailable();
                        await router.pushAndPopAll(const DashboardRoute());
                      } else {
                        await HapticFeedback.vibrate();
                        _reEnteredPinShakeController.start();
                        await _changePinCodeState.newPinMatch();
                        _pageController.jumpToPage(1);
                        await Future.delayed(const Duration(milliseconds: 600));
                        _reEnteredPinShakeController.stop();
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
