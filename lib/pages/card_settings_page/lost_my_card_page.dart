import 'dart:developer';

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
import '../../models/amplitude_event/amplitude_event_part_three/amplitude_event_part_three.dart';
import '../../models/card_model/card_model.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../services/amplitude_service.dart';
import '../../services/cloud_firestore_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../widgets/loading_button/loading_button.dart';
import '../send_page/send_to/provided_amount_tab/use_max_action/use_max_action.dart';
import '../send_page/send_to/send_to_state.dart';
import '../send_page/send_to/transaction_review_tab/transaction_review_tab.dart';

@RoutePage()
class LostMyCardPage extends StatefulWidget {
  const LostMyCardPage({super.key, required this.mainCard});

  final AbstractCard? mainCard;

  @override
  State<LostMyCardPage> createState() => _LostMyCardPageState();
}

class _LostMyCardPageState extends State<LostMyCardPage> {
  SendToState get _sendToState => GetIt.I<SendToState>();

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  late final CardModel? backupCard;

  @override
  void initState() {
    super.initState();
    _balanceStore.loadBackupCard(widget.mainCard!.address).then((_) {
      backupCard = _balanceStore.backupSingleCard;
    }).catchError((error) {
      log('Error loading backup card: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
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
                final cardIndex = _balanceStore.cards.indexWhere(
                  (card) => card.address.trim() == card.address.trim(),
                );
                await _sendToState.transactionsStore.getUtxosData();
                _sendToState.transactionsStore.onSelectCard(cardIndex);
                _sendToState.addressController.text = backupCard!.address;
                _sendToState.transactionsStore.setReceiverWalletAddress(backupCard!.address);
                await useMaxAction();
                _sendToState
                  ..onAddressChanges(backupCard!.address)
                  ..setOutputAddress(backupCard!.address);
                await recordAmplitudeEventPartThree(
                  StartTransfer(
                    walletAddress: widget.mainCard?.address ?? '',
                    backupAddress: backupCard?.address ?? '',
                  ),
                );
                !_sendToState.isAmountToSmall
                    ? _sendToState.sendAmountInUsd == 0
                        ? noFundsToTransfer(context: router.navigatorKey.currentContext!, notCoverFee: false)
                            .then((_) async {
                            await updateCardLostStatus(cardAddress: widget.mainCard!.address, lostStatus: true);
                            await recordAmplitudeEventPartThree(
                              NoFundsTransfer(
                                walletAddress: widget.mainCard?.address ?? '',
                                backupAddress: backupCard?.address ?? '',
                              ),
                            );
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
                                            mainCard: widget.mainCard,
                                          ),
                                        ],
                                      );
                                    },
                                  )
                                : noFundsToTransfer(context: router.navigatorKey.currentContext!, notCoverFee: true)
                                    .then((_) async {
                                    await updateCardLostStatus(cardAddress: widget.mainCard!.address, lostStatus: true);
                                    await recordAmplitudeEventPartThree(
                                      NoEnoughFundsTransfer(
                                        walletAddress: widget.mainCard?.address ?? '',
                                        backupAddress: backupCard?.address ?? '',
                                      ),
                                    );
                                  })
                            : noFundsToTransfer(context: router.navigatorKey.currentContext!, notCoverFee: false)
                                .then((_) async {
                                await updateCardLostStatus(cardAddress: widget.mainCard!.address, lostStatus: true);
                                await recordAmplitudeEventPartThree(
                                  NoFundsTransfer(
                                    walletAddress: widget.mainCard?.address ?? '',
                                    backupAddress: backupCard?.address ?? '',
                                  ),
                                );
                              })
                    : noFundsToTransfer(context: router.navigatorKey.currentContext!, notCoverFee: false)
                        .then((_) async {
                        await updateCardLostStatus(cardAddress: widget.mainCard!.address, lostStatus: true);
                        await recordAmplitudeEventPartThree(
                          NoFundsTransfer(
                            walletAddress: widget.mainCard?.address ?? '',
                            backupAddress: backupCard?.address ?? '',
                          ),
                        );
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
