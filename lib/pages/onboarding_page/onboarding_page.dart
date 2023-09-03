import 'dart:convert';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:just_bottom_sheet/just_bottom_sheet.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:url_launcher/url_launcher.dart';

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
import '../../widgets/loading_button.dart';

@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late PageController _controller = PageController();
  final _nfcState = NfcStore();


  @override
  void initState() {
    _controller = PageController()..addListener(() {});
    super.initState();
    _nfcState.checkNfcSupport();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
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
                                final payloadString =
                                    String.fromCharCodes(hasJson);
                                final Map payloadData =
                                    await json.decode(payloadString);
                                walletAddress = payloadData['a'];
                              } else {
                                final hasUrl = records[0].payload;
                                final payloadString =
                                    String.fromCharCodes(hasUrl);
                                final parts = payloadString
                                    .split('air.coinplus.com/btc/');
                                walletAddress = parts[1];
                              }

                              await NfcManager.instance
                                  .stopSession(alertMessage: 'Complete');
                              await Future.delayed(
                                const Duration(milliseconds: 2500),
                              );

                              await router.push(
                                CardFillRoute(
                                  receivedData: walletAddress.toString(),
                                ),
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
                                final payloadString =
                                    String.fromCharCodes(hasJson);
                                final Map payloadData =
                                    await json.decode(payloadString);
                                walletAddress = payloadData['a'];
                              } else {
                                final hasUrl = records[0].payload;
                                final payloadString =
                                    String.fromCharCodes(hasUrl);
                                final parts = payloadString
                                    .split('air.coinplus.com/btc/');
                                walletAddress = parts[1];
                              }
                              await router.push(
                                CardFillRoute(
                                  receivedData: walletAddress.toString(),
                                ),
                              );
                            },
                          );
                          await showModalBottomSheet(
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) {
                              return AnimatedOpacity(
                                duration: const Duration(milliseconds: 300),
                                opacity: 1,
                                child: Container(
                                  height: 400,
                                  decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      const Gap(10),
                                      Row(
                                        children: [
                                          const Gap(16),
                                          IconButton(
                                            onPressed: router.pop,
                                            icon: const Icon(
                                              Icons.close_sharp,
                                              size: 25,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const Expanded(
                                            child: Text(
                                              'Start with your wallet',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily:
                                                    FontFamily.redHatSemiBold,
                                                fontSize: 17,
                                                color:
                                                    AppColors.primaryTextColor,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 60,
                                          ),
                                        ],
                                      ),
                                      const Gap(10),
                                      const Divider(
                                        thickness: 2,
                                        height: 2,
                                        indent: 15,
                                        endIndent: 15,
                                        color: Color(0xFFF1F1F1),
                                      ),
                                      const Gap(42),
                                      SizedBox(
                                        height: 120,
                                        width: 120,
                                        child: Lottie.asset(
                                          'assets/animated_logo/nfcanimation.json',
                                        ).expandedHorizontally(),
                                      ),
                                      const Gap(20),
                                      const Text(
                                        'It’s easy! Hold your phone near the Coinplus Card \nor on top of your Coinplus Bar’s box',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontFamily: FontFamily.redHatMedium,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                  child: const Text(
                    'Connect wallet',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: FontFamily.redHatSemiBold,
                    ),
                  ),
                ).paddingHorizontal(63)
              else
                const SizedBox(),
              const Gap(10),
              LoadingButton(
                style: _nfcState.isNfcSupported
                    ? context.theme
                        .buttonStyle(
                          textStyle: const TextStyle(
                            fontFamily: FontFamily.redHatSemiBold,
                            color: AppColors.primaryButtonColor,
                            fontSize: 17,
                          ),
                        )
                        .copyWith(
                          backgroundColor: MaterialStateProperty.all(
                            AppColors.silver,
                          ),
                          padding: const MaterialStatePropertyAll(
                            EdgeInsets.all(13),
                          ),
                        )
                    : null,
                onPressed: () {
                  showModalBottomSheet(
                    isScrollControlled: false,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: const EdgeInsets.all(16),
                        child:  Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Assets.icons.notch.image(
                              width: 42,
                            ),
                            const Flexible(
                              flex: 4,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 25, left: 20),
                                    child: Text(
                                      'Start with your wallet',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: FontFamily.redHatBold,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                        color: AppColors.primaryTextColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const Gap(20),
                          ],
                        ),
                      );
                    },
                  );

                },
                child: Text(
                  _nfcState.isNfcSupported
                      ? 'Connect manually'
                      : 'Connect wallet',
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: FontFamily.redHatSemiBold,
                    color: Colors.black,
                  ),
                ),
              ).paddingHorizontal(63),
              const Spacer(
                flex: 3,
              ),
              LoadingButton(
                onPressed: () async {
                  final url = Uri.parse('https://coinplus.com/shop/');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
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
                      overlayColor:  MaterialStateProperty.all(AppColors.silver),
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
