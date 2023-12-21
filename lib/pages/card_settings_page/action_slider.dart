import 'dart:async';

import 'package:action_slider/action_slider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../gen/fonts.gen.dart';
import '../../models/card_model/card_model.dart';
import '../../providers/screen_service.dart';
import '../../services/cloud_firestore_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../utils/secure_storage_utils.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';


class ActionSliderForDelete extends StatelessWidget {
  const ActionSliderForDelete({super.key, required this.card, required this.balanceStore,});

  final CardModel card;
  final BalanceStore balanceStore;

  @override
  Widget build(BuildContext context) {
    return ActionSlider.standard(
      direction: TextDirection.rtl,
      height: 60,
      loadingIcon: Lottie.asset(
        'assets/animated_logo/loading_animation.json',
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
        unawaited(balanceStore.getSelectedCard(card.address));
        await secureStorage.delete(key: 'card${card.address}');
        unawaited(deleteCount(card.address));
        await router.pop();
        unawaited(balanceStore.removeSelectedCard());
        showTopSnackBar(
          displayDuration: const Duration(
            milliseconds: 600,
          ),
          Overlay.of(context),
          CustomSnackBar.success(
            backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
            message: 'Your card was removed',
            textStyle: const TextStyle(
              fontFamily: FontFamily.redHatMedium,
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        );
        await router.pop();
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
