import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:nfc_manager/platform_tags.dart';
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
import '../../store/form_factor_state/form_factor_state.dart';
import '../../store/nfc_state/nfc_state.dart';
import '../../utils/compute_private_key.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button.dart';
import '../splash_screen/splash_screen.dart';
import 'form_factor_page/card_and_bar_scan.dart';
import 'form_factor_page/form_factor_page.dart';


@RoutePage()
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _nfcState = NfcStore();
  final _formFactorState = FormFactorState();
  late StreamSubscription<Map> streamSubscription;

  @override
  void initState() {
    super.initState();
    _nfcState.checkNfcSupport();
    streamSubscription = FlutterBranchSdk.initSession().listen(
      (data) {
        if (data.containsKey('+non_branch_link') &&
            data['+non_branch_link'] != null) {
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
                              final nfcA = MiFare.from(tag);
                              final ident = nfcA?.identifier
                                  .map(
                                    (byte) =>
                                        byte.toRadixString(16).padLeft(2, '0'),
                                  )
                                  .join();
                              log(ident.toString());
                              final signature = await nfcA?.sendMiFareCommand(
                                Uint8List.fromList([60, 0]),
                              );
                              log(
                                signature!
                                    .map(
                                      (byte) => byte
                                          .toRadixString(16)
                                          .padLeft(2, '0'),
                                    )
                                    .join()
                                    .toString(),
                              );

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
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    backgroundColor: Colors.white,
                    context: context,
                    builder: (context) {
                      return Observer(
                        builder: (context) {
                          return AnimatedContainer(
                            height: _formFactorState.isFirstWidget ? 250 : 320,
                            padding: const EdgeInsets.all(12),
                            duration: const Duration(milliseconds: 300),
                            // Animation duration
                            child: Wrap(
                              children: [
                                Center(
                                  child: Assets.icons.notch.image(
                                    width: 42,
                                  ),
                                ),
                                Row(
                                  children: [
                                    if (_formFactorState.isFirstWidget)
                                      IconButton(
                                        splashRadius: 20,
                                        icon: Assets.icons.close.image(
                                          height: 24,
                                        ),
                                        onPressed: router.pop,
                                      )
                                    else
                                      IconButton(
                                        splashRadius: 20,
                                        icon: Assets.icons.arrowBack.image(
                                          height: 24,
                                        ),
                                        onPressed:
                                            _formFactorState.toggleWidget,
                                      ),
                                    const Text(
                                      'Start with your wallet',
                                      style: TextStyle(
                                        fontFamily: FontFamily.redHatBold,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 17,
                                        color: AppColors.primaryTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: Column(
                                    children: [
                                      Observer(
                                        builder: (context) {
                                          return AnimatedSwitcher(
                                            duration: const Duration(
                                              milliseconds: 300,
                                            ),
                                            transitionBuilder: (
                                              child,
                                              animation,
                                            ) {
                                              final slideIn = Tween<Offset>(
                                                begin: const Offset(1, 0),
                                                end: const Offset(0, 0),
                                              ).animate(animation);

                                              final slideOut = Tween<Offset>(
                                                begin: const Offset(-1, 0),
                                                end: const Offset(0, 0),
                                              ).animate(animation);

                                              if (child.key ==
                                                  ValueKey<bool>(
                                                    _formFactorState
                                                        .isFirstWidget,
                                                  )) {
                                                return SlideTransition(
                                                  position: _formFactorState
                                                          .isFirstWidget
                                                      ? slideOut
                                                      : slideIn,
                                                  child: child,
                                                );
                                              } else {
                                                return SlideTransition(
                                                  position: _formFactorState
                                                          .isFirstWidget
                                                      ? slideIn
                                                      : slideOut,
                                                  child: child,
                                                );
                                              }
                                            },
                                            child: _formFactorState
                                                    .isFirstWidget
                                                ? CardAndBarScanMethodsPage(
                                                    key: const ValueKey<bool>(
                                                      true,
                                                    ),
                                                    formFactorState:
                                                        _formFactorState,
                                                  )
                                                : const FormFactorPage(
                                                    key: ValueKey<bool>(
                                                      false,
                                                    ),
                                                  ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ).then((value) => _formFactorState.isFirstWidget = true);
                },
                child: Text(
                  _nfcState.isNfcSupported
                      ? 'Connect manually'
                      : 'Connect wallet',
                  style: _nfcState.isNfcSupported
                      ? const TextStyle(
                          fontSize: 15,
                          fontFamily: FontFamily.redHatSemiBold,
                          color: Colors.black,
                        )
                      : const TextStyle(
                          fontSize: 15,
                          fontFamily: FontFamily.redHatSemiBold,
                          color: Colors.white,
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
                      overlayColor: MaterialStateProperty.all(AppColors.silver),
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
