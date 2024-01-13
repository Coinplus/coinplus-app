import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:styled_text/tags/styled_text_tag.dart';
import 'package:styled_text/widgets/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../extensions/elevated_button_extensions.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../models/amplitude_user_property_model/amplitude_user_property_model.dart';
import '../../../providers/screen_service.dart';
import '../../../services/amplitude_service.dart';
import '../../../widgets/loading_button.dart';

Future<void> notCoinplusCardAlert({
  required BuildContext context,
  required String walletAddress,
  required String walletType,
  required String source,
}) {
  final closeButton = LoadingButton(
    style: context.theme.buttonStyle(
      textStyle: const TextStyle(
        fontFamily: FontFamily.redHatMedium,
        color: AppColors.primaryTextColor,
        fontSize: 15,
      ),
    ),
    onPressed: () async {
      await router.pop();
    },
    child: const Text(
      'Got it',
      style: TextStyle(
        fontSize: 15,
        fontFamily: FontFamily.redHatMedium,
        fontWeight: FontWeight.normal,
        color: AppColors.white,
      ),
    ),
  ).paddingHorizontal(40);
  recordAmplitudeEvent(FakeWallet(source: source, walletType: walletType, walletAddress: walletAddress));
  recordUserProperty(const FraudActivity());
  return showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (_) {
      return EmergeAlertDialog(
        emergeAlertDialogOptions: EmergeAlertDialogOptions(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'The card is not authentic!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatBold,
                  fontSize: 17,
                ),
              ),
              Lottie.asset(
                height: 170,
                'assets/animated_logo/fake_card.json',
                repeat: false,
              ),
              ScaleTap(
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
              const Gap(28),
              Center(child: closeButton),
            ],
          ),
          elevation: 0,
        ),
      );
    },
  );
}
