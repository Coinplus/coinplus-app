import 'dart:developer';
import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';

@RoutePage()
class AboutAppPage extends HookWidget {
  const AboutAppPage({super.key});

  Future<void> appReview() async {
    final startTime = Stopwatch()..start();
    final inAppReview = InAppReview.instance;
    if (await inAppReview.isAvailable()) {
      try {
        await inAppReview.requestReview();
      } catch (e) {
        log(e.toString());
      }
    }
    final elapsedMilliseconds = startTime.elapsedMilliseconds;
    if (elapsedMilliseconds > 300) {
      return;
    }
    try {
      if (Platform.isAndroid) {
        await launchUrl(
          Uri.parse(
            'https://play.google.com/store/apps/details?id=com.coinplus.app',
          ),
        );
      }
    } catch (e) {
      log(e.toString());
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
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
                    color: Colors.grey.withValues(alpha: 0.1),
                  ),
                  InkWell(
                    onTap: () async {
                      await router.push(
                        WebViewRoute(
                          link:
                              'https://coinplus.gitbook.io/help-center/faq/how-to-send-crypto-from-the-activated-coinplus-wallet',
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
                    color: Colors.grey.withValues(alpha: 0.1),
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
