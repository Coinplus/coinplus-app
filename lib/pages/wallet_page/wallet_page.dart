import 'dart:math';
import 'dart:ui';

import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../constants/card_color.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/store.dart';
import '../../utils/header_custom_paint.dart';
import '../onboarding_page/form_factor_pages/form_factor_page.dart';
import '../onboarding_page/form_factor_pages/scan_methods_page.dart';
import '../splash_screen/splash_screen.dart';

@RoutePage()
class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();
  late final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    setWalletShown();
    _balanceStore.getAllCardsInfo();
  }

  @override
  void dispose() {
    reRegisterStoreGetIt();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.95),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Flexible(
                child: Stack(
                  children: [
                    //Curved AppBar
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: CustomPaint(
                        size: Size(
                          context.width,
                          (context.width * 0.44266666666666665).toDouble(),
                        ),
                        painter: HeaderCustomPainter(),
                      ),
                    ),
                    //Total Balance
                    Positioned(
                      top: 56,
                      left: 22,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Wallet',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatBold,
                                  fontSize: 28,
                                  color: Colors.white,
                                ),
                              ),
                              const Gap(14),
                              Assets.icons.coinplusVector.image(
                                height: 26,
                              ),
                            ],
                          ),
                          const Text(
                            'Total balance',
                            style: TextStyle(
                              fontFamily: FontFamily.redHatLight,
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Gap(5),
                          const Text(
                            r'$0',
                            style: TextStyle(
                              fontFamily: FontFamily.redHatBold,
                              color: Colors.white,
                              fontSize: 28,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //Card and Bar Switch
                    Positioned(
                      top: 124,
                      right: 12,
                      child: Container(
                        height: 40,
                        width: 128,
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 1,
                              color: Colors.grey.withOpacity(0.3),
                            ),
                          ],
                        ),
                        child: const DefaultTabController(
                          length: 2,
                          child: SegmentedTabControl(
                            textStyle: TextStyle(
                              fontFamily: FontFamily.redHatSemiBold,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                            splashColor: Colors.transparent,
                            indicatorColor: AppColors.silver,
                            tabs: [
                              SegmentTab(
                                backgroundColor: Colors.white,
                                label: 'Card',
                                textColor: Colors.grey,
                                splashColor: Colors.transparent,
                                selectedTextColor: AppColors.primaryTextColor,
                              ),
                              SegmentTab(
                                backgroundColor: Colors.white,
                                label: 'Bar',
                                textColor: Colors.grey,
                                splashColor: Colors.transparent,
                                selectedTextColor: AppColors.primaryTextColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //Cards Slider
              Expanded(
                flex: 2,
                child: Observer(
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
                                  return Container(
                                    height: 400,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        const Gap(10),
                                        Row(
                                          children: [
                                            const Gap(16),
                                            IconButton(
                                              onPressed: router.pop,
                                              icon: const Icon(
                                                Icons.close_sharp,
                                                size: 25,
                                                color: Colors.black,
                                              ),
                                            ),
                                            const Expanded(
                                              child: Text(
                                                'Add new wallet',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontFamily:
                                                      FontFamily.redHatSemiBold,
                                                  fontSize: 17,
                                                  color: AppColors
                                                      .primaryTextColor,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 60,
                                            ),
                                          ],
                                        ),
                                        const Gap(10),
                                        const Divider(
                                          thickness: 2,
                                          height: 2,
                                          indent: 15,
                                          endIndent: 15,
                                          color: Color(0xFFF1F1F1),
                                        ),
                                        SizedBox(
                                          height: 300,
                                          child: PageView(
                                            controller: _controller,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            children: [
                                              ScanMethodsPage(
                                                controller: _controller,
                                              ),
                                              FormFactorPage(
                                                controller: _controller,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                            child: Assets.images.addCard.image(),
                          );
                        }

                        final card = _balanceStore.cards[index];

                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Stack(
                            children: [
                              card.cardColor.image.image(),
                              Positioned(
                                top: constraints.maxHeight * 0.284,
                                left: 10,
                                right: 10,
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      child: BackdropFilter(
                                        filter: ImageFilter.blur(
                                          sigmaX: 5,
                                          sigmaY: 5,
                                        ),
                                        child: Container(
                                          padding: const EdgeInsets.only(
                                            left: 4,
                                            right: 4,
                                            top: 12,
                                            bottom: 12,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color:
                                                Colors.black.withOpacity(0.3),
                                          ),
                                          child: Column(
                                            children: [
                                              const Row(
                                                children: [
                                                  Text(
                                                    'Address',
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Observer(
                                                builder: (context) {
                                                  if (_balanceStore.loadings[
                                                          card.address] ??
                                                      false) {
                                                    return const Padding(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 5,
                                                            width: 5,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }
                                                  return Text(
                                                    card.address,
                                                    style: const TextStyle(
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.white,
                                                      fontSize: 11,
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
                                            left: 4,
                                            right: 8,
                                            top: 8,
                                            bottom: 8,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            color:
                                                Colors.black.withOpacity(0.3),
                                          ),
                                          child: Column(
                                            children: [
                                              const Row(
                                                children: [
                                                  Text(
                                                    'Balance',
                                                    style: TextStyle(
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      color: Colors.white,
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Observer(
                                                builder: (context) {
                                                  if (_balanceStore.loadings[
                                                          card.address] ??
                                                      false) {
                                                    return const Padding(
                                                      padding:
                                                          EdgeInsets.all(4),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            height: 5,
                                                            width: 5,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }
                                                  return Text(
                                                    '\$${card.balance}.00'
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      fontWeight:
                                                          FontWeight.w700,
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
                          ),
                        );
                      },
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        viewportFraction: 0.7,
                        height: 400,
                        enlargeCenterPage: true,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                      ),
                      itemCount: _balanceStore.cards.length + 1,
                    );
                  },
                ),
              ),
              const Gap(26),
              //Send and Receive
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: const Color(0xFFB2D7FF),
                ),
                height: 40,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ScaleTap(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Assets.icons.charmArrowDownRight.image(
                            height: 20,
                            color: AppColors.secondaryTextColor,
                          ),
                          const Gap(4),
                          const Text(
                            'Receive',
                            style: TextStyle(
                              fontFamily: FontFamily.redHatMedium,
                              fontWeight: FontWeight.w700,
                              color: AppColors.secondaryTextColor,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ScaleTap(
                      onPressed: () {},
                      child: Row(
                        children: [
                          const Text(
                            'Send',
                            style: TextStyle(
                              fontFamily: FontFamily.redHatMedium,
                              fontWeight: FontWeight.w700,
                              color: AppColors.secondaryTextColor,
                              fontSize: 15,
                            ),
                          ),
                          const Gap(4),
                          Assets.icons.charmArrowTopRight.image(
                            height: 20,
                            color: AppColors.secondaryTextColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ).paddingHorizontal(78),
              const Gap(10),
              //BTC Price
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 8, bottom: 12),
                    child: Text(
                      'Market',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        color: AppColors.textHintsColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    height: 73,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Observer(
                        builder: (_) {
                          final coin = _balanceStore.coins.firstWhereOrNull(
                            (element) => element.id == 'bitcoin',
                          );
                          if (coin == null) {
                            return const SizedBox();
                          }

                          return Row(
                            children: [
                              Assets.icons.bTCIcon.image(height: 24),
                              const Gap(8),
                              Text(
                                coin.name,
                                style: const TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                              const Gap(8),
                              Text(
                                coin.symbol.toUpperCase(),
                                style: const TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 10,
                                  color: AppColors.textHintsColor,
                                ),
                              ),
                              const Spacer(),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  buildCoinWidget(coin.currentPrice),
                                  const Gap(4),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: coin.priceChangePercentage_24h > 0
                                          ? const Color(0xFF00BA1E)
                                          : Colors.red,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3),
                                      child: Row(
                                        children: [
                                          if (coin.priceChangePercentage_24h >
                                              0)
                                            const Icon(
                                              Icons.arrow_drop_up,
                                              size: 15,
                                              color: Colors.white,
                                            )
                                          else
                                            const Icon(
                                              Icons.arrow_drop_down,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                          Text(
                                            '${coin.priceChangePercentage_24h.toStringAsFixed(2)} %',
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ).paddingHorizontal(16),
              Gap(max(context.bottomPadding, 51)),
            ],
          );
        },
      ),
    );
  }
}

Widget buildCoinWidget(num price) {
  final myFormat = NumberFormat.decimalPattern('en_us');
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '\$${myFormat.format(price).toString()}',
          style: const TextStyle(
            fontSize: 16,
            fontFamily: FontFamily.redHatMedium,
            color: AppColors.primaryTextColor,
          ),
        ),
      ],
    ),
  );
}
