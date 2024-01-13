import 'dart:async';
import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:did_change_authlocal/did_change_authlocal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gaimon/gaimon.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/secure_storage_utils.dart';
import '../../utils/storage_utils.dart';

@RoutePage()
class PinCodePage extends HookWidget {
  const PinCodePage({super.key});

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  @override
  Widget build(BuildContext context) {
    final _pinController = useTextEditingController();
    final isResumed = useState(false);
    final isFirstTime = useState(true);
    final _enteredPinShakeController = useMemoized(ShakeAnimationController.new);

    final isLocalAuthChanged = useCallback<Future<bool> Function()>(
      () async {
        final currentToken = await StorageUtils.getString(key: 'biometricsToken');

        if (currentToken == null) {
          return false;
        }

        final status = Platform.isIOS
            ? await DidChangeAuthLocal.instance.checkBiometricIOS(token: currentToken)
            : await DidChangeAuthLocal.instance.checkBiometricAndroid();
        return status == AuthLocalStatus.changed;
      },
    );

    useOnAppLifecycleStateChange(
      (previous, current) async {
        isResumed.value = [AppLifecycleState.resumed].contains(current);
        if (isFirstTime.value && isResumed.value) {
          await _walletProtectState.checkBiometricStatus();
          final isAuthChanged = await isLocalAuthChanged();
          if (isAuthChanged) {
            await disableBiometricAuth();
            _walletProtectState.isBiometricsEnabled = false;
          }
          if (_walletProtectState.isBiometricsEnabled && !isAuthChanged) {
            final currentToken = await DidChangeAuthLocal.instance.getTokenBiometric();
            await StorageUtils.setString(key: 'biometricsToken', value: currentToken);
            if (!isAuthChanged) {
              await _walletProtectState.authenticateWithBiometrics();
            }
          } else {
            _walletProtectState.pinFocusNode.requestFocus();
          }
          isFirstTime.value = false;
        }
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.transparent,
        ),
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
              shakeAnimationController: _enteredPinShakeController,
              shakeAnimationType: ShakeAnimationType.LeftRightShake,
              isForward: false,
              child: PinCodeTextField(
                focusNode: _walletProtectState.pinFocusNode,
                controller: _pinController,
                autoDisposeControllers: false,
                blinkDuration: const Duration(milliseconds: 1),
                obscuringWidget: const Text(
                  '●',
                  style: TextStyle(fontSize: 15),
                ),
                onCompleted: (value) async {
                  final savedPinCode = await getSavedPinCode();
                  if (value == savedPinCode) {
                    await router.pop();
                  } else {
                    unawaited(_walletProtectState.dontMatch());
                    Gaimon.error();
                    _pinController.text = '';
                    _enteredPinShakeController.start();
                    await Future.delayed(const Duration(milliseconds: 600));
                    _enteredPinShakeController.stop();
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
          const Gap(20),
          FutureBuilder(
            future: isLocalAuthChanged(),
            builder: (context, snapshot) {
              return Observer(
                builder: (_) {
                  if (!_walletProtectState.isBiometricsEnabled) {
                    return const SizedBox();
                  }
                  if (snapshot.data == true) {
                    return const SizedBox();
                  } else {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
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
                          child: Assets.icons.faceIDSuccess.image(
                            height: 30,
                          ),
                        ),
                      ],
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
