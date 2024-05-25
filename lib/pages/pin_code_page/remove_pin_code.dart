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
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../providers/screen_service.dart';
import '../../services/amplitude_service.dart';
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        systemOverlayStyle: SystemUiOverlayStyle.light,
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
                'Remove passcode',
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
                autoDisposeControllers: false,
                autoFocus: true,
                blinkDuration: const Duration(milliseconds: 1),
                obscuringWidget: const Text(
                  '●',
                  style: TextStyle(fontSize: 15),
                ),
                onCompleted: (value) async {
                  final savedPinCode = await getSavedPinCode();
                  if (value == savedPinCode) {
                    await secureStorage.delete(key: 'pin_code');
                    await recordAmplitudeEventPartTwo(const AppLockDisabled());
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
        ],
      ),
    );
  }
}
