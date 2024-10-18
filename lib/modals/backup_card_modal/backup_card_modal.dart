import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../constants/button_settings.dart';
import '../../constants/card_color.dart';
import '../../extensions/elevated_button_extensions.dart';
import '../../extensions/extensions.dart';
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../store/accelerometer_store/accelerometer_store.dart';
import '../../store/balance_store/balance_store.dart';

// import '../../store/market_page_store/market_page_store.dart';
import '../../utils/data_utils.dart';
import '../../widgets/loading_button/loading_button.dart';
import 'remove_backup_modal.dart';

class MainBackupCardWidget extends StatefulWidget {
  final String mainCardAddress;

  const MainBackupCardWidget({required this.mainCardAddress, Key? key}) : super(key: key);

  @override
  _MainBackupCardWidgetState createState() => _MainBackupCardWidgetState();
}

BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

// MarketPageStore get _marketPageStore => GetIt.I<MarketPageStore>();

AccelerometerStore get _accelerometerStore => GetIt.I<AccelerometerStore>();

class _MainBackupCardWidgetState extends State<MainBackupCardWidget> {
  @override
  void initState() {
    super.initState();
    _balanceStore.loadBackupCard(widget.mainCardAddress);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        final backupCard = _balanceStore.backupCards.firstWhereOrNull(
          (card) => card.address == _balanceStore.backupSingleCard?.address,
        );
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
                      await router.maybePop();
                      await showModalBottomSheet(
                        backgroundColor: Colors.white,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        context: context,
                        builder: (_) {
                          return RemoveBackupCard(
                            cardAddress: widget.mainCardAddress,
                          );
                        },
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
                  const Gap(30),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
