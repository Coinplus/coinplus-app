import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

import '../../constants/buttons/button_settings.dart';
import '../../extensions/context_extension.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../store/nfc_state/nfc_state.dart';
import '../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../utils/card_nfc_session.dart';
import '../../utils/deep_link_util.dart';
import '../../widgets/loading_button.dart';
import 'connect_manually_button/connect_manually_button.dart';

@RoutePage()
class OnboardingPage extends HookWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  @override
  Widget build(BuildContext context) {
    final _nfcState = useMemoized(NfcStore.new);
    final deepLinkRes = useRef<String?>(null);
    final resumed = useState(false);
    final isMifareUltralight = useRef<bool?>(false);

    useOnAppLifecycleStateChange(
      (previous, current) => resumed.value = [AppLifecycleState.resumed].contains(current),
    );

    useEffect(
      () {
        _nfcState.checkNfcSupport();
        final streamSubscription = FlutterBranchSdk.listSession().listen(
          (data) async {
            deepLinkRes.value = onLinkPassed(data);
            if (deepLinkRes.value != null &&
                router.current.name != CardFillWithNfc.name &&
                router.current.name != CardFillRoute.name &&
                router.current.name != BarFillRoute.name &&
                router.current.name != BarFillWithNfc.name) {
              await router.push(CardFillWithNfc(receivedData: deepLinkRes.value));
              deepLinkRes.value = null;
            }
          },
        );

        return streamSubscription.cancel;
      },
      [],
    );

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.transparent,
        ),
      ),
      backgroundColor: AppColors.scaffoldBackgroundColor,
      body: Observer(
        builder: (context) {
          return Column(
            children: [
              const Spacer(
                flex: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Gap(16),
                  SizedBox(
                    height: 56,
                    child: Assets.images.coinpluslogo.image(),
                  ),
                ],
              ),
              const Spacer(
                flex: 2,
              ),
              const Text(
                'Hey there,\nlet’s connect your new wallet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: FontFamily.redHatSemiBold,
                  color: AppColors.primaryTextColor,
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              if (_nfcState.isNfcSupported)
                LoadingButton(
                  onPressed: Platform.isIOS
                      ? () async {
                          await router.pop();
                          await nfcSessionIos(
                            isMifareUltralight: isMifareUltralight.value,
                            walletProtectState: _walletProtectState,
                          );
                        }
                      : () async {
                          await router.pop();
                          await nfcSessionAndroid(
                            isMifareUltralight: isMifareUltralight.value,
                            walletProtectState: _walletProtectState,
                          );
                          await showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return AnimatedOpacity(
                                duration: const Duration(
                                  milliseconds: 300,
                                ),
                                opacity: 1,
                                child: Container(
                                  height: 400,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(
                                        40,
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      const Gap(10),
                                      Assets.icons.notch.image(
                                        height: 4,
                                      ),
                                      const Gap(15),
                                      const Text(
                                        'Ready to Scan',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontFamily: FontFamily.redHatSemiBold,
                                          fontSize: 22,
                                          color: AppColors.primaryTextColor,
                                        ),
                                      ),
                                      const Gap(40),
                                      SizedBox(
                                        height: 150,
                                        width: 150,
                                        child: Lottie.asset(
                                          'assets/animated_logo/nfcanimation.json',
                                        ).expandedHorizontally(),
                                      ),
                                      const Gap(25),
                                      const Text(
                                        'It’s easy! Hold your phone near the Coinplus Card \nor on top of your Coinplus Bar’s box',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: FontFamily.redHatMedium,
                                        ),
                                      ).paddingHorizontal(50),
                                      const Gap(20),
                                      LoadingButton(
                                        onPressed: () async {
                                          await router.pop();
                                        },
                                        style: context.theme
                                            .buttonStyle(
                                              textStyle: const TextStyle(
                                                fontFamily: FontFamily.redHatMedium,
                                                color: AppColors.primaryTextColor,
                                                fontSize: 15,
                                              ),
                                            )
                                            .copyWith(
                                              backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.3)),
                                            ),
                                        child: const Text('Cancel'),
                                      ).paddingHorizontal(60),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Gap(5),
                      const Text(
                        'Connect wallet',
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: FontFamily.redHatSemiBold,
                        ),
                      ),
                      const Gap(5),
                      Assets.icons.nfcIcon.image(
                        height: 20,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ).paddingHorizontal(63)
              else
                const SizedBox(),
              const Gap(10),
              const ConnectManuallyButton(),
              const Spacer(
                flex: 3,
              ),
              LoadingButton(
                onPressed: () async {
                  await FlutterWebBrowser.openWebPage(
                    url: 'https://coinplus.com/shop/',
                    customTabsOptions: const CustomTabsOptions(
                      shareState: CustomTabsShareState.on,
                      instantAppsEnabled: true,
                      showTitle: true,
                      urlBarHidingEnabled: true,
                    ),
                    safariVCOptions: const SafariViewControllerOptions(
                      barCollapsingEnabled: true,
                      modalPresentationStyle: UIModalPresentationStyle.formSheet,
                      dismissButtonStyle: SafariViewControllerDismissButtonStyle.done,
                      modalPresentationCapturesStatusBarAppearance: true,
                    ),
                  );
                },
                style: context.theme
                    .buttonStyle(
                      buttonType: ButtonTypes.TRANSPARENT,
                      textStyle: const TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        color: AppColors.primaryTextColor,
                        fontSize: 15,
                      ),
                    )
                    .copyWith(
                      overlayColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Buy new card'),
                    const Gap(16),
                    Assets.icons.shop.image(
                      height: 24,
                    ),
                  ],
                ),
              ).paddingHorizontal(64),
              const Spacer(),
            ],
          );
        },
      ),
    );
  }
}
