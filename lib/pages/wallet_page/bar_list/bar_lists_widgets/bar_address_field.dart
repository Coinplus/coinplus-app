import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../models/amplitude_event/amplitude_event.dart';
import '../../../../models/bar_model/bar_model.dart';
import '../../../../services/amplitude_service.dart';
import '../../../../store/balance_store/balance_store.dart';
import '../../../../utils/data_utils.dart';
import '../../../../utils/wallet_activation_status.dart';
import '../../../../widgets/custom_snack_bar/snack_bar.dart';
import '../../../../widgets/custom_snack_bar/top_snack.dart';

class BarAddressField extends StatelessWidget {
  const BarAddressField({
    super.key,
    required this.balanceStore,
    required this.index,
    required this.bar,
  });

  final BalanceStore balanceStore;
  final int index;
  final BarModel bar;

  @override
  Widget build(BuildContext context) {
    final visibleAddress = getSplitAddress(bar.address);
    return ScaleTap(
      enableFeedback: false,
      onPressed: balanceStore.barCurrentIndex == index
          ? () async {
              final isBarActivated = isBarWalletActivated(
                balanceStore: balanceStore,
              );
              await recordAmplitudeEvent(
                AddressCopied(
                  walletType: 'Bar',
                  walletAddress: bar.address,
                  activated: await isBarActivated,
                  source: 'Wallet',
                ),
              );
              await Clipboard.setData(
                ClipboardData(
                  text: bar.address.toString(),
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
                      backgroundColor: const Color(
                        0xFF4A4A4A,
                      ).withOpacity(
                        0.9,
                      ),
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
            }
          : null,
      child: Container(
        height: 33,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Assets.images.bar.barAddress.image().image,
          ),
        ),
        child: Center(
          child: Observer(
            builder: (context) {
              if (balanceStore.loadings[bar.address] ?? false) {
                return Text(
                  visibleAddress,
                  style: const TextStyle(
                    fontFamily: FontFamily.redHatMedium,
                    color: Colors.black,
                    fontSize: 13,
                  ),
                );
              }
              return Text(
                visibleAddress,
                style: const TextStyle(
                  fontFamily: FontFamily.redHatMedium,
                  color: Colors.black,
                  fontSize: 13,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
