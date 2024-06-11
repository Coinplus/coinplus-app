import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../send_to_state.dart';

class AmountMatchWidget extends StatelessWidget {
  const AmountMatchWidget({super.key, required this.state});

  final SendToState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Observer(
              builder: (context) {
                return AnimatedCrossFade(
                  firstChild: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xFFEEEFF4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 4,
                              top: 4,
                              bottom: 4,
                            ),
                            child: Assets.icons.info.image(
                              height: 20,
                              color: const Color(
                                0xFFE87E57,
                              ),
                            ),
                          ),
                          const Gap(4),
                          const Text(
                            'Not enough funds to cover the fee',
                            style: TextStyle(
                              fontFamily: FontFamily.redHatMedium,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFE87E57),
                            ),
                          ),
                          const Gap(6),
                        ],
                      ),
                    ),
                  ),
                  secondChild: const SizedBox(),
                  crossFadeState: () {
                    if (state.isCoverFee) {
                      return CrossFadeState.showFirst;
                    } else {
                      return CrossFadeState.showSecond;
                    }
                  }(),
                  duration: const Duration(milliseconds: 300),
                );
              },
            ),
          ],
        ),
        Row(
          children: [
            Observer(
              builder: (context) {
                return AnimatedCrossFade(
                  firstChild: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xFFEEEFF4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 4,
                              top: 4,
                              bottom: 4,
                            ),
                            child: Assets.icons.info.image(
                              height: 20,
                              color: const Color(
                                0xFFE87E57,
                              ),
                            ),
                          ),
                          const Gap(4),
                          const Text(
                            'Not enough funds',
                            style: TextStyle(
                              fontFamily: FontFamily.redHatMedium,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFE87E57),
                            ),
                          ),
                          const Gap(6),
                        ],
                      ),
                    ),
                  ),
                  secondChild: const SizedBox(),
                  crossFadeState: () {
                    if (state.isInputtedAmountBiggerTotal &&
                        !state.isCoverFee) {
                      return CrossFadeState.showFirst;
                    } else {
                      return CrossFadeState.showSecond;
                    }
                  }(),
                  duration: const Duration(milliseconds: 300),
                );
              },
            ),
          ],
        ),
        Row(
          children: [
            Observer(
              builder: (context) {
                return AnimatedCrossFade(
                  firstChild: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color(0xFFEEEFF4),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 4,
                              top: 4,
                              bottom: 4,
                            ),
                            child: Assets.icons.info.image(
                              height: 20,
                              color: const Color(
                                0xFFE87E57,
                              ),
                            ),
                          ),
                          const Gap(4),
                          const Text(
                            'Amount is too small',
                            style: TextStyle(
                              fontFamily: FontFamily.redHatMedium,
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFFE87E57),
                            ),
                          ),
                          const Gap(6),
                        ],
                      ),
                    ),
                  ),
                  secondChild: const SizedBox(),
                  crossFadeState: state.isAmountToSmall
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 300),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
