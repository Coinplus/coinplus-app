import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/firebase_model/buy_card_model.dart';
import '../../store/balance_store/balance_store.dart';

@RoutePage()
class BuyCardPage extends StatelessWidget {
  const BuyCardPage({super.key, required this.method});

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  final Future<BuyCardModel?> method;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primary),
        title: const Text(
          'Shop',
          style: TextStyle(
            color: AppColors.primary,
            fontFamily: FontFamily.redHatMedium,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: FutureBuilder(
        future: method,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Stack(
              children: [
                InAppWebView(
                  initialSettings: InAppWebViewSettings(
                    underPageBackgroundColor: Colors.white,
                    transparentBackground: true,
                  ),
                  initialUrlRequest: URLRequest(
                    httpShouldHandleCookies: false,
                    url: WebUri(
                      snapshot.data!.link.toString(),
                    ),
                  ),
                  onLoadStart: (_, __) {
                    _balanceStore.webViewStartLoading();
                  },
                  onLoadStop: (_, __) {
                    _balanceStore.webViewStopLoading();
                  },
                ),
                Observer(
                  builder: (_) {
                    return _balanceStore.inAppWebViewLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryButtonColor,
                            ),
                          )
                        : Container();
                  },
                ),
              ],
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
