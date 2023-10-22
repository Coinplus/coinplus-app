import 'package:auto_route/annotations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';

@RoutePage()
class SettingsPage extends HookWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          const CupertinoSliverNavigationBar(
            border: Border(),
            stretch: true,
            transitionBetweenRoutes: false,
            backgroundColor: Colors.transparent,
            brightness: Brightness.light,
            largeTitle: Text(
              'Settings',
              style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
                fontFamily: FontFamily.redHatMedium,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(15),
                const Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Text(
                    'Security',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: FontFamily.redHatMedium,
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Gap(14),
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
                          onTap: () {},
                          splashFactory: InkSparkle.splashFactory,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            minLeadingWidth: 10,
                            trailing: CupertinoSwitch(
                              value: true,
                              onChanged: (value) {},
                            ),
                            leading: Padding(
                              padding: const EdgeInsets.only(right: 3, left: 3),
                              child: Assets.icons.lock.image(
                                height: 22,
                              ),
                            ),
                            title: const Text(
                              'App Lock',
                              style: TextStyle(
                                fontFamily: FontFamily.redHatMedium,
                                fontSize: 15,
                                color: AppColors.primaryTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          indent: 5,
                          endIndent: 5,
                          thickness: 1,
                          color: AppColors.silver,
                        ),
                        InkWell(
                          onTap: () {
                            router.push(const CustomPinCodeRoute());
                          },
                          splashFactory: InkSparkle.splashFactory,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            trailing: Assets.icons.arrowForwardIos.image(
                              height: 20,
                            ),
                            splashColor: Colors.transparent,
                            minLeadingWidth: 10,
                            leading: Assets.icons.password.image(
                              height: 22,
                            ),
                            title: const Text(
                              'Change passcode',
                              style: TextStyle(
                                fontFamily: FontFamily.redHatMedium,
                                fontSize: 15,
                                color: AppColors.primaryTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          indent: 0,
                          endIndent: 0,
                          thickness: 1,
                          color: AppColors.silver,
                        ),
                        InkWell(
                          onTap: () {},
                          splashFactory: InkSparkle.splashFactory,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            splashColor: Colors.transparent,
                            minLeadingWidth: 10,
                            trailing: CupertinoSwitch(
                              value: true,
                              onChanged: (value) {},
                            ),
                            leading: Assets.icons.faceIdSettings.image(
                              height: 22,
                            ),
                            title: const Text(
                              'Face ID',
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
                const Gap(20),
                const Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Text(
                    'Notifications',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: FontFamily.redHatMedium,
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Gap(14),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Card(
                    color: const Color(0xFFF7F7FA),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    clipBehavior: Clip.hardEdge,
                    child: InkWell(
                      onTap: () {},
                      splashFactory: InkSparkle.splashFactory,
                      highlightColor: Colors.transparent,
                      child: ListTile(
                        minLeadingWidth: 10,
                        trailing: CupertinoSwitch(
                          value: true,
                          onChanged: (value) {},
                        ),
                        leading: Assets.icons.notifications.image(
                          height: 22,
                        ),
                        title: const Text(
                          'Push notifications',
                          style: TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 15,
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Gap(20),
                const Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Text(
                    'Help & Support',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: FontFamily.redHatMedium,
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Gap(14),
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
                          onTap: () {},
                          splashFactory: InkSparkle.splashFactory,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            trailing:
                                Assets.icons.arrowForwardIos.image(height: 20),
                            minLeadingWidth: 10,
                            leading: Assets.icons.help.image(
                              height: 22,
                            ),
                            title: const Text(
                              'Help center',
                              style: TextStyle(
                                fontFamily: FontFamily.redHatMedium,
                                fontSize: 15,
                                color: AppColors.primaryTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          indent: 0,
                          endIndent: 0,
                          thickness: 1,
                          color: AppColors.silver,
                        ),
                        InkWell(
                          onTap: () {
                            router.push(const ContactUs());
                          },
                          splashFactory: InkSparkle.splashFactory,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            trailing:
                                Assets.icons.arrowForwardIos.image(height: 20),
                            minLeadingWidth: 10,
                            leading: Assets.icons.contactUs.image(
                              height: 22,
                            ),
                            title: const Text(
                              'Contact us',
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
                const Gap(20),
                const Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Text(
                    'Join community',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: FontFamily.redHatMedium,
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Gap(14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScaleTap(
                      onPressed: () {},
                      enableFeedback: false,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          color: const Color(0xFFF7F7FA),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Assets.icons.twitter.image(height: 25),
                          ),
                        ),
                      ),
                    ),
                    const Gap(12),
                    ScaleTap(
                      onPressed: () {},
                      enableFeedback: false,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          color: const Color(0xFFF7F7FA),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Assets.icons.discord.image(height: 25),
                          ),
                        ),
                      ),
                    ),
                    const Gap(12),
                    ScaleTap(
                      onPressed: () {},
                      enableFeedback: false,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          color: const Color(0xFFF7F7FA),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Assets.icons.reddit.image(height: 25),
                          ),
                        ),
                      ),
                    ),
                    const Gap(12),
                    ScaleTap(
                      onPressed: () {},
                      enableFeedback: false,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Container(
                          color: const Color(0xFFF7F7FA),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Assets.icons.star.image(height: 25),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                const Padding(
                  padding: EdgeInsets.only(left: 35),
                  child: Text(
                    'About',
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: FontFamily.redHatMedium,
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Gap(14),
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
                            final url = Uri.parse(
                              'https://coinplus.com/privacy-policy/',
                            );
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            }
                          },
                          splashFactory: InkSparkle.splashFactory,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            trailing:
                                Assets.icons.arrowForwardIos.image(height: 20),
                            minLeadingWidth: 10,
                            leading: Assets.icons.privacy.image(
                              height: 22,
                            ),
                            title: const Text(
                              'Privacy policy',
                              style: TextStyle(
                                fontFamily: FontFamily.redHatMedium,
                                fontSize: 15,
                                color: AppColors.primaryTextColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          indent: 0,
                          endIndent: 0,
                          thickness: 1,
                          color: AppColors.silver,
                        ),
                        InkWell(
                          onTap: () async {
                            final url =
                                Uri.parse('https://coinplus.com/terms-of-use/');
                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            }
                          },
                          splashFactory: InkSparkle.splashFactory,
                          highlightColor: Colors.transparent,
                          child: ListTile(
                            trailing:
                                Assets.icons.arrowForwardIos.image(height: 20),
                            minLeadingWidth: 10,
                            leading: Assets.icons.terms.image(
                              height: 22,
                            ),
                            title: const Text(
                              'Terms of use',
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
                const Gap(100),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => const SettingsPage());
  }
}
