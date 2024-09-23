import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';

import '../../../../extensions/extensions.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../models/amplitude_event/amplitude_event.dart';
import '../../../../services/amplitude_service.dart';
import '../../../../store/address_and_balance_state/address_and_balance_state.dart';
import '../../../../store/balance_store/balance_store.dart';
import '../../../../store/market_page_store/market_page_store.dart';
import '../../../../utils/card_color_detecting.dart';
import '../../../../utils/data_utils.dart';
import '../../../../widgets/custom_snack_bar/snack_bar.dart';
import '../../../../widgets/custom_snack_bar/top_snack.dart';

class CardFront extends StatelessWidget {
  const CardFront({
    super.key,
    required this.receivedData,
    required this.balanceStore,
    required this.cardColor,
    required this.addressState,
    required this.marketPageStore,
  });

  final String receivedData;
  final BalanceStore balanceStore;
  final String cardColor;
  final AddressState addressState;
  final MarketPageStore marketPageStore;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height > 667 ? 455 : 365,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 15,
          ),
        ],
        image: DecorationImage(
          image: getFrontImageForCardColor(cardColor).image,
        ),
      ),
      child: Center(
        child: Observer(
          builder: (context) {
            return Visibility(
              visible: addressState.isAddressVisible,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: context.height * 0.22,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.height < 932
                          ? context.height < 867.4
                              ? context.height > 844
                                  ? context.width * 0.11 // iPhone 14 Pro (ok)
                                  : context.height > 667
                                      ? context.width * 0.17 //iPhone 13 Pro
                                      : context.width *
                                          0.23 // iPhone 7/8/SE (ok)
                              : context.width * 0.15 //Samsung large display
                          : context.width * 0.15, //iPhone 13 Pro Max,
                    ),
                    child: ScaleTap(
                      enableFeedback: false,
                      onPressed: () async {
                        await recordAmplitudeEvent(
                          AddressCopied(
                            walletType: 'Card',
                            walletAddress: balanceStore.selectedCard!.address,
                            activated: false,
                            source: 'Balance',
                          ),
                        );
                        if (Platform.isIOS) {
                          await Clipboard.setData(
                            ClipboardData(
                              text:
                                  balanceStore.selectedCard!.address.toString(),
                            ),
                          ).then(
                            (_) {
                              HapticFeedback.mediumImpact();
                              showTopSnackBar(
                                displayDuration: const Duration(
                                  milliseconds: 400,
                                ),
                                Overlay.of(
                                  context,
                                ),
                                CustomSnackBar.success(
                                  backgroundColor: const Color(
                                    0xFF4A4A4A,
                                  ).withOpacity(0.9),
                                  message: 'Address was copied',
                                  textStyle: const TextStyle(
                                    fontFamily: FontFamily.redHatMedium,
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          await Clipboard.setData(
                            ClipboardData(
                              text:
                                  balanceStore.selectedCard!.address.toString(),
                            ),
                          ).then(
                            (_) {
                              HapticFeedback.mediumImpact();
                            },
                          );
                        }
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: Container(
                            padding: const EdgeInsets.only(
                              left: 8,
                              right: 8,
                              top: 12,
                              bottom: 12,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                6,
                              ),
                              color: Colors.black.withOpacity(
                                0.2,
                              ),
                            ),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Address',
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontFamily: FontFamily.redHatMedium,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                if (receivedData.startsWith('0'))
                                  Observer(
                                    builder: (context) {
                                      final selectedEthCard =
                                          balanceStore.selectedEthCard;
                                      if (balanceStore.loadings[
                                              selectedEthCard?.address] ??
                                          false) {
                                        return const Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                                width: 10,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                  strokeWidth: 3,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      if (selectedEthCard == null) {
                                        return const Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                                width: 10,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                  strokeWidth: 3,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      final visibleAddress = getSplitAddress(
                                        selectedEthCard.address,
                                      );
                                      return Text(
                                        visibleAddress,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: FontFamily.redHatMedium,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ).expandedHorizontally();
                                    },
                                  )
                                else
                                  Observer(
                                    builder: (context) {
                                      if (balanceStore.loadings[balanceStore
                                              .selectedCard?.address] ??
                                          false) {
                                        return const Padding(
                                          padding: EdgeInsets.all(
                                            4,
                                          ),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                                width: 10,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                  strokeWidth: 3,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                      final visibleAddress = getSplitAddress(
                                        balanceStore.selectedCard!.address,
                                      );
                                      return Text(
                                        visibleAddress,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontFamily: FontFamily.redHatMedium,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ).expandedHorizontally();
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Gap(4),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.height < 932
                          ? context.height < 867.4
                              ? context.height > 844
                                  ? context.width * 0.11 // iPhone 14 Pro (ok)
                                  : context.height > 667
                                      ? context.width * 0.17 //iPhone 13 Pro
                                      : context.width *
                                          0.23 // iPhone 7/8/SE (ok)
                              : context.width * 0.15 //Samsung large display
                          : context.width * 0.15, //iPhone 13 Pro Max,
                    ),
                    child: ScaleTap(
                      enableFeedback: false,
                      onPressed: () {},
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(
                              8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                6,
                              ),
                              color: Colors.black.withOpacity(
                                0.2,
                              ),
                            ),
                            child: Column(
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'Balance',
                                      style: TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        color: Colors.white,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ],
                                ),
                                if (receivedData.startsWith('0'))
                                  Observer(
                                    builder: (context) {
                                      final myFormat =
                                          NumberFormat.decimalPatternDigits(
                                        locale: 'en_us',
                                        decimalDigits: 2,
                                      );
                                      final data =
                                          marketPageStore.singleCoin?.result[1];
                                      if (balanceStore.selectedEthCard !=
                                              null &&
                                          balanceStore.selectedEthCard!
                                                  .finalBalance !=
                                              null &&
                                          data != null) {
                                        final cardBalance = balanceStore
                                            .selectedEthCard!.finalBalance!;

                                        if (cardBalance.isNaN) {
                                          return const Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                  width: 10,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.white,
                                                    strokeWidth: 3,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }

                                        return Row(
                                          children: [
                                            Text(
                                              '\$${myFormat.format(cardBalance * data.price)}',
                                              style: const TextStyle(
                                                fontFamily:
                                                    FontFamily.redHatMedium,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return const Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                                width: 10,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                  )
                                else
                                  Observer(
                                    builder: (context) {
                                      final myFormat =
                                          NumberFormat.decimalPatternDigits(
                                        locale: 'en_us',
                                        decimalDigits: 2,
                                      );
                                      final data = marketPageStore
                                          .singleCoin?.result.first;
                                      if (balanceStore.selectedCard != null &&
                                          balanceStore
                                                  .selectedCard!.finalBalance !=
                                              null &&
                                          data != null) {
                                        final cardBalance = balanceStore
                                            .selectedCard!.finalBalance!;

                                        if (cardBalance.isNaN) {
                                          return const Padding(
                                            padding: EdgeInsets.all(4),
                                            child: Row(
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                  width: 10,
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.white,
                                                    strokeWidth: 3,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }

                                        return Row(
                                          children: [
                                            Text(
                                              '\$${myFormat.format(cardBalance / 100000000 * data.price)}',
                                              style: const TextStyle(
                                                fontFamily:
                                                    FontFamily.redHatMedium,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ],
                                        );
                                      } else {
                                        return const Padding(
                                          padding: EdgeInsets.all(4),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                                width: 10,
                                                child:
                                                    CircularProgressIndicator(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ).paddingHorizontal(
              context.height < 845 ? 0 : 20,
            );
          },
        ),
      ),
    );
  }
}
