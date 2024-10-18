import 'package:action_slider/action_slider.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gaimon/gaimon.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

import '../../constants/button_settings.dart';
import '../../extensions/context_extension.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../utils/secure_storage_utils.dart';
import '../../utils/storage_utils.dart';
import '../../widgets/custom_snack_bar/snack_bar_method.dart';
import '../../widgets/loading_button/loading_button.dart';

class RemoveBackupCard extends StatelessWidget {
  const RemoveBackupCard({super.key, required this.cardAddress});

  final String cardAddress;

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  @override
  Widget build(BuildContext context) {
    final _secureStorage = SecureStorageService();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(12),
        Assets.icons.notch.image(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Gap(10),
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
              const Gap(27),
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
                direction: TextDirection.rtl,
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
                  await StorageUtils.deleteBackupCard(cardAddress);
                  await _secureStorage.deleteBackup(
                    mainCardAddress: cardAddress,
                  );
                  _balanceStore.changeCardBackupStatusAndSave(
                    cardAddress: cardAddress,
                    hasBackedUp: false,
                  );
                  Gaimon.success();
                  await showCustomSnackBar(
                    context: context,
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
                  Icons.arrow_back_ios_new,
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
                  style: context.theme.buttonStyle(
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
              const Gap(30),
            ],
          ),
        ),
      ],
    );
  }
}
