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
import '../../../router.gr.dart';
import '../../../services/amplitude_service.dart';
import '../../../services/ramp_service.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../store/history_page_store/history_page_store.dart';
import '../../../store/nfc_state/nfc_state.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../send_page/send_to/send_to_state.dart';
import 'card_empty_state/card_empty_state.dart';
import 'card_lists_widgets/add_new_card_modal.dart';
import 'card_lists_widgets/card_address_field.dart';
import 'card_lists_widgets/card_balance_field.dart';
import 'card_lists_widgets/card_reorder_widget.dart';

typedef CardSelectedCallback = void Function(int index);

class CardList extends StatefulWidget {
  const CardList({
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
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<CardList> {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  RampService get _rampService => GetIt.I<RampService>();

  final _nfcState = NfcStore();

  final carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    if (_balanceStore.cards.isNotEmpty) {
      _rampService.configuration.userAddress =
          _balanceStore.cards[_balanceStore.cardCurrentIndex].address;
    }
    _balanceStore
      ..setOnCardAddedCallback((address) {
        final index = _balanceStore.cards
            .indexWhere((element) => element.address == address);
        if (index.isNegative) {
          return;
        }
        carouselController.animateToPage(index);
      })
      ..setOnCardDeletedCallback((address) {
        final index = _balanceStore.cards
            .indexWhere((element) => element.address == address);
        if (index.isNegative) {
          carouselController.jumpToPage(0);
          return;
        }
        carouselController.jumpToPage(0);
      })
      ..setOnCardActivatedCallback((address) {
        final index = _balanceStore.cards
            .indexWhere((element) => element.address == address);
        carouselController.jumpToPage(index);
      });
    _nfcState.checkNfcSupport();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Observer(
      builder: (_) {
        return ReactionBuilder(
          builder: (context) {
            return reaction(
              (_) => _balanceStore.cards.length,
              (length) {
                if (length > _balanceStore.cardCurrentIndex) {
                  if (_balanceStore.cardCurrentIndex != 0) {
                    widget.onCarouselScroll(length - 1);
                    _balanceStore.setCardCurrentIndex(length - 1);
                    final card = _balanceStore.cards.lastOrNull;
                    if (card != null) {
                      widget.onCardSelected(card as AbstractCard);
                    }
                    _historyPageStore
                      ..setCardHistoryIndex(length - 1)
                      ..setCardActivationIndex(index: length - 1);
                    widget.state.transactionsStore.selectedCard =
                        widget.state.historyPageStore.cardHistoryIndex;
                    _rampService.configuration.userAddress = _balanceStore
                        .cards[_balanceStore.cardCurrentIndex].address;
                  } else {
                    _rampService.configuration.userAddress = _balanceStore
                        .cards[_balanceStore.cardCurrentIndex].address;
                    _historyPageStore.setCardHistoryIndex(0);
                    final card = _balanceStore.cards.first;
                    widget.onCardSelected(card as AbstractCard);
                    _balanceStore.setCardCurrentIndex(0);
                  }
                } else {
                  widget.onCardSelected(null);
                  _rampService.configuration.userAddress = _balanceStore
                      .cards[_balanceStore.cardCurrentIndex].address;
                }
              },
            );
          },
          child: _balanceStore.cards.isEmpty
              ? CardEmptyState(
                  walletProtectState: _walletProtectState,
                  balanceStore: _balanceStore,
                  nfcState: _nfcState,
                )
              : CarouselSlider.builder(
                  carouselController: carouselController,
                  itemBuilder: (context, index, constrains) {
                    if (index == _balanceStore.cards.length) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 25, top: 20),
                        child: Observer(
                          builder: (context) {
                            return ScaleTap(
                              enableFeedback: false,
                              onPressed: _balanceStore.cardCurrentIndex ==
                                      _balanceStore.cards.length
                                  ? () async {
                                      await _walletProtectState
                                          .updateModalStatus(
                                        isOpened: true,
                                      );
                                      await recordAmplitudeEvent(
                                        const AddNewClicked(tab: 'Card'),
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
                                          return AddNewCardModal(
                                            nfcState: _nfcState,
                                          );
                                        },
                                      ).then(
                                        (value) => _walletProtectState
                                            .updateModalStatus(isOpened: false),
                                      );
                                    }
                                  : null,
                              child: Assets.images.addCard.image(),
                            );
                          },
                        ),
                      );
                    }
                    final card = _balanceStore.cards[index];

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
                                    duration: const Duration(milliseconds: 600),
                                    child: _balanceStore.cardCurrentIndex ==
                                            index
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 25,
                                                ),
                                                child: Text(
                                                  card.name,
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
                                                      walletAddress:
                                                          card.address,
                                                      walletType: 'Card',
                                                    ),
                                                  );
                                                  await router.push(
                                                    CardSettingsRoute(
                                                      card: card,
                                                    ),
                                                  );
                                                },
                                                child:
                                                    Assets.icons.settings.image(
                                                  height: 30,
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox(height: 30),
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
                                  padding: const EdgeInsets.only(bottom: 30),
                                  child: ScaleTap(
                                    enableFeedback: false,
                                    opacityMinValue: .99,
                                    scaleMinValue: .99,
                                    onLongPress: _balanceStore
                                                .cardCurrentIndex ==
                                            index
                                        ? _balanceStore.cards.length > 1
                                            ? () async {
                                                await _walletProtectState
                                                    .updateModalStatus(
                                                  isOpened: true,
                                                );
                                                await HapticFeedback
                                                    .mediumImpact();
                                                await showModalBottomSheet(
                                                  isScrollControlled: true,
                                                  context: context,
                                                  shape:
                                                      const RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(20),
                                                      topRight:
                                                          Radius.circular(20),
                                                    ),
                                                  ),
                                                  builder: (context) {
                                                    return CardReorderWidget(
                                                      tabController:
                                                          widget.tabController,
                                                      onCardSelected:
                                                          widget.onCardSelected,
                                                      onCarouselScroll: widget
                                                          .onCarouselScroll,
                                                      index: index,
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
                                      margin: EdgeInsets.all(
                                        context.height > 667 ? 5 : 0,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 20,
                                            spreadRadius: 0.5,
                                          ),
                                        ],
                                      ),
                                      child: Stack(
                                        children: [
                                          Center(
                                            child: Image(
                                              image: card.color.image
                                                  .image()
                                                  .image,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            height: context.height > 667
                                                ? context.height * 0.52
                                                : 450,
                                            child: Center(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  SizedBox(
                                                    height:
                                                        context.height * 0.2,
                                                  ),
                                                  CardAddressField(
                                                    index: index,
                                                  ),
                                                  const Gap(4),
                                                  CardBalanceField(
                                                    index: index,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
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
                        _balanceStore.cards.elementAtOrNull(index)
                            as AbstractCard?,
                      );
                      await _balanceStore.setCardCurrentIndex(index);
                      if (index != _balanceStore.cards.length) {
                        _rampService.configuration.userAddress = _balanceStore
                            .cards[_balanceStore.cardCurrentIndex].address;
                        await _historyPageStore.setCardHistoryIndex(index);
                        await _historyPageStore.setCardActivationIndex(
                          index: index,
                        );
                        widget.state.transactionsStore.onSelectCard(index);
                      }
                    },
                    enlargeFactor: 0.35,
                    enableInfiniteScroll: false,
                    viewportFraction: 0.79,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                  ),
                  itemCount: _balanceStore.cards.length + 1,
                ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
