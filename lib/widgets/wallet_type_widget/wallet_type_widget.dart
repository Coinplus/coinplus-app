import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event_part_one/amplitude_event.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../services/amplitude_service.dart';
import '../../store/wallet_type_state/wallet_type_state.dart';

class WalletTypeWidget extends StatefulWidget {
  const WalletTypeWidget({super.key, required this.pageIndexNotifier});

  final ValueNotifier pageIndexNotifier;

  @override
  State<WalletTypeWidget> createState() => _WalletTypeWidgetState();
}

class _WalletTypeWidgetState extends State<WalletTypeWidget> with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 400),
  );
  late final Animation<Offset> _cardAnimation =
      Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.44, 0)).animate(
    CurvedAnimation(parent: _controller, curve: Curves.decelerate),
  );
  late final Animation<Offset> _barAnimation =
      Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-0.73, 0)).animate(
    CurvedAnimation(parent: _controller, curve: Curves.decelerate),
  );
  final _formFactorState = WalletTypeState();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(30),
        SizedBox(
          child: Observer(
            builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Gap(20),
                      GestureDetector(
                        onTap: () async {
                          _formFactorState.cardSelection();
                          await _controller.forward();
                          await Future.delayed(
                            const Duration(milliseconds: 100),
                          );
                          await router.maybePop(context);
                          widget.pageIndexNotifier.value = 0;
                          await recordAmplitudeEvent(
                            const TypeSelected(
                              source: 'Onboarding',
                              walletType: 'Card',
                            ),
                          );
                          await router.push(CardConnectRoute());
                        },
                        child: Visibility(
                          visible: _formFactorState.isFirstWidgetVisible,
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: SlideTransition(
                            position: _cardAnimation,
                            child: Column(
                              children: [
                                if (_formFactorState.isFirstWidgetZoomed)
                                  Assets.images.card.formCardSelected.image(
                                    height: 100,
                                  )
                                else
                                  Assets.images.card.cardForm.image(height: 80),
                                const Gap(35),
                                const Text(
                                  'Card',
                                  style: TextStyle(
                                    fontFamily: FontFamily.redHatSemiBold,
                                    fontSize: 15,
                                    color: AppColors.primaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(54),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () async {
                          _formFactorState.barSelection();
                          await _controller.forward();
                          await Future.delayed(
                            const Duration(milliseconds: 100),
                          );
                          await router.maybePop(context);
                          widget.pageIndexNotifier.value = 0;
                          await recordAmplitudeEvent(
                            const TypeSelected(
                              source: 'Onboarding',
                              walletType: 'Bar',
                            ),
                          );
                          await router.push(BarConnectRoute());
                        },
                        child: Visibility(
                          visible: _formFactorState.isSecondWidgetVisible,
                          maintainSize: true,
                          maintainAnimation: true,
                          maintainState: true,
                          child: SlideTransition(
                            position: _barAnimation,
                            child: Column(
                              children: [
                                if (_formFactorState.isSecondWidgetZoomed)
                                  Assets.images.bar.formBarSelected.image(
                                    height: 150,
                                  )
                                else
                                  Assets.images.bar.barForm.image(height: 120),
                                const Gap(20),
                                const Text(
                                  'Bar',
                                  style: TextStyle(
                                    fontFamily: FontFamily.redHatSemiBold,
                                    fontSize: 15,
                                    color: AppColors.primaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
