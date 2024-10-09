import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/card_record.dart';
import '../../../models/abstract_card/abstract_card.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../services/amplitude_service.dart';
import '../../../services/ramp_service.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../store/history_page_store/history_page_store.dart';
import '../../send_page/send_to/send_to_state.dart';

int cardCarouselIndex = 0;
int barCarouselIndex = 0;
bool _isAmplitudeEventInProgress = false;

SendToState get _sendToState => GetIt.I<SendToState>();

void tabControllerListener({
  required TabController tabController,
  required HistoryPageStore historyPageStore,
  required BalanceStore balanceStore,
  required RampService rampService,
  required CardChangeCallBack onChangeCard,
  required int cardCarouselIndex,
  required int barCarouselIndex,
}) {
  tabController.addListener(() {
    final card = tabController.index == 0
        ? balanceStore.cards.elementAtOrNull(cardCarouselIndex)
        : balanceStore.bars.elementAtOrNull(barCarouselIndex);

    if (tabController.index == 1 &&
        balanceStore.bars.isNotEmpty &&
        balanceStore.barCurrentIndex != balanceStore.bars.length) {
      rampService.configuration.userAddress = balanceStore.bars[balanceStore.barCurrentIndex].address;
    }
    if (tabController.index == 0 &&
        balanceStore.cards.isNotEmpty &&
        balanceStore.cardCurrentIndex != balanceStore.cards.length) {
      rampService.configuration.userAddress = balanceStore.cards[balanceStore.cardCurrentIndex].address;
    }
    historyPageStore.setTabIndex(tabController.index);

    if (tabController.index == 0) {
      if (balanceStore.cards.isNotEmpty) {
        if (balanceStore.cardCurrentIndex != balanceStore.cards.length) {
          _sendToState.transactionsStore.onSelectCard(balanceStore.cardCurrentIndex);
        }
      }
    } else if (tabController.index == 1) {
      if (balanceStore.bars.isNotEmpty) {
        if (balanceStore.barCurrentIndex != balanceStore.bars.length) {
          _sendToState.transactionsStore.onSelectBar(balanceStore.barCurrentIndex);
        }
      }
    }

    onChangeCard(
      (
        card: card as AbstractCard?,
        index: tabController.index,
      ),
    );

    if (!_isAmplitudeEventInProgress) {
      _isAmplitudeEventInProgress = true;
      if (tabController.index == 0) {
        unawaited(recordAmplitudeEventPartTwo(const CardTabClicked()));
      } else if (tabController.index == 1) {
        unawaited(recordAmplitudeEventPartTwo(const BarTabClicked()));
      }
      Future.delayed(const Duration(seconds: 1), () {
        _isAmplitudeEventInProgress = false;
      });
    }
  });
}
