import 'dart:async';

import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../../models/bar_model/bar_model.dart';
import '../../../models/card_model/card_model.dart';
import '../../../pages/send_page/send_to/send_to_state.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../store/all_settings_state/all_settings_state.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';
import '../../send_button_widget/send_button_widget.dart';

Future<void> secretsSuccessAlert({
  required BuildContext context,
  required String walletAddress,
  required String walletType,
  required bool isBarList,
  required SendToState state,
  required BalanceStore balanceStore,
  CardModel? card,
  BarModel? bar,
}) {
  final allSettingsState = AllSettingsState();

  return showDialogBox(
    context,
    DialogBoxWithAction(
      title: const Text(
        'Success!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/lottie_animations/card_hovering_transaction.json',
      text: isBarList
          ? 'Your wallet activation is successful. You can find your private key in the bar settings.'
          : 'Your wallet activation is successful. You can find your private key in the card settings.',
      primaryActionText: 'Next',
      primaryAction: () async {
        if (isBarList) {
          balanceStore.activateBar();
          balanceStore.onBarActivated(bar!.address);
        } else {
          balanceStore.activateCard();
          balanceStore.onCardActivated(card!.address);
        }
        router.popUntilRouteWithName(DashboardRoute.name);
        await showSendFromWalletModal(
          allSettingsState: allSettingsState,
          isBarList: isBarList,
          state: state,
        );
        if (isBarList) {
          balanceStore.reActivateBar();
        } else {
          balanceStore.reActivateCard();
        }
      },
    ),
    isDismissible: true,
  );
}
