import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gaimon/gaimon.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../all_alert_dialogs/maybe_coinplus_card/maybe_coinplus_card.dart';
import '../../constants/card_color.dart';
import '../../constants/card_type.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../extensions/num_extension.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';
import '../../services/cloud_firestore_service.dart';
import '../../store/accelerometer_store/accelerometer_store.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/history_page_store/history_page_store.dart';
import '../../utils/card_nfc_session.dart';
import '../../utils/data_utils.dart';
import '../../utils/secure_storage_utils.dart';
import '../../utils/storage_utils.dart';
import '../../widgets/loading_button/loading_button.dart';

class PrimaryCardSelectionModal extends HookWidget {
  const PrimaryCardSelectionModal({super.key, this.isFromManualPage = false, required this.backupWalletAddress});

  final bool isFromManualPage;
  final String backupWalletAddress;

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  HistoryPageStore get _historyPageStore => GetIt.I<HistoryPageStore>();

  AccelerometerStore get _accelerometerStore => GetIt.I<AccelerometerStore>();

  @override
  Widget build(BuildContext context) {
    final _secureStorage = SecureStorageService();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(12),
        Assets.icons.notch.image(height: 4),
        const Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: const Text(
            'Backup card',
            style: TextStyle(
              fontFamily: FontFamily.redHatMedium,
              fontSize: 17,
              color: AppColors.primary,
              fontWeight: FontWeight.w700,
            ),
          ).expandedHorizontally(),
        ),
        const Gap(4),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Text(
            'This is a backup card. Please choose the primary wallet you’d like to back up or connect a new wallet to proceed.',
            style: TextStyle(fontFamily: FontFamily.redHatMedium, fontSize: 14, color: AppColors.textHintsColor),
          ),
        ),
        const Gap(24),
        SizedBox(
          height: 300,
          child: ListView.separated(
            itemCount: _balanceStore.cards.where((card) => card.label == WalletType.COINPLUS_WALLET).length,
            separatorBuilder: (_, __) {
              return const SizedBox(height: 25);
            },
            itemBuilder: (context, index) {
              final coinplusCards =
                  _balanceStore.cards.where((card) => card.label == WalletType.COINPLUS_WALLET).toList();
              final card = coinplusCards[index];

              return ScaleTap(
                enableFeedback: false,
                onPressed: card.hasBackedUp
                    ? null
                    : () async {
                        final isCardActivated = await _secureStorage.checkWalletStatus(card.address);
                        final cardData = await getCardData(card.address);
                        if (card.hasBackedUp) {
                        } else if (cardData != null) {
                          await router.maybePop();
                          await _balanceStore.setMainWalletAddress(walletAddress: card.address);
                          await _historyPageStore.setCardActivationIndex(index: index);
                          if (isCardActivated) {
                            await _balanceStore.getSelectedBackupCard(backupWalletAddress);
                            _balanceStore.saveSelectedBackupCard(
                              color: CardColor.BACKUP,
                            );
                            await StorageUtils.saveMainAndBackupCard(
                              mainCardAddress: _balanceStore.mainWalletAddress,
                              backupCard: _balanceStore.selectedBackupCard!,
                            );
                            _balanceStore.changeCardBackupStatusAndSave(
                              cardAddress: _balanceStore.mainWalletAddress,
                              hasBackedUp: true,
                            );
                            await _secureStorage.setBackupStatus(
                              isSet: true,
                              address: _balanceStore.mainWalletAddress,
                            );
                            Gaimon.success();
                            await router.push(
                              SecretSuccess(
                                walletAddress: _balanceStore.mainWalletAddress,
                                initialPageIndex: 1,
                              ),
                            );

                            await addBackupAddressToDb(
                              mainWalletAddress: _balanceStore.mainWalletAddress,
                              backupWalletAddress: _balanceStore.selectedBackupCard!.address,
                            );
                            await updateCardHasBackupStatus(
                              cardAddress: _balanceStore.mainWalletAddress,
                              hasBackupStatus: true,
                            );
                          } else {
                            await router.push(
                              BackupMyWalletRoute(
                                walletAddress: card.address,
                                backupPack: cardData.backupPack ?? false,
                                isWalletActivated: isCardActivated,
                                cardColor: cardData.color ?? '0',
                              ),
                            );
                          }
                        } else {
                          await maybeCoinplusCard(context);
                        }
                      },
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: card.color.image.image(height: 40),
                      ),
                      const Gap(12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            card.name,
                            style: const TextStyle(
                              fontFamily: FontFamily.redHatMedium,
                              fontSize: 15,
                              color: AppColors.primary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            getSplitAddress(card.address),
                            style: const TextStyle(
                              fontFamily: FontFamily.redHatMedium,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textHintsColor,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      if (card.hasBackedUp)
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: Colors.black.withOpacity(0.6),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(6),
                                  child: Row(
                                    children: [
                                      Assets.icons.backedUpIcon.image(height: 24),
                                      const Gap(5),
                                      const Text(
                                        'Backed up',
                                        style: TextStyle(
                                          fontFamily: FontFamily.redHatMedium,
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Observer(
                            builder: (context) {
                              final myFormat = NumberFormat.decimalPatternDigits(
                                locale: 'en_us',
                                decimalDigits: 2,
                              );
                              return AnimatedSwitcher(
                                duration: const Duration(milliseconds: 400),
                                child: _balanceStore.btcPrice == null || _balanceStore.cardMapResult == null
                                    ? const Padding(
                                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
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
                                                  '\$${myFormat.format(card.finalBalance! / 100000000 * _balanceStore.btcPrice!)}',
                                                  style: const TextStyle(
                                                    fontFamily: FontFamily.redHatMedium,
                                                    color: AppColors.primary,
                                                    fontSize: 15,
                                                  ),
                                                ),
                                                Text(
                                                  'BTC ${card.finalBalance?.satoshiToBtc()}',
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
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const Gap(20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64),
          child: LoadingButton(
            style: context.theme
                .buttonStyle(
                  textStyle: const TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    color: AppColors.primaryTextColor,
                    fontSize: 15,
                  ),
                )
                .copyWith(),
            onPressed: () async {
              await router.maybePop();
              await nfcSessionIos(isFromBackupConnect: true);
            },
            child: const Text(
              'Add new',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        const Gap(40),
      ],
    );
  }
}
