import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';

import '../../../constants/card_color.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../pages/wallet_page/card_and_bar_tab/card_and_bar_tab.dart';
import '../../../providers/screen_service.dart';
import '../../../utils/data_utils.dart';
import 'change_selected_address_state.dart';

class ChangeSelectedAddressModal extends HookWidget {
  const ChangeSelectedAddressModal({super.key});

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 2);
    final state = useMemoized(ChangeSelectedAddressState.new);
    return SizedBox(
      height: context.height * 0.91,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.icons.notch.image(height: 4),
            const Gap(20),
            Row(
              children: [
                const Text(
                  'Select wallet',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const Spacer(),
                CardAndBarTab(
                  tabController: tabController,
                ),
              ],
            ),
            const Gap(30),
            Observer(
              builder: (context) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.cards.length,
                  itemBuilder: (context, index) {
                    final card = state.cards[index];
                    final formattedAddress = getSplitAddress(card.address);
                    final data = state.btc;
                    final myFormat = NumberFormat.decimalPatternDigits(
                      locale: 'en_us',
                      decimalDigits: 2,
                    );
                    return Observer(
                      builder: (context) {
                        return InkWell(
                          onTap: () async {
                            state.onSelectCard(index);
                            await router.maybePop();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: state.selectedCardIndex == index
                                  ? const Color(0xFFF7F7FA)
                                  : Colors.transparent,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image:
                                                card.color.image.image().image,
                                          ),
                                        ),
                                      ),
                                      const Gap(12),
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            card.name,
                                            style: const TextStyle(
                                              fontFamily:
                                                  FontFamily.redHatMedium,
                                              fontSize: 15,
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Text(
                                            formattedAddress,
                                            style: const TextStyle(
                                              fontFamily:
                                                  FontFamily.redHatMedium,
                                              fontSize: 14,
                                              color: AppColors.textHintsColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Text(
                                    '\$${myFormat.format((card.finalBalance??0) / 100000000 * data!.price)}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontFamily: FontFamily.redHatMedium,
                                      color: AppColors.textHintsColor,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
