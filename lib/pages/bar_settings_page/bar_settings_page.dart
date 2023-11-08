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
import '../../models/bar_model/bar_model.dart';
import '../../providers/screen_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/bar_color_state/bar_setting_state.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button.dart';
import 'change_bar_name.dart';
import 'remove_bar_modal.dart';

@RoutePage()
class BarSettingsPage extends StatefulWidget {
  const BarSettingsPage({super.key, required this.bar});

  final BarModel bar;

  @override
  State<BarSettingsPage> createState() => _BarSettingsPageState();
}

BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

class _BarSettingsPageState extends State<BarSettingsPage> {
  late BarSettingState _barSettingsState = BarSettingState(bar: widget.bar);

  @override
  void initState() {
    _barSettingsState = BarSettingState(bar: widget.bar);
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
          'Bar settings',
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
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  isScrollControlled: true,
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return CardNameChangeModal(
                      bar: widget.bar,
                    );
                  },
                );
              },
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Bar name',
                    style: TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  const Gap(6),
                  Text(
                    widget.bar.name.toString(),
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
                      text: widget.bar.address.toString(),
                    ),
                  ).then(
                    (_) {
                      HapticFeedback.mediumImpact();
                      showTopSnackBar(
                        displayDuration: const Duration(
                          milliseconds: 400,
                        ),
                        Overlay.of(context),
                        CustomSnackBar.success(
                          backgroundColor:
                              const Color(0xFF4A4A4A).withOpacity(0.9),
                          message: 'Address was copied',
                          textStyle: const TextStyle(
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
                      text: widget.bar.address.toString(),
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
                    widget.bar.address.toString(),
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
                    widget.bar.createdAt,
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
                    'Choose a color theme for your bar',
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
                        CardColor.SILVER,
                        CardColor.GOLD,
                      ];

                      for (var index = 0; index < colors.length; index++) {
                        colorWidgets.add(
                          ScaleTap(
                            enableFeedback: false,
                            onPressed: () {
                              HapticFeedback.selectionClick();
                              _barSettingsState.changeColor(colors[index]);
                            },
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      width: 2,
                                      color: _barSettingsState.selectedColor ==
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
                                    _barSettingsState.selectedColor,
                                  ),
                                  onChanged: (selectedIndex) {
                                    _barSettingsState
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
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  builder: (context) {
                    return RemoveBar(
                      bar: widget.bar,
                    );
                  },
                );
              },
              trailing: Assets.icons.trash.image(
                height: 24,
              ),
              title: const Text(
                'Remove bar',
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
                if (_barSettingsState.selectedColor == CardColor.SILVER) {
                  _balanceStore.changeBarColorAndSave(
                    barAddress: widget.bar.address,
                    color: CardColor.SILVER,
                  );
                } else if (_barSettingsState.selectedColor == CardColor.GOLD) {
                  _balanceStore.changeBarColorAndSave(
                    barAddress: widget.bar.address,
                    color: CardColor.GOLD,
                  );
                }
                await router.pop();
                await _balanceStore.getCardsInfo();
                showTopSnackBar(
                  displayDuration: const Duration(
                    milliseconds: 600,
                  ),
                  Overlay.of(context),
                  CustomSnackBar.success(
                    backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
                    message: 'Your bar color was changed',
                    textStyle: const TextStyle(
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
    case CardColor.SILVER:
      return Assets.images.barEmpty.image(height: 130);
    case CardColor.GOLD:
      return Assets.images.barEmpty.image(height: 130);
    default:
      throw Exception('color can be used only for card');
  }
}
