import 'package:action_slider/action_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gaimon/gaimon.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../constants/button_settings.dart';
import '../../constants/card_color.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../store/accelerometer_store/accelerometer_store.dart';
import '../../store/balance_store/balance_store.dart';
import '../../utils/data_utils.dart';
import '../../utils/secure_storage_utils.dart';
import '../../utils/storage_utils.dart';
import '../../widgets/custom_snack_bar/snack_bar_method.dart';
import '../../widgets/loading_button/loading_button.dart';

BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

AccelerometerStore get _accelerometerStore => GetIt.I<AccelerometerStore>();

final pageIndexNotifier = ValueNotifier(0);

WoltModalSheetPage modalPage1(
  BuildContext modalSheetContext,
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
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primary,
                    ),
                  ).expandedHorizontally(),
                  const Gap(30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Builder(
                      builder: (context) {
                        if (backupCard != null) {
                          final formattedAddress = getSplitAddress(backupCard.address);
                          return Observer(
                            builder: (context) {
                              return _balanceStore.backupCardLoading
                                  ? const CircularProgressIndicator()
                                  : Row(
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
                                            Text(
                                              formattedAddress,
                                              style: const TextStyle(
                                                fontFamily: FontFamily.redHatMedium,
                                                fontWeight: FontWeight.w500,
                                                color: AppColors.textHintsColor,
                                                fontSize: 14,
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
                                              child:
                                                  _balanceStore.btcPrice == null || _balanceStore.cardMapResult == null
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
                                                              return Text(
                                                                '\$${myFormat.format(backupCard.finalBalance ?? 0 / 100000000 * _balanceStore.btcPrice!)}',
                                                                style: const TextStyle(
                                                                  fontFamily: FontFamily.redHatMedium,
                                                                  color: AppColors.primary,
                                                                  fontSize: 15,
                                                                ),
                                                              );
                                                            }
                                                          },
                                                        ),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                            },
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  const Gap(30),
                  LoadingButton(
                    onPressed: router.maybePop,
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
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
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
                  await Future.delayed(const Duration(seconds: 1));
                  controller.success();
                  await _balanceStore.removeSelectedBackupCard(address: backupCard!.address);
                  await StorageUtils.deleteBackupCard(mainCardAddress);
                  await _secureStorage.deleteBackup(
                    mainCardAddress: mainCardAddress,
                  );
                  _balanceStore.changeCardBackupStatusAndSave(
                    cardAddress: mainCardAddress,
                    hasBackedUp: false,
                  );
                  Gaimon.success();
                  await showCustomSnackBar(
                    context: modalSheetContext,
                    message: 'Your backup card was removed',
                  );
                  await router.maybePop();
                },
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
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
