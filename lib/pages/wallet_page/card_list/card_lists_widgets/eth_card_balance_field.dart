import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:get_it/get_it.dart';

import '../../../../extensions/extensions.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../models/abstract_card/abstract_card.dart';
import '../../../../models/amplitude_event/amplitude_event_part_one/amplitude_event.dart';
import '../../../../services/amplitude_service.dart';
import '../../../../services/ramp_service.dart';
import '../../../../store/accelerometer_store/accelerometer_store.dart';
import '../../../../store/balance_store/balance_store.dart';
import '../../../../utils/wallet_activation_status.dart';

class CardEthBalanceField extends HookWidget {
  const CardEthBalanceField({
    super.key,
    required this.index,
    required this.ethCard,
  });

  final int index;

  final AbstractCard ethCard;

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  RampService get _rampService => GetIt.I<RampService>();

  AccelerometerStore get _accelerometerStore => GetIt.I<AccelerometerStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ScaleTap(
          onPressed: _balanceStore.cardCurrentIndex == index
              ? () async {
                  final isActivated = isEthCardWalletActivated();
                  await recordAmplitudeEvent(
                    TopUpButtonClicked(
                      walletType: 'Card',
                      walletAddress: ethCard.address,
                      activated: await isActivated,
                    ),
                  );
                  _rampService.presentRamp();
                }
              : null,
          enableFeedback: false,
          child: Container(
            height: 60,
            padding: EdgeInsets.symmetric(
              horizontal: context.height > 667 ? context.height * 0.035 : context.height * 0.043,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: Colors.black.withValues(
                      alpha: 0.3,
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
                                final myFormat = NumberFormat.decimalPatternDigits(
                                  locale: 'en_us',
                                  decimalDigits: 2,
                                );
                                return AnimatedSwitcher(
                                  duration: const Duration(milliseconds: 400),
                                  child: _balanceStore.listResult == null
                                      ? const Padding(
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
                                        )
                                      : Observer(
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
                                                '\$${myFormat.format(ethCard.finalBalance)}',
                                                style: const TextStyle(
                                                  fontFamily: FontFamily.redHatMedium,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                ),
                                              );
                                            }
                                          },
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
          ),
        );
      },
    );
  }
}
