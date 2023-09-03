import 'dart:math';

import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/store.dart';
import '../../utils/header_custom_paint.dart';
import '../splash_screen/splash_screen.dart';
import 'btc_price/btc_price.dart';
import 'card_and_bar_lists/bar_list.dart';
import 'card_and_bar_lists/card_list.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> with TickerProviderStateMixin {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();
  late final _tabController = TabController(
    length: 2,
    vsync: this,
    initialIndex: _balanceStore.cards.isEmpty
        ? _balanceStore.bars.isEmpty
            ? 0
            : 1
        : _balanceStore.cards.isEmpty
            ? 1
            : 0,
  );

  @override
  void initState() {
    super.initState();
    setWalletShown();
    _balanceStore
      ..getCardsInfo()
      ..getBarsInfo();
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
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Stack(
              children: [
                //Curved AppBar
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: CustomPaint(
                    size: Size(
                      context.height,
                      (context.height * 0.205).toDouble(),
                    ),
                    painter: HeaderCustomPainter(),
                  ),
                ),
                //Total Balance
                Positioned(
                  top: max(context.topPadding + 12, 15),
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
                  top: MediaQuery.of(context).size.height * 0.15,
                  right: max(context.topPadding - 35, 15),
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
                          color: Colors.grey.withOpacity(0.4),
                        ),
                      ],
                    ),
                    child: DefaultTabController(
                      length: 2,
                      child: SegmentedTabControl(
                        textStyle: const TextStyle(
                          fontFamily: FontFamily.redHatSemiBold,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                        splashColor: Colors.transparent,
                        controller: _tabController,
                        indicatorColor: AppColors.silver,
                        tabs: const [
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
            flex: 5,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: const [
                CardList(),
                BarList(),
              ],
            ),
          ),
          if (context.height > 667)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 12, right: 12, bottom: 12),
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
                          Column(
                            children: [
                              const Gap(3),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: AppColors.silver,
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                  vertical: 2,
                                ),
                                child: Text(
                                  coin.symbol.toUpperCase(),
                                  style: const TextStyle(
                                    fontFamily: FontFamily.redHatMedium,
                                    fontSize: 10,
                                    color: AppColors.textHintsColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              buildCoinWidget(coin.currentPrice),
                              const Gap(4),
                              Padding(
                                padding: const EdgeInsets.all(3),
                                child: Row(
                                  children: [
                                    Assets.icons.schedule.image(
                                      height: 18,
                                      color: AppColors.textHintsColor,
                                    ),
                                    const Gap(4),
                                    const Text(
                                      '24h',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: AppColors.textHintsColor,
                                        fontFamily: FontFamily.redHatBold,
                                      ),
                                    ),
                                    if (coin.priceChangePercentage_24h > 0)
                                      const Icon(
                                        Icons.arrow_drop_up,
                                        size: 25,
                                        color: Colors.green,
                                      )
                                    else
                                      const Icon(
                                        Icons.arrow_drop_down,
                                        size: 25,
                                        color: Colors.red,
                                      ),
                                    Text(
                                      '${coin.priceChangePercentage_24h.toStringAsFixed(2)} %',
                                      style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            coin.priceChangePercentage_24h > 0
                                                ? Colors.green
                                                : Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ).paddingHorizontal(16)
          else
            const SizedBox(),
          if (context.height > 667) const Gap(0) else const Gap(0),
          const Spacer(),
        ],
      ),
    );
  }
}
