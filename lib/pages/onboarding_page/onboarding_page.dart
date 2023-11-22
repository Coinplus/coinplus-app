import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';

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
import '../../utils/compute_private_key.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button.dart';
import '../splash_screen/splash_screen.dart';
import 'connect_manually_button/connect_manually_button.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _nfcState = NfcStore();
  late StreamSubscription<Map> streamSubscription;

  @override
  void initState() {
    super.initState();
    _nfcState.checkNfcSupport();
    streamSubscription = FlutterBranchSdk.initSession().listen(
      (data) {
        if (data.containsKey('+non_branch_link') && data['+non_branch_link'] != null) {
          final String url = data['+non_branch_link'];
          final splitting = url.split('/');
          final part = splitting[splitting.length - 1];
          isValidPublicAddress(part)
              ? hasShownWallet().then((hasShown) {
                  if (hasShown) {
                    router.push(CardFillRoute(receivedData: part));
                  } else {
                    router
                      ..push(const OnboardingRoute())
                      ..push(
                        CardFillRoute(receivedData: part),
                      );
                  }
                })
              : showTopSnackBar(
                  displayDuration: const Duration(
                    milliseconds: 400,
                  ),
                  Overlay.of(context),
                  CustomSnackBar.success(
                    backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
                    message: 'This is not valid Coinplus Bitcoin address',
                    textStyle: const TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                );
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
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
                          await NfcManager.instance.startSession(
                            alertMessage:
                                'It’s easy! Hold your phone near the Coinplus Card or on top of your Coinplus Bar’s box',
                            onDiscovered: (tag) async {
                              final ndef = Ndef.from(tag);
                              final records = ndef!.cachedMessage!.records;
                              dynamic walletAddress;
                              if (records.length >= 2) {
                                final hasJson = records[1].payload;
                                final payloadString = String.fromCharCodes(hasJson);
                                final Map payloadData = await json.decode(payloadString);
                                walletAddress = payloadData['a'];
                              } else {
                                final hasUrl = records[0].payload;
                                final payloadString = String.fromCharCodes(hasUrl);
                                final parts = payloadString.split('air.coinplus.com/btc/');
                                walletAddress = parts[1];
                              }

                              await NfcManager.instance.stopSession(alertMessage: 'Complete');
                              await Future.delayed(
                                const Duration(milliseconds: 2500),
                              );

                              await router.push(
                                CardFillWithNfc(
                                  receivedData: walletAddress.toString(),
                                ),
                              );
                            },
                            onError: (_) {
                              return Future(
                                () => log('Message'),
                              );
                            },
                          );
                        }
                      : () async {
                          await router.pop();
                          await NfcManager.instance.startSession(
                            onDiscovered: (tag) async {
                              final ndef = Ndef.from(tag);
                              final records = ndef!.cachedMessage!.records;
                              dynamic walletAddress;

                              if (records.length >= 2) {
                                final hasJson = records[1].payload;
                                final payloadString = String.fromCharCodes(hasJson);
                                final Map payloadData = await json.decode(payloadString);
                                walletAddress = payloadData['a'];
                              } else {
                                final hasUrl = records[0].payload;
                                final payloadString = String.fromCharCodes(hasUrl);
                                final parts = payloadString.split('air.coinplus.com/btc/');
                                walletAddress = parts[1];
                              }
                              await router.push(
                                CardFillWithNfc(
                                  receivedData: walletAddress.toString(),
                                ),
                              );
                            },
                            onError: (_) {
                              return Future(
                                () => log('Message'),
                              );
                            },
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
