import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../../constants/currency.dart';
import '../../../../extensions/extensions.dart';
import '../../../../extensions/num_extension.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../../services/amplitude_service.dart';
import '../../../../widgets/loading_button/loading_button.dart';
import '../send_to_state.dart';
import 'amount_input_field/amount_input_field.dart';
import 'amount_match_cases_widgets/amount_match_cases_widgets.dart';

class ProvideAmountTab extends HookWidget {
  const ProvideAmountTab({
    super.key,
    required this.tabController,
    required this.isBarList,
    required this.usdFocusNode,
    required this.btcFocusNode,
  });

  final TabController tabController;
  final bool isBarList;
  final FocusNode usdFocusNode;
  final FocusNode btcFocusNode;

  SendToState get _sendToState => GetIt.I<SendToState>();

  @override
  Widget build(BuildContext context) {
    final formatter = useMemoized(
      () => NumberFormat.decimalPattern(context.locale.toString()),
      [context.locale],
    );

    return Observer(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
          },
          child: SingleChildScrollView(
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
                                  const AmountMatchWidget(),
                                  Observer(
                                    builder: (context) {
                                      return AnimatedCrossFade(
                                        firstChild: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.only(
                                                    left: 10,
                                                    top: 10,
                                                    bottom: 10,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      const Text(
                                                        'Estimated fee',
                                                        style: TextStyle(
                                                          fontFamily: FontFamily.redHatMedium,
                                                          fontSize: 12,
                                                          fontWeight: FontWeight.w700,
                                                          color: AppColors.primaryTextColor,
                                                        ),
                                                      ),
                                                      const Gap(8),
                                                      Observer(
                                                        builder: (context) {
                                                          return Text(
                                                            '\$ ${formatter.format(_sendToState.transactionsStore.calculatedTxFee.satoshiToUsd(btcCurrentPrice: _sendToState.btcPrice))} ≈ ${_sendToState.transactionsStore.calculatedTxFee.satoshiToBtc()} BTC',
                                                            style: const TextStyle(
                                                              fontFamily: FontFamily.redHatMedium,
                                                              fontSize: 14,
                                                              fontWeight: FontWeight.w500,
                                                              color: AppColors.textHintsColor,
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Divider(
                                              endIndent: 10,
                                              indent: 10,
                                              height: 1,
                                            ),
                                          ],
                                        ),
                                        secondChild: const SizedBox(),
                                        crossFadeState: _sendToState.totalAmount != 0 && _sendToState.amount != 0
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
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                              top: 10,
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text(
                                                  'Send from',
                                                  style: TextStyle(
                                                    fontFamily: FontFamily.redHatMedium,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.primaryTextColor,
                                                  ),
                                                ),
                                                const Gap(8),
                                                Observer(
                                                  builder: (context) {
                                                    return Text(
                                                      _sendToState.transactionsStore.selectedCard != -1
                                                          ? _sendToState.formattedSelectedCardAddress ?? ''
                                                          : _sendToState.formattedSelectedBarAddress,
                                                      style: const TextStyle(
                                                        fontFamily: FontFamily.redHatMedium,
                                                        fontSize: 14,
                                                        fontWeight: FontWeight.w500,
                                                        color: AppColors.textHintsColor,
                                                      ),
                                                    );
                                                  },
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
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              children: [
                                                const Text(
                                                  'Balance',
                                                  style: TextStyle(
                                                    fontFamily: FontFamily.redHatMedium,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color: AppColors.primaryTextColor,
                                                  ),
                                                ),
                                                const Gap(8),
                                                if (_sendToState.btc == null)
                                                  const SizedBox()
                                                else
                                                  Observer(
                                                    builder: (_) {
                                                      return AnimatedCrossFade(
                                                        firstChild: Observer(
                                                          builder: (context) {
                                                            return Text(
                                                              '\$${formatter.format(_sendToState.spendableBalance)}',
                                                              style: const TextStyle(
                                                                fontFamily: FontFamily.redHatMedium,
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.w500,
                                                                color: AppColors.textHintsColor,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        secondChild: Observer(
                                                          builder: (context) {
                                                            return Text(
                                                              'BTC ${_sendToState.spendableBalance.usdToBtc(btcCurrentPrice: _sendToState.btcPrice)}',
                                                              style: const TextStyle(
                                                                fontFamily: FontFamily.redHatMedium,
                                                                fontSize: 14,
                                                                fontWeight: FontWeight.w500,
                                                                color: AppColors.textHintsColor,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                        crossFadeState: _sendToState.currency == Currency.USD
                                                            ? CrossFadeState.showFirst
                                                            : CrossFadeState.showSecond,
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
                                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                              _sendToState.formattedAddress,
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
                                onPressed: !_sendToState.isAmountToSmall
                                    ? _sendToState.sendAmountInUsd == 0
                                        ? null
                                        : !_sendToState.isInputtedAmountBiggerTotal
                                            ? !_sendToState.isCoverFee
                                                ? () async {
                                                    usdFocusNode.unfocus();
                                                    btcFocusNode.unfocus();
                                                    await Future.delayed(
                                                      const Duration(
                                                        milliseconds: 400,
                                                      ),
                                                    );
                                                    tabController.animateTo(2);
                                                    await _sendToState.transactionsStore.findOptimalUtxo();
                                                    await recordAmplitudeEventPartTwo(
                                                      AmountNextClicked(
                                                        sendToAddress: _sendToState.outputAddress,
                                                        sendFromAddress: _sendToState.selectedCardAddress!,
                                                        amount: '${_sendToState.amount.toStringAsFixed(3)} \$',
                                                        balance:
                                                            '${_sendToState.selectedCard!.finalBalance!.satoshiToUsd(btcCurrentPrice: _sendToState.btcPrice).toStringAsFixed(3)} \$',
                                                        fee:
                                                            '\$ ${formatter.format(_sendToState.transactionsStore.calculatedTxFee.satoshiToUsd(btcCurrentPrice: _sendToState.btcPrice))}',
                                                      ),
                                                    );
                                                  }
                                                : null
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
          ),
        );
      },
    );
  }
}
