import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../store/address_and_balance_state/address_and_balance_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/card_animation_state/card_animation_state.dart';
import '../../store/qr_detect_state/qr_detect_state.dart';
import '../../utils/compute_private_key.dart';
import '../../widgets/loading_button.dart';
import '../card_fill_page/already_saved_card_dialog/already_saved_card_dialog.dart';
import '../splash_screen/splash_screen.dart';

@RoutePage()
class BarFillPage extends StatefulWidget {
  const BarFillPage({super.key, this.receivedData});

  final String? receivedData;

  @override
  State<BarFillPage> createState() => _BarFillPageState();
}

class _BarFillPageState extends State<BarFillPage> with TickerProviderStateMixin {
  late TextEditingController _btcAddressController = TextEditingController();
  late AnimationController _textFieldAnimationController;
  final _cardAnimationState = CardAnimationState();
  late AnimationController _lottieController;
  final _validationStore = ValidationState();
  final _addressState = AddressState();
  final _focusNode = FocusNode();

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  @override
  void initState() {
    super.initState();
    _nfcStop();
    _toggleWidgets();
    _btcAddressController.addListener(_validateBTCAddress);
    _btcAddressController = TextEditingController();
    _btcAddressController.text = widget.receivedData ?? '';
    _lottieController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _focusNode.addListener(() {
      _focusNode.hasFocus ? _textFieldAnimationController.forward() : _textFieldAnimationController.animateBack(0);
    });
    _textFieldAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
      lowerBound: 1,
      upperBound: 1.09,
    );
    if (widget.receivedData != null) {
      onInitWithAddress();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldAnimationController.dispose();
  }

  Future<void> onInitWithAddress() async {
    _lottieController.reset();
    await _validateBTCAddress();
  }

  Future<void> _toggleWidgets() async {
    await Future.delayed(const Duration(milliseconds: 600));
    _cardAnimationState.startLoading();
  }

  Future<void> _nfcStop() async {
    await Future.delayed(const Duration(milliseconds: 10000));
    await NfcManager.instance.stopSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Virtual bar',
          style: TextStyle(
            fontSize: 32,
            fontFamily: FontFamily.redHatBold,
          ),
        ).expandedHorizontally(),
        backgroundColor: AppColors.scaffoldBackgroundColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Gap(20),
          Expanded(
            flex: 2,
            child: Observer(
              builder: (context) {
                final data = _balanceStore.coins;
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 600),
                  child: AnimatedSwitcher(
                    switchInCurve: Curves.bounceIn,
                    duration: const Duration(milliseconds: 600),
                    child: _addressState.isAddressVisible
                        ? Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: Assets.images.barEmpty.image().image,
                                ),
                              ),
                              child: Center(
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    return SizedBox(
                                      width: constraints.maxWidth * 0.6,
                                      child: Column(
                                        children: [
                                          const Gap(203),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Assets.icons.balance.image(
                                                      height: 12,
                                                    ),
                                                    Observer(
                                                      builder: (context) {
                                                        if (_balanceStore
                                                                .loadings[_balanceStore.selectedBar?.address] ??
                                                            false) {
                                                          return const Padding(
                                                            padding: EdgeInsets.all(
                                                              4,
                                                            ),
                                                            child: CupertinoActivityIndicator(
                                                              radius: 5,
                                                            ),
                                                          );
                                                        }
                                                        return Text(
                                                          (_balanceStore.selectedBar != null
                                                                  ? '\$${(_balanceStore.selectedBar!.data!.balance / 100000000 * data!.price).toStringAsFixed(2)}'
                                                                  : '')
                                                              .toString(),
                                                          style: TextStyle(
                                                            fontFamily: FontFamily.redHatMedium,
                                                            fontWeight: FontWeight.w700,
                                                            color: Colors.white.withOpacity(
                                                              0.7,
                                                            ),
                                                            fontSize: 25,
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Gap(11),
                                          Container(
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: Assets.icons.barAddressField.image().image,
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                vertical: 10,
                                                horizontal: 16,
                                              ),
                                              child: Observer(
                                                builder: (context) {
                                                  if (_balanceStore.loadings[_balanceStore.selectedBar?.address] ??
                                                      false) {
                                                    return const Padding(
                                                      padding: EdgeInsets.all(4),
                                                      child: CupertinoActivityIndicator(
                                                        radius: 5,
                                                      ),
                                                    );
                                                  }
                                                  return Text(
                                                    _balanceStore.selectedBar?.address ?? '',
                                                    style: const TextStyle(
                                                      fontFamily: FontFamily.redHatLight,
                                                      fontWeight: FontWeight.w700,
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Container(
                              width: context.width - 34,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: Assets.images.barEmpty.image().image,
                                ),
                              ),
                              child: Center(
                                child: Column(
                                  children: [
                                    const Gap(230),
                                    if (_addressState.isAddressVisible)
                                      const SizedBox()
                                    else
                                      Expanded(
                                        child: ScaleTransition(
                                          scale: _textFieldAnimationController,
                                          child: TextField(
                                            onChanged: (_) {
                                              _validateBTCAddress();
                                            },
                                            controller: _btcAddressController,
                                            maxLines: 2,
                                            minLines: 1,
                                            focusNode: _focusNode,
                                            cursorColor: AppColors.primaryButtonColor,
                                            cursorWidth: 1,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: AppColors.primaryTextColor,
                                              fontFamily: FontFamily.redHatLight,
                                            ),
                                            onTapOutside: (_) {
                                              WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                                            },
                                            decoration: InputDecoration(
                                              fillColor: Colors.white,
                                              hintText: 'Write here your \nbar address ',
                                              hintMaxLines: 2,
                                              hintStyle: TextStyle(
                                                fontFamily: FontFamily.redHatLight,
                                                fontSize: 12,
                                                color: AppColors.primaryTextColor.withOpacity(
                                                  0.4,
                                                ),
                                              ),
                                              contentPadding: const EdgeInsets.symmetric(
                                                horizontal: 8,
                                                vertical: 16,
                                              ),
                                              prefixIconConstraints: const BoxConstraints(
                                                minWidth: 27,
                                                minHeight: 27,
                                              ),
                                              prefixIcon: Observer(
                                                builder: (context) {
                                                  return Padding(
                                                    padding: const EdgeInsets.all(
                                                      4,
                                                    ),
                                                    child: _validationStore.isValid
                                                        ? IconButton(
                                                            onPressed: () async {
                                                              _focusNode.unfocus();
                                                              await Future.delayed(
                                                                const Duration(
                                                                  milliseconds: 300,
                                                                ),
                                                              );
                                                              final res = await context.pushRoute<String?>(
                                                                const QrScannerRoute(),
                                                              );
                                                              if (res == null) {
                                                                return;
                                                              }

                                                              _btcAddressController.text = res;
                                                              await _validateBTCAddress();
                                                            },
                                                            icon: Assets.images.qrCode.image(
                                                              height: 34,
                                                              color: AppColors.primaryTextColor,
                                                            ),
                                                          )
                                                        : Lottie.asset(
                                                            'assets/animated_logo/address_validation_success.json',
                                                            height: 24,
                                                            controller: _lottieController,
                                                            onLoaded: (composition) {
                                                              Future.delayed(
                                                                const Duration(
                                                                  milliseconds: 1000,
                                                                ),
                                                              );
                                                              _lottieController.duration = composition.duration;
                                                            },
                                                          ),
                                                  );
                                                },
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: AppColors.primaryButtonColor,
                                                ),
                                                borderRadius: BorderRadius.circular(
                                                  5,
                                                ),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.transparent,
                                                ),
                                                borderRadius: BorderRadius.circular(
                                                  5,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ).paddingHorizontal(60),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
          const Gap(20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey.withOpacity(0.3),
              ),
              color: Colors.white.withOpacity(0.7),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Observer(
                builder: (_) {
                  return Column(
                    children: [
                      AnimatedSwitcher(
                        switchInCurve: Curves.decelerate,
                        duration: const Duration(milliseconds: 300),
                        child: Row(
                          children: [
                            if (_addressState.isAddressVisible)
                              const Text(
                                'Coinplus Virtual Bar',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: AppColors.textHintsColor,
                                ),
                              )
                            else
                              const Text(
                                'Fill in the address of your physical bar \nwallet',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                  color: AppColors.textHintsColor,
                                ),
                              ),
                          ],
                        ),
                      ),
                      const Gap(4),
                      if (_addressState.isAddressVisible)
                        const Text(
                          'This is the virtual copy of your physical Coinplus Bar with its address and the balance shown above. You can save it in the app for further easy access and tracking.',
                          style: TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 14,
                            color: AppColors.textHintsColor,
                          ),
                        )
                      else
                        const Text(
                          'Please fill the address from your physical bar into the address input field, or scan the QR code.',
                          style: TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 14,
                            color: AppColors.textHintsColor,
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ).paddingHorizontal(16),
          const Gap(20),
          Observer(
            builder: (_) {
              return LoadingButton(
                onPressed: _addressState.isAddressVisible
                    ? () {
                        try {
                          _balanceStore.saveSelectedBar();
                          hasShownWallet().then((hasShown) {
                            if (hasShown) {
                              router.pop(Dashboard());
                            } else {
                              router.push(const WalletProtectionRoute());
                            }
                          });
                        } catch (e) {
                          if (!router.stackData
                              .indexWhere(
                                (element) => element.name == Dashboard.name,
                              )
                              .isNegative) {
                            router.pop();
                            alreadySavedCard(context);
                          }
                        }
                      }
                    : null,
                child: const Text(
                  'Save to wallet',
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: FontFamily.redHatSemiBold,
                  ),
                ),
              ).paddingHorizontal(49);
            },
          ),
          const Gap(50),
          //Gap(max(context.bottomPadding, 12)),
        ],
      ),
    );
  }

  Future<void> _validateBTCAddress() async {
    final btcAddress = _btcAddressController.text.trim();
    unawaited(
      _balanceStore.getSelectedBar(btcAddress),
    );
    if (isValidPublicAddress(btcAddress)) {
      _validationStore.validate();
      await Future.delayed(
        const Duration(seconds: 1),
      );
      _focusNode.unfocus();
      Future.delayed(
        const Duration(milliseconds: 1200),
        () => _addressState.isAddressVisible = true,
      );
      await _lottieController.forward(from: 0);
    } else {}
  }
}
