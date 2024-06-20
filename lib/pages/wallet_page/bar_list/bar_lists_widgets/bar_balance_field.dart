import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

import '../../../../extensions/extensions.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../models/amplitude_event/amplitude_event.dart';
import '../../../../models/bar_model/bar_model.dart';
import '../../../../services/amplitude_service.dart';
import '../../../../services/ramp_service.dart';
import '../../../../store/accelerometer_store/accelerometer_store.dart';
import '../../../../store/balance_store/balance_store.dart';
import '../../../../store/market_page_store/market_page_store.dart';
import '../../../../utils/wallet_activation_status.dart';

class BarBalanceField extends StatelessWidget {
  const BarBalanceField({
    super.key,
    required this.balanceStore,
    required this.index,
    required this.rampService,
    required this.bar,
    required this.marketPageStore,
    required this.accelerometerStore,
  });

  final BalanceStore balanceStore;
  final RampService rampService;
  final MarketPageStore marketPageStore;
  final AccelerometerStore accelerometerStore;
  final int index;
  final BarModel bar;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ScaleTap(
          enableFeedback: false,
          opacityMinValue: .98,
          scaleMinValue: .98,
          onPressed: balanceStore.barCurrentIndex == index
              ? () async {
                  final isActivated = isBarWalletActivated(
                    balanceStore: balanceStore,
                  );
                  await recordAmplitudeEvent(
                    TopUpButtonClicked(
                      walletType: 'Bar',
                      walletAddress: bar.address,
                      activated: await isActivated,
                    ),
                  );
                  rampService.presentRamp();
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
                          final data = marketPageStore.singleCoin?.result.first;
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
                          final balance = bar.finalBalance;
                          return Observer(
                            builder: (_) {
                              if (accelerometerStore.hasPerformedAction) {
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
                                  '\$${myFormat.format((balance ?? 0) / 100000000 * data.price)}',
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
                  Assets.icons.alternative.image(
                    height: 48,
                  ),
                ],
              ),
            ),
          ).paddingHorizontal(37),
        );
      },
    );
  }
}
