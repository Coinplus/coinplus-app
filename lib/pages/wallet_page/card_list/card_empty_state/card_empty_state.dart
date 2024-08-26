import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../extensions/elevated_button_extensions.dart';
import '../../../../extensions/extensions.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../models/amplitude_event/amplitude_event.dart';
import '../../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../../providers/screen_service.dart';
import '../../../../router.dart';
import '../../../../services/amplitude_service.dart';
import '../../../../services/cloud_firestore_service.dart';
import '../../../../store/balance_store/balance_store.dart';
import '../../../../store/nfc_state/nfc_state.dart';
import '../../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../../../widgets/loading_button/loading_button.dart';
import '../card_lists_widgets/add_new_card_modal.dart';

class CardEmptyState extends StatelessWidget {
  const CardEmptyState({
    super.key,
    required this.walletProtectState,
    required this.balanceStore,
    required this.nfcState,
  });

  final WalletProtectState walletProtectState;
  final BalanceStore balanceStore;
  final NfcStore nfcState;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemBuilder: (context, index, constrains) {
        if (index == balanceStore.cards.length) {
          return ScaleTap(
            enableFeedback: false,
            scaleMinValue: 0.98,
            onPressed: () {
              router.push(BuyCardRoute(method: getBuyCardData()));
            },
            child: Container(
              height: context.height * 0.5,
              margin: EdgeInsets.all(
                context.height > 667 ? 5 : 0,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 0.5,
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Assets.images.card.emptyCard.image(),
                  Positioned(
                    left: 10,
                    right: 17,
                    child: Assets.images.card.buyCards.image(),
                  ),
                  Positioned(
                    bottom: 1,
                    left: 1,
                    right: 1,
                    child: Assets.images.card.cardBuyBlurEffect.image(),
                  ),
                  Positioned(
                    left: 12,
                    right: 12,
                    bottom: 12,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Coinplus Card',
                          style: TextStyle(
                            fontSize: 18,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w700,
                            fontFamily: FontFamily.redHatMedium,
                          ),
                        ).expandedHorizontally(),
                        const Gap(2),
                        Row(
                          children: [
                            Assets.images.card.buyCardText.image(
                              height: 20,
                            ),
                          ],
                        ),
                        const Gap(6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Buy now at a special \nprice',
                              style: TextStyle(
                                fontFamily: FontFamily.redHatMedium,
                                color: Color(0xFF838995),
                              ),
                            ),
                            Row(
                              children: [
                                const Text(
                                  r'$24,99',
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontFamily: FontFamily.redHatMedium,
                                    color: AppColors.primary,
                                  ),
                                ),
                                const Gap(6),
                                FutureBuilder(
                                  future: getBuyCardData(),
                                  builder: (context, snapshot) {
                                    if (snapshot.data == null) {
                                      return Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: Colors.grey,
                                          ),
                                          height: 26,
                                          width: 57,
                                        ),
                                      );
                                    } else {
                                      return Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: const Color(0xFFFD7E70),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                            vertical: 4,
                                          ),
                                          child: Text(
                                            snapshot.data!.price.toString(),
                                            style: const TextStyle(
                                              fontFamily:
                                                  FontFamily.redHatMedium,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      );
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                        const Gap(8),
                        LoadingButton(
                          onPressed: () {
                            recordAmplitudeEventPartTwo(
                              const BuyCardClicked(),
                            );
                            router.push(BuyCardRoute(method: getBuyCardData()));
                          },
                          style: context.theme
                              .buttonStyle(
                                textStyle: const TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                              .copyWith(
                                backgroundColor: WidgetStateProperty.all(
                                  AppColors.primaryButtonColor,
                                ),
                              ),
                          child: const Text('Buy now'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: 25, top: 20),
          child: ScaleTap(
            enableFeedback: false,
            onPressed: index == 1
                ? () async {
                    await walletProtectState.updateModalStatus(
                      isOpened: true,
                    );
                    await recordAmplitudeEvent(
                      const AddNewClicked(tab: 'Card'),
                    );
                    await showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      context: context,
                      builder: (context) {
                        return AddNewCardModal(
                          nfcState: nfcState,
                        );
                      },
                    ).then(
                      (value) =>
                          walletProtectState.updateModalStatus(isOpened: false),
                    );
                  }
                : null,
            child: Assets.images.addCard.image(),
          ),
        );
      },
      options: CarouselOptions(
        enlargeFactor: 0.35,
        enableInfiniteScroll: false,
        viewportFraction: 0.79,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
      ),
      itemCount: 2,
    );
  }
}
