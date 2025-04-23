import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';

import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/amplitude_event/amplitude_event_part_three/amplitude_event_part_three.dart';
import '../../models/firebase_model/cards_firebase_model.dart';
import '../../providers/screen_service.dart';
import '../../services/amplitude_service.dart';
import '../../utils/data_utils.dart';
import '../../widgets/loading_button/loading_button.dart';
import '../backup_card_modal/backup_card_modal.dart';

class LostCardInfoModal extends StatelessWidget {
  const LostCardInfoModal({super.key, required this.cardData});

  final CardsModel? cardData;

  @override
  Widget build(BuildContext context) {
    recordAmplitudeEventPartThree(
      PrimaryCard(walletAddress: cardData?.primaryWalletAddress ?? '', backupAddress: cardData?.address ?? ''),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(12),
          Assets.icons.notch.image(height: 4),
          const Gap(10),
          const Text(
            'Primary card details',
            style: TextStyle(
              fontFamily: FontFamily.redHatMedium,
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ).expandedHorizontally(),
          const Gap(30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Builder(
              builder: (context) {
                if (cardData != null) {
                  return Observer(
                    builder: (context) {
                      return ScaleTap(
                        scaleMinValue: 0.98,
                        enableFeedback: false,
                        onPressed: () async {
                          await Clipboard.setData(
                            ClipboardData(
                              text: cardData?.primaryWalletAddress ?? '',
                            ),
                          ).then(
                            (_) {
                              HapticFeedback.mediumImpact();
                              settingsState.copyAddress();
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
                          child: Row(
                            children: [
                              getColorImage(cardData!.primaryWalletColor!),
                              const Gap(10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Primary card',
                                    style: TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primary,
                                      fontSize: 15,
                                    ),
                                  ),
                                  AnimatedCrossFade(
                                    firstChild: const Row(
                                      children: [
                                        Text(
                                          'Copied',
                                          style: TextStyle(
                                            fontFamily: FontFamily.redHatMedium,
                                            color: Colors.green,
                                          ),
                                        ),
                                        Icon(
                                          Icons.check,
                                          color: Colors.green,
                                          size: 18,
                                        ),
                                      ],
                                    ),
                                    secondChild: Text(
                                      getSplitAddress(cardData?.primaryWalletAddress ?? ''),
                                      style: const TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.textHintsColor,
                                      ),
                                    ),
                                    crossFadeState: settingsState.isAddressCopied
                                        ? CrossFadeState.showFirst
                                        : CrossFadeState.showSecond,
                                    duration: const Duration(
                                      milliseconds: 200,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ),
          const Gap(32),
          LoadingButton(
            onPressed: router.maybePop,
            child: const Text(
              'Got it',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                fontWeight: FontWeight.normal,
              ),
            ),
          ).paddingHorizontal(60),
          const Gap(40),
        ],
      ),
    );
  }

  Widget getColorImage(String color) {
    switch (color) {
      case '0':
        return Assets.images.card.orangeCardFront.image(height: 45);
      case '1':
        return Assets.images.card.whiteCardFront.image(height: 45);
      case '2':
        return Assets.images.card.brownCardFront.image(height: 45);
      default:
        return const SizedBox.shrink();
    }
  }
}
