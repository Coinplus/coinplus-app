import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../constants/card_color.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../models/abstract_card/abstract_card.dart';
import '../../../providers/screen_service.dart';
import '../../../router.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../store/nfc_state/nfc_state.dart';
import '../../../store/settings_button_state/settings_button_state.dart';
import '../../../widgets/custom_snack_bar/snack_bar.dart';
import '../../../widgets/custom_snack_bar/top_snack.dart';
import '../../onboarding_page/form_factor_page/bar_scan_methods_page.dart';

class BarList extends StatefulWidget {
  const BarList({
    super.key,
    required this.onCardSelected,
    required this.onCarouselScroll,
  });

  final ValueChanged<AbstractCard?> onCardSelected;
  final ValueChanged<int> onCarouselScroll;

  @override
  State<BarList> createState() => _BarListState();
}

class _BarListState extends State<BarList> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin<BarList> {
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  SettingsState get _settingsState => GetIt.instance<SettingsState>();
  final _nfcStore = NfcStore();

  @override
  void initState() {
    super.initState();
    _nfcStore.checkNfcSupport();
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
                if (length > _settingsState.barCurrentIndex) {
                  widget.onCarouselScroll(length - 1);
                  _settingsState.setBarCurrentIndex(length - 1);
                  final bar = _balanceStore.bars.lastOrNull;
                  if (bar != null) {
                    widget.onCardSelected(bar as AbstractCard);
                  }
                } else {
                  _settingsState.setBarCurrentIndex(length);
                  widget.onCardSelected(null);
                }
              },
            );
          },
          child: CarouselSlider.builder(
            itemBuilder: (context, index, constrains) {
              if (index == _balanceStore.bars.length) {
                return ScaleTap(
                  enableFeedback: false,
                  onPressed: () {
                    showModalBottomSheet(
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
                  },
                  child: Assets.images.addCard.image(),
                );
              }

              final bar = _balanceStore.bars[index];
              final visibleAddress = _getVisibleAddress(bar.address);

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
                              child: _settingsState.barCurrentIndex == index
                                  ? Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 25),
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
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: context.height > 844 ? 30 : 10),
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
                              children: [
                                const Gap(35),
                                Stack(
                                  children: [
                                    Container(
                                      height: 160,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: Assets.images.bar.hologramWithFrame.image().image,
                                        ),
                                      ),
                                      child: Center(
                                        child: Assets.images.bar.barSecret1.image(
                                          height: 44,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        const Text(
                                          'Balance',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: FontFamily.redHatMedium,
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
                                                padding: EdgeInsets.all(
                                                  4,
                                                ),
                                                child: Row(
                                                  children: [
                                                    SizedBox(
                                                      height: 10,
                                                      width: 10,
                                                      child: CircularProgressIndicator(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            }
                                            return Text(
                                              (bar.data?.balance != null
                                                      ? '\$${myFormat.format((bar.data!.balance - bar.data!.spentTxoSum) / 100000000 * data.price)}'
                                                      : '')
                                                  .toString(),
                                              style: TextStyle(
                                                fontFamily: FontFamily.redHatMedium,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black.withOpacity(0.7),
                                                fontSize: 20,
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ).paddingHorizontal(40),
                                const Gap(10),
                                ScaleTap(
                                  enableFeedback: false,
                                  onPressed: () {
                                    Clipboard.setData(
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
                                  },
                                  child: Container(
                                    height: 33,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(image: Assets.images.bar.barAddress.image().image),
                                    ),
                                    child: Center(
                                      child: Observer(
                                        builder: (context) {
                                          if (_balanceStore.loadings[bar.address] ?? false) {
                                            return const Padding(
                                              padding: EdgeInsets.all(
                                                4,
                                              ),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    height: 10,
                                                    width: 10,
                                                    child: CircularProgressIndicator(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
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
                                const Gap(15),
                                Assets.images.bar.barCoinplusLogo.image(
                                  height: 40,
                                ),
                                const Gap(15),
                                Assets.images.bar.barSecret2.image(
                                  height: 41,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                widget.onCarouselScroll(index);
                widget.onCardSelected(
                  _balanceStore.bars.elementAtOrNull(index) as AbstractCard?,
                );
                _settingsState.setBarCurrentIndex(index);
              },
              enlargeFactor: 0.35,
              disableCenter: true,
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

  String _getVisibleAddress(String fullAddress) {
    final start = fullAddress.substring(0, 5);
    final end = fullAddress.substring(fullAddress.length - 5);
    return '$start ... $end';
  }

  @override
  bool get wantKeepAlive => true;
}
