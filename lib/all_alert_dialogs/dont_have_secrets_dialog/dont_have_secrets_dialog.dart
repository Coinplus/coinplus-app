import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> dontHaveSecretsDialog(BuildContext context) {
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
          Gap(25),
          Text(
            '🥺',
            style: TextStyle(fontSize: 100),
          ),
        ],
      ),
      primaryActionText: 'Got it',
      primaryAction: () async {
        await router.maybePop();
      },
      widget: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Text(
          'To transfer funds, you must enter the codes beneath the Security Stickers. These codes are required to submit a transaction on the blockchain, and without them, fund transfers are not possible. As a non-custodial service, we do not have access to these codes and therefore cannot assist with fund transfers.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: FontFamily.redHatMedium,
            fontSize: 13,
            color: AppColors.primary,
          ),
        ),
      ),
    ),
    isDismissible: true,
  );
}
