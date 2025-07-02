import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:get_it/get_it.dart';

import '../../../../constants/card_color.dart';
import '../../../../constants/card_type.dart';
import '../../../../extensions/extensions.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../models/amplitude_event/amplitude_event_part_one/amplitude_event.dart';
import '../../../../services/amplitude_service.dart';
import '../../../../store/balance_store/balance_store.dart';
import '../../../../utils/data_utils.dart';
import '../../../../utils/wallet_activation_status.dart';
import '../../../../widgets/custom_snack_bar/snack_bar_method.dart';
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
              final isCardActivated = isCardWalletActivated();
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
                  showCustomSnackBar(
                    context: context,
                    message: 'Address was copied',
                  );
                },
              );
            }
          : null,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: context.height > 667 ? context.height * 0.035 : context.height * 0.043,
        ),
        child: Platform.isIOS
            ? ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
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
                      color: state.cards[index].label == WalletType.COINPLUS_LEGACY_WALLET ||
                              state.cards[index].label == WalletType.TRACKER_PLUS || state.cards[index].color == CardColor.GATE_BLACK
                          ? Colors.grey.withValues(alpha: 0.3)
                          : Colors.black.withValues(
                              alpha: 0.3,
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
                            if (_balanceStore.loadings[state.cards[index].address] ?? false) {
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
              )
            : Container(
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
                  color: state.cards[index].label == WalletType.COINPLUS_LEGACY_WALLET ||
                          state.cards[index].label == WalletType.TRACKER_PLUS || state.cards[index].color == CardColor.GATE_BLACK
                      ? Colors.grey.withValues(alpha: 0.3)
                      : Colors.black.withValues(
                          alpha: 0.3,
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
                        if (_balanceStore.loadings[state.cards[index].address] ?? false) {
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
