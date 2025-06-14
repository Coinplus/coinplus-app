import 'dart:async';

import 'package:action_slider/action_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

import '../../gen/fonts.gen.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../services/amplitude_service.dart';
import '../../services/cloud_firestore_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/history_page_store/history_page_store.dart';
import '../../utils/secure_storage_utils.dart';
import '../../utils/storage_utils.dart';
import '../../utils/wallet_activation_status.dart';
import '../../widgets/custom_snack_bar/snack_bar_method.dart';

class ActionSliderForCardDelete extends StatelessWidget {
  const ActionSliderForCardDelete({
    super.key,
    required this.card,
    required this.balanceStore,
  });

  final AbstractCard card;
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
        await _balanceStore.loadBackupCard(card.address);
        final backupCard = _balanceStore.backupCards.firstWhereOrNull(
          (card) => card.address == _balanceStore.backupSingleCard?.address,
        );

        controller.loading();
        await Future.delayed(const Duration(seconds: 1));
        controller.success();
        if (backupCard != null) {
          await _balanceStore.removeSelectedBackupCard(address: backupCard.address);
          await StorageUtils.deleteBackupCard(card.address);
          _balanceStore.changeCardBackupStatusAndSave(cardAddress: card.address, hasBackedUp: false);
          unawaited(deletePrimaryAddressFromDb(backupWalletAddress: backupCard.address));
          unawaited(deletePrimaryWalletColorFromDb(backupWalletAddress: backupCard.address));
          unawaited(deleteBackupAddressFromDb(mainWalletAddress: card.address));
          unawaited(updateCardHasBackupStatus(cardAddress: card.address, hasBackupStatus: false));
        }
        if (card.blockchain == 'BTC') {
          final isCardActivated = await isCardWalletActivated();
          await recordAmplitudeEventPartTwo(
            CardDeleted(
              walletAddress: card.address,
              walletType: 'Card',
              activated: isCardActivated,
            ),
          );
          unawaited(_balanceStore.removeSelectedCard(address: card.address));
        } else if (card.blockchain == 'ETH') {
          final isCardActivated = await isEthCardWalletActivated();
          await recordAmplitudeEventPartTwo(
            CardDeleted(
              walletAddress: card.address,
              walletType: 'Card',
              activated: isCardActivated,
            ),
          );
          unawaited(_balanceStore.removeSelectedEthCard(address: card.address));
        }

        await Future.wait({
          _secureStorage.deleteBackup(mainCardAddress: card.address),
          _secureStorage.deleteCard(card: card),
        });
        await _historyPageStore.deleteAddressFromHistoryMap(
          address: card.address,
        );
        unawaited(deleteCount(card.address));
        await router.maybePop();
        _historyPageStore.cardHistories[card.address]?.clear();
        _balanceStore.onCardDeleted(card.address);
        await _historyPageStore.setCardHistoryIndex(0);
        Gaimon.success();
        router.popUntilRouteWithName(DashboardRoute.name);
        await showCustomSnackBar(
          context: context,
          message: 'Your card was removed',
        );
        await router.maybePop();
      },
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withValues(alpha: 0.3),
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
