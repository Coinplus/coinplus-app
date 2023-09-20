import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../constants/buttons/button_settings.dart';
import '../../extensions/elevated_button_extensions.dart';
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
import '../../widgets/loading_button.dart';
import '../card_fill_page/edit_address_dialog/edit_address_dialog.dart';
import '../card_fill_page/skip_button_alert/skip_button_alert.dart';
import '../splash_screen/splash_screen.dart';

@RoutePage()
class BarFillWithNfc extends StatefulWidget {
  const BarFillWithNfc({super.key, this.receivedData});
  final String? receivedData;
  @override
  State<BarFillWithNfc> createState() => _BarFillWithNfcState();
}

class _BarFillWithNfcState extends State<BarFillWithNfc>
    with TickerProviderStateMixin {
  late TextEditingController _btcAddressController = TextEditingController();
  final _cardAnimationState = CardAnimationState();
  final _validationStore = QrDetectState();
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
    if (widget.receivedData != null) {
      onInitWithAddress();
    }
  }

  Future<void> onInitWithAddress() async {
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
                final data = _balanceStore.coin?.coins.first;
                return AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  child: _addressState.isAddressVisible
                      ? Container(
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
                                      const Gap(23),
                                      Flexible(
                                        flex: 4,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 0,
                                              left: 0,
                                              right: 0,
                                              child:
                                                  Assets.images.topCircle.image(
                                                height: 165,
                                              ),
                                            ),
                                            Positioned(
                                              top: 1,
                                              left: 0,
                                              right: 0,
                                              child: Assets.images.hologram
                                                  .image(height: 163),
                                            ),
                                            Positioned(
                                              top: 60,
                                              left: 0,
                                              right: 0,
                                              child: Assets.images.barSecret1
                                                  .image(
                                                height: 40,
                                              ),
                                            ),
                                            const Positioned(
                                              top: 70,
                                              left: 0,
                                              right: 0,
                                              child: Text(
                                                'Secret 1',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily:
                                                      FontFamily.redHatMedium,
                                                  color: Colors.black26,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Assets.icons.balance.image(
                                                  height: 12,
                                                ),
                                                Observer(
                                                  builder: (context) {
                                                    if (_balanceStore.loadings[
                                                            _balanceStore
                                                                .selectedBar
                                                                ?.address] ??
                                                        false) {
                                                      return const Padding(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        child:
                                                            CupertinoActivityIndicator(
                                                          radius: 5,
                                                        ),
                                                      );
                                                    }
                                                    return Text(
                                                      (_balanceStore.selectedBar !=
                                                                  null
                                                              ? '\$${(_balanceStore.selectedBar!.balance! / 100000000 * data!.price).toStringAsFixed(2)}'
                                                              : '')
                                                          .toString(),
                                                      style: const TextStyle(
                                                        fontFamily: FontFamily
                                                            .redHatMedium,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black,
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
                                            image: Assets.icons.barAddressField
                                                .image()
                                                .image,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 16,
                                          ),
                                          child: Observer(
                                            builder: (context) {
                                              if (_balanceStore.loadings[
                                                      _balanceStore.selectedBar
                                                          ?.address] ??
                                                  false) {
                                                return const Padding(
                                                  padding: EdgeInsets.all(4),
                                                  child:
                                                      CupertinoActivityIndicator(
                                                    radius: 5,
                                                  ),
                                                );
                                              }
                                              return Text(
                                                _balanceStore
                                                        .selectedBar?.address ??
                                                    '',
                                                style: const TextStyle(
                                                  fontFamily:
                                                      FontFamily.redHatLight,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      const Gap(20),
                                      Assets.images.barLogo.image(
                                        height: 38,
                                      ),
                                      const Gap(12),
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: Assets.images.barSecret2
                                                .image()
                                                .image,
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 60,
                                            vertical: 16,
                                          ),
                                          child: Text(
                                            'Secret 2',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily:
                                                  FontFamily.redHatMedium,
                                              color: Colors.black26,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Gap(20),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: context.width - 34,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: Assets.images.skeletonEmpty.image().image,
                            ),
                          ),
                          child: LayoutBuilder(
                            builder: (_, constraints) {
                              return Center(
                                child: SizedBox(
                                  width: constraints.maxWidth * 0.5,
                                  child: Column(
                                    //mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Gap(23),
                                      Flexible(
                                        flex: 3,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 0,
                                              left: 0,
                                              right: 0,
                                              child: Assets
                                                  .images.skeletonCircle
                                                  .image(
                                                height: 165,
                                              ),
                                            ),
                                            Positioned(
                                              top: 60,
                                              left: 0,
                                              right: 0,
                                              child: Assets
                                                  .images.skeletonSecret1
                                                  .image(
                                                height: 40,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Assets.images.skeletonAddressField
                                          .image(),
                                      const Gap(20),
                                      Assets.images.skeletonLogo.image(
                                        height: 38,
                                      ),
                                      const Gap(12),
                                      Assets.images.skeletonSecret2.image(),
                                      const Gap(30),
                                    ],
                                  ),
                                ),
                              );
                            },
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
            child: const Padding(
              padding: EdgeInsets.all(14),
              child: Column(
                children: [
                  AnimatedSwitcher(
                    switchInCurve: Curves.decelerate,
                    duration: Duration(milliseconds: 300),
                    child: Row(
                      children: [
                        Text(
                          'Coinplus Virtual Bar',
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
                  Gap(4),
                  Text(
                    'This is the virtual copy of your physical Coinplus Bar with its address and the balance shown above. You can save it in the app for further easy access and tracking.',
                    style: TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 14,
                      color: AppColors.textHintsColor,
                    ),
                  ),
                ],
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
                              router.pop(const Dashboard());
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
                            editAddressDialog(context);
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
          const Gap(10),
          Observer(
            builder: (_) {
              return LoadingButton(
                onPressed: _addressState.isAddressVisible
                    ? () {
                        showMyDialog(context);
                      }
                    : () {
                        router.pop(const OnboardingRoute());
                      },
                style: context.theme
                    .buttonStyle(
                      buttonType: ButtonTypes.TRANSPARENT,
                      textStyle: const TextStyle(
                        fontFamily: FontFamily.redHatSemiBold,
                        color: AppColors.primaryTextColor,
                        fontSize: 17,
                      ),
                    )
                    .copyWith(
                      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                    ),
                child: const Text('Skip'),
              );
            },
          ),
          const Gap(20),
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
    if (isValidBTCAddress(btcAddress)) {
      _validationStore.validate();
      _focusNode.unfocus();
      Future.delayed(
        const Duration(milliseconds: 800),
        () => _addressState.isAddressVisible = true,
      );
    } else {}
  }

  bool isValidBTCAddress(String address) {
    final btcAddressRegex = RegExp(r'^(bc1|[13])[a-zA-HJ-NP-Z0-9]{33,39}$');
    return btcAddressRegex.hasMatch(address);
  }
}
