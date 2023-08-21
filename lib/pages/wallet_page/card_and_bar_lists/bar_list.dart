import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/bar_color.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../store/settings_button_state/settings_button_state.dart';
import 'bar_add_modal.dart';

class BarList extends StatefulWidget {
  const BarList({super.key});

  @override
  State<BarList> createState() => _BarListState();
}

class _BarListState extends State<BarList> {
  final _settingsState = SettingsState();

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();
  late final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return CarouselSlider.builder(
          itemBuilder: (context, index, constrains) {
            if (index == _balanceStore.bars.length) {
              return ScaleTap(
                enableFeedback: false,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return BarBottomSheet(controller: _controller);
                    },
                  );
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 30, bottom: 30),
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

            final card = _balanceStore.bars[index];

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: LayoutBuilder(
                builder: (context, constraints) {
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
                              child: _settingsState.barCurrentIndex == index
                                  ? ScaleTap(
                                      onPressed: () {},
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
                        child: card.barColor.image.image(),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.height * 0.32,
                        left: 33,
                        right: 33,
                        child: Column(
                          children: [
                            ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 5,
                                  sigmaY: 5,
                                ),
                                child: Container(
                                  alignment: Alignment.center,
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
                                    color: Colors.black.withOpacity(0.3),
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
                                              padding: EdgeInsets.all(4),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    height: 5,
                                                    width: 5,
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
                                              fontFamily:
                                                  FontFamily.redHatMedium,
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
                            const Gap(4),
                            ClipRRect(
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 5,
                                  sigmaY: 5,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.only(
                                    left: 8,
                                    right: 8,
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      6,
                                    ),
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  child: Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Text(
                                            'Balance',
                                            style: TextStyle(
                                              fontFamily:
                                                  FontFamily.redHatMedium,
                                              color: Colors.white,
                                              fontSize: 11,
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
                                                    height: 5,
                                                    width: 5,
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
                                              fontFamily:
                                                  FontFamily.redHatMedium,
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
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              _settingsState.setBarCurrentIndex(index);
            },
            enlargeFactor: 0.35,
            disableCenter: true,
            enableInfiniteScroll: false,
            viewportFraction: 0.77,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          ),
          itemCount: _balanceStore.bars.length + 1,
        );
      },
    );
  }
}
