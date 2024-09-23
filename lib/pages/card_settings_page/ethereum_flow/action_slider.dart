import 'dart:async';

import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../models/eth_card_model/eth_card_model.dart';
import '../../../providers/screen_service.dart';
import '../../../services/amplitude_service.dart';
import '../../../services/cloud_firestore_service.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../store/history_page_store/history_page_store.dart';
import '../../../utils/secure_storage_utils.dart';
import '../../../utils/wallet_activation_status.dart';
import '../../../widgets/custom_snack_bar/snack_bar_method.dart';

class ActionSliderForEthCardDelete extends StatelessWidget {
  const ActionSliderForEthCardDelete({
    super.key,
    required this.ethCard,
    required this.balanceStore,
  });

  final EthCardModel ethCard;
  final BalanceStore balanceStore;

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  @override
  Widget build(BuildContext context) {
    final _secureStorage = SecureStorageService();

    return ActionSlider.standard(
      direction: TextDirection.rtl,
      height: 60,
      loadingIcon: Lottie.asset(
        'assets/lottie_animations/loading_animation.json',
        repeat: true,
        height: 30,
      ),
      successIcon: const Icon(
        Icons.check_rounded,
        color: Colors.white,
      ),
      action: (controller) async {
        controller.loading();
        unawaited(balanceStore.getSelectedEthCard(ethCard.address));
        await Future.delayed(const Duration(seconds: 1));
        controller.success();
        await _secureStorage.deleteEthCard(card: ethCard);
        await _historyPageStore.deleteAddressFromHistoryMap(
          address: ethCard.address,
        );
        unawaited(deleteCount(ethCard.address));
        await router.maybePop();
        await balanceStore.removeSelectedEthCard();
        _historyPageStore.cardHistories[ethCard.address]?.clear();
        _balanceStore.onCardDeleted(ethCard.address);
        await _historyPageStore.setCardHistoryIndex(0);
        await recordAmplitudeEventPartTwo(
          CardDeleted(
            walletAddress: ethCard.address,
            walletType: 'Card',
            activated:
                await isEthCardWalletActivated(balanceStore: _balanceStore),
          ),
        );
        await showCustomSnackBar(
          context: context,
          message: 'Your card was removed',
        );
        await router.maybePop();
      },
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 1,
          spreadRadius: 1,
        ),
      ],
      toggleColor: Colors.red,
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: Colors.white,
      ),
      child: const Text(
        'Slide to delete',
        style: TextStyle(fontFamily: FontFamily.redHatMedium),
      ),
    );
  }
}
