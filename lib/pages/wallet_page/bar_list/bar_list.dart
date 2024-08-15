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
import '../../../store/market_page_store/market_page_store.dart';
import '../../../store/nfc_state/nfc_state.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../send_page/send_to/send_to_state.dart';
import 'bar_lists_widgets/add_new_bar_modal.dart';
import 'bar_lists_widgets/bar_address_field.dart';
import 'bar_lists_widgets/bar_balance_field.dart';
import 'bar_lists_widgets/bar_reorder_widget.dart';

class BarList extends StatefulWidget {
  const BarList({
    super.key,
    required this.onCardSelected,
    required this.onCarouselScroll,
    required this.tabController,
    required this.state,
  });

  final ValueChanged<AbstractCard?> onCardSelected;
  final ValueChanged<int> onCarouselScroll;
  final TabController tabController;
  final SendToState state;

  @override
  State<BarList> createState() => _BarListState();
}

class _BarListState extends State<BarList>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<BarList> {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  RampService get _rampService => GetIt.I<RampService>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  AccelerometerStore get _accelerometerStore => GetIt.I<AccelerometerStore>();

  final _nfcStore = NfcStore();

  final carouselController = CarouselSliderController();

  @override
  void initState() {
    super.initState();
    _nfcStore.checkNfcSupport();
    if (_balanceStore.bars.isNotEmpty) {
      _rampService.configuration.userAddress =
          _balanceStore.bars[_balanceStore.barCurrentIndex].address;
    }
    _balanceStore
      ..setOnBarDeletedCallback((address) {
        final index = _balanceStore.bars
            .indexWhere((element) => element.address == address);
        if (index.isNegative) {
          carouselController.jumpToPage(0);
          return;
        }
        carouselController.jumpToPage(0);
      })
      ..setOnBarActivatedCallback((address) {
        final index = _balanceStore.bars
            .indexWhere((element) => element.address == address);
        carouselController.jumpToPage(index);
      });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (_) {
        return ReactionBuilder(
          builder: (context) {
            return reaction((_) => _balanceStore.bars.length, (length) {
              {
                if (length > _balanceStore.barCurrentIndex) {
                  if (_balanceStore.barCurrentIndex != 0) {
                    widget.onCarouselScroll(length - 1);
                    _balanceStore.setBarCurrentIndex(length - 1);
                    final bar = _balanceStore.bars.lastOrNull;
                    if (bar != null) {
                      widget.onCardSelected(bar as AbstractCard);
                    }
                    _historyPageStore
                      ..setBarHistoryIndex(length - 1)
                      ..setBarActivationIndex(index: length - 1);
                    widget.state.transactionsStore.selectedBar =
                        widget.state.historyPageStore.barHistoryIndex;
                    _rampService.configuration.userAddress = _balanceStore
                        .bars[_balanceStore.barCurrentIndex].address;
                  } else {
                    _rampService.configuration.userAddress = _balanceStore
                        .bars[_balanceStore.barCurrentIndex].address;
                    _historyPageStore.setBarHistoryIndex(0);
                    final bar = _balanceStore.bars.first;
                    widget.onCardSelected(bar as AbstractCard);
                    _balanceStore.setBarCurrentIndex(0);
                  }
                } else {
                  widget.onCardSelected(null);
                  _rampService.configuration.userAddress =
                      _balanceStore.bars[_balanceStore.barCurrentIndex].address;
                }
              }
            });
          },
          child: CarouselSlider.builder(
            carouselController: carouselController,
            itemBuilder: (context, index, constrains) {
              if (index == _balanceStore.bars.length) {
                return Observer(
                  builder: (context) {
                    return ScaleTap(
                      enableFeedback: false,
                      onPressed: _balanceStore.barCurrentIndex ==
                              _balanceStore.bars.length
                          ? () async {
                              await _walletProtectState.updateModalStatus(
                                isOpened: true,
                              );
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
                                  return AddNewBarModal(nfcStore: _nfcStore);
                                },
                              );
                              await _walletProtectState.updateModalStatus(
                                isOpened: false,
                              );
                            }
                          : null,
                      child: Assets.images.addCard.image(),
                    );
                  },
                );
              }

              final bar = _balanceStore.bars[index];

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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text(
                                            bar.name,
                                            style: const TextStyle(
                                              fontFamily:
                                                  FontFamily.redHatMedium,
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
                            padding: EdgeInsets.only(
                              bottom: context.height > 844 ? 30 : 10,
                            ),
                            child: ScaleTap(
                              enableFeedback: false,
                              opacityMinValue: .993,
                              scaleMinValue: .993,
                              onLongPress: _balanceStore.barCurrentIndex ==
                                      index
                                  ? _balanceStore.bars.length > 1
                                      ? () async {
                                          await _walletProtectState
                                              .updateModalStatus(
                                            isOpened: true,
                                          );
                                          await HapticFeedback.mediumImpact();
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            context: context,
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                              ),
                                            ),
                                            builder: (context) {
                                              return BarReorderWidget(
                                                balanceStore: _balanceStore,
                                                index: index,
                                                rampService: _rampService,
                                                bar: bar,
                                                marketPageStore:
                                                    _marketPageStore,
                                                accelerometerStore:
                                                    _accelerometerStore,
                                                onCardSelected:
                                                    widget.onCardSelected,
                                                onCarouselScroll:
                                                    widget.onCarouselScroll,
                                              );
                                            },
                                          );
                                          await _walletProtectState
                                              .updateModalStatus(
                                            isOpened: false,
                                          );
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
                                      BarBalanceField(
                                        accelerometerStore: _accelerometerStore,
                                        balanceStore: _balanceStore,
                                        bar: bar,
                                        index: index,
                                        marketPageStore: _marketPageStore,
                                        rampService: _rampService,
                                      ),
                                      const Gap(10),
                                      BarAddressField(
                                        index: index,
                                        bar: bar,
                                        balanceStore: _balanceStore,
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
                  _rampService.configuration.userAddress =
                      _balanceStore.bars[_balanceStore.barCurrentIndex].address;
                  await _historyPageStore.setBarHistoryIndex(index);
                  await _historyPageStore.setBarActivationIndex(index: index);
                  widget.state.transactionsStore.onSelectBar(index);
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
