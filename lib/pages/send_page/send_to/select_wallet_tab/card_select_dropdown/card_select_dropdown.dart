import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../../../constants/card_color.dart';
import '../../../../../extensions/extensions.dart';
import '../../../../../gen/colors.gen.dart';
import '../../../../../gen/fonts.gen.dart';
import '../../../../../providers/screen_service.dart';
import '../../../../../utils/data_utils.dart';
import '../../change_selected_address/change_selected_address_modal.dart';
import '../../send_to_state.dart';

class CardSelectDropdown extends HookWidget {
  const CardSelectDropdown({
    super.key,
    required this.isBarList,
  });

  final bool isBarList;

  SendToState get _sendToState => GetIt.I<SendToState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFFF7F7FA),
      ),
      child: ScaleTap(
        enableFeedback: false,
        onPressed: _sendToState.hasMoreThanOneWallets
            ? () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: router.navigatorKey.currentContext!,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  builder: (_) => ChangeSelectedAddressModal(
                    isBarList: isBarList,
                  ),
                );
              }
            : null,
        child: Observer(
          builder: (context) {
            if (_sendToState.transactionsStore.selectedCard != -1) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Observer(
                    builder: (_) {
                      final data = _sendToState.btc;
                      final myFormat = NumberFormat.decimalPatternDigits(
                        locale: 'en_us',
                        decimalDigits: 2,
                      );
                      final singleCard =
                          _sendToState.transactionsStore.cards[_sendToState.transactionsStore.selectedCard];
                      final formattedAddress = getSplitAddress(singleCard.address);

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 25,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: singleCard.color.image.image().image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                      color: Colors.grey.withValues(alpha: 0.2),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    singleCard.name,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: FontFamily.redHatMedium,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Text(
                                    formattedAddress,
                                    style: const TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      fontSize: 14,
                                      color: AppColors.textHintsColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Observer(
                                    builder: (context) {
                                      return _sendToState.hasPerformedAction
                                          ? Text(
                                              r'$*****',
                                              style: TextStyle(
                                                fontSize: singleCard.finalBalance.toString().length > 9 ? 17 : 20,
                                                fontFamily: FontFamily.redHatMedium,
                                                color: AppColors.textHintsColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )
                                          : Text(
                                              '\$${myFormat.format(
                                                (singleCard.finalBalance ?? 0) / 100000000 * data!.price,
                                              )}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily: FontFamily.redHatMedium,
                                                color: AppColors.textHintsColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            );
                                    },
                                  ),
                                  const Gap(2),
                                  Text(
                                    'BTC ${(singleCard.finalBalance ?? 0) / 100000000}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: FontFamily.redHatMedium,
                                      color: AppColors.textHintsColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              if (_sendToState.hasMoreThanOneWallets)
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.primary,
                                ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            } else if (_sendToState.transactionsStore.selectedBar != -1) {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Observer(
                    builder: (_) {
                      final data = _sendToState.btc;
                      final myFormat = NumberFormat.decimalPatternDigits(
                        locale: 'en_us',
                        decimalDigits: 2,
                      );
                      final singleBar = _sendToState.transactionsStore.bars[_sendToState.transactionsStore.selectedBar];
                      final formattedAddress = getSplitAddress(singleBar.address);

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 25,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: singleBar.color.image.image().image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                      color: Colors.grey.withValues(alpha: 0.2),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    singleBar.name,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: FontFamily.redHatMedium,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Text(
                                    formattedAddress,
                                    style: const TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      fontSize: 14,
                                      color: AppColors.textHintsColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Observer(
                                    builder: (context) {
                                      return _sendToState.hasPerformedAction
                                          ? Text(
                                              r'$*****',
                                              style: TextStyle(
                                                fontSize: singleBar.finalBalance.toString().length > 9 ? 17 : 20,
                                                fontFamily: FontFamily.redHatMedium,
                                                color: AppColors.textHintsColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )
                                          : Text(
                                              '\$${myFormat.format(
                                                (singleBar.finalBalance ?? 0) / 100000000 * data!.price,
                                              )}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily: FontFamily.redHatMedium,
                                                color: AppColors.textHintsColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            );
                                    },
                                  ),
                                  const Gap(2),
                                  Text(
                                    'BTC ${(singleBar.finalBalance ?? 0) / 100000000}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: FontFamily.redHatMedium,
                                      color: AppColors.textHintsColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              if (_sendToState.hasMoreThanOneWallets)
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.primary,
                                ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Observer(
                    builder: (_) {
                      final data = _sendToState.btc;
                      final myFormat = NumberFormat.decimalPatternDigits(
                        locale: 'en_us',
                        decimalDigits: 2,
                      );
                      final singleCard =
                          _sendToState.transactionsStore.cards[_sendToState.historyPageStore.cardHistoryIndex];
                      final formattedAddress = getSplitAddress(singleCard.address);

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 25,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: singleCard.color.image.image().image,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      spreadRadius: 5,
                                      color: Colors.grey.withValues(alpha: 0.2),
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    singleCard.name,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontFamily: FontFamily.redHatMedium,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  Text(
                                    formattedAddress,
                                    style: const TextStyle(
                                      fontFamily: FontFamily.redHatMedium,
                                      fontSize: 14,
                                      color: AppColors.textHintsColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Observer(
                                    builder: (context) {
                                      return _sendToState.hasPerformedAction
                                          ? Text(
                                              r'$*****',
                                              style: TextStyle(
                                                fontSize: singleCard.finalBalance.toString().length > 9 ? 17 : 20,
                                                fontFamily: FontFamily.redHatMedium,
                                                color: AppColors.textHintsColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            )
                                          : Text(
                                              '\$${myFormat.format(
                                                (singleCard.finalBalance ?? 0) / 100000000 * data!.price,
                                              )}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily: FontFamily.redHatMedium,
                                                color: AppColors.textHintsColor,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            );
                                    },
                                  ),
                                  const Gap(2),
                                  Text(
                                    'BTC ${(singleCard.finalBalance ?? 0) / 100000000}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: FontFamily.redHatMedium,
                                      color: AppColors.textHintsColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              if (_sendToState.hasMoreThanOneWallets)
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: AppColors.primary,
                                ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
