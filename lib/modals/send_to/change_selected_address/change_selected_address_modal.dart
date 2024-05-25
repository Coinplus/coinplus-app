import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';

import '../../../constants/card_color.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/bar_model/bar_model.dart';
import '../../../models/card_model/card_model.dart';
import '../../../providers/screen_service.dart';
import '../../../utils/data_utils.dart';
import '../../../utils/secure_storage_utils.dart';
import '../../../widgets/all_alert_dialogs/bar_activation_alert/bar_activation_alert.dart';
import '../../../widgets/all_alert_dialogs/card_activation_alert/card_activation_alert.dart';
import '../send_to_state.dart';

class ChangeSelectedAddressModal extends HookWidget {
  const ChangeSelectedAddressModal({
    super.key,
    required this.isBarList,
    required this.state,
  });

  final bool isBarList;
  final SendToState state;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.91,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.icons.notch.image(height: 4),
            const Gap(20),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                children: [
                  Text(
                    'Select wallet',
                    style: TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(30),
            Expanded(
              flex: context.height > 667 ? 7 : 10,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Observer(
                      builder: (context) {
                        final items = [
                          ...state.transactionsStore.cards,
                          ...state.transactionsStore.bars,
                        ];
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final item = items[index];
                            if (item is CardModel) {
                              final card = item;
                              final formattedCardAddress =
                                  getSplitAddress(card.address);
                              final data = state.btc;
                              final myFormat =
                                  NumberFormat.decimalPatternDigits(
                                locale: 'en_us',
                                decimalDigits: 2,
                              );
                              final cardActivationStatus =
                                  checkWalletStatus(card.address);
                              return Observer(
                                builder: (context) {
                                  final isSelected = state.historyPageStore
                                              .cardHistoryIndex ==
                                          index &&
                                      state.transactionsStore.selectedBar == -1;
                                  return InkWell(
                                    onTap: () async {
                                      if (await cardActivationStatus) {
                                        state.transactionsStore
                                            .onSelectCard(index);
                                        await router.maybePop();
                                      } else {
                                        await cardActivationAlert(
                                          context: context,
                                          isModalOpened: ValueNotifier(true),
                                          card: card,
                                          isBarList: isBarList,
                                        );
                                        await state.historyPageStore
                                            .setCardHistoryIndex(index);
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: isSelected
                                            ? Colors.grey.withOpacity(0.1)
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
                                                      image: card.color.image
                                                          .image()
                                                          .image,
                                                    ),
                                                  ),
                                                ),
                                                const Gap(12),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      card.name,
                                                      style: const TextStyle(
                                                        fontFamily: FontFamily
                                                            .redHatMedium,
                                                        fontSize: 15,
                                                        color:
                                                            AppColors.primary,
                                                      ),
                                                    ),
                                                    Text(
                                                      formattedCardAddress,
                                                      style: const TextStyle(
                                                        fontFamily: FontFamily
                                                            .redHatMedium,
                                                        fontSize: 14,
                                                        color: AppColors
                                                            .textHintsColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '\$${myFormat.format((card.finalBalance ?? 0) / 100000000 * data!.price)}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily:
                                                    FontFamily.redHatMedium,
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
                            } else {
                              final bar = item as BarModel;
                              final formattedBarAddress =
                                  getSplitAddress(bar.address);
                              final data = state.btc;
                              final myFormat =
                                  NumberFormat.decimalPatternDigits(
                                locale: 'en_us',
                                decimalDigits: 2,
                              );
                              final barActivationStatus =
                                  checkWalletStatus(bar.address);
                              return Observer(
                                builder: (context) {
                                  final isSelected = state.historyPageStore
                                              .barHistoryIndex ==
                                          index -
                                              state.transactionsStore.cards
                                                  .length &&
                                      state.transactionsStore.selectedCard ==
                                          -1 &&
                                      state.transactionsStore.selectedBar != -1;
                                  return InkWell(
                                    onTap: () async {
                                      if (await barActivationStatus) {
                                        state.transactionsStore.onSelectBar(
                                          index -
                                              state.transactionsStore.cards
                                                  .length,
                                        );
                                        await router.maybePop();
                                      } else {
                                        await barActivationDialog(
                                          context: context,
                                          isModalOpened: ValueNotifier(true),
                                          bar: bar,
                                          isBarList: isBarList,
                                        );
                                        await state.historyPageStore
                                            .setCardHistoryIndex(
                                          index -
                                              state.transactionsStore.cards
                                                  .length,
                                        );
                                      }
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: isSelected
                                            ? Colors.grey.withOpacity(0.1)
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
                                                      image: bar.color.image
                                                          .image()
                                                          .image,
                                                    ),
                                                  ),
                                                ),
                                                const Gap(12),
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      bar.name,
                                                      style: const TextStyle(
                                                        fontFamily: FontFamily
                                                            .redHatMedium,
                                                        fontSize: 15,
                                                        color:
                                                            AppColors.primary,
                                                      ),
                                                    ),
                                                    Text(
                                                      formattedBarAddress,
                                                      style: const TextStyle(
                                                        fontFamily: FontFamily
                                                            .redHatMedium,
                                                        fontSize: 14,
                                                        color: AppColors
                                                            .textHintsColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '\$${myFormat.format((bar.finalBalance ?? 0) / 100000000 * data!.price)}',
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily:
                                                    FontFamily.redHatMedium,
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
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
