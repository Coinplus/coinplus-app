import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';

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
            onTap: () => {},
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
