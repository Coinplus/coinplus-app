import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';

import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../models/amplitude_event/amplitude_event_part_one/amplitude_event.dart';
import '../../providers/screen_service.dart';
import '../../services/amplitude_service.dart';
import '../../store/all_settings_state/all_settings_state.dart';
import '../../utils/data_utils.dart';
import '../../widgets/loading_button/loading_button.dart';

Future<void> receiveModal({
  required AbstractCard card,
  required bool isBarList,
  required Future<bool> isCardActivated,
  required Future<bool> isBarActivated,
  required ObjectRef<({AbstractCard? card, int index})> currentCard,
  required ValueNotifier<bool> isModalOpened,
  required AllSettingsState settingsState,
}) async {
  isModalOpened.value = true;
  await showModalBottomSheet(
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    backgroundColor: Colors.white,
    isScrollControlled: true,
    context: router.navigatorKey.currentContext!,
    builder: (_) {
      return SizedBox(
        height: 650,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.icons.notch.image(
                height: 4,
              ),
              Row(
                children: [
                  SizedBox(
                    height: 50,
                    child: IconButton(
                      onPressed: router.maybePop,
                      icon: Assets.icons.close.image(),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          card.blockchain == 'BTC' ? 'Receive BTC' : 'Receive ETH',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Gap(6),
                        if (card.blockchain == 'BTC')
                          Assets.icons.bTCIcon.image(
                            height: 24,
                          )
                        else
                          Assets.icons.ethIcon.image(
                            height: 24,
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 40,
                  ),
                ],
              ),
              const Gap(30),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: const Color(
                    0xFFF7F7FA,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        left: 62,
                        right: 62,
                        bottom: 17,
                      ),
                      child: QrImageView(
                        data: card.address,
                        size: 220,
                        gapless: false,
                      ),
                    ),
                    ScaleTap(
                      enableFeedback: false,
                      onPressed: () async {
                        await recordAmplitudeEvent(
                          AddressCopied(
                            walletType: isBarList ? 'Bar' : 'Card',
                            walletAddress: card.address,
                            activated: isBarList ? await isBarActivated : await isCardActivated,
                            source: 'Receive',
                          ),
                        );
                        await Clipboard.setData(
                          ClipboardData(
                            text: card.address.toString(),
                          ),
                        ).then(
                          (_) {
                            HapticFeedback.mediumImpact();
                            settingsState.copyAddress();
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 12,
                          right: 12,
                          bottom: 12,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                              left: 10,
                            ),
                            child: Row(
                              children: [
                                Assets.icons.contentCopy.image(
                                  height: 32,
                                  color: AppColors.primaryButtonColor,
                                ),
                                const Gap(
                                  8,
                                ),
                                Observer(
                                  builder: (context) {
                                    return Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Your address',
                                          style: TextStyle(
                                            fontFamily: FontFamily.redHatMedium,
                                            fontSize: 16,
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
                                          secondChild: context.height > 667
                                              ? Text(
                                                  getSplitAddress(card.address),
                                                  style: const TextStyle(
                                                    fontFamily: FontFamily.redHatMedium,
                                                    fontSize: 14,
                                                    color: Color(
                                                      0xFF4F6486,
                                                    ),
                                                  ),
                                                )
                                              : Text(
                                                  getSplitAddress(card.address),
                                                  style: const TextStyle(
                                                    fontFamily: FontFamily.redHatMedium,
                                                    fontSize: 14,
                                                    color: Color(
                                                      0xFF4F6486,
                                                    ),
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
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(
                      0xFF4A83E0,
                    ).withOpacity(
                      0.1,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(14),
                  color: const Color(
                    0xFF4A83E0,
                  ).withOpacity(0.05),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Assets.icons.error.image(
                        height: 24,
                      ),
                      const Gap(10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Please note',
                            style: TextStyle(
                              fontFamily: FontFamily.redHatMedium,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Color(
                                0xFF4F6486,
                              ),
                            ),
                          ),
                          const Gap(4),
                          Text(
                            card.blockchain == 'BTC'
                                ? 'This address is exclusively for receiving \nBitcoin. You cannot receive any other \ncryptocurrency to this address.'
                                : 'This address is exclusively for receiving \nEthereum. You cannot receive any other \ncryptocurrency to this address.',
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              fontFamily: FontFamily.redHatMedium,
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Color(
                                0xFF4F6486,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              LoadingButton(
                onPressed: () async {
                  await recordAmplitudeEvent(
                    ShareAddressClicked(
                      walletType: isBarList ? 'Bar' : 'Card',
                      walletAddress: currentCard.value.card!.address,
                      activated: isBarList ? await isBarActivated : await isCardActivated,
                    ),
                  );
                  await Share.share(
                    card.address,
                  );
                },
                child: const Text(
                  'Share',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                  ),
                ),
              ).paddingHorizontal(60),
              const Gap(20),
            ],
          ),
        ),
      );
    },
  );
  isModalOpened.value = false;
}
