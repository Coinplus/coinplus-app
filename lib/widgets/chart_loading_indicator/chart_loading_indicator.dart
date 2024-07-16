import 'package:flutter/material.dart';

import '../../pages/coin_chart_page/coin_chart_page.dart';

class ChartLoadingIndicator extends StatelessWidget {
  const ChartLoadingIndicator({
    super.key,
    required this.widget,
  });

  final CoinChartPage widget;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Center(
        child: CircularProgressIndicator(
          color: widget.data!.symbol == 'BTC'
              ? const Color(0xFFf7931a)
              : widget.data!.symbol == 'ETH'
                  ? const Color(0xFF7588C8)
                  : widget.data!.symbol == 'USDT'
                      ? const Color(0xFF2ea07b)
                      : widget.data!.symbol == 'BNB'
                          ? const Color(0xFFF3BA2F)
                          : widget.data!.symbol == 'SOL'
                              ? const Color(0xFF9945FF)
                              : widget.data!.symbol == 'USDC'
                                  ? const Color(0xFF2775ca)
                                  : widget.data!.symbol == 'STETH'
                                      ? const Color(0xFF749EED)
                                      : widget.data!.symbol == 'XRP'
                                          ? const Color(
                                              0xFF2f2c56,
                                            )
                                          : widget.data!.symbol == 'TON'
                                              ? const Color(
                                                  0xFF3887E6,
                                                )
                                              : widget.data!.symbol == 'DOGE'
                                                  ? const Color(
                                                      0xFFe1b303,
                                                    )
                                                  : const Color(
                                                      0xFFFD5340,
                                                    ).withOpacity(
                                                      0.7,
                                                    ),
        ),
      ),
    );
  }
}
