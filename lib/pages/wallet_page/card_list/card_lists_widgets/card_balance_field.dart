import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:get_it/get_it.dart';

import '../../../../constants/card_type.dart';
import '../../../../extensions/extensions.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../models/amplitude_event/amplitude_event_part_one/amplitude_event.dart';
import '../../../../services/amplitude_service.dart';
import '../../../../services/ramp_service.dart';
import '../../../../store/accelerometer_store/accelerometer_store.dart';
import '../../../../store/balance_store/balance_store.dart';
import '../../../send_page/send_to/change_selected_address/change_selected_address_state.dart';

class CardBalanceField extends HookWidget {
  const CardBalanceField({super.key, required this.index});

  final int index;

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  RampService get _rampService => GetIt.I<RampService>();

  AccelerometerStore get _accelerometerStore => GetIt.I<AccelerometerStore>();

  @override
  Widget build(BuildContext context) {
    final state = useMemoized(ChangeSelectedAddressState.new);

    return Observer(
      builder: (_) {
        return ScaleTap(
          onPressed: _balanceStore.cardCurrentIndex == index
              ? () async {
                  await recordAmplitudeEvent(
                    TopUpButtonClicked(
                      walletType: 'Card',
                      walletAddress: state.cards[index].address,
                      activated: false,
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
            child: Platform.isIOS
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: state.cards[index].label == WalletType.COINPLUS_LEGACY_WALLET || state.cards[index].label == WalletType.TRACKER_PLUS
                              ? Colors.grey.withValues(alpha: 0.5)
                              : Colors.black.withValues(
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
                                        child: _balanceStore.btcPrice == null || _balanceStore.cardMapResult == null
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
                                                      '\$${myFormat.format(
                                                        _balanceStore.cardCurrentIndex != _balanceStore.cards.length
                                                            ? (_balanceStore.cards[index].finalBalance ?? 0) /
                                                                100000000 *
                                                                _balanceStore.btcPrice!
                                                            : 0,
                                                      )}',
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
                  )
                : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.black.withValues(
                        alpha: 0.4,
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
                                    child: _balanceStore.btcPrice == null || _balanceStore.cardMapResult == null
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
                                                  '\$${myFormat.format(
                                                    _balanceStore.cardCurrentIndex != _balanceStore.cards.length
                                                        ? (_balanceStore.cards[index].finalBalance ?? 0) /
                                                            100000000 *
                                                            _balanceStore.btcPrice!
                                                        : 0,
                                                  )}',
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
        );
      },
    );
  }
}
