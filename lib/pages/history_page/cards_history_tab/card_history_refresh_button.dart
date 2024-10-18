import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../services/amplitude_service.dart';
import 'card_history_list_state.dart';

class CardHistoryRefreshButton extends StatelessWidget {
  const CardHistoryRefreshButton({super.key, required this.controller});
  final AnimationController controller;
  @override
  Widget build(BuildContext context) {
    final state = CardHistoryListState();
    return Observer(
      builder: (context) {
        return Positioned(
          right: 16,
          child: ScaleTap(
            enableFeedback: false,
            onPressed: state.historyPageStore
                        .disabledButtons[state.balanceStore.cards[state.historyPageStore.cardHistoryIndex].address] ??
                    false
                ? () async {
                    unawaited(controller.forward());
                    await state.historyPageStore.getSingleCardHistory(
                      address: state.balanceStore.cards[state.historyPageStore.cardHistoryIndex].address,
                    );
                    controller.reset();
                  }
                : () async {
                    unawaited(controller.repeat());
                    state.historyPageStore.disabledButtons[
                        state.balanceStore.cards[state.historyPageStore.cardHistoryIndex].address] = true;
                    await state.historyPageStore.setRefreshing(
                      value: true,
                    );
                    await state.historyPageStore.cardRefresh(
                      state.balanceStore.cards[state.historyPageStore.cardHistoryIndex].address,
                    );
                    controller
                      ..stop()
                      ..reset();
                    await state.historyPageStore.setRefreshing(
                      value: false,
                    );
                    state.historyPageStore.makeInactive();
                    await Future.delayed(
                      const Duration(minutes: 1),
                    );
                    state.historyPageStore.disabledButtons[
                        state.balanceStore.cards[state.historyPageStore.cardHistoryIndex].address] = false;
                    state.historyPageStore.makeActive();
                    await recordAmplitudeEventPartTwo(
                      RefreshClicked(
                        address: state.historyPageStore.selectedCardAddress,
                      ),
                    );
                  },
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Refreshed',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontSize: 11,
                        color: Color(0xFF838995),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Observer(
                      builder: (_) => Text(
                        state.historyPageStore.getLastRefreshed(
                          state.historyPageStore.selectedCardAddress,
                        ),
                        style: const TextStyle(
                          fontFamily: FontFamily.redHatMedium,
                          fontSize: 10,
                          color: Color(0xFF838995),
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(8),
                Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.silver,
                  ),
                  child: RotationTransition(
                    turns: controller,
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: Assets.icons.sync.image(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
