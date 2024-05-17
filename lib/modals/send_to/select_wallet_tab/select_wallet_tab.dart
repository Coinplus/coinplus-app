import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants/card_color.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../utils/data_utils.dart';
import '../../../widgets/loading_button/loading_button.dart';
import '../../../widgets/shimmers/history_dropdown_shimmer.dart';
import '../change_selected_address/change_selected_address_modal.dart';
import '../send_to_state.dart';

class ProvideAddressTab extends HookWidget {
  const ProvideAddressTab({
    super.key,
    required this.state,
    required this.tabController,
  });

  final SendToState state;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    final addressController = useTextEditingController();
    final sendFocusNode = useFocusNode();
    useAutomaticKeepAlive();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: const Text(
            'Send to',
            style: TextStyle(
              fontFamily: FontFamily.redHatMedium,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryTextColor,
            ),
          ).expandedHorizontally(),
        ),
        const Gap(8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Observer(
            builder: (context) {
              return state.transactionsStore.utxoData != null
                  ? SizedBox(
                      height: 44,
                      child: TextField(
                        keyboardType: TextInputType.text,
                        autocorrect: false,
                        autofocus: true,
                        enableSuggestions: false,
                        scribbleEnabled: false,
                        focusNode: sendFocusNode,
                        style: const TextStyle(
                          fontFamily: FontFamily.redHatMedium,
                          fontSize: 14,
                          color: AppColors.textHintsColor,
                          fontWeight: FontWeight.normal,
                        ),
                        cursorColor: AppColors.secondaryButtons,
                        controller: addressController,
                        onTapOutside: (_) {
                          WidgetsBinding.instance.focusManager.primaryFocus
                              ?.unfocus();
                        },
                        onChanged: state.onAddressChanges,
                        decoration: InputDecoration(
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                            borderRadius: BorderRadius.circular(
                              8,
                            ),
                          ),
                          contentPadding:
                              const EdgeInsets.only(top: 12, left: 8),
                          hintText: 'Receiver’s wallet address',
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(9),
                            child: ScaleTap(
                              onPressed: () async {
                                final res = await router.push<String?>(
                                  const QrScannerRoute(),
                                );
                                if (res == null) {
                                  return;
                                }
                                addressController.text = res;
                                state.onAddressChanges(res);
                              },
                              child: Assets.icons.qrCode.image(height: 18),
                            ),
                          ),
                          hintStyle: TextStyle(
                            fontFamily: FontFamily.redHatLight,
                            color: AppColors.primaryTextColor.withOpacity(0.8),
                            fontSize: 14,
                          ),
                          fillColor: Colors.grey.withOpacity(0.1),
                        ),
                      ),
                    )
                  : Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
            },
          ),
        ),
        const Gap(17),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: const Text(
            'Selected wallet',
            style: TextStyle(
              fontFamily: FontFamily.redHatMedium,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryTextColor,
            ),
          ).expandedHorizontally(),
        ),
        const Gap(8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Observer(
            builder: (_) {
              return state.btc == null
                  ? const Padding(
                      padding: EdgeInsets.only(top: 14),
                      child: HistoryDropdownShimmer(),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xFFF7F7FA),
                      ),
                      child: ScaleTap(
                        enableFeedback: false,
                        onPressed: state.hasMoreThanOneCards
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
                                  builder: (_) =>
                                      const ChangeSelectedAddressModal(),
                                );
                              }
                            : null,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Observer(
                              builder: (_) {
                                final data = state.btc;
                                final myFormat =
                                    NumberFormat.decimalPatternDigits(
                                  locale: 'en_us',
                                  decimalDigits: 2,
                                );
                                final singleCard = state.selectedCard;
                                final formattedAddress =
                                    getSplitAddress(singleCard.address);

                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 40,
                                          width: 25,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: singleCard.color.image
                                                  .image()
                                                  .image,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 10,
                                                spreadRadius: 5,
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const Gap(10),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              singleCard.name,
                                              style: const TextStyle(
                                                fontSize: 15,
                                                fontFamily:
                                                    FontFamily.redHatMedium,
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
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Observer(
                                              builder: (context) {
                                                return state.hasPerformedAction
                                                    ? Text(
                                                        r'$*****',
                                                        style: TextStyle(
                                                          fontSize: singleCard
                                                                      .finalBalance
                                                                      .toString()
                                                                      .length >
                                                                  9
                                                              ? 17
                                                              : 20,
                                                          fontFamily: FontFamily
                                                              .redHatMedium,
                                                          color: AppColors
                                                              .textHintsColor,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      )
                                                    : Text(
                                                        '\$${myFormat.format((singleCard.finalBalance ?? 0) / 100000000 * data!.price)}',
                                                        style: const TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: FontFamily
                                                              .redHatMedium,
                                                          color: AppColors
                                                              .textHintsColor,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      );
                                              },
                                            ),
                                            const Gap(2),
                                            Text(
                                              'BTC ${(singleCard.finalBalance ?? 0) / 100000000}',
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontFamily:
                                                    FontFamily.redHatMedium,
                                                color: AppColors.textHintsColor,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        if (state.hasMoreThanOneCards)
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
                        ),
                      ),
                    );
            },
          ),
        ),
        const Spacer(),
        Observer(
          builder: (context) {
            return LoadingButton(
              onPressed: state.transactionsStore.utxoData != null
                  ? state.isValidReceiverAddress
                      ? () {
                          tabController.animateTo(1);
                        }
                      : null
                  : null,
              child: const Text(
                'Next',
                style: TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ).paddingHorizontal(60);
          },
        ),
        if (sendFocusNode.hasFocus) const Gap(24) else const Gap(50),
      ],
    );
  }
}
