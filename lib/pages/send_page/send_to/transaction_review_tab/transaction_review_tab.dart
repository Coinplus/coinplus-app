import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

import '../../../../all_alert_dialogs/broadcast_error_dialog/broadcast_error_dialog.dart';
import '../../../../all_alert_dialogs/fee_alert_dialog/fee_alert_dialog.dart';
import '../../../../all_alert_dialogs/tx_submitted_dialog/tx_submitted_dialog.dart';
import '../../../../constants/currency.dart';
import '../../../../extensions/extensions.dart';
import '../../../../extensions/num_extension.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../models/abstract_card/abstract_card.dart';
import '../../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../../models/card_model/card_model.dart';
import '../../../../providers/screen_service.dart';
import '../../../../services/amplitude_service.dart';
import '../../../../services/cloud_firestore_service.dart';
import '../../../../store/balance_store/balance_store.dart';
import '../../../../store/history_page_store/history_page_store.dart';
import '../../../../widgets/loading_button/loading_button.dart';
import '../send_to_state.dart';

class TransactionReviewTab extends HookWidget {
  const TransactionReviewTab({
    super.key,
    this.isFromLostCardPage,
    this.backupCard,
    this.mainCard,
  });

  final bool? isFromLostCardPage;
  final CardModel? backupCard;
  final AbstractCard? mainCard;

  SendToState get _sendToState => GetIt.I<SendToState>();

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  @override
  Widget build(BuildContext context) {
    final formatter = useMemoized(
      () => NumberFormat.decimalPattern(context.locale.toString()),
      [context.locale],
    );
    useEffect(() {
      _sendToState.transactionsStore.createTransactionHex();
      return null;
    });
    return SingleChildScrollView(
      child: SizedBox(
        height: context.height * 0.85,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Transaction review',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryTextColor,
              ),
            ),
            const Gap(24),
            Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0xFFF7F7FA),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'From',
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
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const Text(
                                    'Balance after',
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
                                        return Text(
                                          '\$${formatter.format(_sendToState.balanceAfter)}',
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
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Gap(7),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: const Color(0xFFF7F7FA),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'To',
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
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 43,
                  left: 0,
                  right: 0,
                  child: CircleAvatar(
                    maxRadius: 25,
                    backgroundColor: Colors.white,
                    child: Lottie.asset(
                      'assets/lottie_animations/arrow.json',
                      height: 50,
                    ),
                  ),
                ),
              ],
            ),
            const Gap(23),
            const Text(
              'Amount',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                fontWeight: FontWeight.w700,
                fontSize: 15,
                color: AppColors.primary,
              ),
            ),
            const Gap(8),
            if (_sendToState.currency == Currency.USD)
              Text(
                '-\$${formatter.format(_sendToState.amount)}',
                style: const TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontSize: 24,
                ),
              )
            else
              Text(
                '-${_sendToState.amount.usdToBtc(btcCurrentPrice: _sendToState.btcPrice).toStringAsFixed(8)} BTC',
                style: const TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontSize: 24,
                ),
              ),
            if (_sendToState.currency == Currency.USD)
              Observer(
                builder: (context) {
                  return Text(
                    '≈ ${_sendToState.amount.usdToBtc(btcCurrentPrice: _sendToState.btcPrice).toStringAsFixed(8)} BTC',
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: FontFamily.redHatMedium,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textHintsColor,
                    ),
                  );
                },
              )
            else
              Text(
                '≈ \$ ${formatter.format(_sendToState.amount)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textHintsColor,
                ),
              ),
            const Gap(24),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Estimated network fee',
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
                        Column(
                          children: [
                            const Gap(5),
                            IconButton(
                              splashRadius: 20,
                              onPressed: () {
                                feeAlertDialog(context: context);
                              },
                              icon: Assets.icons.txFeeInfo.image(
                                height: 28,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Divider(
                      endIndent: 10,
                      indent: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap(15),
                              Text(
                                'Max total',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primaryTextColor,
                                ),
                              ),
                              Gap(15),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 10,
                            bottom: 10,
                            right: 10,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\$${formatter.format(_sendToState.maxTotal)}',
                                style: const TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.textHintsColor,
                                  fontSize: 14,
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
            const Spacer(),
            Observer(
              builder: (context) {
                return LoadingButton(
                  onPressed: () async {
                    try {
                      await recordAmplitudeEventPartTwo(
                        SendClicked(
                          sendToAddress: _sendToState.outputAddress,
                          sendFromAddress: _sendToState.selectedCardAddress!,
                          amount: '${_sendToState.amount.toStringAsFixed(3)} \$',
                          balance:
                              '${_sendToState.selectedCard!.finalBalance!.satoshiToUsd(btcCurrentPrice: _sendToState.btcPrice).toStringAsFixed(3)} \$',
                          fee:
                              '\$ ${formatter.format(_sendToState.transactionsStore.calculatedTxFee.satoshiToUsd(btcCurrentPrice: _sendToState.btcPrice))}',
                          txHash: _sendToState.transactionsStore.txHex,
                        ),
                      );
                      // await _sendToState.transactionsStore.broadcastTransaction();
                      await router.maybePop();
                      await transactionSubmittedAlert(context: context);
                      if (isFromLostCardPage == true && mainCard != null) {
                        await _balanceStore.replaceMainCardWithBackup(
                          mainCardAddress: mainCard!.address,
                          backedUpCard: backupCard,
                        );
                        await _historyPageStore.saveAndPatchCardAddress(
                          backupCard!.address,
                        );
                        await updateCardLostStatus(cardAddress: mainCard!.address, lostStatus: true);
                      }
                    } catch (e) {
                      await broadcastFailAlertDialog(context);
                    }
                  },
                  child: _sendToState.transactionsStore.broadcastLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          'Send',
                          style: TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                ).paddingHorizontal(60);
              },
            ),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}
