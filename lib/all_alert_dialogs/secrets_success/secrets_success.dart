import 'dart:async';

import 'package:flutter/material.dart';

import '../../../gen/fonts.gen.dart';
import '../../../models/bar_model/bar_model.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../store/all_settings_state/all_settings_state.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../services/amplitude_service.dart';
import '../../utils/card_nfc_session.dart';
import '../../widgets/send_button_widget/send_button_widget.dart';

Future<void> secretsSuccessAlert({
  required BuildContext context,
  required String walletAddress,
  required String walletType,
  required bool isBarList,
  required BalanceStore balanceStore,
  required bool? hasBackup,
  AbstractCard? card,
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
          ? 'Your wallet activation is successful. You can find your private key in the bar settings ⚙️'
          : 'Your wallet activation is successful. You can find your private key in the card settings ⚙️',
      primaryActionText: 'Next',
      primaryAction: () async {
        if (hasBackup == true) {
          await router.pushAndPopAll(const DashboardRoute());
          await connectBackupWalletIos(mainWalletAddress: walletAddress);
        } else {
          if (isBarList) {
            balanceStore.activateBar();
            balanceStore.onBarActivated(bar!.address);
          } else {
            if (card!.blockchain == 'BTC') {
              balanceStore.activateCard();
              balanceStore.onCardActivated(card.address);
            } else {
              balanceStore.activateCard();
              balanceStore.onCardActivated(card.address);
            }
          }

          router.popUntilRouteWithName(DashboardRoute.name);

          if (card?.blockchain == 'BTC') {
            await showSendFromWalletModal(
              allSettingsState: allSettingsState,
              isBarList: isBarList,
            );
          }

          await recordAmplitudeEventPartTwo(
            ActivationNextClicked(address: card!.address),
          );
          if (isBarList) {
            balanceStore.reActivateBar();
          } else {
            balanceStore.reActivateCard();
          }
        }
      },
    ),
    isDismissible: true,
  );
}
