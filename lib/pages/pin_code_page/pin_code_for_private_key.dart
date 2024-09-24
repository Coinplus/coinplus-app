import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gaimon/gaimon.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../models/bar_model/bar_model.dart';
import '../../providers/screen_service.dart';
import '../../store/bar_color_state/bar_setting_state.dart';
import '../../store/card_color_state/card_setting_state.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/secure_storage_utils.dart';

@RoutePage()
class PinCodeForPrivateKey extends HookWidget {
  const PinCodeForPrivateKey({
    super.key,
    this.bar,
    this.isKeyVisible,
    this.card,
    this.isVisible,
  });

  final AbstractCard? card;
  final BarModel? bar;
  final CardSettingState? isVisible;
  final BarSettingState? isKeyVisible;

  @override
  Widget build(BuildContext context) {
    final _shakeAnimationController = useMemoized(ShakeAnimationController.new);
    final _pinController = useTextEditingController();
    final _secureStorage = SecureStorageService();

    useEffect(() {
      Future.delayed(Duration.zero, () async {
        await _walletProtectState.checkBiometricStatus();
        if (_walletProtectState.isBiometricsEnabled) {
          await _walletProtectState.authenticateWithBiometrics();
        }
      });
      return null;
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.transparent,
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Gap(70),
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
                autoDisposeControllers: false,
                blinkDuration: const Duration(milliseconds: 1),
                obscuringWidget: const Text(
                  '●',
                  style: TextStyle(fontSize: 15),
                ),
                onCompleted: (value) async {
                  final savedPinCode = await _secureStorage.getSavedPinCode();
                  if (value == savedPinCode) {
                    isVisible?.isPrivateKeyVisible = true;
                    await router.maybePop();
                  } else {
                    unawaited(_walletProtectState.dontMatch());
                    Gaimon.error();
                    _pinController.text = '';
                    _shakeAnimationController.start();
                    await Future.delayed(const Duration(milliseconds: 600));
                    _shakeAnimationController.stop();
                    _walletProtectState.pinFocusNode.requestFocus();
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
          Observer(
            builder: (_) {
              if (!_walletProtectState.isBiometricsEnabled) {
                return const SizedBox();
              }

              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration:
                            BoxDecoration(color: Colors.grey.withOpacity(0.3)),
                        height: 1,
                        width: 155,
                      ),
                      const Text(
                        'Or',
                        style: TextStyle(
                          fontFamily: FontFamily.redHatLight,
                          color: AppColors.primary,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        height: 1,
                        width: 155,
                      ),
                    ],
                  ),
                  const Gap(20),
                  ScaleTap(
                    enableFeedback: false,
                    onPressed: () {
                      _walletProtectState.authenticateWithBiometrics();
                    },
                    child: _walletProtectState.availableBiometric ==
                            BiometricType.fingerprint
                        ? Assets.icons.iphoneTouchId.image(
                            height: 30,
                          )
                        : Assets.icons.faceIDSuccess.image(
                            height: 30,
                          ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();
