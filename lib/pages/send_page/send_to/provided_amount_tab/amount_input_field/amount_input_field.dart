import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../../../constants/currency.dart';
import '../../../../../extensions/num_extension.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/fonts.gen.dart';
import '../../../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../../../services/amplitude_service.dart';
import '../../send_to_state.dart';
import '../use_max_action/use_max_action.dart';
import 'btc_amount_text_field/btc_amount_text_field.dart';
import 'usd_amount_text_field/usd_amount_text_field.dart';

class AmountInputField extends HookWidget {
  const AmountInputField({
    super.key,
    required this.usdFocusNode,
    required this.btcFocusNode,
  });

  final FocusNode usdFocusNode;
  final FocusNode btcFocusNode;

  SendToState get _sendToState => GetIt.I<SendToState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Observer(
              builder: (context) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Gap(60),
                    if (_sendToState.currency == Currency.USD)
                      UsdAmountTextField(
                        usdFocusNode: usdFocusNode,
                      )
                    else if (_sendToState.currency == Currency.USD)
                      const SizedBox()
                    else
                      BtcAmountTextField(
                        btcFocusNode: btcFocusNode,
                      ),
                    IconButton(
                      splashRadius: 25,
                      onPressed: () async {
                        await _sendToState.onToggleCurrency();
                        await recordAmplitudeEventPartTwo(
                          SendCurrencyChanged(
                            currency: _sendToState.currency.name.toString(),
                          ),
                        );
                      },
                      icon: Assets.icons.swapButton.image(
                        height: 30,
                        color: const Color(0xFF4A83E0),
                      ),
                    ),
                    const Gap(20),
                  ],
                );
              },
            ),
            Observer(
              builder: (context) {
                return AnimatedCrossFade(
                  firstChild: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        '≈',
                        style: TextStyle(
                          fontFamily: FontFamily.redHatMedium,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF838995),
                        ),
                      ),
                      const Gap(6),
                      AnimatedCrossFade(
                        firstChild: Row(
                          children: [
                            Assets.icons.bTCIcon.image(height: 20),
                            const Gap(6),
                            Observer(
                              builder: (context) {
                                final value = _sendToState.amount
                                    .usdToBtc(
                                      btcCurrentPrice: _sendToState.btcPrice,
                                    )
                                    .toStringAsFixed(8);
                                final formattedValue = value.replaceAll(
                                  RegExp(r'([.]*0+)(?!.*\d)'),
                                  '',
                                );
                                return Text(
                                  _sendToState.currency == Currency.USD
                                      ? formattedValue.isEmpty
                                          ? '0'
                                          : formattedValue
                                      : '',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: FontFamily.redHatMedium,
                                    color: Color(0xFF838995),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        secondChild: Observer(
                          builder: (context) {
                            final value = _sendToState.amount.toStringAsFixed(3);
                            return Text(
                              '\$ $value',
                              style: const TextStyle(
                                fontFamily: FontFamily.redHatMedium,
                                fontSize: 15,
                                color: Color(0xFF838995),
                                fontWeight: FontWeight.w500,
                              ),
                            );
                          },
                        ),
                        crossFadeState: _sendToState.currency == Currency.USD
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 300),
                      ),
                    ],
                  ),
                  secondChild: const SizedBox(),
                  crossFadeState: _sendToState.isConvertedAmountVisible && !_sendToState.isInputtedAmountBiggerTotal
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(milliseconds: 300),
                );
              },
            ),
          ],
        ),
        Observer(
          builder: (context) {
            return AnimatedCrossFade(
              secondChild: Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  _sendToState.isUseMaxClicked ? 'Maximum spendable amount' : '',
                  style: const TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF838995),
                  ),
                ),
              ),
              firstChild: TextButton(
                style: ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: WidgetStateProperty.resolveWith(
                    (states) => Colors.grey.withOpacity(0.2),
                  ),
                ),
                onPressed: useMaxAction,
                child: Text(
                  !_sendToState.isUseMaxClicked ? 'Use max' : '',
                  style: const TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF838995),
                  ),
                ),
              ),
              crossFadeState: _sendToState.isUseMaxClicked ? CrossFadeState.showSecond : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
              firstCurve: Curves.bounceIn,
            );
          },
        ),
      ],
    );
  }
}
