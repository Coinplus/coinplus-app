import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:styled_text/tags/styled_text_tag.dart';
import 'package:styled_text/widgets/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../models/amplitude_user_property_model/amplitude_user_property_model.dart';
import '../../../providers/screen_service.dart';
import '../../../services/amplitude_service.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../../widgets/alert_dialog/dialog_box_with_action.dart';
import '../../../widgets/alert_dialog/show_dialog_box.dart';

Future<void> notCoinplusCardAlert({
  required BuildContext context,
  required String walletAddress,
  required String walletType,
  required String source,
  required WalletProtectState walletProtectState,
}) {
  recordAmplitudeEvent(FakeWallet(source: source, walletType: walletType, walletAddress: walletAddress));
  recordUserProperty(const FraudActivity());
  return showDialogBox(
    context,
    walletProtectState,
    DialogBoxWithAction(
      title: const Text(
        'The card is not authentic!',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: FontFamily.redHatBold,
          fontSize: 17,
        ),
      ),
      lottieAsset: 'assets/animated_logo/fake_card.json',
      primaryActionText: 'Got it',
      primaryAction: router.pop,
      widget: ScaleTap(
        enableFeedback: false,
        onPressed: () async {
          await router.pop();
          final email = Uri.encodeComponent('support@coinplus.com');
          final mail = Uri.parse('mailto:$email');
          if (await launchUrl(mail)) {
          } else {}
        },
        child: StyledText(
          textAlign: TextAlign.center,
          text:
              'The card was not produced by Coinplus. In case you have any question feel free to contact as at <p>support@coinplus.com</p>',
          tags: {
            'p': StyledTextTag(
              style: const TextStyle(
                fontFamily: FontFamily.redHatLight,
                fontWeight: FontWeight.w700,
                fontSize: 14,
                decoration: TextDecoration.underline,
                color: Colors.blue,
              ),
            ),
          },
          style: const TextStyle(
            fontFamily: FontFamily.redHatLight,
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
      text: '',
    ),
    isDismissible: true,
  );
}
