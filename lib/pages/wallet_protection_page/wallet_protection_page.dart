import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';

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

@RoutePage()
class WalletProtectionPage extends StatelessWidget {
  const WalletProtectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _walletProtectState = WalletProtectState();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
          Container(
            height: 66,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.silver,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5),
                  child: Assets.icons.lock.image(
                    color: const Color(0xFF007AFF),
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
                Observer(
                  builder: (context) {
                    return CupertinoSwitch(
                      onChanged: (_) async {
                        await _walletProtectState.onToggleSwitch();
                        await Future.delayed(
                          const Duration(
                            milliseconds: 300,
                          ),
                        );
                        await router.push(const CreatePinRoute());
                      },
                      value: _walletProtectState.isToggleSwitched && true,
                    );
                  },
                ),
              ],
            ).paddingOnly(top: 9, bottom: 9, left: 12, right: 12),
          ).paddingHorizontal(16),
          // else
          //   Container(),
          const Spacer(
            flex: 5,
          ),
          LoadingButton(
            style: context.theme.buttonStyle(
              buttonType: ButtonTypes.TRANSPARENT,
            ),
            onPressed: () {
              router.pushAndPopAll(const Dashboard());
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
