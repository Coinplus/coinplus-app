import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../../all_alert_dialogs/android_nfc_modal/android_bar_nfc_modal.dart';
import '../../all_alert_dialogs/android_nfc_modal/android_card_nfc_modal.dart';
import '../../all_alert_dialogs/maybe_coinplus_card/maybe_coinplus_card.dart';
import '../../all_alert_dialogs/trouble_tapping_bar/trouble_tapping_bar.dart';
import '../../all_alert_dialogs/trouble_tapping_card/trouble_tapping_card.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../pages/send_page/send_to/send_to_state.dart';
import '../../providers/screen_service.dart';
import '../loading_button/loading_button.dart';

Future<void> showBarTapIssueBottomSheet({
  required ValueNotifier<bool> isModalOpened,
  required SendToState state,
}) async {
  isModalOpened.value = true;
  await showModalBottomSheet(
    context: router.navigatorKey.currentContext!,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          20,
        ),
        topRight: Radius.circular(
          20,
        ),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (_) {
      return BarIssueOptionsSheet(state: state);
    },
  );
  isModalOpened.value = false;
}

Future<void> maybeCoinplusCardModal({
  required ValueNotifier<bool> isModalOpened,
}) async {
  isModalOpened.value = true;
  await maybeCoinplusCard(router.navigatorKey.currentContext!);
  isModalOpened.value = false;
}

Future<void> showWrongCardModal({
  required ValueNotifier<bool> isModalOpened,
}) async {
  isModalOpened.value = true;
  await showModalBottomSheet(
    context: router.navigatorKey.currentContext!,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(40),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(
          8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(2),
            Assets.icons.notch.image(
              height: 4,
            ),
            const Gap(
              40,
            ),
            Lottie.asset(
              'assets/lottie_animations/warning.json',
              repeat: false,
              height: 120,
            ),
            const Gap(
              30,
            ),
            const Text(
              'You tapped the wrong card. Please check the wallet address of the card',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontFamily: FontFamily.redHatMedium,
              ),
            ).paddingHorizontal(50),
            const Gap(30),
            LoadingButton(
              onPressed: () async {
                await router.maybePop();
              },
              style: context.theme
                  .buttonStyle(
                    textStyle: const TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      color: AppColors.primaryTextColor,
                      fontSize: 15,
                    ),
                  )
                  .copyWith(
                    backgroundColor:
                        WidgetStateProperty.all(Colors.grey.withOpacity(0.3)),
                  ),
              child: const Text('Close'),
            ).paddingHorizontal(60),
            const Gap(
              20,
            ),
          ],
        ),
      );
    },
  );
  isModalOpened.value = false;
}

Future<void> showAndroidCardNfcBottomSheet({
  required ValueNotifier<bool> isModalOpened,
  required SendToState state,
}) async {
  isModalOpened.value = true;
  await showModalBottomSheet(
    context: router.navigatorKey.currentContext!,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          20,
        ),
        topRight: Radius.circular(
          20,
        ),
      ),
    ),
    backgroundColor: Colors.transparent,
    builder: (context) {
      return AndroidCardNfcModal(state: state);
    },
  );
  isModalOpened.value = true;
}

Future<void> showCardTapIssueBottomSheet({
  required ValueNotifier<bool> isModalOpened,
  required SendToState state,
}) async {
  isModalOpened.value = true;
  await showModalBottomSheet(
    context: router.navigatorKey.currentContext!,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          20,
        ),
        topRight: Radius.circular(
          20,
        ),
      ),
    ),
    backgroundColor: Colors.white,
    builder: (_) {
      return CardIssueOptionsSheet(state: state);
    },
  );
  isModalOpened.value = true;
}

Future<void> showAndroidBarNfcBottomSheet({
  required ValueNotifier<bool> isModalOpened,
  required SendToState state,
}) async {
  isModalOpened.value = true;
  await showModalBottomSheet(
    context: router.navigatorKey.currentContext!,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(
          20,
        ),
        topRight: Radius.circular(
          20,
        ),
      ),
    ),
    backgroundColor: Colors.transparent,
    builder: (context) {
      return AndroidBarNfcModal(state: state);
    },
  );
  isModalOpened.value = false;
}
