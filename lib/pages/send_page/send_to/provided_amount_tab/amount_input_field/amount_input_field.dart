import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gaimon/gaimon.dart';
import 'package:gap/gap.dart';

import '../../../../../constants/currency.dart';
import '../../../../../extensions/num_extension.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../gen/fonts.gen.dart';
import '../../send_to_state.dart';
import 'btc_amount_text_field/btc_amount_text_field.dart';
import 'usd_amount_text_field/usd_amount_text_field.dart';

class AmountInputField extends HookWidget {
  const AmountInputField({
    super.key,
    required this.usdFocusNode,
    required this.btcFocusNode,
    required this.state,
  });

  final SendToState state;
  final FocusNode usdFocusNode;
  final FocusNode btcFocusNode;

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
                    if (state.currency == Currency.USD)
                      UsdAmountTextField(
                        state: state,
                        usdFocusNode: usdFocusNode,
                      )
                    else if (state.currency == Currency.USD)
                      const SizedBox()
                    else
                      BtcAmountTextField(
                        state: state,
                        btcFocusNode: btcFocusNode,
                      ),
                    IconButton(
                      splashRadius: 25,
                      onPressed: () async {
                        await state.onToggleCurrency();
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
                                final value = state.amount
                                    .usdToBtc(
                                      btcCurrentPrice: state.btcPrice,
                                    )
                                    .toStringAsFixed(8);
                                final formattedValue = value.replaceAll(
                                  RegExp(r'([.]*0+)(?!.*\d)'),
                                  '',
                                );
                                return Text(
                                  state.currency == Currency.USD
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
                            final value = state.amount.toStringAsFixed(3);
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
                        crossFadeState: state.currency == Currency.USD
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 300),
                      ),
                    ],
                  ),
                  secondChild: const SizedBox(),
                  crossFadeState: state.isConvertedAmountVisible &&
                          !state.isInputtedAmountBiggerTotal
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
                  state.isUseMaxClicked ? 'Maximum sendable amount' : '',
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
                onPressed: () {
                  final res = state.onUseMax();
                  if (res == 0) {
                    state.usdController.text = '0';
                    state.btcController.text = '0';
                    Gaimon.error();
                    return;
                  }
                  if (res != 0 &&
                      res >
                          state.transactionsStore.txFee.satoshiToUsd(
                            btcCurrentPrice: state.btcPrice,
                          )) {
                    final maxSendAmount = res -
                        state.transactionsStore.txFee.satoshiToUsd(
                          btcCurrentPrice: state.btcPrice,
                        );
                    state.setAmount(maxSendAmount.toString());
                    state.usdController.text = maxSendAmount.toStringAsFixed(3);
                    final btcAmount =
                        res.usdToBtc(btcCurrentPrice: state.btcPrice);

                    final txFeeInBtc =
                        state.transactionsStore.txFee.satoshiToBtc();

                    final maxSendAmountInBtc = btcAmount - txFeeInBtc;
                    state.setAmount(
                      maxSendAmountInBtc
                          .btcToUsd(btcCurrentPrice: state.btcPrice)
                          .toString(),
                    );
                    state.btcController.text =
                        maxSendAmountInBtc.toStringAsFixed(8).toString();
                  } else {
                    state.usdController.text = '0';
                    state.btcController.text = '0';
                    Gaimon.error();
                  }
                },
                child: Text(
                  !state.isUseMaxClicked ? 'Use max' : '',
                  style: const TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF838995),
                  ),
                ),
              ),
              crossFadeState: state.isUseMaxClicked
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(milliseconds: 300),
              firstCurve: Curves.bounceIn,
            );
          },
        ),
      ],
    );
  }
}
