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
import '../../../router.gr.dart';
import '../../../services/amplitude_service.dart';

//import '../../../services/ramp_service.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../store/nfc_state/nfc_state.dart';
import '../../../store/settings_button_state/settings_button_state.dart';
import '../../../store/wallet_protect_state/wallet_protect_state.dart';
import '../../../utils/data_utils.dart';
import '../../../utils/wallet_activation_status.dart';
import '../../../widgets/custom_snack_bar/snack_bar.dart';
import '../../../widgets/custom_snack_bar/top_snack.dart';
import '../../onboarding_page/form_factor_page/card_scan_methods_page.dart';

typedef CardSelectedCallback = void Function(int index);

class CardList extends StatefulWidget {
  const CardList({
    super.key,
    required this.onCardSelected,
    required this.onCarouselScroll,
    required this.tabController,
  });

  final ValueChanged<AbstractCard?> onCardSelected;
  final ValueChanged<int> onCarouselScroll;
  final TabController tabController;

  @override
  State<CardList> createState() => _CardListState();
}

class _CardListState extends State<CardList> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<CardList> {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  SettingsState get _settingsState => GetIt.instance<SettingsState>();

  WalletProtectState get _walletProtectState => GetIt.I<WalletProtectState>();

  final _nfcState = NfcStore();
  final carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    if (_balanceStore.cards.isNotEmpty) {
      //configuration.userAddress = _balanceStore.cards[_settingsState.cardCurrentIndex].address;
    }
    _balanceStore.setOnCardAddedCallback((address) {
      final index = _balanceStore.cards.indexWhere((element) => element.address == address);
      if (index.isNegative) {
        return;
      }
      carouselController.animateToPage(index);
      widget.tabController.animateTo(0);
    });
    _nfcState.checkNfcSupport();
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
              (_) => _balanceStore.cards.length,
              (length) {
                if (length > _settingsState.cardCurrentIndex) {
                  widget.onCarouselScroll(length - 1);
                  final card = _balanceStore.cards.lastOrNull;
                  if (card != null) {
                    widget.onCardSelected(card as AbstractCard);
                  }
                  //configuration.userAddress = _balanceStore.cards[_settingsState.cardCurrentIndex].address;
                } else {
                  _settingsState.setCardCurrentIndex(length);
                  widget.onCardSelected(null);
                  //configuration.userAddress = _balanceStore.cards[_settingsState.cardCurrentIndex].address;
                }
              },
            );
          },
          child: CarouselSlider.builder(
            carouselController: carouselController,
            itemBuilder: (context, index, constrains) {
              if (index == _balanceStore.cards.length) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 25, top: 20),
                  child: Observer(
                    builder: (context) {
                      return ScaleTap(
                        enableFeedback: false,
                        onPressed: _settingsState.cardCurrentIndex == _balanceStore.cards.length
                            ? () async {
                                await _walletProtectState.updateModalStatus(isOpened: true);
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
                                              padding: EdgeInsets.only(
                                                left: 20,
                                                top: 10,
                                              ),
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
                                        CardScanMethodsPage(isAvailable: _nfcState).paddingHorizontal(20),
                                        const Gap(40),
                                      ],
                                    );
                                  },
                                ).then((value) => _walletProtectState.updateModalStatus(isOpened: false));
                              }
                            : null,
                        child: Assets.images.addCard.image(),
                      );
                    },
                  ),
                );
              }
              final card = _balanceStore.cards[index];
              final visibleAddress = getSplitAddress(card.address);

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
                              child: _settingsState.cardCurrentIndex == index
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 25),
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
                                              CardSettingsRoute(card: card),
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
                            padding: const EdgeInsets.only(bottom: 30),
                            child: ScaleTap(
                              enableFeedback: false,
                              opacityMinValue: .99,
                              scaleMinValue: .99,
                              onLongPress: _settingsState.cardCurrentIndex == index
                                  ? _balanceStore.cards.length > 1
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
                                                                'Re-order cards',
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
                                                      itemCount: _balanceStore.cards.length,
                                                      clipBehavior: Clip.antiAlias,
                                                      itemBuilder: (_, index) {
                                                        final item = _balanceStore.cards[index];
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
                                                                color: _settingsState.isReorderingStart
                                                                    ? Colors.grey.withOpacity(0.1)
                                                                    : Colors.grey.withOpacity(0.3),
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
                                                                              final data = _balanceStore.coins;
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
                                                                              return Text(
                                                                                '\$${myFormat.format((item.data!.balance - item.data!.spentTxoSum) / 100000000 * data.price)}',
                                                                                style: const TextStyle(
                                                                                  fontSize: 13,
                                                                                  fontFamily: FontFamily.redHatMedium,
                                                                                ),
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
                                                        _balanceStore.changeCardIndexAndSave(
                                                          oldIndex: oldIndex,
                                                          newIndex: newIndex,
                                                          cardAddress: _balanceStore.cards[oldIndex].address,
                                                        );
                                                        widget.onCarouselScroll(index);
                                                        widget.onCardSelected(
                                                          _balanceStore.cards.elementAtOrNull(index) as AbstractCard?,
                                                        );
                                                        _settingsState.setCardCurrentIndex(index);
                                                      },
                                                      onReorderStart: (val) {
                                                        _settingsState.startReorder();
                                                        HapticFeedback.heavyImpact();
                                                      },
                                                      onReorderEnd: (val) {
                                                        _settingsState.isReorderingStart = false;
                                                        if (index != _balanceStore.cards.length) {
                                                          // configuration.userAddress = _balanceStore
                                                          //     .cards[_settingsState.cardCurrentIndex].address;
                                                        }
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
                                margin: EdgeInsets.all(context.height > 667 ? 5 : 0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 20,
                                      spreadRadius: 0.5,
                                    ),
                                  ],
                                  image: DecorationImage(
                                    image: card.color.image.image().image,
                                  ),
                                ),
                                child: SizedBox(
                                  height: context.height > 667 ? context.height * 0.52 : 450,
                                  child: Center(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: context.height * 0.2,
                                        ),
                                        ScaleTap(
                                          enableFeedback: false,
                                          onPressed: _settingsState.cardCurrentIndex == index
                                              ? () async {
                                                  final isCardActivated = isCardWalletActivated(
                                                    balanceStore: _balanceStore,
                                                    settingsState: _settingsState,
                                                  );
                                                  await recordAmplitudeEvent(
                                                    AddressCopied(
                                                      walletType: 'Card',
                                                      walletAddress: card.address,
                                                      activated: await isCardActivated,
                                                      source: 'Wallet',
                                                    ),
                                                  );
                                                  await Clipboard.setData(
                                                    ClipboardData(
                                                      text: card.address.toString(),
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
                                            padding: EdgeInsets.symmetric(
                                              horizontal: context.height > 667
                                                  ? context.height * 0.035
                                                  : context.height * 0.043,
                                            ),
                                            child: Container(
                                              height: 60,
                                              alignment: Alignment.center,
                                              padding: const EdgeInsets.only(
                                                left: 8,
                                                right: 8,
                                                top: 12,
                                                bottom: 12,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(6),
                                                color: Colors.black.withOpacity(
                                                  0.3,
                                                ),
                                              ),
                                              child: Column(
                                                children: [
                                                  const Row(
                                                    children: [
                                                      Text(
                                                        'Address',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          fontFamily: FontFamily.redHatMedium,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Observer(
                                                    builder: (context) {
                                                      if (_balanceStore.loadings[card.address] ?? false) {
                                                        return Text(
                                                          visibleAddress,
                                                          overflow: TextOverflow.ellipsis,
                                                          softWrap: true,
                                                          style: const TextStyle(
                                                            fontFamily: FontFamily.redHatMedium,
                                                            fontWeight: FontWeight.w700,
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                          ),
                                                        ).expandedHorizontally();
                                                      }
                                                      return Text(
                                                        visibleAddress,
                                                        overflow: TextOverflow.ellipsis,
                                                        softWrap: true,
                                                        style: const TextStyle(
                                                          fontFamily: FontFamily.redHatMedium,
                                                          fontWeight: FontWeight.w700,
                                                          color: Colors.white,
                                                          fontSize: 12,
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
                                        ScaleTap(
                                          onPressed: _settingsState.cardCurrentIndex == index
                                              ? () async {
                                                  final isActivated = isCardWalletActivated(
                                                    balanceStore: _balanceStore,
                                                    settingsState: _settingsState,
                                                  );
                                                  await recordAmplitudeEvent(
                                                    TopUpButtonClicked(
                                                      walletType: 'Card',
                                                      walletAddress: card.address,
                                                      activated: await isActivated,
                                                    ),
                                                  );
                                                  //presentRamp();
                                                }
                                              : null,
                                          enableFeedback: false,
                                          child: Container(
                                            height: 60,
                                            padding: EdgeInsets.symmetric(
                                              horizontal: context.height > 667
                                                  ? context.height * 0.035
                                                  : context.height * 0.043,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(6),
                                                color: Colors.black.withOpacity(
                                                  0.3,
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(
                                                      8,
                                                    ),
                                                    child: Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Text(
                                                          'Balance',
                                                          style: TextStyle(
                                                            fontFamily: FontFamily.redHatMedium,
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                          ),
                                                        ),
                                                        Observer(
                                                          builder: (context) {
                                                            final data = _balanceStore.coins;
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
                                                                        strokeWidth: 2,
                                                                        color: Colors.white,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            }
                                                            return Text(
                                                              '\$${myFormat.format((card.data!.balance - card.data!.spentTxoSum) / 100000000 * data.price)}',
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
                                                  ),
                                                  Assets.icons.alternative.image(height: 50),
                                                ],
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
                  _balanceStore.cards.elementAtOrNull(index) as AbstractCard?,
                );
                await _settingsState.setCardCurrentIndex(index);
                if (index != _balanceStore.cards.length) {
                  //configuration.userAddress = _balanceStore.cards[_settingsState.cardCurrentIndex].address;
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
