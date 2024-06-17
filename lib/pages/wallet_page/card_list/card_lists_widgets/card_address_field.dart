import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:get_it/get_it.dart';

import '../../../../extensions/extensions.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../models/amplitude_event/amplitude_event.dart';
import '../../../../services/amplitude_service.dart';
import '../../../../store/balance_store/balance_store.dart';
import '../../../../utils/data_utils.dart';
import '../../../../utils/wallet_activation_status.dart';
import '../../../../widgets/custom_snack_bar/snack_bar.dart';
import '../../../../widgets/custom_snack_bar/top_snack.dart';
import '../../../send_page/send_to/change_selected_address/change_selected_address_state.dart';

class CardAddressField extends HookWidget {
  const CardAddressField({super.key, required this.index});

  final int index;
  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  @override
  Widget build(BuildContext context) {
    final state = useMemoized(ChangeSelectedAddressState.new);

    return ScaleTap(
      enableFeedback: false,
      onPressed: _balanceStore.cardCurrentIndex == index
          ? () async {
              final isCardActivated = isCardWalletActivated(
                balanceStore: _balanceStore,
              );
              await recordAmplitudeEvent(
                AddressCopied(
                  walletType: 'Card',
                  walletAddress: state.cards[index].address,
                  activated: await isCardActivated,
                  source: 'Wallet',
                ),
              );
              await Clipboard.setData(
                ClipboardData(
                  text: state.cards[index].address.toString(),
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
                      backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
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
        padding: EdgeInsets.symmetric(
          horizontal: context.height > 667
              ? context.height * 0.035
              : context.height * 0.043,
        ),
        child: Container(
          height: 60,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 12,
            bottom: 12,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: Colors.black.withOpacity(
              0.3,
            ),
          ),
          child: Column(
            children: [
              const Row(
                children: [
                  Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: FontFamily.redHatMedium,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Observer(
                builder: (context) {
                  if (_balanceStore.loadings[state.cards[index].address] ??
                      false) {
                    return Text(
                      getSplitAddress(state.cards[index].address),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: const TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ).expandedHorizontally();
                  }
                  return Text(
                    getSplitAddress(state.cards[index].address),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: const TextStyle(
                      fontFamily: FontFamily.redHatMedium,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ).expandedHorizontally();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
