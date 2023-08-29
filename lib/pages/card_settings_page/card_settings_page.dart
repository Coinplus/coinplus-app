import 'dart:io';
import 'dart:math';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../constants/card_color.dart';
import '../../extensions/context_extension.dart';
import '../../extensions/widget_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/card_model/card_model.dart';
import '../../providers/screen_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/card_color_state/card_setting_state.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button.dart';
import 'change_card_name.dart';
import 'remove_card_modal.dart';

@RoutePage()
class CardSettingsPage extends StatefulWidget {
  const CardSettingsPage({super.key, required this.card});

  final CardModel card;

  @override
  State<CardSettingsPage> createState() => _CardSettingsPageState();
}

BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

class _CardSettingsPageState extends State<CardSettingsPage> {
  late CardSettingState _cardSettingsState =
      CardSettingState(card: widget.card);

  @override
  void initState() {
    _cardSettingsState = CardSettingState(card: widget.card);
    super.initState();
  }

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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              onTap: () {
                showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return CardNameChangeModal(
                      card: widget.card,
                    );
                  },
                );
              },
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Card name',
                    style: TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const Gap(6),
                  Text(
                    widget.card.cardName.toString(),
                    style: const TextStyle(
                      fontFamily: FontFamily.redHatLight,
                      fontSize: 14,
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
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
                    style: const TextStyle(
                      fontFamily: FontFamily.redHatLight,
                      fontSize: 14,
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              trailing: Assets.icons.contentCopy.image(
                height: 24,
              ),
            ),
            const Gap(16),
            ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Date added',
                    style: TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                  const Gap(6),
                  Text(
                    widget.card.cardAddedDate.toString(),
                    style: const TextStyle(
                      fontFamily: FontFamily.redHatLight,
                      fontSize: 14,
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
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
                    style: TextStyle(
                      fontFamily: FontFamily.redHatLight,
                      fontSize: 14,
                      color: AppColors.primaryTextColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Gap(25),
                  Observer(
                    builder: (_) {
                      final colorWidgets = <Widget>[];

                      final colors = <CardColor>[
                        CardColor.ORANGE,
                        CardColor.WHITE,
                        CardColor.BROWN,
                      ];

                      for (var index = 0; index < colors.length; index++) {
                        colorWidgets.add(
                          ScaleTap(
                            enableFeedback: false,
                            onPressed: () {
                              HapticFeedback.selectionClick();
                              _cardSettingsState.changeColor(colors[index]);
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      width: 2,
                                      color: _cardSettingsState.selectedColor ==
                                              colors[index]
                                          ? Colors.blue
                                          : Colors.transparent,
                                    ),
                                  ),
                                  child: getColorImage(colors[index]),
                                ),
                                Radio(
                                  activeColor: AppColors.secondaryButtons,
                                  value: index,
                                  groupValue: colors.indexOf(
                                    _cardSettingsState.selectedColor,
                                  ),
                                  onChanged: (selectedIndex) {
                                    _cardSettingsState
                                        .changeColor(colors[selectedIndex!]);
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: colorWidgets,
                      );
                    },
                  ),
                ],
              ),
            ),
            const Gap(30),
            Divider(
              color: Colors.grey.withOpacity(0.7),
            ),
            const Gap(20),
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
            const Gap(20),
            LoadingButton(
              onPressed: () async {
                if (_cardSettingsState.selectedColor == CardColor.ORANGE) {
                  _balanceStore.changeCardColorAndSave(
                    cardAddress: widget.card.address,
                    color: CardColor.ORANGE,
                  );
                } else if (_cardSettingsState.selectedColor ==
                    CardColor.WHITE) {
                  _balanceStore.changeCardColorAndSave(
                    cardAddress: widget.card.address,
                    color: CardColor.WHITE,
                  );
                } else if (_cardSettingsState.selectedColor ==
                    CardColor.BROWN) {
                  _balanceStore.changeCardColorAndSave(
                    cardAddress: widget.card.address,
                    color: CardColor.BROWN,
                  );
                }
                await router.pop();
                await _balanceStore.getCardsInfo();
                showTopSnackBar(
                  displayDuration: const Duration(
                    milliseconds: 600,
                  ),
                  Overlay.of(context),
                  const CustomSnackBar.success(
                    backgroundColor: Color(0xFF4A4A4A),
                    message: 'Your card color was changed',
                    textStyle: TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                );
              },
              child: const Text(
                'Save',
                style: TextStyle(fontFamily: FontFamily.redHatMedium),
              ),
            ).paddingHorizontal(64),
            Gap(max(context.bottomPadding, 50)),
          ],
        ),
      ),
    );
  }
}

Widget getColorImage(CardColor color) {
  switch (color) {
    case CardColor.ORANGE:
      return Assets.images.cardColorOrange.image(height: 130);
    case CardColor.WHITE:
      return Assets.images.cardColorWhite.image(height: 130);
    case CardColor.BROWN:
      return Assets.images.cardColorBrown.image(height: 130);
    default:
      return const SizedBox.shrink();
  }
}
