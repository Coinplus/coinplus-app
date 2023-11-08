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
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/secure_storage_utils.dart';

@RoutePage()
class PinRemove extends StatelessWidget {
  const PinRemove({super.key});

  @override
  Widget build(BuildContext context) {
    final _walletProtectState = WalletProtectState();
    late final _shakeAnimationController = ShakeAnimationController();
    final _pinController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
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
            child: ShakeAnimationWidget(
              shakeAnimationController: _shakeAnimationController,
              shakeAnimationType: ShakeAnimationType.LeftRightShake,
              isForward: false,
              child: PinCodeTextField(
                focusNode: _walletProtectState.pinFocusNode,
                controller: _pinController,
                autoFocus: true,
                blinkDuration: const Duration(milliseconds: 1),
                obscuringWidget: const Text(
                  '●',
                  style: TextStyle(fontSize: 15),
                ),
                onCompleted: (value) async {
                  final savedPinCode = await getSavedPinCode();
                  if (value == savedPinCode) {
                    await router.pop();
                    await secureStorage.delete(key: 'pin_code');
                  } else {
                    await HapticFeedback.vibrate();
                    _pinController.text = '';
                    _walletProtectState.pinFocusNode.requestFocus();
                    _shakeAnimationController.start();
                    await _walletProtectState.dontMatch();
                    await Future.delayed(
                      const Duration(
                        milliseconds: 600,
                      ),
                    );
                    _shakeAnimationController.stop();
                  }
                },
                textCapitalization: TextCapitalization.characters,
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
                animationDuration: const Duration(milliseconds: 100),
                onChanged: (value) {},
                appContext: context,
              ),
            ),
          ),
          const Gap(20),
          const Text(
            'Enter your passcode',
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
    );
  }
}
