import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../all_alert_dialogs/no_funds_to_transfer_alert/no_funds_to_transfer_alert.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../models/card_model/card_model.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../services/cloud_firestore_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../utils/secure_storage_utils.dart';
import '../send_page/send_to/provided_amount_tab/use_max_action/use_max_action.dart';
import '../send_page/send_to/send_to_state.dart';
import '../send_page/send_to/transaction_review_tab/transaction_review_tab.dart';

class LostCardActionSlider extends StatefulWidget {
  const LostCardActionSlider({
    super.key,
    required this.card,
    required this.lostStatus,
  });

  final AbstractCard card;
  final bool lostStatus;

  @override
  State<LostCardActionSlider> createState() => _LostCardActionSliderState();
}

class _LostCardActionSliderState extends State<LostCardActionSlider> {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  SendToState get _sendToState => GetIt.I<SendToState>();
  late final CardModel? backupCard;

  @override
  void initState() {
    super.initState();
    _balanceStore.loadBackupCard(widget.card.address).then((_) {
      backupCard = _balanceStore.backupSingleCard;
    });
  }

  @override
  Widget build(BuildContext context) {
    final _secureStorage = SecureStorageService();
    return ActionSlider.standard(
      height: 60,
      backgroundColor: Colors.grey.withOpacity(0.09),
      successIcon: const Icon(
        Icons.check_rounded,
        color: Colors.black,
      ),
      action: (controller) async {
        controller.loading();
        final isCardActivated = await _secureStorage.checkWalletStatus(widget.card.address);
        final cardData = await getCardData(widget.card.address);
        await Future.delayed(const Duration(milliseconds: 300));
        Gaimon.success();
        controller.success();
        if (widget.lostStatus == true) {
          router.popUntilRouteWithName(DashboardRoute.name);
          final mainCardIndex = _balanceStore.cards.indexOf(widget.card);
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
                  ? noFundsToTransfer(context: router.navigatorKey.currentContext!, notCoverFee: false).then((_) async {
                      await updateCardLostStatus(cardAddress: widget.card.address, lostStatus: true);
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
                                controller.reset();
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Gap(12),
                                    Assets.icons.notch.image(height: 4),
                                    const Gap(30),
                                    TransactionReviewTab(
                                      isFromLostCardPage: true,
                                      backupCard: backupCard,
                                      mainCard: widget.card,
                                    ),
                                  ],
                                );
                              },
                            )
                          : noFundsToTransfer(context: router.navigatorKey.currentContext!, notCoverFee: true)
                              .then((_) async {
                              await updateCardLostStatus(cardAddress: widget.card.address, lostStatus: true);
                            })
                      : noFundsToTransfer(context: router.navigatorKey.currentContext!, notCoverFee: false)
                          .then((_) async {
                          await updateCardLostStatus(cardAddress: widget.card.address, lostStatus: true);
                        })
              : noFundsToTransfer(context: router.navigatorKey.currentContext!, notCoverFee: false).then((_) async {
                  await updateCardLostStatus(cardAddress: widget.card.address, lostStatus: true);
                });
        } else {
          if (isCardActivated == true) {
            if (widget.card.hasBackedUp) {
              await router.push(LostMyCardRoute(backupCard: backupCard, mainCard: widget.card));
            } else {
              await router.push(DontHaveBackupRoute(walletAddress: widget.card.address, cardColor: cardData?.color));
            }
          } else {
            await router.push(ActivateCardForBackup(card: widget.card));
          }
        }
      },
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          blurRadius: 1,
          spreadRadius: 1,
        ),
      ],
      toggleColor: Colors.white,
      icon: const Icon(
        Icons.arrow_forward_ios,
        color: AppColors.textHintsColor,
      ),
      child: Text(
        widget.lostStatus == true ? 'Start transfer' : 'Slide to confirm',
        style: const TextStyle(fontFamily: FontFamily.redHatMedium, fontSize: 13, color: AppColors.textHintsColor),
      ),
    );
  }
}
