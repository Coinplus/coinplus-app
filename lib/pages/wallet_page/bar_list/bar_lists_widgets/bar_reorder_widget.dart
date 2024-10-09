import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';

import '../../../../constants/card_color.dart';
import '../../../../extensions/extensions.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../models/abstract_card/abstract_card.dart';
import '../../../../models/bar_model/bar_model.dart';
import '../../../../services/ramp_service.dart';
import '../../../../store/accelerometer_store/accelerometer_store.dart';
import '../../../../store/balance_store/balance_store.dart';
import '../../../../store/market_page_store/market_page_store.dart';
import '../../../../utils/data_utils.dart';

class BarReorderWidget extends StatelessWidget {
  const BarReorderWidget({
    super.key,
    required this.balanceStore,
    required this.index,
    required this.rampService,
    required this.bar,
    required this.marketPageStore,
    required this.accelerometerStore,
    required this.onCardSelected,
    required this.onCarouselScroll,
  });

  final BalanceStore balanceStore;
  final RampService rampService;
  final MarketPageStore marketPageStore;
  final AccelerometerStore accelerometerStore;
  final ValueChanged<AbstractCard?> onCardSelected;
  final ValueChanged<int> onCarouselScroll;
  final int index;
  final BarModel bar;

  @override
  Widget build(BuildContext context) {
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
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
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
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                        color: Colors.grey.withOpacity(
                          0.1,
                        ),
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
            padding: const EdgeInsets.only(
              bottom: 30,
            ),
            proxyDecorator: proxyDecorator,
            itemCount: balanceStore.bars.length,
            itemBuilder: (_, index) {
              final item = balanceStore.bars[index];

              return Container(
                key: ValueKey(
                  item.address,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 7,
                    horizontal: 20,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      color: Colors.grey.withOpacity(
                        0.2,
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        item.color.image.image(
                          height: 80,
                        ),
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
                                const Gap(
                                  5,
                                ),
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
                                const Gap(
                                  5,
                                ),
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
                                const Gap(
                                  5,
                                ),
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
                                const Gap(
                                  5,
                                ),
                                Builder(
                                  builder: (context) {
                                    final data = marketPageStore.singleCoin?.result.first;

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
                                        final balance = bar.finalBalance;
                                        if (accelerometerStore.hasPerformedAction) {
                                          return const Text(
                                            r'$*****',
                                            style: TextStyle(
                                              fontSize: 13,
                                              fontFamily: FontFamily.redHatMedium,
                                            ),
                                          );
                                        } else {
                                          return Text(
                                            '\$${myFormat.format((balance ?? 0) / 100000000 * data.price)}',
                                            style: const TextStyle(
                                              fontSize: 13,
                                              fontFamily: FontFamily.redHatMedium,
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
                            const Gap(
                              25,
                            ),
                            Center(
                              child: Icon(
                                Icons.drag_handle,
                                color: Colors.grey.withOpacity(0.5),
                                size: 30,
                              ),
                            ),
                            const Gap(
                              25,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            onReorder: (oldIndex, newIndex) {
              balanceStore.changeBarIndexAndSave(
                oldIndex: oldIndex,
                newIndex: newIndex,
                cardAddress: balanceStore.bars[oldIndex].address,
              );
              onCarouselScroll(
                index,
              );
              onCardSelected(
                balanceStore.bars.elementAtOrNull(
                  index,
                ) as AbstractCard?,
              );
              balanceStore.setBarCurrentIndex(
                index,
              );
            },
            onReorderStart: (val) {
              HapticFeedback.heavyImpact();
            },
          ),
        ),
      ),
    );
  }
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
