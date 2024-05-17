import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';

import '../../../constants/currency.dart';
import '../../../extensions/extensions.dart';
import '../../../extensions/num_extension.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../widgets/loading_button/loading_button.dart';
import '../send_to_state.dart';
import 'amount_input_field/amount_input_field.dart';
import 'amount_match_cases_widgets/amount_match_cases_widgets.dart';

class ProvideAmountTab extends HookWidget {
  const ProvideAmountTab({
    super.key,
    required this.tabController,
    required this.state,
  });

  final SendToState state;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final formatter = useMemoized(
      () => NumberFormat.decimalPattern(context.locale.toString()),
      [context.locale],
    );
    final usdFocusNode = useFocusNode();
    final btcFocusNode = useFocusNode();
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: context.height * 0.8,
        child: Column(
          children: [
            const Text(
              'Amount',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryTextColor,
              ),
            ),
            AmountInputField(
              usdFocusNode: usdFocusNode,
              btcFocusNode: btcFocusNode,
              state: state,
            ),
            SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: SizedBox(
                height: context.height * 0.5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Card(
                        color: const Color(0xFFF7F7FA),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: Column(
                          children: [
                            AmountMatchWidget(state: state),
                            Observer(
                              builder: (context) {
                                return AnimatedCrossFade(
                                  firstChild: Column(
                                    children: [
                                      Observer(
                                        builder: (context) {
                                          return Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 10,
                                                  top: 10,
                                                  bottom: 10,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const Text(
                                                      'Estimated fee',
                                                      style: TextStyle(
                                                        fontFamily: FontFamily
                                                            .redHatMedium,
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: AppColors
                                                            .primaryTextColor,
                                                      ),
                                                    ),
                                                    const Gap(8),
                                                    Text(
                                                      '\$ ${formatter.format(state.networkFee)} ≈ ${state.networkFeeInBtc} BTC',
                                                      style: const TextStyle(
                                                        fontFamily: FontFamily
                                                            .redHatMedium,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: AppColors
                                                            .textHintsColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                      const Divider(
                                        endIndent: 10,
                                        indent: 10,
                                        height: 1,
                                      ),
                                    ],
                                  ),
                                  secondChild: const SizedBox(),
                                  crossFadeState: state.amount != 0
                                      ? CrossFadeState.showFirst
                                      : CrossFadeState.showSecond,
                                  duration: const Duration(milliseconds: 250),
                                  firstCurve: Curves.easeOut,
                                  secondCurve: Curves.elasticOut,
                                );
                              },
                            ),
                            Observer(
                              builder: (context) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                        top: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Selected wallet',
                                            style: TextStyle(
                                              fontFamily:
                                                  FontFamily.redHatMedium,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.primaryTextColor,
                                            ),
                                          ),
                                          const Gap(8),
                                          Text(
                                            state.formattedSelectedAddress,
                                            style: const TextStyle(
                                              fontFamily:
                                                  FontFamily.redHatMedium,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: AppColors.textHintsColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: 10,
                                        top: 10,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text(
                                            'Balance',
                                            style: TextStyle(
                                              fontFamily:
                                                  FontFamily.redHatMedium,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.primaryTextColor,
                                            ),
                                          ),
                                          const Gap(8),
                                          if (state.btc == null)
                                            const SizedBox()
                                          else
                                            Observer(
                                              builder: (_) {
                                                return AnimatedCrossFade(
                                                  firstChild: Observer(
                                                    builder: (context) {
                                                      return Text(
                                                        '\$${formatter.format(state.spendableBalance)}',
                                                        style: const TextStyle(
                                                          fontFamily: FontFamily
                                                              .redHatMedium,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .textHintsColor,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  secondChild: Observer(
                                                    builder: (context) {
                                                      return Text(
                                                        'BTC ${state.spendableBalance.usdToBtc(btcCurrentPrice: state.btcPrice)}',
                                                        style: const TextStyle(
                                                          fontFamily: FontFamily
                                                              .redHatMedium,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: AppColors
                                                              .textHintsColor,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  crossFadeState: state
                                                              .currency ==
                                                          Currency.USD
                                                      ? CrossFadeState.showFirst
                                                      : CrossFadeState
                                                          .showSecond,
                                                  duration: const Duration(
                                                    milliseconds: 300,
                                                  ),
                                                );
                                              },
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                            const Divider(
                              endIndent: 10,
                              indent: 10,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                    bottom: 10,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Send to',
                                        style: TextStyle(
                                          fontFamily: FontFamily.redHatMedium,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          color: AppColors.primaryTextColor,
                                        ),
                                      ),
                                      const Gap(8),
                                      Text(
                                        state.formattedAddress,
                                        style: const TextStyle(
                                          fontFamily: FontFamily.redHatMedium,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.textHintsColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Gap(12),
                    Observer(
                      builder: (context) {
                        return LoadingButton(
                          onPressed: state.sendAmountInUsd == 0
                              ? null
                              : !state.isInputtedAmountBiggerTotal
                                  ? !state.isCoverFee
                                      ? () async {
                                          usdFocusNode.unfocus();
                                          btcFocusNode.unfocus();
                                          await Future.delayed(
                                            const Duration(milliseconds: 400),
                                          );
                                          tabController.animateTo(2);
                                          await state.transactionsStore
                                              .findOptimalUtxo();
                                        }
                                      : null
                                  : null,
                          child: const Text(
                            'Next',
                            style: TextStyle(
                              fontFamily: FontFamily.redHatMedium,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ).paddingHorizontal(60);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
