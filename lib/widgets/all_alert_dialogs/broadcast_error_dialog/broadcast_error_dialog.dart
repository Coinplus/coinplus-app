import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../alert_dialog/dialog_box_with_action.dart';
import '../../alert_dialog/show_dialog_box.dart';

Future<void> broadcastFailAlertDialog(BuildContext context) {
  return showDialogBox(
    context,
    DialogBoxWithAction(
      text: '',
      title: const Column(
        children: [
          Text(
            'Oops…',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: FontFamily.redHatBold,
              fontSize: 17,
            ),
          ),
          Gap(20),
          Text(
            '🥺',
            style: TextStyle(fontSize: 90),
          ),
        ],
      ),
      primaryActionText: 'Got it',
      primaryAction: () async {
        await router.maybePop();
      },
      widget: const Text(
        'Something went wrong, \nplease try again later',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatMedium,
          fontSize: 13,
          color: AppColors.primary,
        ),
      ),
    ),
    isDismissible: true,
  );
}
