import 'dart:async';

import 'package:action_slider/action_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

import '../../gen/fonts.gen.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../providers/screen_service.dart';
import '../../router.gr.dart';
import '../../services/cloud_firestore_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../widgets/custom_snack_bar/snack_bar_method.dart';

class LostCardActionSlider extends StatefulWidget {
  const LostCardActionSlider({
    super.key,
    required this.card,
  });

  final AbstractCard card;

  @override
  State<LostCardActionSlider> createState() => _LostCardActionSliderState();
}

class _LostCardActionSliderState extends State<LostCardActionSlider> {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  @override
  void initState() {
    super.initState();
    _balanceStore.loadBackupCard(widget.card.address);
  }

  @override
  Widget build(BuildContext context) {
    final backupCard = _balanceStore.backupCards.firstWhereOrNull(
      (card) => card.address == _balanceStore.backupSingleCard?.address,
    );
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
        await _balanceStore.replaceMainCardWithBackup(
          mainCardAddress: widget.card.address,
          backedUpCard: backupCard,
        );
        await updateCardLostStatus(cardAddress: widget.card.address, lostStatus: true);

        router.popUntilRouteWithName(DashboardRoute.name);
        await showCustomSnackBar(
          context: context,
          message: 'Your backup card changed as primary',
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
        'Lost my card',
        style: TextStyle(fontFamily: FontFamily.redHatMedium),
      ),
    );
  }
}
