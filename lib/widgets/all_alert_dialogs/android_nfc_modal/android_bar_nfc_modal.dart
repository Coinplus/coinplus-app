import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:nfc_manager/nfc_manager.dart';

import '../../../extensions/elevated_button_extensions.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../modals/send_to/send_to_state.dart';
import '../../../providers/screen_service.dart';
import '../../loading_button/loading_button.dart';
import '../trouble_tapping_bar/trouble_tapping_bar.dart';

class AndroidBarNfcModal extends StatelessWidget {
  const AndroidBarNfcModal({super.key, required this.state});

  final SendToState state;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(
        milliseconds: 300,
      ),
      opacity: 1,
      child: Container(
        height: 400,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(
              40,
            ),
          ),
        ),
        child: Column(
          children: [
            const Gap(10),
            Assets.icons.notch.image(
              height: 4,
            ),
            const Gap(15),
            const Text(
              'Ready to Scan',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: FontFamily.redHatSemiBold,
                fontSize: 22,
                color: AppColors.primaryTextColor,
              ),
            ),
            const Gap(40),
            SizedBox(
              height: 150,
              width: 150,
              child: Lottie.asset(
                'assets/lottie_animations/nfcanimation.json',
              ).expandedHorizontally(),
            ),
            const Gap(25),
            const Text(
              "Please tap your phone on the top of your Bar's box to verify it's legitimacy",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontFamily: FontFamily.redHatMedium,
              ),
            ).paddingHorizontal(50),
            const Gap(20),
            LoadingButton(
              onPressed: () async {
                await router.maybePop();
                await NfcManager.instance.stopSession();
                await Future.delayed(const Duration(milliseconds: 1000));
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
                  backgroundColor: Colors.white,
                  builder: (context) {
                    return BarIssueOptionsSheet(state: state);
                  },
                );
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
              child: const Text('Cancel'),
            ).paddingHorizontal(60),
          ],
        ),
      ),
    );
  }
}
