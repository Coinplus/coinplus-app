import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../extensions/context_extension.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../store/all_settings_state/all_settings_state.dart';
import 'provided_amount_tab/provided_amount_tab.dart';
import 'select_wallet_tab/select_wallet_tab.dart';
import 'send_to_state.dart';
import 'transaction_review_tab/transaction_review_tab.dart';

class SendToModal extends HookWidget {
  const SendToModal({
    super.key,
    required this.allSettingsState,
    required this.isBarList,
  });

  final AllSettingsState allSettingsState;
  final bool isBarList;

  SendToState get _sendToState => GetIt.I<SendToState>();

  @override
  Widget build(BuildContext context) {
    final tabController = useTabController(initialLength: 3);
    final usdFocusNode = useFocusNode();
    final btcFocusNode = useFocusNode();
    final sendFocusNode = useFocusNode();

    useEffect(
      () {
        tabController.addListener(() {
          _sendToState.setSelectedIndex(tabController.index);
        });
        Timer.periodic(const Duration(minutes: 1), (timer) {
          _sendToState.transactionsStore.getRecommendedFee();
        });
        return _sendToState.dispose;
      },
      [],
    );

    return Container(
      height: context.height * 0.93,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Column(
              children: [
                const Gap(12),
                Assets.icons.notch.image(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      IconButton(
                        splashRadius: 20,
                        onPressed: () {
                          if (_sendToState.selectedIndex == 0) {
                            router.maybePop();
                          } else if (_sendToState.selectedIndex == 1) {
                            usdFocusNode.unfocus();
                            btcFocusNode.unfocus();
                            tabController.animateTo(0);
                            sendFocusNode.requestFocus();
                          } else {
                            tabController.animateTo(1);
                          }
                        },
                        icon: Observer(
                          builder: (_) {
                            return Row(
                              children: [
                                if (_sendToState.selectedIndex == 0)
                                  Assets.icons.close.image(
                                    height: 32,
                                    color: AppColors.primary,
                                  )
                                else
                                  Row(
                                    children: [
                                      const Gap(10),
                                      Assets.icons.arrowBackIos.image(
                                        height: 20,
                                        color: AppColors.primary,
                                      ),
                                    ],
                                  ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  ProvideAddressTab(
                    tabController: tabController,
                    isBarList: isBarList,
                    sendFocusNode: sendFocusNode,
                  ),
                  ProvideAmountTab(
                    tabController: tabController,
                    isBarList: isBarList,
                    usdFocusNode: usdFocusNode,
                    btcFocusNode: btcFocusNode,
                  ),
                  TransactionReviewTab(
                    tabController: tabController,
                    allSettingsState: allSettingsState,
                    isBarList: isBarList,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
