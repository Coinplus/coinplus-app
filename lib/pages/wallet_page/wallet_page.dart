import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:auto_route/annotations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
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
import '../../models/data_model/data_model.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/store.dart';
import '../../utils/header_custom_paint.dart';
import 'btc_price/btc_price.dart';

@RoutePage()
class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  @override
  void initState() {
    super.initState();
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
      body: Stack(
        fit: StackFit.expand,
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
              //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
              painter: HeaderCustomPainter(),
            ),
          ),

          //Total Balance
          Positioned(
            top: 65,
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
          //Cards Slider
          Positioned(
            top: 210,
            left: 0,
            right: 0,
            child: Observer(
              builder: (_) {
                return CarouselSlider.builder(
                  itemBuilder: (context, index, constrains) {
                    if (index == _balanceStore.cards.length) {
                      return Assets.images.addCard.image();
                    }

                    final card = _balanceStore.cards[index];

                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 5,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: ScaleTap(
                        onPressed: () {},
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(14),
                          child: Stack(
                            children: [
                              card.cardColor.image.image(
                                height: 380,
                              ),
                              Positioned(
                                top: 225,
                                left: 10,
                                right: 10,
                                child: Container(
                                  height: 40,
                                  padding: const EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: Colors.black.withOpacity(0.3),
                                  ),
                                  child: Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Text(
                                            'Address',
                                            style: TextStyle(
                                              fontSize: 11,
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
                                              child: CupertinoActivityIndicator(
                                                radius: 5,
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
                              Positioned(
                                top: 270,
                                left: 10,
                                right: 10,
                                child: Container(
                                  height: 50,
                                  padding: const EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
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
                                              child: CupertinoActivityIndicator(
                                                radius: 5,
                                              ),
                                            );
                                          }
                                          return Text(
                                            (card.balance ?? 0).toString(),
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
                            ],
                          ),
                        ),
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

          //Card and Bar Switch
          Positioned(
            top: MediaQuery.of(context).size.width * 0.309,
            right: MediaQuery.of(context).size.width * 0.0335,
            child: Container(
              height: 45,
              width: 130,
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
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.width * 0.3153,
            right: MediaQuery.of(context).size.width * 0.04,
            child: const SizedBox(
              height: 40,
              width: 125,
              child: DefaultTabController(
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
                      label: 'Card',
                      textColor: Colors.grey,
                      splashColor: Colors.transparent,
                      selectedTextColor: AppColors.primaryTextColor,
                    ),
                    SegmentTab(
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

          //Send and Receive
          Positioned(
            bottom: 180,
            left: 77,
            right: 78,
            child: Container(
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
                        Assets.icons.arrowBottomRight.image(
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
                        Assets.icons.arrowTopRight.image(
                          height: 20,
                          color: AppColors.secondaryTextColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          //BTC Price
          Positioned(
            bottom: 63,
            left: 16,
            right: 16,
            child: Column(
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
                    child: Row(
                      children: [
                        Assets.icons.bTCIcon.image(height: 24),
                        const Gap(8),
                        const Text(
                          'Bitcoin',
                          style: TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        const Gap(8),
                        const Text(
                          'BTC',
                          style: TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 10,
                            color: AppColors.textHintsColor,
                          ),
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FutureBuilder<DataModel>(
                              future: getCryptoPrice(),
                              builder: (context, snapData) {
                                switch (snapData.connectionState) {
                                  case ConnectionState.waiting:
                                    return const SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  default:
                                    if (snapData.hasError) {
                                      return const Text('Loading...');
                                    } else {
                                      return buildCoinWidget(snapData.data!);
                                    }
                                }
                              },
                            ),
                            const Gap(4),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: const Color(0xFF00BA1E),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(3),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.arrow_drop_up,
                                      size: 15,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      '1.46%',
                                      style: TextStyle(
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
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildCoinWidget(DataModel dataModel) {
  final myFormat = NumberFormat.decimalPattern('en_us');
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '\$${myFormat.format(dataModel.price)}',
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
