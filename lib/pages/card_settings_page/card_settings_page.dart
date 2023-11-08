import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:local_auth/local_auth.dart';
import 'package:styled_text/styled_text.dart';
import 'package:url_launcher/url_launcher.dart';

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
import '../../utils/secure_storage_utils.dart';
import '../../widgets/custom_snack_bar/snack_bar.dart';
import '../../widgets/custom_snack_bar/top_snack.dart';
import '../../widgets/loading_button.dart';
import '../splash_screen/background.dart';
import 'change_card_name.dart';
import 'remove_card_modal.dart';

@RoutePage()
class CardSettingsPage extends HookWidget {
  const CardSettingsPage({super.key, required this.card});

  final CardModel card;

  @override
  Widget build(BuildContext context) {
    useAutomaticKeepAlive();
    final _cardSettingsState = useMemoized(() => CardSettingState(card: card));
    final _balanceStore = useMemoized(() => GetIt.I<BalanceStore>());
    final _isPinSet = getIsPinCodeSet();
    final _auth = LocalAuthentication();

    final isInactive = useState(false);
    final appLocked = useState(false);
    final isBiometricsRunning = useState(false);

    useOnAppLifecycleStateChange((previous, current) async {
      appLocked.value = await getIsPinCodeSet();
      isInactive.value = [AppLifecycleState.inactive].contains(current);
    });

    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: const Text(
              'Card settings',
              style: TextStyle(
                fontSize: 17,
                fontFamily: FontFamily.redHatMedium,
              ),
            ),
          ),
          body: Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return CardNameChangeModal(
                            card: card,
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
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                        const Gap(6),
                        Text(
                          card.name,
                          style: const TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 14,
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.w300,
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
                            text: card.address.toString(),
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
                            text: card.address.toString(),
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
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        const Gap(6),
                        Text(
                          card.address.toString(),
                          style: const TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 14,
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    trailing: Assets.icons.contentCopy.image(
                      height: 24,
                    ),
                  ),
                  FutureBuilder(
                    future: getPrivateKeyFromStorage(key: card.address),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        return Observer(
                          builder: (context) {
                            return Column(
                              children: [
                                const Gap(16),
                                ListTile(
                                  trailing: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Gap(13),
                                      if (_cardSettingsState
                                          .isPrivateKeyVisible)
                                        Assets.icons.contentCopy.image(
                                          height: 24,
                                        )
                                      else
                                        Assets.icons.show.image(
                                          height: 24,
                                          color: AppColors.textHintsColor,
                                        ),
                                    ],
                                  ),
                                  onLongPress: () async {
                                    await HapticFeedback.selectionClick();
                                    if (await _isPinSet) {
                                      isBiometricsRunning.value = true;
                                      final isAuthorized =
                                          await _auth.authenticate(
                                        localizedReason:
                                            'Authenticate using Face ID',
                                      );
                                      if (isAuthorized) {
                                        _cardSettingsState.makePrivateVisible();
                                      }
                                    }
                                  },
                                  onTap: () {
                                    _cardSettingsState.isPrivateKeyVisible
                                        ? Clipboard.setData(
                                            ClipboardData(
                                              text: snapshot.data.toString(),
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
                                                      const Color(0xFF4A4A4A)
                                                          .withOpacity(0.9),
                                                  message:
                                                      'Private key was copied',
                                                  textStyle: const TextStyle(
                                                    fontFamily:
                                                        FontFamily.redHatMedium,
                                                    fontSize: 14,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              );
                                            },
                                          )
                                        : showTopSnackBar(
                                            displayDuration: const Duration(
                                              milliseconds: 400,
                                            ),
                                            Overlay.of(context),
                                            CustomSnackBar.success(
                                              backgroundColor:
                                                  const Color(0xFF4A4A4A)
                                                      .withOpacity(0.9),
                                              message:
                                                  'Hold to reveal your Private key',
                                              textStyle: const TextStyle(
                                                fontFamily:
                                                    FontFamily.redHatMedium,
                                                fontSize: 14,
                                                color: Colors.white,
                                              ),
                                            ),
                                          );
                                  },
                                  title: Observer(
                                    builder: (context) {
                                      return Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Private key',
                                            style: TextStyle(
                                              fontFamily:
                                                  FontFamily.redHatMedium,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              color: AppColors.primaryTextColor,
                                            ),
                                          ),
                                          const Gap(6),
                                          if (_cardSettingsState
                                              .isPrivateKeyVisible)
                                            Container(
                                              padding: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey
                                                      .withOpacity(0.1),
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Text(
                                                snapshot.data.toString(),
                                                style: const TextStyle(
                                                  fontFamily:
                                                      FontFamily.redHatMedium,
                                                  fontSize: 14,
                                                  color: AppColors
                                                      .primaryTextColor,
                                                  fontWeight: FontWeight.w300,
                                                ),
                                              ),
                                            )
                                          else
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: ImageFiltered(
                                                imageFilter: ImageFilter.blur(
                                                  sigmaX: 5,
                                                  sigmaY: 5,
                                                ),
                                                child: Container(
                                                  padding:
                                                      const EdgeInsets.all(5),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10,
                                                    ),
                                                    border: Border.all(
                                                      color: Colors.grey
                                                          .withOpacity(0.1),
                                                    ),
                                                  ),
                                                  child: const Text(
                                                    'L24hTctc4WlPBJwyP8EzBogNhm2y7EUjkHpVBFD9rhYT5PLoTuY6',
                                                    style: TextStyle(
                                                      fontFamily: FontFamily
                                                          .redHatMedium,
                                                      fontSize: 14,
                                                      color: AppColors
                                                          .textHintsColor,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: ScaleTap(
                                    enableFeedback: false,
                                    onPressed: () async {
                                      final url = Uri.parse(
                                        'https://coinplus.gitbook.io/help-center/getting-started/how-to-send-crypto-from-the-coinplus-wallet',
                                      );
                                      if (await canLaunchUrl(url)) {
                                        await launchUrl(url);
                                      }
                                    },
                                    child: StyledText(
                                      text:
                                          'If you dont know what to do with this Private key, please checkout our <p>Help center</p> article.',
                                      tags: {
                                        'p': StyledTextTag(
                                          style: const TextStyle(
                                            fontFamily: FontFamily.redHatMedium,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 14,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      },
                                      style: const TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        return const SizedBox();
                      }
                    },
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
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        const Gap(6),
                        Text(
                          card.createdAt,
                          style: const TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 14,
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),
                  Divider(
                    indent: 5,
                    endIndent: 5,
                    color: Colors.grey.withOpacity(0.2),
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
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        const Gap(6),
                        const Text(
                          'Choose a color theme for your card',
                          style: TextStyle(
                            fontFamily: FontFamily.redHatMedium,
                            fontSize: 14,
                            color: AppColors.primaryTextColor,
                            fontWeight: FontWeight.w300,
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

                            for (var index = 0;
                                index < colors.length;
                                index++) {
                              colorWidgets.add(
                                ScaleTap(
                                  enableFeedback: false,
                                  onPressed: () {
                                    HapticFeedback.selectionClick();
                                    _cardSettingsState
                                      ..changeColor(colors[index])
                                      ..colorState();
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            width: 2,
                                            color: _cardSettingsState
                                                        .selectedColor ==
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
                                          _cardSettingsState.changeColor(
                                            colors[selectedIndex!],
                                          );
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
                  const Gap(10),
                  Divider(
                    indent: 5,
                    endIndent: 5,
                    color: Colors.grey.withOpacity(0.2),
                  ),
                  const Gap(10),
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
                          return RemoveCard(
                            card: card,
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
                  const Gap(10),
                  Observer(
                    builder: (context) {
                      return LoadingButton(
                        onPressed: _cardSettingsState.isColorChanged
                            ? () async {
                                if (_cardSettingsState.selectedColor ==
                                    CardColor.ORANGE) {
                                  _balanceStore.changeCardColorAndSave(
                                    cardAddress: card.address,
                                    color: CardColor.ORANGE,
                                  );
                                  showTopSnackBar(
                                    displayDuration: const Duration(
                                      milliseconds: 600,
                                    ),
                                    Overlay.of(context),
                                    CustomSnackBar.success(
                                      backgroundColor: const Color(0xFF4A4A4A)
                                          .withOpacity(0.9),
                                      message: 'Your card color was changed',
                                      textStyle: const TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                } else if (_cardSettingsState.selectedColor ==
                                    CardColor.WHITE) {
                                  _balanceStore.changeCardColorAndSave(
                                    cardAddress: card.address,
                                    color: CardColor.WHITE,
                                  );
                                  showTopSnackBar(
                                    displayDuration: const Duration(
                                      milliseconds: 600,
                                    ),
                                    Overlay.of(context),
                                    CustomSnackBar.success(
                                      backgroundColor: const Color(0xFF4A4A4A)
                                          .withOpacity(0.9),
                                      message: 'Your card color was changed',
                                      textStyle: const TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                } else if (_cardSettingsState.selectedColor ==
                                    CardColor.BROWN) {
                                  _balanceStore.changeCardColorAndSave(
                                    cardAddress: card.address,
                                    color: CardColor.BROWN,
                                  );
                                  showTopSnackBar(
                                    displayDuration: const Duration(
                                      milliseconds: 600,
                                    ),
                                    Overlay.of(context),
                                    CustomSnackBar.success(
                                      backgroundColor: const Color(0xFF4A4A4A)
                                          .withOpacity(0.9),
                                      message: 'Your card color was changed',
                                      textStyle: const TextStyle(
                                        fontFamily: FontFamily.redHatMedium,
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                  );
                                }
                                await router.pop();
                                await _balanceStore.getCardsInfo();
                              }
                            : null,
                        child: const Text(
                          'Save',
                          style: TextStyle(fontFamily: FontFamily.redHatMedium),
                        ),
                      ).paddingHorizontal(64);
                    },
                  ),
                  Gap(max(context.bottomPadding, 50)),
                ],
              ),
            ),
          ),
        ),
        Visibility(
          visible: isInactive.value && appLocked.value,
          child: !isBiometricsRunning.value
              ? const Background()
              : const SizedBox(),
        ),
      ],
    );
  }
}

Widget getColorImage(CardColor color) {
  switch (color) {
    case CardColor.ORANGE:
      return Assets.images.orangeCardFront.image(height: 130);
    case CardColor.WHITE:
      return Assets.images.whiteCardFront.image(height: 130);
    case CardColor.BROWN:
      return Assets.images.brownCardFront.image(height: 130);
    default:
      return const SizedBox.shrink();
  }
}
