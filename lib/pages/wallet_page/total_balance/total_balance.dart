import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../store/accelerometer_store/accelerometer_store.dart';
import '../../../store/balance_store/balance_store.dart';
import '../../../store/market_page_store/market_page_store.dart';

class TotalBalance extends StatelessWidget {
  const TotalBalance({super.key});

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  AccelerometerStore get _accelerometerStore => GetIt.I<AccelerometerStore>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Wallet',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatBold,
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    ),
                    const Gap(14),
                    Assets.icons.coinplusVector.image(
                      height: 26,
                    ),
                  ],
                ),
                const Text(
                  'Total balance',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatLight,
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Gap(5),
              ],
            ),
          ),
          Observer(
            builder: (context) {
              final data = _marketPageStore.singleCoin?.result.first;
              final ethBalance = _balanceStore.allEthCardsBalances;
              final myFormat = NumberFormat.decimalPatternDigits(
                locale: 'en_us',
                decimalDigits: 2,
              );
              final balance = _balanceStore.allCardsBalances;
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                child: data == null || _balanceStore.balanceLoading == true
                    ? const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        child: SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        ),
                      )
                    : Observer(
                        builder: (_) {
                          if (_accelerometerStore.hasPerformedAction) {
                            return const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Center(
                                child: Text(
                                  r'$*****',
                                  style: TextStyle(
                                    fontFamily: FontFamily.redHatBold,
                                    color: Colors.white,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                '\$${myFormat.format((balance / 100000000 * (data.price)) + ethBalance)}',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatBold,
                                  color: Colors.white,
                                  fontSize: balance > 1000000000
                                      ? (balance > 100000000 ? 24 : 26)
                                      : 28,
                                ),
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
    );
  }
}
