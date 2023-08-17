import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../widgets/loading_button.dart';
import 'change_card_color.dart';

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
            onTap: () {},
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
                  'Coinplus virtual card',
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
                showTopSnackBar(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  displayDuration: const Duration(milliseconds: 400),
                  Overlay.of(context),
                  const CustomSnackBar.success(
                    backgroundColor: Colors.grey,
                    icon: Icon(
                      Icons.check,
                      size: 40,
                      color: Colors.transparent,
                    ),
                    iconPositionLeft: 20,
                    iconRotationAngle: 0,
                    message: 'Address copied to clipboard',
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
