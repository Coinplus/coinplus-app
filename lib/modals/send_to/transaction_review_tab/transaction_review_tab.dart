import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/currency.dart';
import '../../../extensions/extensions.dart';
import '../../../extensions/num_extension.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../store/all_settings_state/all_settings_state.dart';
import '../../../widgets/all_alert_dialogs/tx_submitted_dialog/tx_submitted_dialog.dart';
import '../../../widgets/loading_button/loading_button.dart';
import '../send_to_state.dart';

class TransactionReviewTab extends HookWidget {
  const TransactionReviewTab({
    super.key,
    required this.tabController,
    required this.state,
    required this.allSettingsState,
    required this.isBarList,
  });

  final SendToState state;
  final TabController tabController;
  final AllSettingsState allSettingsState;
  final bool isBarList;

  @override
  Widget build(BuildContext context) {
    final formatter = useMemoized(
      () => NumberFormat.decimalPattern(context.locale.toString()),
      [context.locale],
    );
    useEffect(() {
      state.transactionsStore.createTransactionHex();
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
                                  Text(
                                    isBarList
                                        ? state.formattedSelectedBarAddress
                                        : state.formattedSelectedCardAddress,
                                    style: const TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.textHintsColor,
                                    ),
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
                                  if (state.btc == null)
                                    const SizedBox()
                                  else
                                    Observer(
                                      builder: (_) {
                                        return Text(
                                          '\$${formatter.format(state.balanceAfter)}',
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
            if (state.currency == Currency.USD)
              Text(
                '-\$${formatter.format(state.amount)}',
                style: const TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontSize: 24,
                ),
              )
            else
              Text(
                '-${state.amount.usdToBtc(btcCurrentPrice: state.btcPrice).toStringAsFixed(8)} BTC',
                style: const TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primary,
                  fontSize: 24,
                ),
              ),
            if (state.currency == Currency.USD)
              Observer(
                builder: (context) {
                  return Text(
                    '≈ ${state.amount.usdToBtc(btcCurrentPrice: state.btcPrice).toStringAsFixed(8)} BTC',
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
                '≈ \$ ${formatter.format(state.amount)}',
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
                              Text(
                                '${state.networkFeeInBtc} BTC ≈ \$${formatter.format(state.networkFee)}',
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
                        Column(
                          children: [
                            const Gap(5),
                            IconButton(
                              splashRadius: 20,
                              onPressed: () {},
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
                                '\$${formatter.format(state.maxTotal)}',
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
            LoadingButton(
              onPressed: () async {
                await state.transactionsStore.broadcastTransaction();
                await router.maybePop();
                await transactionSubmittedAlert(
                  context: context,
                  allSettingsState: allSettingsState,
                );
              },
              child: const Text(
                'Send',
                style: TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ).paddingHorizontal(60),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}
