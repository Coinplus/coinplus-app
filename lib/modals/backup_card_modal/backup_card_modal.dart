import 'dart:async';

import 'package:action_slider/action_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gaimon/gaimon.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../constants/button_settings.dart';
import '../../constants/card_color.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../extensions/num_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../models/abstract_card/abstract_card.dart';
import '../../models/amplitude_event/amplitude_event_part_three/amplitude_event_part_three.dart';
import '../../providers/screen_service.dart';
import '../../services/amplitude_service.dart';
import '../../services/cloud_firestore_service.dart';
import '../../store/accelerometer_store/accelerometer_store.dart';
import '../../store/all_settings_state/all_settings_state.dart';
import '../../store/balance_store/balance_store.dart';
import '../../utils/data_utils.dart';
import '../../utils/secure_storage_utils.dart';
import '../../utils/storage_utils.dart';
import '../../widgets/custom_snack_bar/snack_bar_method.dart';
import '../../widgets/loading_button/loading_button.dart';

BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

AccelerometerStore get _accelerometerStore => GetIt.I<AccelerometerStore>();

final settingsState = AllSettingsState();

final pageIndexNotifier = ValueNotifier(0);

WoltModalSheetPage modalPage1(
  BuildContext modalSheetContext,
  AbstractCard card,
) {
  return WoltModalSheetPage(
    backgroundColor: Colors.white,
    sabGradientColor: Colors.white,
    hasTopBarLayer: false,
    isTopBarLayerAlwaysVisible: true,
    child: Observer(
      builder: (context) {
        final backupCard = _balanceStore.backupCards.firstWhereOrNull(
          (card) => card.address == _balanceStore.backupSingleCard?.address,
        );
        recordAmplitudeEventPartThree(
          BackedUp(
            walletAddress: card.address,
            backupAddress: backupCard?.address ?? '',
          ),
        );
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Gap(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Gap(10),
                  const Text(
                    'Your wallet is securely backed up',
                    style: TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ).expandedHorizontally(),
                  const Gap(4),
                  const Text(
                    'Backup card details',
                    style: TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textHintsColor,
                    ),
                  ).expandedHorizontally(),
                  const Gap(30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Builder(
                      builder: (context) {
                        if (backupCard != null) {
                          return Observer(
                            builder: (context) {
                              return _balanceStore.backupCardLoading
                                  ? const CircularProgressIndicator()
                                  : ScaleTap(
                                      scaleMinValue: 0.98,
                                      enableFeedback: false,
                                      onPressed: () async {
                                        await Clipboard.setData(
                                          ClipboardData(
                                            text: backupCard.address.toString(),
                                          ),
                                        ).then(
                                          (_) {
                                            HapticFeedback.mediumImpact();
                                            settingsState.copyAddress();
                                          },
                                        );
                                        await recordAmplitudeEventPartThree(
                                          CopyBackupAddress(
                                            walletAddress: card.address,
                                            backupAddress: backupCard.address,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(0)),
                                        child: Row(
                                          children: [
                                            backupCard.color.image.image(height: 45),
                                            const Gap(10),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  backupCard.name,
                                                  style: const TextStyle(
                                                    fontFamily: FontFamily.redHatMedium,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors.primary,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                AnimatedCrossFade(
                                                  firstChild: const Row(
                                                    children: [
                                                      Text(
                                                        'Copied',
                                                        style: TextStyle(
                                                          fontFamily: FontFamily.redHatMedium,
                                                          color: Colors.green,
                                                        ),
                                                      ),
                                                      Icon(
                                                        Icons.check,
                                                        color: Colors.green,
                                                        size: 18,
                                                      ),
                                                    ],
                                                  ),
                                                  secondChild: Text(
                                                    getSplitAddress(backupCard.address),
                                                    style: const TextStyle(
                                                      fontFamily: FontFamily.redHatMedium,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w400,
                                                      color: AppColors.textHintsColor,
                                                    ),
                                                  ),
                                                  crossFadeState: settingsState.isAddressCopied
                                                      ? CrossFadeState.showFirst
                                                      : CrossFadeState.showSecond,
                                                  duration: const Duration(
                                                    milliseconds: 200,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Observer(
                                              builder: (context) {
                                                final myFormat = NumberFormat.decimalPatternDigits(
                                                  locale: 'en_us',
                                                  decimalDigits: 2,
                                                );
                                                return AnimatedSwitcher(
                                                  duration: const Duration(
                                                    milliseconds: 400,
                                                  ),
                                                  child: _balanceStore.btcPrice == null ||
                                                          _balanceStore.cardMapResult == null
                                                      ? const Padding(
                                                          padding: EdgeInsets.symmetric(
                                                            vertical: 4,
                                                            horizontal: 2,
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              SizedBox(
                                                                height: 10,
                                                                width: 10,
                                                                child: CircularProgressIndicator(
                                                                  strokeWidth: 3,
                                                                  color: Colors.white,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      : Observer(
                                                          builder: (_) {
                                                            if (_accelerometerStore.hasPerformedAction) {
                                                              return const Text(
                                                                r'$*****',
                                                                style: TextStyle(
                                                                  fontFamily: FontFamily.redHatMedium,
                                                                  fontWeight: FontWeight.w500,
                                                                  color: AppColors.primary,
                                                                  fontSize: 15,
                                                                ),
                                                              );
                                                            } else {
                                                              return Column(
                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                children: [
                                                                  Text(
                                                                    '\$${myFormat.format(backupCard.finalBalance! / 100000000 * _balanceStore.btcPrice!)}',
                                                                    style: const TextStyle(
                                                                      fontFamily: FontFamily.redHatMedium,
                                                                      color: AppColors.primary,
                                                                      fontSize: 15,
                                                                    ),
                                                                  ),
                                                                  Text(
                                                                    'BTC ${backupCard.finalBalance?.satoshiToBtc()}',
                                                                    style: const TextStyle(
                                                                      fontFamily: FontFamily.redHatMedium,
                                                                      color: AppColors.textHintsColor,
                                                                      fontSize: 14,
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            }
                                                          },
                                                        ),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                            },
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  const Gap(32),
                  LoadingButton(
                    onPressed: () {
                      router.maybePop();
                      recordAmplitudeEventPartThree(
                        GotItBackup(walletAddress: card.address, backupAddress: backupCard?.address ?? ''),
                      );
                    },
                    child: const Text(
                      'Got it',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ).paddingHorizontal(60),
                  const Gap(10),
                  LoadingButton(
                    style: context.theme.buttonStyle(
                      buttonType: ButtonTypes.TRANSPARENT,
                    ),
                    onPressed: () async {
                      pageIndexNotifier.value = pageIndexNotifier.value + 1;
                      await recordAmplitudeEventPartThree(
                        RemoveBackup(walletAddress: card.address, backupAddress: backupCard?.address ?? ''),
                      );
                    },
                    child: const Text(
                      'Remove backup',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: FontFamily.redHatMedium,
                        fontWeight: FontWeight.normal,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                  ).paddingHorizontal(60),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );
}

WoltModalSheetPage modalPage2(
  BuildContext modalSheetContext,
  String mainCardAddress,
) {
  final _secureStorage = SecureStorageService();
  return WoltModalSheetPage(
    leadingNavBarWidget: Column(
      children: [
        const Gap(10),
        Row(
          children: [
            Column(
              children: [
                IconButton(
                  padding: const EdgeInsets.all(16),
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () => pageIndexNotifier.value = pageIndexNotifier.value - 1,
                ),
              ],
            ),
            const Row(
              children: [
                Text(
                  'Remove Backup',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Assets.images.card.backupCardFront.image(height: 120),
              const Gap(20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'This will permanently delete your backup from the wallet.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: FontFamily.redHatMedium,
                    color: AppColors.primary,
                  ),
                ),
              ),
              const Gap(20),
              ActionSlider.standard(
                height: 60,
                loadingIcon: Lottie.asset(
                  'assets/lottie_animations/loading_animation.json',
                  repeat: true,
                  height: 30,
                ),
                successIcon: const Icon(
                  Icons.check_rounded,
                  color: Colors.white,
                ),
                action: (controller) async {
                  final backupCard = _balanceStore.backupCards.firstWhereOrNull(
                    (card) => card.address == _balanceStore.backupSingleCard?.address,
                  );
                  controller.loading();
                  await Future.delayed(const Duration(milliseconds: 500));
                  controller.success();
                  await _balanceStore.removeSelectedBackupCard(address: backupCard!.address);
                  await StorageUtils.deleteBackupCard(mainCardAddress);
                  await _secureStorage.deleteBackup(mainCardAddress: mainCardAddress);
                  _balanceStore.changeCardBackupStatusAndSave(cardAddress: mainCardAddress, hasBackedUp: false);
                  unawaited(deleteBackupAddressFromDb(mainWalletAddress: mainCardAddress));
                  unawaited(deletePrimaryAddressFromDb(backupWalletAddress: backupCard.address));
                  unawaited(deletePrimaryWalletColorFromDb(backupWalletAddress: backupCard.address));
                  unawaited(updateCardHasBackupStatus(cardAddress: mainCardAddress, hasBackupStatus: false));
                  await showCustomSnackBar(context: modalSheetContext, message: 'Your backup card was removed');
                  await recordAmplitudeEventPartThree(
                    RemoveBackupConfirm(walletAddress: mainCardAddress, backupAddress: backupCard.address),
                  );
                  await router.maybePop();
                  Gaimon.success();
                },
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.3),
                    blurRadius: 1,
                    spreadRadius: 1,
                  ),
                ],
                toggleColor: Colors.red,
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                child: const Text(
                  'Slide to delete',
                  style: TextStyle(fontFamily: FontFamily.redHatMedium),
                ),
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: LoadingButton(
                  style: modalSheetContext.theme.buttonStyle(
                    buttonType: ButtonTypes.TRANSPARENT,
                  ),
                  onPressed: router.maybePop,
                  child: const Text(
                    'Cancel',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: FontFamily.redHatMedium,
                      fontWeight: FontWeight.normal,
                      color: AppColors.primaryTextColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
