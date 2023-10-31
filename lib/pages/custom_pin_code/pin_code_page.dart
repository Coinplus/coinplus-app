import 'dart:developer';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';

@RoutePage()
class CustomPinCode extends StatefulWidget {
  const CustomPinCode({super.key});

  @override
  State<CustomPinCode> createState() => _CustomPinCodeState();
}

class _CustomPinCodeState extends State<CustomPinCode> {
  final _pageController = PageController();
  final _enterPinCodeController = TextEditingController();
  final _repeatPinCodeController = TextEditingController();
  final secureStorage = const FlutterSecureStorage();
  final _walletProtectState = WalletProtectState();
  final _enterPinFocusNode = FocusNode();
  final _repeatPinFocusNode = FocusNode();

  Future<void> _savePinCode(String pinCode) async {
    await secureStorage.write(key: 'pin_code', value: pinCode);
  }

  @override
  Widget build(BuildContext context) {
    var enteredPin = _enterPinCodeController.text;
    var repeatPin = _repeatPinCodeController.text;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Passcode',
          style: TextStyle(fontFamily: FontFamily.redHatMedium, fontSize: 18),
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          Column(
            children: [
              const Gap(130),
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
                  focusNode: _enterPinFocusNode,
                  controller: _enterPinCodeController,
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
              const Gap(130),
              const Text(
                'Repeat passcode',
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
                  focusNode: _repeatPinFocusNode,
                  controller: _repeatPinCodeController,
                  obscuringWidget: const Text(
                    '●',
                    style: TextStyle(fontSize: 15),
                  ),
                  onCompleted: (value) async {
                    repeatPin = value;
                    if(enteredPin == repeatPin)  {
                      _repeatPinFocusNode.unfocus();
                      await _savePinCode(value);
                      await _walletProtectState.authenticateWithBiometrics().then((value) =>  _authenticateAndPop());
                    } else {
                      log('Incorrect pin');
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
  void _authenticateAndPop() {
    router.push(const Dashboard());
  }
}
