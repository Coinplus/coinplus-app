import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../constants/buttons/button_settings.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../widgets/loading_button.dart';
import '../splash_screen/splash_screen.dart';

@RoutePage()
class WalletProtectionPage extends HookWidget {
  const WalletProtectionPage({super.key});

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      setWalletShown();
      _walletProtectState
        ..checkPinCodeStatus()
        ..checkBiometricStatus();
      return;
    });

    final onToggleAppLock = useCallback(
      (isEnable) async {
        if (isEnable) {
          await router.push(const CreatePinCode());
        } else {
          await router.push(const PinRemove());
        }
        await _walletProtectState.checkPinCodeStatus();
        await _walletProtectState.checkBiometricStatus();
      },
      [_walletProtectState.isSetPinCode],
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Assets.images.walletProtectImage.image().paddingHorizontal(60),
          const Text(
            'Protect your wallet',
            style: TextStyle(
              fontFamily: FontFamily.redHatBold,
              fontSize: 28,
            ),
          ),
          const Gap(5),
          const Text(
            'Adding a biometric security will ensure that \nyou are the only one that can access your \nwallet.',
            style: TextStyle(
              fontFamily: FontFamily.redHatLight,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(
            flex: 5,
          ),
          // if (Platform.isIOS)
          ScaleTap(
            onPressed: () {
              onToggleAppLock(!_walletProtectState.isSetPinCode);
            },
            child: Container(
              height: 66,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Assets.icons.lock.image(
                      color: AppColors.primary,
                      height: 28,
                    ),
                  ),
                  const Gap(18),
                  const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'App Lock',
                        style: TextStyle(
                          fontFamily: FontFamily.redHatMedium,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        'Secure your wallet with passcode',
                        style: TextStyle(
                          fontFamily: FontFamily.redHatMedium,
                          color: AppColors.textHintsColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Assets.icons.arrowForwardIos.image(
                    height: 30,
                  ),
                ],
              ).paddingOnly(top: 9, bottom: 9, left: 12, right: 12),
            ).paddingHorizontal(16),
          ),
          const Spacer(
            flex: 5,
          ),
          LoadingButton(
            style: context.theme.buttonStyle(
              buttonType: ButtonTypes.TRANSPARENT,
            ),
            onPressed: () {
              router.pushAndPopAll(const DashboardRoute());
            },
            child: const Text(
              'Not now',
              style: TextStyle(
                fontSize: 16,
                fontFamily: FontFamily.redHatMedium,
                fontWeight: FontWeight.normal,
                color: AppColors.primaryTextColor,
              ),
            ),
          ).paddingHorizontal(60),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
