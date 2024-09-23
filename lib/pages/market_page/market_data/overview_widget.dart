import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../gen/fonts.gen.dart';
import '../../../store/market_page_store/market_page_store.dart';
import '../../../utils/number_formatter.dart';

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({super.key});

  MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

  @override
  Widget build(BuildContext context) {
    final bitcoin = _marketPageStore.searchedList[0];
    final ethereum = _marketPageStore.searchedList[1];
    final ton = _marketPageStore.searchedList.firstWhere(
      (item) => item.symbol == 'TON',
    );
    return Column(
      children: [
        const Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 8,
                      spreadRadius: 3,
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    children: [
                      CachedNetworkImage(
                        imageUrl: bitcoin.icon,
                        height: 22,
                        width: 22,
                        placeholder: (context, url) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          height: 22,
                          width: 22,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.3),
                            child: Center(
                              child: Text(
                                bitcoin.symbol,
                                style: const TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 7,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (
                          context,
                          url,
                          error,
                        ) =>
                            const Icon(Icons.error),
                      ),
                      const Gap(5),
                      CryptoPriceFormatter(
                        price: bitcoin.price,
                        isChartPage: false,
                      ),
                      const Gap(15),
                      Container(
                        height: 20,
                        width: 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                      const Gap(15),
                      CachedNetworkImage(
                        imageUrl: ethereum.icon,
                        height: 22,
                        width: 22,
                        placeholder: (context, url) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          height: 22,
                          width: 22,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.3),
                            child: Center(
                              child: Text(
                                ethereum.symbol,
                                style: const TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 7,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (
                          context,
                          url,
                          error,
                        ) =>
                            const Icon(Icons.error),
                      ),
                      const Gap(5),
                      CryptoPriceFormatter(
                        price: ethereum.price,
                        isChartPage: false,
                      ),
                      const Gap(15),
                      Container(
                        height: 20,
                        width: 1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.2),
                        ),
                      ),
                      const Gap(15),
                      CachedNetworkImage(
                        imageUrl: ton.icon,
                        height: 22,
                        width: 22,
                        placeholder: (context, url) => Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          height: 22,
                          width: 22,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.withOpacity(0.3),
                            child: Center(
                              child: Text(
                                ton.symbol,
                                style: const TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  fontSize: 7,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        errorWidget: (
                          context,
                          url,
                          error,
                        ) =>
                            const Icon(Icons.error),
                      ),
                      const Gap(5),
                      CryptoPriceFormatter(
                        price: ton.price,
                        isChartPage: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        // SizedBox(
        //   height: 400,
        //   width: 450,
        //   child: Padding(
        //     padding: const EdgeInsets.all(16),
        //     child: AbsorbPointer(
        //       child: InAppWebView(
        //         initialSettings: InAppWebViewSettings(
        //           underPageBackgroundColor: Colors.white,
        //           transparentBackground: true,
        //           disableVerticalScroll: true,
        //           disableHorizontalScroll: true,
        //         ),
        //         initialData: InAppWebViewInitialData(
        //           data: '''
        //             <!DOCTYPE html>
        //             <html lang="en">
        //             <head>
        //               <meta charset="UTF-8">
        //               <meta name="viewport" content="width=device-width, initial-scale=1.0">
        //               <title>Crypto Fear & Greed Index</title>
        //               <script async src="https://static.coinstats.app/widgets/v5/cs-widget.js"></script>
        //             </head>
        //             <body style="margin:0; padding:0;">
        //               <cs-widget
        //                 type="fear-and-greed"
        //                 theme="light"
        //                 direction="horizontal"
        //                 background="#FFFFFF"
        //                 is-market-sentiment-visible="true"
        //                 is-last-updated-visible="true"
        //                 title-color="#000000"
        //                 chart-indicator-one-color="#F02934"
        //                 chart-indicator-two-color="#F07D29"
        //                 chart-indicator-three-color="#9ACB82"
        //                 chart-indicator-four-color="#34B349"
        //                 subtitle-color="#666666"
        //                 last-updated-color="#666666"
        //                 arrow-color="#D9D9D9">
        //               </cs-widget>
        //             </body>
        //             </html>
        //           ''',
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
