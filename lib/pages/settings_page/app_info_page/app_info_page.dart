import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:gap/gap.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';

@RoutePage()
class AboutAppPage extends HookWidget {
  const AboutAppPage({super.key});

  Future<void> appReview() async {
    final inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      await inAppReview.requestReview();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'About app',
          style: TextStyle(
            fontFamily: FontFamily.redHatMedium,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          const Gap(10),
          Center(
            child: Container(
              height: 100,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Assets.images.appLogo.image(),
              ),
            ),
          ),
          const Gap(10),
          FutureBuilder(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return const SizedBox();
              } else if (snapshot.hasData) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      snapshot.data!.version,
                      style: const TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontSize: 14,
                      ),
                    ),
                    const Gap(3),
                    Text(
                      '(${snapshot.data!.buildNumber})',
                      style: const TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontSize: 14,
                      ),
                    ),
                  ],
                );
              }
              return const CircularProgressIndicator();
            },
          ),
          const Gap(10),
          const Text(
            'Coinplus',
            style: TextStyle(fontSize: 18, fontFamily: FontFamily.redHatMedium),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Card(
              color: const Color(0xFFF7F7FA),
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.hardEdge,
              child: Column(
                children: [
                  InkWell(
                    onTap: () async {
                      await Share.share(
                        'www.coinplus.com',
                      );
                    },
                    splashFactory: InkSparkle.splashFactory,
                    highlightColor: Colors.transparent,
                    child: ListTile(
                      trailing: Assets.icons.arrowForwardIos.image(height: 20),
                      minLeadingWidth: 10,
                      leading: Assets.icons.share.image(
                        color: Colors.blue,
                        height: 24,
                      ),
                      title: const Text(
                        'Share Coinplus',
                        style: TextStyle(
                          fontFamily: FontFamily.redHatMedium,
                          fontSize: 15,
                          color: AppColors.primaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    indent: 0,
                    endIndent: 0,
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  InkWell(
                    onTap: () async {
                      await FlutterWebBrowser.openWebPage(
                        url: 'https://coinplus.com',
                        customTabsOptions: const CustomTabsOptions(
                          shareState: CustomTabsShareState.on,
                          instantAppsEnabled: true,
                          showTitle: true,
                          urlBarHidingEnabled: true,
                        ),
                        safariVCOptions: const SafariViewControllerOptions(
                          barCollapsingEnabled: true,
                          modalPresentationStyle:
                              UIModalPresentationStyle.formSheet,
                          dismissButtonStyle:
                              SafariViewControllerDismissButtonStyle.done,
                          modalPresentationCapturesStatusBarAppearance: true,
                        ),
                      );
                    },
                    splashFactory: InkSparkle.splashFactory,
                    highlightColor: Colors.transparent,
                    child: ListTile(
                      trailing: Assets.icons.arrowForwardIos.image(height: 20),
                      minLeadingWidth: 10,
                      leading: Assets.icons.web.image(
                        height: 22,
                        color: Colors.blue,
                      ),
                      title: const Text(
                        'Coinplus Web',
                        style: TextStyle(
                          fontFamily: FontFamily.redHatMedium,
                          fontSize: 15,
                          color: AppColors.primaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    height: 1,
                    indent: 0,
                    endIndent: 0,
                    thickness: 1,
                    color: Colors.grey.withOpacity(0.1),
                  ),
                  InkWell(
                    onTap: () async {
                      await appReview();
                    },
                    splashFactory: InkSparkle.splashFactory,
                    highlightColor: Colors.transparent,
                    child: ListTile(
                      trailing: Assets.icons.arrowForwardIos.image(height: 20),
                      minLeadingWidth: 10,
                      leading: Assets.icons.rate.image(
                        height: 22,
                        color: Colors.blue,
                      ),
                      title: const Text(
                        'Rate Coinplus',
                        style: TextStyle(
                          fontFamily: FontFamily.redHatMedium,
                          fontSize: 15,
                          color: AppColors.primaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
