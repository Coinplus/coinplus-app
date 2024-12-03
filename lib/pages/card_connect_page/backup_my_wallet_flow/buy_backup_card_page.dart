import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../services/cloud_firestore_service.dart';
import '../../../store/balance_store/balance_store.dart';

@RoutePage()
class BuyBackupCardPage extends StatelessWidget {
  const BuyBackupCardPage({super.key});

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        iconTheme: const IconThemeData(
          color: AppColors.primary,
        ),
        centerTitle: true,
        title: Row(
          children: [
            IconButton(
              onPressed: router.maybePop,
              icon: Assets.icons.close.image(height: 30),
              splashRadius: 20,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            const Spacer(),
            const Text(
              'Shop',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                fontSize: 22,
                fontWeight: FontWeight.w700,
                color: AppColors.primary,
              ),
            ),
            const Gap(50),
            const Spacer(),
          ],
        ),
      ),
      body: FutureBuilder(
        future: getBuyBackupData(),
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
