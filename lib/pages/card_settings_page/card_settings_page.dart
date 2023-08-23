import 'dart:io';
import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/card_model/card_model.dart';
import '../../providers/screen_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/selected_card_store/selected_card_store.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button.dart';
import 'change_card_color.dart';
import 'change_card_name.dart';
import 'remove_card_modal.dart';

@RoutePage()
class CardSettingsPage extends StatefulWidget {
  const CardSettingsPage({super.key, required this.card});

  final CardModel card;

  @override
  State<CardSettingsPage> createState() => _CardSettingsPageState();
}

final selectedCardStore = SelectedCardStore();

BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

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
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
                Gap(6),
                Text(
                  'Coinplus Bitcoin card',
                  style: TextStyle(fontFamily: FontFamily.redHatLight, fontSize: 14, color: AppColors.primaryTextColor, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            trailing: Assets.icons.edit.image(
              height: 24,
            ),
          ),
          const Gap(16),
          ListTile(
            onTap: () {
              if (Platform.isIOS) {
                Clipboard.setData(
                  ClipboardData(
                    text: widget.card.address.toString(),
                  ),
                ).then(
                  (_) {
                    HapticFeedback.mediumImpact();
                    showTopSnackBar(
                      displayDuration: const Duration(
                        milliseconds: 400,
                      ),
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
                  },
                );
              } else {
                Clipboard.setData(
                  ClipboardData(
                    text: widget.card.address.toString(),
                  ),
                ).then(
                  (_) {
                    HapticFeedback.mediumImpact();
                  },
                );
              }
            },
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Address',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const Gap(6),
                Text(
                  widget.card.address.toString(),
                  style: const TextStyle(fontFamily: FontFamily.redHatLight, fontSize: 14, color: AppColors.primaryTextColor, fontWeight: FontWeight.w600),
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
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                Gap(6),
                Text(
                  '07/06/2023',
                  style: TextStyle(fontFamily: FontFamily.redHatLight, fontSize: 14, color: AppColors.primaryTextColor, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          const Gap(16),
          Divider(
            color: Colors.grey.withOpacity(0.7),
          ),
          const Gap(16),
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Appearance',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                const Gap(6),
                const Text(
                  'Choose a color theme for your card',
                  style: TextStyle(fontFamily: FontFamily.redHatLight, fontSize: 14, color: AppColors.primaryTextColor, fontWeight: FontWeight.w600),
                ),
                const Gap(25),
                ChangeImageColor(
                  card: widget.card,
                ),
              ],
            ),
          ),
          const Gap(30),
          Divider(
            color: Colors.grey.withOpacity(0.7),
          ),
          const Gap(26),
          ListTile(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.transparent,
                builder: (context) {
                  return RemoveCard(
                    card: widget.card,
                  );
                },
              );
            },
            trailing: Assets.icons.trash.image(
              height: 24,
            ),
            title: const Text(
              'Remove card',
              style: TextStyle(
                fontFamily: FontFamily.redHatMedium,
                color: Color(0xFFFD5340),
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
          const Spacer(),
          LoadingButton(
            onPressed: () {
              _balanceStore.saveSelectedCard();
              router.pop();
            },
            child: const Text(
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
