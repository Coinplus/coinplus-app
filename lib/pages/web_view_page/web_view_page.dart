import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../gen/colors.gen.dart';
import '../../store/balance_store/balance_store.dart';

@RoutePage()
class WebViewPage extends StatelessWidget {
  const WebViewPage({super.key, required this.link});

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  final String link;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColors.primary),
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialSettings: InAppWebViewSettings(
              underPageBackgroundColor: Colors.white,
              transparentBackground: true,
            ),
            initialUrlRequest: URLRequest(
              httpShouldHandleCookies: false,
              url: WebUri(
                link,
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
      ),
    );
  }
}
