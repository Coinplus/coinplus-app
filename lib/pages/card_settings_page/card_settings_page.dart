import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';

import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button.dart';
import 'change_card_color.dart';
import 'change_card_name.dart';

@RoutePage()
class CardSettingsPage extends StatefulWidget {
  const CardSettingsPage({super.key});

  @override
  State<CardSettingsPage> createState() => _CardSettingsPageState();
}

class _CardSettingsPageState extends State<CardSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Card settings',
          style: TextStyle(fontSize: 17),
        ),
      ),
      body: Column(
        children: [
          ListTile(
            onTap: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return const CardNameChangeModal();
                },
              );
            },
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Card name',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 16,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                Gap(6),
                Text(
                  'Coinplus Bitcoin card',
                  style: TextStyle(fontFamily: FontFamily.redHatLight),
                ),
              ],
            ),
            trailing: Assets.icons.edit.image(
              height: 24,
            ),
          ),
          const Gap(16),
          ListTile(
            onTap: () => {
              Clipboard.setData(
                const ClipboardData(
                  text: 'PnP68faffhkss8fsffs6dadadadda',
                ),
              ).then((_) {
                HapticFeedback.mediumImpact();
                showTopSnackBar(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  displayDuration: const Duration(milliseconds: 400),
                  Overlay.of(context),
                  const CustomSnackBar.success(
                    backgroundColor: Color(0xFF4A4A4A),
                    message: 'Address was copied',
                    textStyle: TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                );
              }),
            },
            title: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 16,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                Gap(6),
                Text(
                  'PnP68faffhkss8fsffs6dadadadda',
                  style: TextStyle(fontFamily: FontFamily.redHatLight),
                ),
              ],
            ),
            trailing: Assets.icons.contentCopy.image(
              height: 24,
            ),
          ),
          const Gap(16),
          const ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date added',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 16,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                Gap(6),
                Text(
                  '07/06/2023',
                  style: TextStyle(fontFamily: FontFamily.redHatLight),
                ),
              ],
            ),
          ),
          const Gap(16),
          Divider(
            color: Colors.grey.withOpacity(0.7),
          ),
          const Gap(16),
          const ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Appearance',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 16,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                Gap(6),
                Text(
                  'Choose a color theme for your card',
                  style: TextStyle(fontFamily: FontFamily.redHatLight),
                ),
                Gap(25),
                ImageRadioRow(),
              ],
            ),
          ),
          const Gap(30),
          Divider(
            color: Colors.grey.withOpacity(0.7),
          ),
          const Gap(26),
          ListTile(
            onTap: () {},
            trailing: const Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24,
              color: AppColors.primaryTextColor,
            ),
            title: const Text(
              'Remove card',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                color: AppColors.primaryTextColor,
                fontSize: 16,
              ),
            ),
          ),
          const Spacer(),
          const LoadingButton(
            child: Text(
              'Save',
              style: TextStyle(fontFamily: FontFamily.redHatMedium),
            ),
          ).paddingHorizontal(64),
          Gap(max(context.bottomPadding, 50)),
        ],
      ),
    );
  }
}
