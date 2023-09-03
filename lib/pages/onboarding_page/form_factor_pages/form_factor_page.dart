import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../store/form_factor_state/form_factor_state.dart';

class FormFactorPage extends StatefulWidget {
  const FormFactorPage({super.key});


  @override
  State<FormFactorPage> createState() => _FormFactorPageState();
}

class _FormFactorPageState extends State<FormFactorPage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 400),
  );
  late final Animation<Offset> _cardAnimation =
      Tween<Offset>(begin: const Offset(0, 0), end: const Offset(0.44, 0))
          .animate(
    CurvedAnimation(parent: _controller, curve: Curves.decelerate),
  );
  late final Animation<Offset> _barAnimation =
      Tween<Offset>(begin: const Offset(0, 0), end: const Offset(-0.73, 0))
          .animate(
    CurvedAnimation(parent: _controller, curve: Curves.decelerate),
  );
  final _formFactorState = FormFactorState();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Gap(22),
        const Text(
          'Please select a wallet form: card or bar?',
          style: TextStyle(
            fontFamily: FontFamily.redHatMedium,
            color: AppColors.primaryTextColor,
            fontSize: 14,
          ),
        ),
        const Gap(30),
        SizedBox(
          height: 220,
          child: Observer(
            builder: (context) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      const Gap(30),
                      GestureDetector(
                        onTap: () async {
                          _formFactorState.cardSelection();
                          await _controller.forward();
                          await Future.delayed(
                            const Duration(milliseconds: 100),
                          );
                          await router.pop(context);
                          await router.push(CardFillRoute());
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
                                  Assets.images.formCardSelected.image(
                                    height: 100,
                                  )
                                else
                                  Assets.images.cardForm.image(height: 80),
                                const Gap(50),
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
                      const Gap(10),
                      GestureDetector(
                        onTap: () async {
                          _formFactorState.barSelection();
                          await _controller.forward();
                          await Future.delayed(
                            const Duration(milliseconds: 100),
                          );
                          await router.pop(context);
                          await router.push(BarFillRoute());
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
                                  Assets.images.formBarSelected.image(
                                    height: 160,
                                  )
                                else
                                  Assets.images.barForm.image(height: 120),
                                const Gap(30),
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
