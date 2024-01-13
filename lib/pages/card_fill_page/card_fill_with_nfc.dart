import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flip_card/flip_card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:nfc_manager/nfc_manager.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

import '../../constants/card_color.dart';
import '../../constants/card_type.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event.dart';
import '../../models/amplitude_user_property_model/amplitude_user_property_model.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../services/amplitude_service.dart';
import '../../services/cloud_firestore_service.dart';
import '../../services/firebase_service.dart';
import '../../store/accept_state/accept_state.dart';
import '../../store/address_and_balance_state/address_and_balance_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/checkbox_state/checkbox_state.dart';
import '../../store/connectivity_store/connectivity_store.dart';
import '../../store/qr_detect_state/qr_detect_state.dart';
import '../../store/secret_lines_state/secret_lines_state.dart';
import '../../widgets/loading_button.dart';
import '../splash_screen/splash_screen.dart';
import 'already_saved_card_dialog/already_saved_card_dialog.dart';
import 'card_widget_nfc_fill/card_widget_nfc_fill.dart';

@RoutePage()
class CardFillWithNfc extends StatefulWidget {
  const CardFillWithNfc({
    super.key,
    this.receivedData,
    this.cardColor,
    this.isOriginalCard,
    this.isMiFareUltralight,
    this.isOldCard,
    this.isActivated,
  });

  final String? receivedData;
  final String? cardColor;
  final bool? isOriginalCard;
  final bool? isMiFareUltralight;
  final bool? isOldCard;
  final bool? isActivated;

  @override
  State<CardFillWithNfc> createState() => _CardFillWithNfcState();
}

class _CardFillWithNfcState extends State<CardFillWithNfc> with TickerProviderStateMixin {
  final Connectivity _connectivity = Connectivity();

  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final _flipCardController = FlipCardController();
  final _lineStore = LinesStore();
  final _focusNode = FocusNode();
  final _addressState = AddressState(CardType.CARD);
  final _acceptState = AcceptState();
  final _checkboxState = CheckboxState();
  late final TextEditingController _btcAddressController = TextEditingController();
  late AnimationController _textFieldAnimationController;
  final ShakeAnimationController _shakeAnimationController = ShakeAnimationController();

  late AnimationController _lottieController;
  final _validationStore = ValidationState();
  final _connectivityStore = ConnectivityStore();

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  @override
  void initState() {
    super.initState();
    _toggleCard();
    if (Platform.isAndroid) {
      _nfcStop();
    }
    _btcAddressController.addListener(_addressState.validateBTCAddress);
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
      Future.delayed(const Duration(milliseconds: 300), () {
        _btcAddressController.text = widget.receivedData ?? '';
        _addressState.btcAddress = widget.receivedData!;
      });
    }
    _connectivityStore.initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_connectivityStore.updateConnectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    _focusNode.dispose();
    _lottieController.dispose();
    _textFieldAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Theme(
              data: ThemeData(
                canvasColor: Colors.white,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: IconButton(
                onPressed: () async {
                  unawaited(
                    _flipCardController.controller!.value == 1 && _lineStore.isLineVisible
                        ? makeLineInvisible()
                        : router.pop(),
                  );
                  await Future.delayed(const Duration(milliseconds: 500));
                  _checkboxState.isActive = false;
                  _acceptState.isAccepted = true;
                },
                icon: Assets.icons.arrowBackIos.image(height: 22),
              ),
            ),
            const Gap(10),
            const Text(
              'Virtual card',
              style: TextStyle(
                fontSize: 32,
                fontFamily: FontFamily.redHatBold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CardWidgetNfcFill(
              focusNode: _focusNode,
              linesStore: _lineStore,
              addressState: _addressState,
              cardColor: widget.cardColor,
              balanceStore: _balanceStore,
              validationState: _validationStore,
              lottieController: _lottieController,
              flipCardController: _flipCardController,
              btcAddressController: _btcAddressController,
              textFieldAnimationController: _textFieldAnimationController,
            ),
          ),
          if (context.height > 844) Gap(context.height * 0.001) else Gap(context.height * 0.02),
          Observer(
            builder: (context) {
              return ShakeAnimationWidget(
                shakeRange: 0.3,
                isForward: false,
                shakeAnimationController: _shakeAnimationController,
                shakeAnimationType: ShakeAnimationType.LeftRightShake,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        AnimatedCrossFade(
                          firstChild: AnimatedCrossFade(
                            firstChild: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                color: Colors.white.withOpacity(0.7),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Coinplus virtual card',
                                      style: TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: AppColors.textHintsColor,
                                      ),
                                    ).expandedHorizontally(),
                                    const Gap(4),
                                    const Text(
                                      'This is the virtual copy of your physical Coinplus Card with its address and the balance shown above. You can save it in the app for further easy access and tracking.',
                                      style: TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontSize: 14,
                                        color: AppColors.textHintsColor,
                                      ),
                                    ).expandedHorizontally(),
                                  ],
                                ),
                              ),
                            ),
                            secondChild: Observer(
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () {
                                    hasShownWallet().then(
                                      (hasShown) async {
                                        if (hasShown) {
                                          unawaited(
                                            recordAmplitudeEvent(
                                              ActivatedCheckboxClicked(
                                                source: 'Wallet',
                                                walletType: 'Card',
                                                walletAddress: _balanceStore.selectedCard!.address,
                                              ),
                                            ),
                                          );
                                        } else {
                                          unawaited(
                                            recordAmplitudeEvent(
                                              ActivatedCheckboxClicked(
                                                source: 'Onboarding',
                                                walletType: 'Card',
                                                walletAddress: _balanceStore.selectedCard!.address,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    );
                                    _checkboxState.makeActiveCheckbox();
                                    HapticFeedback.heavyImpact();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: _checkboxState.isActivatedCheckBox
                                            ? const Color(0xFF73C3A6)
                                            : const Color(0xFFFF2E00).withOpacity(0.6),
                                      ),
                                      color: _checkboxState.isActivatedCheckBox
                                          ? const Color(0xFF73C3A6).withOpacity(0.1)
                                          : const Color(0xFFFF2E00).withOpacity(0.05),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(14),
                                      child: Column(
                                        children: [
                                          const Text(
                                            'This card was previously activated!',
                                            style: TextStyle(
                                              fontFamily: FontFamily.redHatMedium,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16,
                                              color: AppColors.textHintsColor,
                                            ),
                                          ).expandedHorizontally(),
                                          const Gap(4),
                                          const Text(
                                            "This card has been used previously, and Secrets 1 and 2 were revealed. Others may have access to the funds. If you didn't activate the card yourself, please avoid using it.",
                                            style: TextStyle(
                                              fontFamily: FontFamily.redHatMedium,
                                              fontSize: 14,
                                              color: AppColors.textHintsColor,
                                            ),
                                          ).expandedHorizontally(),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            crossFadeState:
                                widget.isActivated == true ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                            duration: const Duration(milliseconds: 400),
                          ),
                          secondChild: GestureDetector(
                            onTap: () {
                              unawaited(
                                recordAmplitudeEvent(
                                  const WarningCheckboxClicked(),
                                ),
                              );
                              _checkboxState.makeActive();
                              HapticFeedback.heavyImpact();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: _checkboxState.isActive
                                      ? const Color(0xFF73C3A6)
                                      : _acceptState.isAccepted
                                          ? Colors.grey.withOpacity(0.3)
                                          : const Color(0xFFFF2E00).withOpacity(0.6),
                                ),
                                color: _checkboxState.isActive
                                    ? const Color(0xFF73C3A6).withOpacity(0.1)
                                    : _acceptState.isAccepted
                                        ? Colors.white.withOpacity(0.7)
                                        : const Color(0xFFFF2E00).withOpacity(0.05),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14),
                                child: Column(
                                  children: [
                                    const Text(
                                      'Keep your card safe!',
                                      style: TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: AppColors.textHintsColor,
                                      ),
                                    ).expandedHorizontally(),
                                    const Gap(4),
                                    const Text(
                                      'Make sure to keep your card safe! You will need your \nSecret 1 and Secret 2 in the future to manage your crypto.',
                                      style: TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontSize: 14,
                                        color: AppColors.textHintsColor,
                                      ),
                                    ).expandedHorizontally(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          crossFadeState:
                              !_lineStore.isLineVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 400),
                        ),
                      ],
                    ).paddingHorizontal(16),
                    Visibility(
                      visible: !_lineStore.isLineVisible,
                      child: Visibility(
                        visible: widget.isActivated == true,
                        child: Positioned(
                          right: 16,
                          child: Transform.scale(
                            scale: 1.2,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Observer(
                                builder: (context) {
                                  return Checkbox(
                                    checkColor: const Color(0xFF73C3A6),
                                    activeColor: const Color(0xFF73C3A6).withOpacity(0.5),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4),
                                      ),
                                    ),
                                    side: BorderSide(
                                      color: const Color(0xFFFF2E00).withOpacity(0.6),
                                    ),
                                    value: _checkboxState.isActivatedCheckBox,
                                    onChanged: (_) {
                                      hasShownWallet().then(
                                        (hasShown) async {
                                          if (hasShown) {
                                            unawaited(
                                              recordAmplitudeEvent(
                                                ActivatedCheckboxClicked(
                                                  source: 'Wallet',
                                                  walletType: 'Card',
                                                  walletAddress: _balanceStore.selectedCard!.address,
                                                ),
                                              ),
                                            );
                                          } else {
                                            unawaited(
                                              recordAmplitudeEvent(
                                                ActivatedCheckboxClicked(
                                                  source: 'Onboarding',
                                                  walletType: 'Card',
                                                  walletAddress: _balanceStore.selectedCard!.address,
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      );
                                      _checkboxState.makeActiveCheckbox();
                                    },
                                    splashRadius: 15,
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Observer(
                      builder: (context) {
                        return Visibility(
                          visible: _lineStore.isLineVisible,
                          child: Positioned(
                            right: 16,
                            child: Transform.scale(
                              scale: 1.2,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Observer(
                                  builder: (context) {
                                    return Checkbox(
                                      checkColor: const Color(0xFF73C3A6),
                                      activeColor: const Color(0xFF73C3A6).withOpacity(0.5),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      side: BorderSide(
                                        color: _acceptState.isAccepted
                                            ? Colors.grey.withOpacity(0.5)
                                            : const Color(0xFFFF2E00).withOpacity(0.6),
                                      ),
                                      value: _checkboxState.isActive,
                                      onChanged: (_) {
                                        recordAmplitudeEvent(
                                          const WarningCheckboxClicked(),
                                        );
                                        _checkboxState.makeActive();
                                      },
                                      splashRadius: 15,
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          if (context.height > 844) Gap(context.height * 0.04) else Gap(context.height * 0.03),
          Observer(
            builder: (_) {
              return _lineStore.isLineVisible
                  ? LoadingButton(
                      onPressed: () async {
                        if (_checkboxState.isActive) {
                          unawaited(signInAnonymously(address: _btcAddressController.text));
                          if (widget.isOriginalCard == true) {
                            unawaited(connectedCount(widget.receivedData!));
                            if (widget.cardColor == '0') {
                              _balanceStore.saveSelectedCard(color: CardColor.ORANGE);
                            } else if (widget.cardColor == '1') {
                              _balanceStore.saveSelectedCard(color: CardColor.WHITE);
                            } else if (widget.cardColor == '2') {
                              _balanceStore.saveSelectedCard(color: CardColor.BLACK);
                            } else {
                              _balanceStore.saveSelectedCard(color: CardColor.ORANGE);
                            }
                          } else {
                            if (widget.isMiFareUltralight == true) {
                              if (widget.isOldCard == false || widget.isOldCard == null) {
                                _balanceStore.saveSelectedCardAsTracker(
                                  color: CardColor.ORANGE,
                                  label: WalletType.TRACKER_PLUS,
                                  name: 'Bitcoin Wallet',
                                );
                              } else {
                                unawaited(connectedCount(widget.receivedData!));
                                _balanceStore.saveSelectedCardAsTracker(
                                  color: CardColor.ORANGE,
                                  label: WalletType.COINPLUS_WALLET,
                                  name: 'Coinplus Bitcoin Wallet',
                                );
                              }
                            } else {
                              await recordUserProperty(const Tracker());
                              _balanceStore.saveSelectedCardAsTracker(
                                color: CardColor.TRACKER,
                                label: WalletType.TRACKER,
                                name: 'Bitcoin Wallet',
                              );
                            }
                          }
                          await hasShownWallet().then((hasShown) {
                            recordAmplitudeEvent(CardAddedEvent(address: _balanceStore.selectedCard!.address));
                            recordUserProperty(const CardTap());
                            if (hasShown) {
                              router.pop();
                            } else {
                              router.pushAndPopAll(
                                const WalletProtectionRoute(),
                              );
                            }
                          });
                        } else {
                          await HapticFeedback.vibrate();
                          _acceptState.accept();
                          _shakeAnimationController.start();
                          await Future.delayed(
                            const Duration(
                              milliseconds: 600,
                            ),
                          );
                          _shakeAnimationController.stop();
                        }
                        await hasShownWallet().then(
                          (hasShown) async {
                            if (hasShown) {
                              await recordAmplitudeEvent(
                                GotItClicked(
                                  source: 'Wallet',
                                  walletType: 'Card',
                                  walletAddress: _balanceStore.selectedCard!.address,
                                ),
                              );
                            } else {
                              await recordAmplitudeEvent(
                                GotItClicked(
                                  source: 'Onboarding',
                                  walletType: 'Card',
                                  walletAddress: _balanceStore.selectedCard!.address,
                                ),
                              );
                              await recordAmplitudeEvent(CardAddedEvent(address: _balanceStore.selectedCard!.address));
                            }
                          },
                        );
                      },
                      child: const Text(
                        'Got it',
                        style: TextStyle(
                          fontSize: 17,
                          fontFamily: FontFamily.redHatSemiBold,
                        ),
                      ),
                    ).paddingHorizontal(49)
                  : Observer(
                      builder: (context) {
                        return LoadingButton(
                          onPressed: _connectivityStore.connectionStatus == ConnectivityResult.none
                              ? null
                              : _addressState.isAddressVisible
                                  ? _checkboxState.isActivatedCheckBox
                                      ? () async {
                                          await hasShownWallet().then(
                                            (hasShown) async {
                                              if (hasShown) {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Wallet',
                                                    walletType: 'Card',
                                                    walletAddress: _balanceStore.selectedCard!.address,
                                                  ),
                                                );
                                              } else {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Onboarding',
                                                    walletType: 'Card',
                                                    walletAddress: _balanceStore.selectedCard!.address,
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                          final cardIndex = _balanceStore.cards.indexWhere(
                                            (element) => element.address == _balanceStore.selectedCard?.address,
                                          );
                                          if (cardIndex != -1) {
                                            await alreadySavedCard(
                                              context: context,
                                              walletAddress: _balanceStore.selectedCard!.address,
                                            );
                                            _balanceStore.onCardAdded(_balanceStore.selectedCard!.address);
                                          } else {
                                            await _toggleCard();
                                            await Future.delayed(
                                              const Duration(milliseconds: 300),
                                            );
                                            _lineStore.makeVisible();
                                          }
                                        }
                                      : () async {
                                          await hasShownWallet().then(
                                            (hasShown) async {
                                              if (hasShown) {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Wallet',
                                                    walletType: 'Card',
                                                    walletAddress: _balanceStore.selectedCard!.address,
                                                  ),
                                                );
                                              } else {
                                                await recordAmplitudeEvent(
                                                  SaveToWalletClicked(
                                                    source: 'Onboarding',
                                                    walletType: 'Card',
                                                    walletAddress: _balanceStore.selectedCard!.address,
                                                  ),
                                                );
                                              }
                                            },
                                          );
                                          if (widget.isActivated == true) {
                                            await HapticFeedback.vibrate();
                                            _acceptState.checkboxAccept();
                                            _shakeAnimationController.start();
                                            await Future.delayed(
                                              const Duration(
                                                milliseconds: 600,
                                              ),
                                            );
                                            _shakeAnimationController.stop();
                                          } else {
                                            final cardIndex = _balanceStore.cards.indexWhere(
                                              (element) => element.address == _balanceStore.selectedCard?.address,
                                            );
                                            if (cardIndex != -1) {
                                              await alreadySavedCard(
                                                context: context,
                                                walletAddress: _balanceStore.selectedCard!.address,
                                              );
                                              _balanceStore.onCardAdded(_balanceStore.selectedCard!.address);
                                            } else {
                                              if (_flipCardController.state!.isFront) {
                                                await _toggleCard();
                                                _lineStore.makeVisible();
                                              }
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
                    );
            },
          ),
          if (context.height > 844) Gap(context.height * 0.1) else Gap(context.height * 0.05),
        ],
      ),
    );
  }

  Future<void> _nfcStop() async {
    await Future.delayed(const Duration(milliseconds: 3000));
    await NfcManager.instance.stopSession();
  }

  Future<void> _toggleCard() async {
    await Future.delayed(const Duration(milliseconds: 400));
    await _flipCardController.toggleCard();
  }

  Future<void> makeLineInvisible() async {
    await _toggleCard();
    await Future.delayed(const Duration(milliseconds: 350));
    _lineStore.makeInvisible();
  }
}
