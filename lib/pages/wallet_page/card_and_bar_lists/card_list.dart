import 'dart:ui';

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
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../store/settings_button_state/settings_button_state.dart';
import '../../../widgets/custom_snack_bar/snack_bar.dart';
import '../../../widgets/custom_snack_bar/top_snack.dart';
import 'card_add_modal.dart';

class CardList extends StatefulWidget {
  const CardList({super.key});

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  final _settingsState = SettingsState();

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();
  late final PageController _controller = PageController();

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
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return CardBottomSheetWidget(controller: _controller);
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 30,
                    bottom: 30,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 2,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Assets.images.addCard.image(),
                  ),
                ),
              );
            }

            final card = _balanceStore.cards[index];

            return Stack(
              fit: StackFit.expand,
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Observer(
                    builder: (context) {
                      return AnimatedSwitcher(
                        duration: const Duration(milliseconds: 400),
                        child: _settingsState.cardCurrentIndex == index
                            ? ScaleTap(
                                onPressed: () {
                                  router.push(
                                    const CardSettingsRoute(),
                                  );
                                },
                                child: Assets.icons.settings.image(
                                  height: 30,
                                ),
                              )
                            : const SizedBox(),
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 30,
                    bottom: 30,
                  ),
                  child: card.cardColor.image.image(),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.29,
                  left: 5,
                  right: 5,
                  child: Column(
                    children: [
                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: ScaleTap(
                            onPressed: () {
                              Clipboard.setData(
                                ClipboardData(
                                  text: card.address.toString(),
                                ),
                              ).then(
                                (_) {
                                  HapticFeedback.mediumImpact();
                                  showTopSnackBar(
                                    padding: const EdgeInsets.only(
                                      left: 40,
                                      right: 40,
                                    ),
                                    displayDuration:
                                        const Duration(milliseconds: 400),
                                    Overlay.of(context),
                                    const CustomSnackBar.success(
                                      backgroundColor: Color(0xFF4A4A4A),
                                      message: 'Address was copied',
                                      textStyle: TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(
                                left: 8,
                                right: 8,
                                top: 12,
                                bottom: 12,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.black.withOpacity(0.2),
                              ),
                              child: Column(
                                children: [
                                  const Row(
                                    children: [
                                      Text(
                                        'Address',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: FontFamily.redHatMedium,
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
                                          padding: EdgeInsets.all(4),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 7,
                                                width: 7,
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
                                        card.address,
                                        style: const TextStyle(
                                          fontFamily: FontFamily.redHatMedium,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 10,
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
                      const Gap(4),
                      ScaleTap(
                        onPressed: () {},
                        child: ClipRRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 5,
                              sigmaY: 5,
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.black.withOpacity(0.2),
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
                                          fontSize: 12,
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
                                          padding: EdgeInsets.all(4),
                                          child: Row(
                                            children: [
                                              SizedBox(
                                                height: 7,
                                                width: 7,
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
                                        '\$${card.balance}.00'.toString(),
                                        style: const TextStyle(
                                          fontFamily: FontFamily.redHatMedium,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                          fontSize: 20,
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
                    ],
                  ).paddingHorizontal(35),
                ),
              ],
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              _settingsState.setCardCurrentIndex(index);
            },
            enlargeFactor: 0.35,
            disableCenter: true,
            enableInfiniteScroll: false,
            viewportFraction: 0.77,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          ),
          itemCount: _balanceStore.cards.length + 1,
        );
      },
    );
  }
}
