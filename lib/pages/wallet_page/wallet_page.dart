import 'dart:async';
import 'dart:convert';

import 'package:auto_route/annotations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/data_model/data_model.dart';

@RoutePage()
class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  final imgList = <String>[
    'assets/images/Orange_card.png',
    'assets/images/White_Card.png',
    'assets/images/Brown_Card.png',
    'assets/images/Add_Card.png',
  ];

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 20), (timer) {
      getCryptoPrice();
    });
  }

  Future<DataModel> getCryptoPrice() async {
    final url = Uri.parse(
      'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin&vs_currencies=usd',
    );
    final response = await http.get(url);
    final databody = json.decode(response.body);
    final dataModel = DataModel.fromJson(databody);
    return dataModel;
  }

  @override
  Widget build(BuildContext context) {
    final buttonCarouselController = CarouselController();

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
            child: Assets.images.subtract.image(),
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
            child: CarouselSlider.builder(
              carouselController: buttonCarouselController,
              itemBuilder: (context, index, constrains) {
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
                      child: Image.asset(
                        imgList[index],
                        height: 380,
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
              itemCount: imgList.length,
            ),
          ),

          //Card and Bar Switch
          Positioned(
            top: MediaQuery.of(context).size.width * 0.31,
            right: MediaQuery.of(context).size.width * 0.05,
            child: Container(
              height: 46,
              width: 127,
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
            top: MediaQuery.of(context).size.width * 0.317,
            right: MediaQuery.of(context).size.width * 0.058,
            child: ToggleSwitch(
              curve: Curves.ease,
              minWidth: 60,
              cornerRadius: 20,
              activeBgColors: const [
                [
                  AppColors.silver,
                ],
                [
                  AppColors.silver,
                ]
              ],
              activeFgColor: AppColors.primaryTextColor,
              inactiveBgColor: Colors.white,
              inactiveFgColor: Colors.grey,
              totalSwitches: 2,
              labels: const [
                'Card',
                'Bar',
              ],
              customTextStyles: const [
                TextStyle(fontFamily: FontFamily.redHatMedium),
              ],
              radiusStyle: true,
              onToggle: (index) {},
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
                    onPressed: () {
                      addWidgetToCarousel();
                    },
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
                    onPressed: () {
                      removeWidgetFromCarousel(1);
                    },
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

  Future<void> addWidgetToCarousel() async {
    setState(() {
      imgList.add('assets/images/Brown_Card.png');
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'imgList',
      imgList.map((widget) => widget.toString()).toList(),
    );
  }

  Future<void> removeWidgetFromCarousel(int index) async {
    setState(() {
      if (index >= 0 && index < imgList.length) {
        imgList.removeAt(index);
      }
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(
      'imgList',
      imgList.map((widget) => widget.toString()).toList(),
    );
  }
}

Widget buildCoinWidget(DataModel dataModel) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '\$${dataModel.price.toString()}',
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

