import 'dart:async';

import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../models/bar_model/bar_model.dart';
import '../../providers/screen_service.dart';
import '../../services/amplitude_service.dart';
import '../../services/cloud_firestore_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/history_page_store/history_page_store.dart';
import '../../utils/secure_storage_utils.dart';
import '../../utils/wallet_activation_status.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';

class ActionSliderForBarDelete extends StatelessWidget {
  const ActionSliderForBarDelete({
    super.key,
    required this.bar,
    required this.balanceStore,
  });

  final BarModel bar;
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
        await Future.delayed(const Duration(seconds: 1));
        controller.success();
        unawaited(_balanceStore.getSelectedBar(bar.address));
        await _secureStorage.deleteBar(bar: bar);
        await _historyPageStore.deleteAddressFromHistoryMap(
          address: bar.address,
        );
        _historyPageStore.cardHistories[bar.address]?.clear();
        await _historyPageStore.setCardHistoryIndex(0);
        unawaited(deleteCount(bar.address));
        await router.maybePop();
        unawaited(_balanceStore.removeSelectedBar());

        final isBarActivated = isBarWalletActivated();
        await recordAmplitudeEventPartTwo(
          CardDeleted(
            walletAddress: bar.address,
            walletType: 'Bar',
            activated: await isBarActivated,
          ),
        );
        _balanceStore.onCardDeleted(
          bar.address,
        );
        showTopSnackBar(
          displayDuration: const Duration(
            milliseconds: 600,
          ),
          Overlay.of(context),
          CustomSnackBar.success(
            backgroundColor: const Color(0xFF4A4A4A).withValues(alpha: 0.9),
            message: 'Your bar was removed',
            textStyle: const TextStyle(
              fontFamily: FontFamily.redHatMedium,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
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
