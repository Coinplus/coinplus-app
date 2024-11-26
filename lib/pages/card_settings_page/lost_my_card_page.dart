import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../all_alert_dialogs/no_funds_to_transfer_alert/no_funds_to_transfer_alert.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../models/card_model/card_model.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../services/cloud_firestore_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../widgets/loading_button/loading_button.dart';
import '../send_page/send_to/provided_amount_tab/use_max_action/use_max_action.dart';
import '../send_page/send_to/send_to_state.dart';
import '../send_page/send_to/transaction_review_tab/transaction_review_tab.dart';

@RoutePage()
class LostMyCardPage extends StatelessWidget {
  const LostMyCardPage({super.key, required this.backupCard, required this.mainCard});

  SendToState get _sendToState => GetIt.I<SendToState>();

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  final AbstractCard? mainCard;
  final CardModel? backupCard;

  @override
  Widget build(BuildContext context) {
    // Future<void> changeBackupCardToPrimary() async {
    //   await _balanceStore.replaceMainCardWithBackup(
    //     mainCardAddress: mainCard!.address,
    //     backedUpCard: backupCard,
    //   );
    //   await updateCardLostStatus(cardAddress: mainCard!.address, lostStatus: true);
    //
    //   router.popUntilRouteWithName(DashboardRoute.name);
    //   await Future.delayed(const Duration(milliseconds: 300));
    //   await showCustomSnackBar(
    //     context: context,
    //     message: 'Your backup card changed as primary',
    //   );
    //   await router.maybePop();
    // }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Lost my card',
          style: TextStyle(
            fontFamily: FontFamily.redHatMedium,
            color: AppColors.primary,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ).expandedHorizontally(),
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            Assets.images.lostCardIllustration.image(),
            const Gap(46),
            const Text(
              'Immediate action is required!',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const Gap(8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 31),
              child: Text(
                'All your funds will be transferred to your backup wallet, and this wallet will be blocked. This ensures that anyone who finds it won’t be able to send funds using the Coinplus app.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            LoadingButton(
              onPressed: () async {
                router.popUntilRouteWithName(DashboardRoute.name);
                final mainCardIndex = _balanceStore.cards.indexOf(mainCard);
                await _sendToState.transactionsStore.getUtxosData();
                _sendToState.transactionsStore.onSelectCard(mainCardIndex);
                _sendToState.addressController.text = backupCard!.address;
                _sendToState.transactionsStore.setReceiverWalletAddress(backupCard!.address);
                await useMaxAction();
                _sendToState
                  ..onAddressChanges(backupCard!.address)
                  ..setOutputAddress(backupCard!.address);

                !_sendToState.isAmountToSmall
                    ? _sendToState.sendAmountInUsd == 0
                        ? noFundsToTransfer(context: router.navigatorKey.currentContext!, notCoverFee: false)
                            .then((_) async {
                            await updateCardLostStatus(cardAddress: mainCard!.address, lostStatus: true);
                          })
                        : !_sendToState.isInputtedAmountBiggerTotal
                            ? !_sendToState.isCoverFee
                                ? await showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    context: router.navigatorKey.currentContext!,
                                    builder: (_) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Gap(12),
                                          Assets.icons.notch.image(height: 4),
                                          const Gap(30),
                                          TransactionReviewTab(
                                            isFromLostCardPage: true,
                                            backupCard: backupCard,
                                            mainCard: mainCard,
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                : noFundsToTransfer(context: router.navigatorKey.currentContext!, notCoverFee: true)
                                    .then((_) async {
                                    await updateCardLostStatus(cardAddress: mainCard!.address, lostStatus: true);
                                  })
                            : noFundsToTransfer(context: router.navigatorKey.currentContext!, notCoverFee: false)
                                .then((_) async {
                                await updateCardLostStatus(cardAddress: mainCard!.address, lostStatus: true);
                              })
                    : noFundsToTransfer(context: router.navigatorKey.currentContext!, notCoverFee: false)
                        .then((_) async {
                        await updateCardLostStatus(cardAddress: mainCard!.address, lostStatus: true);
                      });
              },
              child: const Text(
                'Start Transfer',
                style: TextStyle(fontFamily: FontFamily.redHatMedium, fontSize: 15),
              ),
            ).paddingHorizontal(64),
            const Gap(40),
          ],
        ),
      ),
    );
  }
}
