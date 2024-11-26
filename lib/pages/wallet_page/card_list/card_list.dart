import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gaimon/gaimon.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:ios_smooth_page_indicator/ios_smooth_page_indicator.dart';
import 'package:mobx/mobx.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../all_alert_dialogs/maybe_coinplus_card/maybe_coinplus_card.dart';
import '../../../constants/card_color.dart';
import '../../../constants/card_type.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../modals/backup_card_modal/backup_card_modal.dart';
import '../../../modals/lost_card_info_modal/lost_card_info_modal.dart';
import '../../../models/abstract_card/abstract_card.dart';
import '../../../models/amplitude_event/amplitude_event.dart';
import '../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../services/amplitude_service.dart';
import '../../../services/cloud_firestore_service.dart';
import '../../../services/ramp_service.dart';
import '../../../store/all_settings_state/all_settings_state.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../store/history_page_store/history_page_store.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../../utils/wallet_activation_status.dart';
import '../../send_page/send_to/send_to_state.dart';
import 'card_empty_state/card_empty_state.dart';
import 'card_lists_widgets/add_new_card_modal.dart';
import 'card_lists_widgets/card_address_field.dart';
import 'card_lists_widgets/card_balance_field.dart';
import 'card_lists_widgets/card_reorder_widget.dart';
import 'card_lists_widgets/eth_card_address_field.dart';
import 'card_lists_widgets/eth_card_balance_field.dart';

typedef CardSelectedCallback = void Function(int index);

class CardList extends StatefulWidget {
  const CardList({
    super.key,
    required this.onCardSelected,
    required this.onCarouselScroll,
    required this.tabController,
    required this.carouselController,
    required this.indicatorController,
  });

  final ValueChanged<AbstractCard?> onCardSelected;
  final ValueChanged<int> onCarouselScroll;
  final TabController tabController;
  final CarouselSliderController carouselController;
  final PageController indicatorController;

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<CardList> {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  SendToState get _sendToState => GetIt.I<SendToState>();

  RampService get _rampService => GetIt.I<RampService>();

  final _nfcState = AllSettingsState();

  @override
  void initState() {
    super.initState();
    if (_balanceStore.cards.isNotEmpty) {
      _rampService.configuration.userAddress = _balanceStore.cards[_balanceStore.cardCurrentIndex].address;
    }
    _balanceStore
      ..setOnCardAddedCallback((address) {
        final index = _balanceStore.cards.indexWhere((element) => element.address == address);
        if (index.isNegative) {
          return;
        }
        _balanceStore.getCardsInfo();
        WidgetsBinding.instance.addPostFrameCallback((_) {
          widget.carouselController.animateToPage(index);
        });
      })
      ..setOnCardDeletedCallback((address) {
        final index = _balanceStore.cards.indexWhere((element) => element.address == address);
        if (index.isNegative && _balanceStore.cards.isNotEmpty) {
          widget.carouselController.jumpToPage(0);
          return;
        }
      })
      ..setOnCardActivatedCallback((address) {
        final index = _balanceStore.cards.indexWhere((element) => element.address == address);
        widget.carouselController.jumpToPage(index);
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
              (_) => _balanceStore.ethCards.length,
              (length) {
                if (length > _balanceStore.cardCurrentIndex - _balanceStore.cards.length) {
                  if (_balanceStore.cardCurrentIndex != 0) {
                    widget.onCarouselScroll(length - 1);
                    _balanceStore.setCardCurrentIndex(length);
                    final ethCard = _balanceStore.ethCards.lastOrNull;
                    if (ethCard != null) {
                      widget.onCardSelected(ethCard as AbstractCard);
                    }
                    _rampService.configuration.userAddress =
                        _balanceStore.ethCards[_balanceStore.cardCurrentIndex].address;
                  } else {
                    _rampService.configuration.userAddress =
                        _balanceStore.ethCards[_balanceStore.cardCurrentIndex].address;
                    _historyPageStore.setCardHistoryIndex(0);
                    final ethCard = _balanceStore.ethCards.first;
                    widget.onCardSelected(ethCard as AbstractCard);
                    _balanceStore.setCardCurrentIndex(0);
                  }
                } else {
                  widget.onCardSelected(null);
                  _rampService.configuration.userAddress =
                      _balanceStore.ethCards[_balanceStore.cardCurrentIndex].address;
                }
              },
            );
          },
          child: ReactionBuilder(
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
                      _sendToState.transactionsStore.selectedCard = _sendToState.historyPageStore.cardHistoryIndex;
                      _rampService.configuration.userAddress =
                          _balanceStore.cards[_balanceStore.cardCurrentIndex].address;
                    } else {
                      _rampService.configuration.userAddress =
                          _balanceStore.cards[_balanceStore.cardCurrentIndex].address;
                      _historyPageStore.setCardHistoryIndex(0);
                      final card = _balanceStore.cards.first;
                      widget.onCardSelected(card as AbstractCard);
                      _balanceStore.setCardCurrentIndex(0);
                    }
                  } else {
                    widget.onCardSelected(null);
                    _rampService.configuration.userAddress =
                        _balanceStore.cards[_balanceStore.cardCurrentIndex].address;
                  }
                },
              );
            },
            child: _balanceStore.cards.isEmpty && _balanceStore.ethCards.isEmpty
                ? CardEmptyState(
                    walletProtectState: _walletProtectState,
                    balanceStore: _balanceStore,
                    nfcState: _nfcState,
                  )
                : Column(
                    children: [
                      Expanded(
                        child: Observer(
                          builder: (context) {
                            return CarouselSlider.builder(
                              carouselController: widget.carouselController,
                              itemBuilder: (context, index, constrains) {
                                final isCard = index < _balanceStore.cards.length;
                                final isBtc = index < _balanceStore.cards.length;
                                if (index == _balanceStore.cards.length + _balanceStore.ethCards.length) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                      bottom: 25,
                                      top: 20,
                                    ),
                                    child: Observer(
                                      builder: (context) {
                                        return ScaleTap(
                                          enableFeedback: false,
                                          onPressed: _balanceStore.cardCurrentIndex == index
                                              ? () async {
                                                  await _walletProtectState.updateModalStatus(
                                                    isOpened: true,
                                                  );
                                                  await recordAmplitudeEvent(
                                                    const AddNewClicked(
                                                      tab: 'Card',
                                                    ),
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
                                                    (value) => _walletProtectState.updateModalStatus(
                                                      isOpened: false,
                                                    ),
                                                  );
                                                }
                                              : null,
                                          child: Assets.images.addCard.image(),
                                        );
                                      },
                                    ),
                                  );
                                }
                                final example = isBtc
                                    ? _balanceStore.cards[index]
                                    : _balanceStore.ethCards[index - _balanceStore.cards.length];
                                if (isCard) {
                                  final card = example as AbstractCard;
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
                                                  duration: const Duration(
                                                    milliseconds: 600,
                                                  ),
                                                  child: _balanceStore.cardCurrentIndex == index
                                                      ? Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only(
                                                                left: 25,
                                                              ),
                                                              child: Text(
                                                                card.name,
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
                                                                    walletAddress: card.address,
                                                                    walletType: 'Card',
                                                                  ),
                                                                );
                                                                await router.push(
                                                                  CardSettingsRoute(
                                                                    card: card,
                                                                  ),
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
                                            flex: 10,
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 10,
                                                ),
                                                child: ScaleTap(
                                                  enableFeedback: false,
                                                  opacityMinValue: .99,
                                                  scaleMinValue: .99,
                                                  onLongPress: _balanceStore.cardCurrentIndex == index
                                                      ? _balanceStore.cards.length > 1
                                                          ? () async {
                                                              await _walletProtectState.updateModalStatus(
                                                                isOpened: true,
                                                              );
                                                              await HapticFeedback.mediumImpact();
                                                              await showModalBottomSheet(
                                                                isScrollControlled: true,
                                                                context: context,
                                                                shape: const RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.only(
                                                                    topLeft: Radius.circular(
                                                                      20,
                                                                    ),
                                                                    topRight: Radius.circular(
                                                                      20,
                                                                    ),
                                                                  ),
                                                                ),
                                                                builder: (context) {
                                                                  return CardReorderWidget(
                                                                    tabController: widget.tabController,
                                                                    onCardSelected: widget.onCardSelected,
                                                                    onCarouselScroll: widget.onCarouselScroll,
                                                                    index: index,
                                                                  );
                                                                },
                                                              );
                                                              await _walletProtectState.updateModalStatus(
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
                                                      borderRadius: BorderRadius.circular(
                                                        14,
                                                      ),
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
                                                            image: card.color.image.image().image,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: context.height > 667 ? context.height * 0.52 : 450,
                                                          child: Center(
                                                            child: Column(
                                                              mainAxisSize: MainAxisSize.min,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                SizedBox(
                                                                  height: context.height * 0.15,
                                                                ),
                                                                if (card.label == WalletType.COINPLUS_WALLET)
                                                                  if (card.color == CardColor.BACKUP)
                                                                    ScaleTap(
                                                                      enableFeedback: false,
                                                                      onPressed: () async {
                                                                        final cardData =
                                                                            await getCardData(card.address);
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled: true,
                                                                          context: context,
                                                                          shape: const RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(
                                                                                20,
                                                                              ),
                                                                              topRight: Radius.circular(
                                                                                20,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          builder: (context) {
                                                                            return LostCardInfoModal(
                                                                              cardData: cardData,
                                                                            );
                                                                          },
                                                                        );
                                                                      },
                                                                      child: Padding(
                                                                        padding: EdgeInsets.symmetric(
                                                                          horizontal: context.height > 667
                                                                              ? context.height * 0.035
                                                                              : context.height * 0.043,
                                                                        ),
                                                                        child: ClipRRect(
                                                                          child: BackdropFilter(
                                                                            filter: ImageFilter.blur(
                                                                              sigmaX: 10,
                                                                              sigmaY: 10,
                                                                            ),
                                                                            child: Container(
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: BorderRadius.circular(6),
                                                                                color: Colors.black.withOpacity(0.5),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.symmetric(
                                                                                  vertical: 10,
                                                                                  horizontal: 8,
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    Assets.icons.addBackupIcon
                                                                                        .image(height: 28),
                                                                                    const Gap(2),
                                                                                    const Text(
                                                                                      'Primary card',
                                                                                      style: TextStyle(
                                                                                        fontFamily:
                                                                                            FontFamily.redHatMedium,
                                                                                        color: Colors.white,
                                                                                        fontSize: 12,
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )
                                                                  else
                                                                    ScaleTap(
                                                                      enableFeedback: false,
                                                                      onPressed: card.label ==
                                                                              WalletType.COINPLUS_WALLET
                                                                          ? () async {
                                                                              await _balanceStore
                                                                                  .loadBackupCard(card.address);
                                                                              final isWalletActivated =
                                                                                  await isCardWalletActivated();
                                                                              final hasBackUp =
                                                                                  await isCardWalletHasBackup(
                                                                                address: card.address,
                                                                              );
                                                                              if (isWalletActivated && hasBackUp) {
                                                                                await WoltModalSheet.show<void>(
                                                                                  pageIndexNotifier: pageIndexNotifier,
                                                                                  context: context,
                                                                                  pageListBuilder: (modalSheetContext) {
                                                                                    return [
                                                                                      modalPage1(modalSheetContext),
                                                                                      modalPage2(
                                                                                        modalSheetContext,
                                                                                        card.address,
                                                                                      ),
                                                                                    ];
                                                                                  },
                                                                                  modalTypeBuilder: (context) {
                                                                                    final size = MediaQuery.of(context)
                                                                                        .size
                                                                                        .width;
                                                                                    if (size < 768) {
                                                                                      return WoltModalType
                                                                                          .bottomSheet();
                                                                                    } else {
                                                                                      return WoltModalType.dialog();
                                                                                    }
                                                                                  },
                                                                                  onModalDismissedWithBarrierTap: () {
                                                                                    Navigator.of(context).maybePop();
                                                                                    pageIndexNotifier.value = 0;
                                                                                  },
                                                                                );
                                                                              } else if (isWalletActivated &&
                                                                                  !hasBackUp) {
                                                                                final cardData = await getCardData(
                                                                                  card.address,
                                                                                );
                                                                                await _balanceStore
                                                                                    .setMainWalletAddress(
                                                                                  walletAddress: card.address,
                                                                                );

                                                                                await router.push(
                                                                                  BackupMyWalletRoute(
                                                                                    walletAddress: card.address,
                                                                                    backupPack: cardData?.backupPack,
                                                                                    isWalletActivated:
                                                                                        isWalletActivated,
                                                                                    cardColor: card.color.toString(),
                                                                                  ),
                                                                                );
                                                                              } else if (!isWalletActivated) {
                                                                                final cardData = await getCardData(
                                                                                  card.address,
                                                                                );
                                                                                await _balanceStore
                                                                                    .setMainWalletAddress(
                                                                                  walletAddress: card.address,
                                                                                );
                                                                                await router.push(
                                                                                  BackupMyWalletRoute(
                                                                                    walletAddress: card.address,
                                                                                    backupPack: cardData?.backupPack,
                                                                                    isWalletActivated:
                                                                                        isWalletActivated,
                                                                                    cardColor: card.color.toString(),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              pageIndexNotifier.value = 0;
                                                                            }
                                                                          : () async {
                                                                              await maybeCoinplusCard(
                                                                                context,
                                                                              );
                                                                            },
                                                                      child: AnimatedCrossFade(
                                                                        firstChild: Padding(
                                                                          padding: EdgeInsets.symmetric(
                                                                            horizontal: context.height > 667
                                                                                ? context.height * 0.035
                                                                                : context.height * 0.043,
                                                                          ),
                                                                          child: Container(
                                                                            decoration: BoxDecoration(
                                                                              image: DecorationImage(
                                                                                image: Assets.icons.backedUpField
                                                                                    .image()
                                                                                    .image,
                                                                              ),
                                                                            ),
                                                                            child: Padding(
                                                                              padding: const EdgeInsets.symmetric(
                                                                                vertical: 10,
                                                                                horizontal: 8,
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Assets.icons.backedUpIcon
                                                                                      .image(height: 24),
                                                                                  const Gap(6),
                                                                                  const Text(
                                                                                    'Backed Up',
                                                                                    style: TextStyle(
                                                                                      fontFamily:
                                                                                          FontFamily.redHatMedium,
                                                                                      color: Colors.white,
                                                                                      fontSize: 12,
                                                                                    ),
                                                                                  ),
                                                                                  const Gap(16),
                                                                                  Assets.icons.backupInfoIcon
                                                                                      .image(height: 22),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        secondChild: Padding(
                                                                          padding: EdgeInsets.symmetric(
                                                                            horizontal: context.height > 667
                                                                                ? context.height * 0.035
                                                                                : context.height * 0.043,
                                                                          ),
                                                                          child: ClipRRect(
                                                                            child: BackdropFilter(
                                                                              filter: ImageFilter.blur(
                                                                                sigmaX: 10,
                                                                                sigmaY: 10,
                                                                              ),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius:
                                                                                      BorderRadius.circular(6),
                                                                                  color: Colors.black.withOpacity(0.5),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.symmetric(
                                                                                    vertical: 10,
                                                                                    horizontal: 8,
                                                                                  ),
                                                                                  child: Row(
                                                                                    children: [
                                                                                      Assets.icons.addBackupIcon
                                                                                          .image(height: 28),
                                                                                      const Gap(2),
                                                                                      const Text(
                                                                                        'Add backup',
                                                                                        style: TextStyle(
                                                                                          fontFamily:
                                                                                              FontFamily.redHatMedium,
                                                                                          color: Colors.white,
                                                                                          fontSize: 12,
                                                                                        ),
                                                                                      ),
                                                                                      const Spacer(),
                                                                                      Assets.icons.arrowRight
                                                                                          .image(height: 28),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        firstCurve: Curves.easeInOutBack,
                                                                        secondCurve: Curves.easeInOutBack,
                                                                        crossFadeState: card.hasBackedUp
                                                                            ? CrossFadeState.showFirst
                                                                            : CrossFadeState.showSecond,
                                                                        duration: const Duration(milliseconds: 50),
                                                                      ),
                                                                    ),
                                                                const Gap(10),
                                                                if (card.blockchain == 'BTC')
                                                                  CardAddressField(
                                                                    index: index,
                                                                  )
                                                                else
                                                                  CardEthAddressField(
                                                                    index: index,
                                                                    ethCard: _balanceStore.ethCards[index -
                                                                        _balanceStore.cards.length] as AbstractCard,
                                                                  ),
                                                                const Gap(4),
                                                                if (card.blockchain == 'BTC')
                                                                  CardBalanceField(
                                                                    index: index,
                                                                  )
                                                                else
                                                                  CardEthBalanceField(
                                                                    ethCard: _balanceStore.ethCards[index -
                                                                        _balanceStore.cards.length] as AbstractCard,
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
                                } else {
                                  final ethCard = example as AbstractCard;
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
                                                  duration: const Duration(
                                                    milliseconds: 600,
                                                  ),
                                                  child: _balanceStore.cardCurrentIndex == index
                                                      ? Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only(
                                                                left: 25,
                                                              ),
                                                              child: Text(
                                                                ethCard.name,
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
                                                                    walletAddress: ethCard.address,
                                                                    walletType: 'EthCard',
                                                                  ),
                                                                );
                                                                await router.push(
                                                                  CardSettingsRoute(
                                                                    card: ethCard,
                                                                  ),
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
                                            flex: 10,
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 10,
                                                ),
                                                child: ScaleTap(
                                                  enableFeedback: false,
                                                  opacityMinValue: .99,
                                                  scaleMinValue: .99,
                                                  onLongPress: _balanceStore.cardCurrentIndex == index
                                                      ? _balanceStore.ethCards.length > 1
                                                          ? () async {
                                                              await _walletProtectState.updateModalStatus(
                                                                isOpened: true,
                                                              );
                                                              await HapticFeedback.mediumImpact();
                                                              await showModalBottomSheet(
                                                                isScrollControlled: true,
                                                                context: context,
                                                                shape: const RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.only(
                                                                    topLeft: Radius.circular(
                                                                      20,
                                                                    ),
                                                                    topRight: Radius.circular(
                                                                      20,
                                                                    ),
                                                                  ),
                                                                ),
                                                                builder: (context) {
                                                                  return CardReorderWidget(
                                                                    tabController: widget.tabController,
                                                                    onCardSelected: widget.onCardSelected,
                                                                    onCarouselScroll: widget.onCarouselScroll,
                                                                    index: index,
                                                                  );
                                                                },
                                                              );
                                                              await _walletProtectState.updateModalStatus(
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
                                                      borderRadius: BorderRadius.circular(
                                                        14,
                                                      ),
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
                                                            image: ethCard.color.image.image().image,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: context.height > 667 ? context.height * 0.52 : 450,
                                                          child: Center(
                                                            child: Column(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                SizedBox(
                                                                  height: context.height * 0.2,
                                                                ),
                                                                CardEthAddressField(
                                                                  index: index,
                                                                  ethCard: ethCard,
                                                                ),
                                                                const Gap(4),
                                                                CardEthBalanceField(
                                                                  ethCard: ethCard,
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
                                }
                              },
                              options: CarouselOptions(
                                onPageChanged: (index, reason) async {
                                  widget.onCarouselScroll(index);
                                  final selectedCard = index < _balanceStore.cards.length
                                      ? _balanceStore.cards.elementAtOrNull(index) as AbstractCard?
                                      : _balanceStore.ethCards.elementAtOrNull(
                                          index - _balanceStore.cards.length,
                                        ) as AbstractCard?;
                                  widget.onCardSelected(selectedCard);
                                  await _balanceStore.setCardCurrentIndex(index);
                                  if (selectedCard != null && selectedCard.blockchain == 'BTC') {
                                    _rampService.configuration.userAddress = selectedCard.address;
                                    await _historyPageStore.setCardHistoryIndex(index);
                                    await _historyPageStore.setCardActivationIndex(index: index);
                                    if (index < _balanceStore.cards.length) {
                                      _sendToState.transactionsStore.onSelectCard(index);
                                    }
                                  } else if (selectedCard?.blockchain == 'ETH') {
                                    _rampService.configuration.userAddress = selectedCard!.address;

                                    await _historyPageStore.setCardActivationIndex(index: index);
                                  }
                                  await _balanceStore.updateCardIndicatorIndex(index);
                                },
                                enlargeFactor: 0.35,
                                enableInfiniteScroll: false,
                                viewportFraction: 0.79,
                                enlargeCenterPage: true,
                                enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                              ),
                              itemCount: _balanceStore.cards.length + _balanceStore.ethCards.length + 1,
                            );
                          },
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: AbsorbPointer(
                          absorbing: false,
                          child: IosSmoothPageIndicator(
                            dotIndex: _balanceStore.cardIndicatorIndex,
                            dotsCount: _balanceStore.cards.length + _balanceStore.ethCards.length + 1,
                            dotBackgroundColor: Colors.grey.withOpacity(0.1),
                            carouselController: widget.carouselController,
                            dotColor: Colors.grey.withOpacity(0.3),
                            onPageChanged: _balanceStore.updateCardIndicatorIndex,
                            activeDotColor: AppColors.primaryButtonColor.withOpacity(0.7),
                            onDotTapped: (_) {
                              recordAmplitudeEventPartTwo(
                                const PageIndicatorClicked(),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
