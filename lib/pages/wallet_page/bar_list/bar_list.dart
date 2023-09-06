import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../constants/bar_color.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../store/settings_button_state/settings_button_state.dart';
import '../../onboarding_page/form_factor_pages/bar_scan_methods_page.dart';

class BarList extends StatefulWidget {
  const BarList({super.key});

  @override
  State<BarList> createState() => _BarListState();
}

class _BarListState extends State<BarList> {
  final _settingsState = SettingsState();

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

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
                          const BarScanMethodsPage().paddingHorizontal(20),
                          const Gap(40),
                        ],
                      );
                    },
                  );
                },
                child: Assets.images.addCard.image(),
              );
            }

            final bar = _balanceStore.bars[index];

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
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: bar.barColor.image.image().image,
                            ),
                          ),
                          child: Center(
                            child: LayoutBuilder(
                              builder: (context, constraint) {
                                return SizedBox(
                                  width: constraint.maxWidth * 0.85,
                                  child: Column(
                                    children: [
                                      const Gap(40),
                                      Flexible(
                                        flex: 4,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              top: 0,
                                              left: 0,
                                              right: 0,
                                              child:
                                                  Assets.images.topCircle.image(
                                                height: 165,
                                              ),
                                            ),
                                            Positioned(
                                              top: 1,
                                              left: 0,
                                              right: 0,
                                              child: Assets.images.hologram
                                                  .image(height: 163),
                                            ),
                                            Positioned(
                                              top: 60,
                                              left: 0,
                                              right: 0,
                                              child: Assets.images.barSecret1
                                                  .image(
                                                height: 40,
                                              ),
                                            ),
                                            const Positioned(
                                              top: 70,
                                              left: 0,
                                              right: 0,
                                              child: Text(
                                                'Secret 1',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  fontFamily:
                                                      FontFamily.redHatMedium,
                                                  color: Colors.black26,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Assets.icons.balance.image(
                                                  height: 12,
                                                ),
                                                Observer(
                                                  builder: (context) {
                                                    final coin = _balanceStore
                                                        .coins
                                                        .firstWhereOrNull(
                                                      (element) =>
                                                          element.id ==
                                                          'bitcoin',
                                                    );
                                                    if (_balanceStore.loadings[
                                                            bar.address] ??
                                                        false) {
                                                      return const Padding(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        child:
                                                            CupertinoActivityIndicator(
                                                          radius: 5,
                                                        ),
                                                      );
                                                    }
                                                    return Text(
                                                      (bar.balance != null
                                                              ? '\$${(bar.balance! / 100000000 * coin!.currentPrice).toStringAsFixed(2)}'
                                                              : '')
                                                          .toString(),
                                                      style: TextStyle(
                                                        fontFamily: FontFamily
                                                            .redHatMedium,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        fontSize: 25,
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Gap(11),
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: Assets.icons.barAddressField
                                                .image()
                                                .image,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 10,
                                            horizontal: 16,
                                          ),
                                          child: Observer(
                                            builder: (context) {
                                              if (_balanceStore.loadings[
                                                      bar
                                                          .address] ??
                                                  false) {
                                                return const Padding(
                                                  padding: EdgeInsets.all(4),
                                                  child:
                                                      CupertinoActivityIndicator(
                                                    radius: 5,
                                                  ),
                                                );
                                              }
                                              return Text(
                                                bar.address,
                                                style: const TextStyle(
                                                  fontFamily:
                                                      FontFamily.redHatLight,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                      const Gap(20),
                                      Assets.images.barLogo.image(
                                        height: 38,
                                      ),
                                      const Gap(12),
                                      Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: Assets.images.barSecret2
                                                .image()
                                                .image,
                                          ),
                                        ),
                                        child: const Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 60,
                                            vertical: 16,
                                          ),
                                          child: Text(
                                            'Secret 2',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontFamily:
                                                  FontFamily.redHatMedium,
                                              color: Colors.black26,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                      const Gap(35),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
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
