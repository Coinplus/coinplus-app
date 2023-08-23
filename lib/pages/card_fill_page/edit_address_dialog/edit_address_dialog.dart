import 'package:emerge_alert_dialog/emerge_alert_dialog.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../widgets/loading_button.dart';

Future<void> editAddressDialog(BuildContext context) {
  final okButton = LoadingButton(
    child: const Text(
      'Got it',
      style: TextStyle(
        fontFamily: FontFamily.redHatMedium,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    onPressed: () {
      router.pushAndPopAll(const Dashboard());
    },
  ).paddingHorizontal(40);
  return showDialog<void>(
    context: context,
    builder: (context) {
      return EmergeAlertDialog(
        emergeAlertDialogOptions: EmergeAlertDialogOptions(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          content: SizedBox(
            height: 270,
            child: Column(
              children: [
                Row(
                  children: [
                    Center(
                      child: IconButton(
                        onPressed: () {
                          router.pop(context);
                        },
                        icon: const Icon(
                          Icons.close_sharp,
                          size: 25,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        'You have already \nsaved this!',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: FontFamily.redHatBold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 45,
                    ),
                  ],
                ),
                const Gap(23),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Gap(40),
                      Assets.images.formCard.image(height: 63),
                      const Gap(16),
                      Assets.icons.taskAlt.image(height: 24),
                    ],
                  ),
                ).expandedHorizontally(),
                const Gap(31),
                const Text(
                  'It looks like you have already saved this card. If you need to add another one, please try again.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: FontFamily.redHatLight,
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                  ),
                ),
                const Gap(18),
                Center(child: okButton),
              ],
            ),
          ),
          elevation: 0,
        ),
      );
    },
  );
}
