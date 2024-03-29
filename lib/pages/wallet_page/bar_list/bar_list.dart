import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gaimon/gaimon.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../constants/card_color.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/abstract_card/abstract_card.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../services/amplitude_service.dart';
import '../../../services/ramp_service.dart';
import '../../../store/accelerometer_store/accelerometer_store.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../store/history_page_store/history_page_store.dart';
import '../../../store/ip_store/ip_store.dart';
import '../../../store/market_page_store/market_page_store.dart';
import '../../../store/nfc_state/nfc_state.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../../utils/data_utils.dart';
import '../../../utils/wallet_activation_status.dart';
import '../../../widgets/custom_snack_bar/snack_bar.dart';
import '../../../widgets/custom_snack_bar/top_snack.dart';
import '../../../widgets/wallet_connect_methods/bar_connect_methods.dart';

class BarList extends StatefulWidget {
  const BarList({
    super.key,
    required this.onCardSelected,
    required this.onCarouselScroll,
    required this.tabController,
  });

  final ValueChanged<AbstractCard?> onCardSelected;
  final ValueChanged<int> onCarouselScroll;
  final TabController tabController;

  @override
  State<BarList> createState() => _BarListState();
}

class _BarListState extends State<BarList> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<BarList> {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  IpStore get _ipStore => GetIt.I<IpStore>();

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  RampService get _rampService => GetIt.I<RampService>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  AccelerometerStore get _accelerometerStore => GetIt.I<AccelerometerStore>();

  final _nfcStore = NfcStore();

  final carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _nfcStore.checkNfcSupport();
    if (_balanceStore.bars.isNotEmpty) {
      _rampService.configuration.userAddress = _balanceStore.bars[_balanceStore.barCurrentIndex].address;
    }
    _balanceStore.setOnBarAddedCallback((address) {
      final index = _balanceStore.bars.indexWhere((element) => element.address == address);
      if (index.isNegative) {
        return;
      }
      carouselController.animateToPage(index);
      widget.tabController.animateTo(1);
    });
  }

  Widget proxyDecorator(Widget child, int index, Animation<double> animation) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Material(
          color: Colors.transparent,
          child: child,
        );
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (_) {
        return ReactionBuilder(
          builder: (context) {
            return reaction(
              (_) => _balanceStore.bars.length,
              (length) {
                if (length > _balanceStore.barCurrentIndex) {
                  widget.onCarouselScroll(length - 1);
                  final bar = _balanceStore.bars.lastOrNull;
                  if (bar != null) {
                    widget.onCardSelected(bar as AbstractCard);
                  }
                  _historyPageStore.setBarHistoryIndex(length - 1);
                  _rampService.configuration.userAddress = _balanceStore.bars[_balanceStore.barCurrentIndex].address;
                } else {
                  _balanceStore.setBarCurrentIndex(length);
                  _historyPageStore.setBarHistoryIndex(length - 1);
                  widget.onCardSelected(null);
                  _rampService.configuration.userAddress = _balanceStore.bars[_balanceStore.barCurrentIndex].address;
                }
              },
            );
          },
          child: CarouselSlider.builder(
            carouselController: carouselController,
            itemBuilder: (context, index, constrains) {
              if (index == _balanceStore.bars.length) {
                return Observer(
                  builder: (context) {
                    return ScaleTap(
                      enableFeedback: false,
                      onPressed: _balanceStore.barCurrentIndex == _balanceStore.bars.length
                          ? () async {
                              await _walletProtectState.updateModalStatus(isOpened: true);
                              await recordAmplitudeEvent(
                                const AddNewClicked(tab: 'Bar'),
                              );
                              await showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
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
                                      BarScanMethodsPage(
                                        isAvailable: _nfcStore,
                                      ).paddingHorizontal(20),
                                      const Gap(40),
                                    ],
                                  );
                                },
                              );
                              await _walletProtectState.updateModalStatus(isOpened: false);
                            }
                          : null,
                      child: Assets.images.addCard.image(),
                    );
                  },
                );
              }

              final bar = _balanceStore.bars[index];
              final visibleAddress = getSplitAddress(bar.address);

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
                              child: _balanceStore.barCurrentIndex == index
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 30),
                                          child: Text(
                                            bar.name,
                                            style: const TextStyle(
                                              fontFamily: FontFamily.redHatMedium,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        ScaleTap(
                                          enableFeedback: false,
                                          onPressed: () async {
                                            await recordAmplitudeEvent(
                                              WalletSettingsClicked(
                                                walletAddress: bar.address,
                                                walletType: 'Bar',
                                              ),
                                            );
                                            await router.push(
                                              BarSettingsRoute(bar: bar),
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
                  Observer(
                    builder: (context) {
                      return Expanded(
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.only(bottom: context.height > 844 ? 30 : 10),
                            child: ScaleTap(
                              enableFeedback: false,
                              opacityMinValue: .993,
                              scaleMinValue: .993,
                              onLongPress: _balanceStore.barCurrentIndex == index
                                  ? _balanceStore.bars.length > 1
                                      ? () async {
                                          await _walletProtectState.updateModalStatus(isOpened: true);
                                          await HapticFeedback.mediumImpact();
                                          await showModalBottomSheet(
                                            useSafeArea: false,
                                            isScrollControlled: true,
                                            context: context,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            builder: (context) {
                                              return SizedBox(
                                                height: 600,
                                                child: Scaffold(
                                                  appBar: AppBar(
                                                    toolbarHeight: 130,
                                                    automaticallyImplyLeading: false,
                                                    elevation: 0,
                                                    backgroundColor: Colors.transparent,
                                                    flexibleSpace: Column(
                                                      children: <Widget>[
                                                        const Gap(15),
                                                        Assets.icons.notch.image(height: 4),
                                                        const Gap(10),
                                                        Padding(
                                                          padding: const EdgeInsets.only(left: 10, right: 10),
                                                          child: Column(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            children: [
                                                              const Text(
                                                                'Re-order bars',
                                                                style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontFamily: FontFamily.redHatMedium,
                                                                  fontSize: 30,
                                                                ),
                                                              ),
                                                              const Gap(10),
                                                              Container(
                                                                padding: const EdgeInsets.symmetric(
                                                                  horizontal: 15,
                                                                  vertical: 10,
                                                                ),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  color: Colors.grey.withOpacity(0.1),
                                                                ),
                                                                child: const Text(
                                                                  'Hold and slide the wallet across the list to re-order',
                                                                  style: TextStyle(
                                                                    fontFamily: FontFamily.redHatMedium,
                                                                    fontSize: 14,
                                                                    color: Colors.black,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  backgroundColor: Colors.transparent,
                                                  body: SizedBox(
                                                    height: 700,
                                                    child: ReorderableListView.builder(
                                                      padding: const EdgeInsets.only(bottom: 30),
                                                      proxyDecorator: proxyDecorator,
                                                      itemCount: _balanceStore.bars.length,
                                                      itemBuilder: (_, index) {
                                                        final item = _balanceStore.bars[index];

                                                        return Container(
                                                          key: ValueKey(item.address),
                                                          child: Padding(
                                                            padding: const EdgeInsets.symmetric(
                                                              vertical: 7,
                                                              horizontal: 20,
                                                            ),
                                                            child: Container(
                                                              padding: const EdgeInsets.all(15),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(10),
                                                                color: Colors.grey.withOpacity(0.2),
                                                              ),
                                                              child: Row(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  item.color.image.image(height: 80),
                                                                  const Gap(20),
                                                                  Column(
                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                    children: [
                                                                      Row(
                                                                        children: [
                                                                          const Text(
                                                                            'Name:',
                                                                            style: TextStyle(
                                                                              fontSize: 14,
                                                                              fontFamily: FontFamily.redHatMedium,
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                          ),
                                                                          const Gap(5),
                                                                          Text(
                                                                            item.name,
                                                                            style: const TextStyle(
                                                                              fontSize: 14,
                                                                              fontFamily: FontFamily.redHatMedium,
                                                                              fontWeight: FontWeight.w600,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          const Text(
                                                                            'Address:',
                                                                            style: TextStyle(
                                                                              fontSize: 14,
                                                                              fontFamily: FontFamily.redHatMedium,
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                          ),
                                                                          const Gap(5),
                                                                          Text(
                                                                            getSplitAddress(item.address),
                                                                            style: const TextStyle(
                                                                              fontSize: 12,
                                                                              fontFamily: FontFamily.redHatMedium,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          const Text(
                                                                            'Date added:',
                                                                            style: TextStyle(
                                                                              fontSize: 14,
                                                                              fontFamily: FontFamily.redHatMedium,
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                          ),
                                                                          const Gap(5),
                                                                          Text(
                                                                            item.createdAt,
                                                                            style: const TextStyle(
                                                                              fontSize: 12,
                                                                              fontFamily: FontFamily.redHatMedium,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Row(
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: [
                                                                          const Text(
                                                                            'Balance:',
                                                                            style: TextStyle(
                                                                              fontSize: 14,
                                                                              fontFamily: FontFamily.redHatMedium,
                                                                              fontWeight: FontWeight.w700,
                                                                            ),
                                                                          ),
                                                                          const Gap(5),
                                                                          Builder(
                                                                            builder: (context) {
                                                                              final data = _marketPageStore
                                                                                  .singleCoin?.result.first;

                                                                              final myFormat =
                                                                                  NumberFormat.decimalPatternDigits(
                                                                                locale: 'en_us',
                                                                                decimalDigits: 2,
                                                                              );
                                                                              if (data == null) {
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
                                                                                          strokeWidth: 1,
                                                                                          color: Colors.black,
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                );
                                                                              }
                                                                              return Observer(
                                                                                builder: (_) {
                                                                                  final balance = bar.data!.netTxoCount;
                                                                                  if (_accelerometerStore
                                                                                      .hasPerformedAction) {
                                                                                    return const Text(
                                                                                      r'$*****',
                                                                                      style: TextStyle(
                                                                                        fontSize: 13,
                                                                                        fontFamily:
                                                                                            FontFamily.redHatMedium,
                                                                                      ),
                                                                                    );
                                                                                  } else {
                                                                                    return Text(
                                                                                      '\$${myFormat.format(balance / 100000000 * data.price)}',
                                                                                      style: const TextStyle(
                                                                                        fontSize: 13,
                                                                                        fontFamily:
                                                                                            FontFamily.redHatMedium,
                                                                                      ),
                                                                                    );
                                                                                  }
                                                                                },
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const Spacer(),
                                                                  Column(
                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                    children: [
                                                                      const Gap(25),
                                                                      Center(
                                                                        child: Icon(
                                                                          Icons.drag_handle,
                                                                          color: Colors.grey.withOpacity(0.5),
                                                                          size: 30,
                                                                        ),
                                                                      ),
                                                                      const Gap(25),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      onReorder: (oldIndex, newIndex) {
                                                        _balanceStore.changeBarIndexAndSave(
                                                          oldIndex: oldIndex,
                                                          newIndex: newIndex,
                                                          cardAddress: _balanceStore.bars[oldIndex].address,
                                                        );
                                                        widget.onCarouselScroll(index);
                                                        widget.onCardSelected(
                                                          _balanceStore.bars.elementAtOrNull(index) as AbstractCard?,
                                                        );
                                                        _balanceStore.setBarCurrentIndex(index);
                                                      },
                                                      onReorderStart: (val) {
                                                        HapticFeedback.heavyImpact();
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                          await _walletProtectState.updateModalStatus(isOpened: false);
                                        }
                                      : () async {
                                          Gaimon.error();
                                        }
                                  : null,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      blurRadius: 15,
                                      spreadRadius: 0.5,
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: bar.color.image.image().image,
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Gap(context.height * 0.045),
                                      Observer(
                                        builder: (_) {
                                          final countryStatus = _ipStore.rampCountryStatus;
                                          final regionStatus = _ipStore.rampRegionStatus;
                                          return countryStatus
                                              ? !regionStatus
                                                  ? ScaleTap(
                                                      enableFeedback: false,
                                                      opacityMinValue: .98,
                                                      scaleMinValue: .98,
                                                      onPressed: _balanceStore.barCurrentIndex == index
                                                          ? () async {
                                                              final isActivated = isBarWalletActivated(
                                                                balanceStore: _balanceStore,
                                                              );
                                                              await recordAmplitudeEvent(
                                                                TopUpButtonClicked(
                                                                  walletType: 'Bar',
                                                                  walletAddress: bar.address,
                                                                  activated: await isActivated,
                                                                ),
                                                              );
                                                              _rampService.presentRamp();
                                                            }
                                                          : null,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(8),
                                                          color: Colors.black.withOpacity(0.3),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.only(
                                                            top: 2,
                                                            bottom: 2,
                                                            left: 8,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  const Text(
                                                                    'Balance',
                                                                    style: TextStyle(
                                                                      fontSize: 12,
                                                                      fontFamily: FontFamily.redHatMedium,
                                                                      color: Colors.white,
                                                                    ),
                                                                  ),
                                                                  Observer(
                                                                    builder: (context) {
                                                                      final data =
                                                                          _marketPageStore.singleCoin?.result.first;
                                                                      final myFormat =
                                                                          NumberFormat.decimalPatternDigits(
                                                                        locale: 'en_us',
                                                                        decimalDigits: 2,
                                                                      );
                                                                      if (data == null) {
                                                                        return const Padding(
                                                                          padding: EdgeInsets.symmetric(
                                                                            vertical: 4,
                                                                            horizontal: 2,
                                                                          ),
                                                                          child: Row(
                                                                            children: [
                                                                              SizedBox(
                                                                                height: 10,
                                                                                width: 10,
                                                                                child: CircularProgressIndicator(
                                                                                  strokeWidth: 3,
                                                                                  color: Colors.white,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      }
                                                                      final balance = bar.data!.netTxoCount;
                                                                      return Observer(
                                                                        builder: (_) {
                                                                          if (_accelerometerStore.hasPerformedAction) {
                                                                            return const Text(
                                                                              r'$*****',
                                                                              style: TextStyle(
                                                                                fontFamily: FontFamily.redHatMedium,
                                                                                fontWeight: FontWeight.w500,
                                                                                color: Colors.white,
                                                                                fontSize: 18,
                                                                              ),
                                                                            );
                                                                          } else {
                                                                            return Text(
                                                                              '\$${myFormat.format(balance / 100000000 * data.price)}',
                                                                              style: const TextStyle(
                                                                                fontFamily: FontFamily.redHatMedium,
                                                                                fontWeight: FontWeight.w700,
                                                                                color: Colors.white,
                                                                                fontSize: 20,
                                                                              ),
                                                                            );
                                                                          }
                                                                        },
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                              Assets.icons.alternative.image(height: 48),
                                                            ],
                                                          ),
                                                        ),
                                                      ).paddingHorizontal(37),
                                                    )
                                                  : Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(8),
                                                        color: Colors.black.withOpacity(0.3),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(
                                                          top: 2,
                                                          bottom: 2,
                                                          left: 8,
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Column(
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                const Text(
                                                                  'Balance',
                                                                  style: TextStyle(
                                                                    fontSize: 12,
                                                                    fontFamily: FontFamily.redHatMedium,
                                                                    color: Colors.white,
                                                                  ),
                                                                ),
                                                                Observer(
                                                                  builder: (context) {
                                                                    final data =
                                                                        _marketPageStore.singleCoin?.result.first;
                                                                    final myFormat = NumberFormat.decimalPatternDigits(
                                                                      locale: 'en_us',
                                                                      decimalDigits: 2,
                                                                    );
                                                                    if (data == null) {
                                                                      return const Padding(
                                                                        padding: EdgeInsets.symmetric(
                                                                          vertical: 4,
                                                                          horizontal: 2,
                                                                        ),
                                                                        child: Row(
                                                                          children: [
                                                                            SizedBox(
                                                                              height: 10,
                                                                              width: 10,
                                                                              child: CircularProgressIndicator(
                                                                                strokeWidth: 3,
                                                                                color: Colors.white,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      );
                                                                    }
                                                                    return Text(
                                                                      (bar.data?.fundedTxoSum != null
                                                                              ? '\$${myFormat.format((bar.data!.netTxoCount) / 100000000 * data.price)}'
                                                                              : '')
                                                                          .toString(),
                                                                      style: const TextStyle(
                                                                        fontFamily: FontFamily.redHatMedium,
                                                                        fontWeight: FontWeight.w700,
                                                                        color: Colors.white,
                                                                        fontSize: 20,
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ],
                                                            ),
                                                            const SizedBox(height: 48),
                                                            //Assets.icons.alternative.image(height: 48),
                                                          ],
                                                        ),
                                                      ),
                                                    ).paddingHorizontal(37)
                                              : Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(8),
                                                    color: Colors.black.withOpacity(0.3),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.only(
                                                      top: 2,
                                                      bottom: 2,
                                                      left: 8,
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            const Text(
                                                              'Balance',
                                                              style: TextStyle(
                                                                fontSize: 12,
                                                                fontFamily: FontFamily.redHatMedium,
                                                                color: Colors.white,
                                                              ),
                                                            ),
                                                            Observer(
                                                              builder: (context) {
                                                                final data = _marketPageStore.singleCoin?.result.first;
                                                                final myFormat = NumberFormat.decimalPatternDigits(
                                                                  locale: 'en_us',
                                                                  decimalDigits: 2,
                                                                );
                                                                if (data == null) {
                                                                  return const Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                      vertical: 4,
                                                                      horizontal: 2,
                                                                    ),
                                                                    child: Row(
                                                                      children: [
                                                                        SizedBox(
                                                                          height: 10,
                                                                          width: 10,
                                                                          child: CircularProgressIndicator(
                                                                            strokeWidth: 3,
                                                                            color: Colors.white,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  );
                                                                }
                                                                return Text(
                                                                  (bar.data?.fundedTxoSum != null
                                                                          ? '\$${myFormat.format((bar.data!.netTxoCount) / 100000000 * data.price)}'
                                                                          : '')
                                                                      .toString(),
                                                                  style: const TextStyle(
                                                                    fontFamily: FontFamily.redHatMedium,
                                                                    fontWeight: FontWeight.w700,
                                                                    color: Colors.white,
                                                                    fontSize: 20,
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ],
                                                        ),
                                                        const SizedBox(height: 48),
                                                      ],
                                                    ),
                                                  ),
                                                ).paddingHorizontal(37);
                                        },
                                      ),
                                      const Gap(10),
                                      ScaleTap(
                                        enableFeedback: false,
                                        onPressed: _balanceStore.barCurrentIndex == index
                                            ? () async {
                                                final isBarActivated = isBarWalletActivated(
                                                  balanceStore: _balanceStore,
                                                );
                                                await recordAmplitudeEvent(
                                                  AddressCopied(
                                                    walletType: 'Bar',
                                                    walletAddress: bar.address,
                                                    activated: await isBarActivated,
                                                    source: 'Wallet',
                                                  ),
                                                );
                                                await Clipboard.setData(
                                                  ClipboardData(
                                                    text: bar.address.toString(),
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
                                                        backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
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
                                              }
                                            : null,
                                        child: Container(
                                          height: 33,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(image: Assets.images.bar.barAddress.image().image),
                                          ),
                                          child: Center(
                                            child: Observer(
                                              builder: (context) {
                                                if (_balanceStore.loadings[bar.address] ?? false) {
                                                  return Text(
                                                    visibleAddress,
                                                    style: const TextStyle(
                                                      fontFamily: FontFamily.redHatMedium,
                                                      color: Colors.black,
                                                      fontSize: 13,
                                                    ),
                                                  );
                                                }
                                                return Text(
                                                  visibleAddress,
                                                  style: const TextStyle(
                                                    fontFamily: FontFamily.redHatMedium,
                                                    color: Colors.black,
                                                    fontSize: 13,
                                                  ),
                                                );
                                              },
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
                      );
                    },
                  ),
                ],
              );
            },
            options: CarouselOptions(
              onPageChanged: (index, reason) async {
                widget.onCarouselScroll(index);
                widget.onCardSelected(
                  _balanceStore.bars.elementAtOrNull(index) as AbstractCard?,
                );
                await _balanceStore.setBarCurrentIndex(index);
                if (index != _balanceStore.bars.length) {
                  _rampService.configuration.userAddress = _balanceStore.bars[_balanceStore.barCurrentIndex].address;
                  await _historyPageStore.setBarHistoryIndex(index);
                }
              },
              enlargeFactor: 0.35,
              enableInfiniteScroll: false,
              viewportFraction: 0.79,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            ),
            itemCount: _balanceStore.bars.length + 1,
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
