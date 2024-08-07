import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../services/cloud_firestore_service.dart';
import '../../store/balance_store/balance_store.dart';

@RoutePage()
class BuyCardPage extends StatelessWidget {
  const BuyCardPage({super.key});

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

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
        future: getBuyCardData(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Observer(
              builder: (context) {
                return Stack(
                  children: [
                    InAppWebView(
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
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
