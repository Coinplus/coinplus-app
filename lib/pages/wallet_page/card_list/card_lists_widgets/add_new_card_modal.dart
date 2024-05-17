import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../extensions/extensions.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../store/nfc_state/nfc_state.dart';
import '../../../../widgets/wallet_connect_methods/card_connect_methods.dart';

class AddNewCardModal extends StatelessWidget {
  const AddNewCardModal({
    super.key,
    required NfcStore nfcState,
  }) : _nfcState = nfcState;

  final NfcStore _nfcState;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: Assets.icons.notch.image(
            height: 4,
          ),
        ),
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                top: 10,
              ),
              child: Text(
                'Add new wallet',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: FontFamily.redHatBold,
                  fontSize: 17,
                  color: AppColors.primaryTextColor,
                ),
              ),
            ),
          ],
        ),
        const Gap(18),
        CardScanMethodsPage(isAvailable: _nfcState).paddingHorizontal(20),
        const Gap(40),
      ],
    );
  }
}
