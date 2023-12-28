import 'dart:async';
import 'dart:math';

import 'package:animated_segmented_tab_control/animated_segmented_tab_control.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../constants/card_record.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../models/amplitude_event/amplitude_event.dart';
import '../../services/amplitude_service.dart';
import '../../services/ramp_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/settings_button_state/settings_button_state.dart';
import '../../store/store.dart';
import '../../utils/header_custom_paint.dart';
import '../splash_screen/splash_screen.dart';
import 'bar_list/bar_list.dart';
import 'card_list/card_list.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({
    super.key,
    required this.onChangeCard,
  });

  final CardChangeCallBack onChangeCard;

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> with TickerProviderStateMixin {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  SettingsState get _settingsState => GetIt.instance<SettingsState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int cardCarouselIndex = 0;
  int barCarouselIndex = 0;
  bool _isAmplitudeEventInProgress = false;
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
    configureRamp(
      address: _balanceStore.cards.isNotEmpty
          ? _balanceStore.cards[_settingsState.cardCurrentIndex].address
          : _balanceStore.bars.isNotEmpty
              ? _balanceStore.bars[_settingsState.barCurrentIndex].address
              : '',
    );
    _tabController.addListener(() {
      final card = _tabController.index == 0
          ? _balanceStore.cards.elementAtOrNull(cardCarouselIndex)
          : _balanceStore.bars.elementAtOrNull(barCarouselIndex);
      if (_tabController.index == 1 &&
          _balanceStore.bars.isNotEmpty &&
          _settingsState.barCurrentIndex != _balanceStore.bars.length) {
        configuration.userAddress = _balanceStore.bars[_settingsState.barCurrentIndex].address;
      }
      if (_tabController.index == 0 &&
          _balanceStore.cards.isNotEmpty &&
          _settingsState.cardCurrentIndex != _balanceStore.cards.length) {
        configuration.userAddress = _balanceStore.cards[_settingsState.cardCurrentIndex].address;
      }
      widget.onChangeCard(
        (
          card: card as AbstractCard?,
          index: _tabController.index,
        ),
      );
      amplitudeEvent();
    });
  }

  void amplitudeEvent() {
    if (!_isAmplitudeEventInProgress) {
      _isAmplitudeEventInProgress = true;
      if (_tabController.index == 0) {
        unawaited(recordAmplitudeEvent(const CardTabClicked()));
      } else if (_tabController.index == 1) {
        unawaited(recordAmplitudeEvent(const BarTabClicked()));
      }
      Future.delayed(const Duration(seconds: 1), () {
        _isAmplitudeEventInProgress = false;
      });
    }
  }

  @override
  void dispose() {
    reRegisterStoreGetIt();
    _tabController.removeListener(amplitudeEvent);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 130,
        flexibleSpace: Stack(
          children: [
            CustomPaint(
              size: Size(
                context.height,
                (context.height > 667 ? context.height * 0.205 : context.height * 0.2).toDouble(),
              ),
              painter: HeaderCustomPainter(),
            ),
            Positioned(
              bottom: context.height > 667 ? 6 : 0,
              right: context.height > 844 ? context.width * 0.055 : context.width * 0.04,
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
                    indicatorColor: Colors.grey.withOpacity(0.1),
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
            Positioned(
              top: 55,
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
                  Observer(
                    builder: (context) {
                      final data = _balanceStore.coins;
                      final myFormat = NumberFormat.decimalPatternDigits(
                        locale: 'en_us',
                        decimalDigits: 2,
                      );
                      final balance = _balanceStore.allCardsBalances;
                      if (data == null) {
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                          child: SizedBox(
                            height: 15,
                            width: 15,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        );
                      }
                      return Text(
                        '\$${myFormat.format(balance / 100000000 * data.price)}',
                        style: const TextStyle(
                          fontFamily: FontFamily.redHatBold,
                          color: Colors.white,
                          fontSize: 28,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.transparent,
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white.withOpacity(0.95),
      body: RefreshIndicator(

        displacement: 50,
        triggerMode: RefreshIndicatorTriggerMode.anywhere,
        color: Colors.black,
        onRefresh: () async {
          await HapticFeedback.mediumImpact();
          await _balanceStore.getCoins();
          unawaited(_balanceStore.getCardsInfo());
          unawaited(_balanceStore.getBarsInfo());
        },
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                children: [
                  if (context.height > 667) const Gap(15) else const SizedBox(),
                  //Cards Slider
                  Expanded(
                    flex: context.height > 667 ? 7 : 10,
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: _tabController,
                      children: [
                        CardList(
                          onCardSelected: (card) => widget.onChangeCard(
                            (card: card, index: 0),
                          ),
                          onCarouselScroll: (val) => cardCarouselIndex = val,
                        ),
                        BarList(
                          onCardSelected: (card) => widget.onChangeCard(
                            (card: card, index: 1),
                          ),
                          onCarouselScroll: (val) => barCarouselIndex = val,
                        ),
                      ],
                    ),
                  ),
                  // Current price(btc)
                  if (context.height > 667)
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
                            child: Observer(
                              builder: (_) {
                                final data = _balanceStore.coins;
                                if (data == null) {
                                  return Row(
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
                                      Column(
                                        children: [
                                          const Gap(3),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(2),
                                              color: Colors.grey.withOpacity(0.1),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 4,
                                              vertical: 2,
                                            ),
                                            child: const Text(
                                              'BTC',
                                              style: TextStyle(
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
                                          const Row(
                                            children: [
                                              Text(
                                                r'$',
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: FontFamily.redHatMedium,
                                                  color: AppColors.primaryTextColor,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 17,
                                                width: 17,
                                                child: Padding(
                                                  padding: EdgeInsets.all(4),
                                                  child: CircularProgressIndicator(
                                                    color: AppColors.primaryTextColor,
                                                    strokeWidth: 2,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
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
                                                const SizedBox(
                                                  height: 17,
                                                  width: 17,
                                                  child: Padding(
                                                    padding: EdgeInsets.all(4),
                                                    child: CircularProgressIndicator(
                                                      color: AppColors.primaryTextColor,
                                                      strokeWidth: 2,
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  ' %',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.black,
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
                                } else {
                                  final myFormat = NumberFormat.decimalPattern('en_us');
                                  final formattedPrice = myFormat.format(data.price).toString();
                                  return Row(
                                    children: [
                                      Assets.icons.bTCIcon.image(height: 24),
                                      const Gap(8),
                                      Text(
                                        data.name,
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
                                              color: Colors.grey.withOpacity(0.1),
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 4,
                                              vertical: 2,
                                            ),
                                            child: Text(
                                              data.symbol.toUpperCase(),
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
                                          Text(
                                            '\$ ${formattedPrice.substring(0, min(formattedPrice.length, 9))}',
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontFamily: FontFamily.redHatMedium,
                                              color: AppColors.primaryTextColor,
                                            ),
                                          ),
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
                                                if (data.priceChange1d > 0)
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
                                                  '${data.priceChange1d.toStringAsFixed(2)} %',
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: data.priceChange1d > 0 ? Colors.green : Colors.red,
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
                                }
                              },
                            ),
                          ),
                        ],
                      ).paddingHorizontal(16),
                    )
                  else
                    const SizedBox(),
                  const Spacer(),
                  const Gap(30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
