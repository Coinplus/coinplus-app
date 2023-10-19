import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/card_color.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../store/settings_button_state/settings_button_state.dart';
import '../../../widgets/custom_snack_bar/snack_bar.dart';
import '../../../widgets/custom_snack_bar/top_snack.dart';
import '../../onboarding_page/form_factor_pages/card_scan_methods_page.dart';

typedef CardSelectedCallback = void Function(int index);

class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();
  SettingsState get _settingsState => GetIt.instance<SettingsState>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return CarouselSlider.builder(
          itemBuilder: (context, index, constrains) {
            if (index == _balanceStore.cards.length) {
              return ScaleTap(
                enableFeedback: false,
                onPressed: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    context: context,
                    builder: (context) {
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
                                padding: EdgeInsets.only(left: 20, top: 10),
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
                          const CardScanMethodsPage().paddingHorizontal(20),
                          const Gap(40),
                        ],
                      );
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 25, top: 20),
                  child: Assets.images.addCard.image(),
                ),
              );
            }
            final card = _balanceStore.cards[index];
            final visibleAddress = _getVisibleAddress(card.address);

            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flex(
                  direction: Axis.horizontal,
                  children: [
                    Expanded(
                      child: Observer(
                        builder: (context) {
                          return AnimatedSwitcher(
                            duration: const Duration(milliseconds: 400),
                            child: _settingsState.cardCurrentIndex == index
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 25),
                                        child: Text(
                                          card.cardName,
                                          style: const TextStyle(
                                            fontFamily: FontFamily.redHatMedium,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      ScaleTap(
                                        enableFeedback: false,
                                        onPressed: () async {
                                          await router.push(
                                            CardSettingsRoute(card: card),
                                          );
                                        },
                                        child: Assets.icons.settings.image(
                                          height: 30,
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(
                                    height: 30,
                                  ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 20,
                              spreadRadius: 0.5,
                            ),
                          ],
                          image: DecorationImage(
                            image: card.cardColor.image.image().image,
                          ),
                        ),
                        child: SizedBox(
                          height: context.height * 0.52,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: context.height * 0.2,
                                ),
                                ScaleTap(
                                  enableFeedback: false,
                                  onPressed: () {
                                    Clipboard.setData(
                                      ClipboardData(
                                        text: card.address.toString(),
                                      ),
                                    ).then(
                                      (_) {
                                        HapticFeedback.mediumImpact();
                                        showTopSnackBar(
                                          displayDuration: const Duration(
                                            milliseconds: 400,
                                          ),
                                          Overlay.of(context),
                                          CustomSnackBar.success(
                                            backgroundColor:
                                                const Color(0xFF4A4A4A)
                                                    .withOpacity(0.9),
                                            message: 'Address was copied',
                                            textStyle: const TextStyle(
                                              fontFamily:
                                                  FontFamily.redHatMedium,
                                              fontSize: 14,
                                              color: Colors.white,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: context.width * 0.07,
                                    ),
                                    child: Container(
                                      height: 57,
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.only(
                                        left: 8,
                                        right: 8,
                                        top: 12,
                                        bottom: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        color: Colors.black.withOpacity(
                                          0.3,
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          const Row(
                                            children: [
                                              Text(
                                                'Address',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily:
                                                      FontFamily.redHatMedium,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Observer(
                                            builder: (context) {
                                              if (_balanceStore
                                                      .loadings[card.address] ??
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
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }
                                              return Text(
                                                visibleAddress,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                style: const TextStyle(
                                                  fontFamily:
                                                      FontFamily.redHatMedium,
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
                                const Gap(4),
                                ScaleTap(
                                  onPressed: () {},
                                  enableFeedback: false,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: context.width * 0.07,
                                    ),
                                    child: ClipRRect(
                                      child: Container(
                                        height: 57,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(6),
                                          color: Colors.black.withOpacity(
                                            0.3,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Text(
                                                    'Balance',
                                                    style: TextStyle(
                                                      fontFamily:
                                                          FontFamily.redHatMedium,
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                  Observer(
                                                    builder: (context) {
                                                      final data = _balanceStore
                                                          .coin?.coins.first;
                                                      if (data == null) {
                                                        return const SizedBox();
                                                      }
                                                      if (_balanceStore
                                                              .loadings[card.address] ??
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
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      }
                                                      return Text(
                                                        '\$${((card.data!.balance - card.data!.spentTxoSum)/ 100000000 * data.price).toStringAsFixed(2)}',
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              FontFamily.redHatMedium,
                                                          fontWeight: FontWeight.w700,
                                                          color: Colors.white,
                                                          fontSize: 20,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Assets.icons.alternative.image(height: 50),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              _settingsState.setCardCurrentIndex(index);
            },
            enlargeFactor: 0.35,
            enableInfiniteScroll: false,
            viewportFraction: 0.79,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          ),
          itemCount: _balanceStore.cards.length + 1,
        );
      },
    );
  }

  String _getVisibleAddress(String fullAddress) {
    final start = fullAddress.substring(0, 5);
    final end = fullAddress.substring(fullAddress.length - 5);
    return '$start ... $end';
  }
}
