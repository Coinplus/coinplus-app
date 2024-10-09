import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';

import '../../../../extensions/extensions.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../gen/colors.gen.dart';
import '../../../../gen/fonts.gen.dart';
import '../../../../http/repositories/mempool_repo.dart';
import '../../../../models/amplitude_event/amplitude_event.dart';
import '../../../../models/amplitude_event/amplitude_event_part_two/amplitude_event_part_two.dart';
import '../../../../providers/screen_service.dart';
import '../../../../router.gr.dart';
import '../../../../services/amplitude_service.dart';
import '../../../../store/balance_store/balance_store.dart';
import '../../../../utils/secure_storage_utils.dart';
import '../../../../widgets/loading_button/loading_button.dart';
import '../../../../widgets/shimmers/history_dropdown_shimmer.dart';
import '../send_to_state.dart';
import 'card_select_dropdown/card_select_dropdown.dart';

class ProvideAddressTab extends HookWidget {
  const ProvideAddressTab({
    super.key,
    required this.tabController,
    required this.isBarList,
    required this.sendFocusNode,
  });

  final TabController tabController;
  final bool isBarList;
  final FocusNode sendFocusNode;

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  SendToState get _sendToState => GetIt.I<SendToState>();

  @override
  Widget build(BuildContext context) {
    final _scrollController = useScrollController();
    final _secureStorage = SecureStorageService();
    useAutomaticKeepAlive();
    final isCardActivated = _secureStorage.isCardWalletActivated(
      balanceStore: _balanceStore,
      state: _sendToState,
    );
    final isBarActivated = _secureStorage.isBarWalletActivated(
      balanceStore: _balanceStore,
      state: _sendToState,
    );
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: const Text(
            'Send to',
            style: TextStyle(
              fontFamily: FontFamily.redHatMedium,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryTextColor,
            ),
          ).expandedHorizontally(),
        ),
        const Gap(8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Observer(
            builder: (context) {
              return SizedBox(
                height: _sendToState.isValidReceiverAddress ? 50 : 72,
                child: Observer(
                  builder: (context) {
                    return TextField(
                      controller: _sendToState.addressController,
                      focusNode: sendFocusNode,
                      scrollController: _scrollController,
                      decoration: InputDecoration(
                        errorText: _sendToState.shouldValidateReceiverAddress && !_sendToState.isValidReceiverAddress
                            ? 'Invalid receiver address'
                            : null,
                        errorStyle: const TextStyle(color: Colors.red),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.blueAccent,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.2),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 10,
                        ),
                        hintText: 'Enter receiver address',
                        fillColor: Colors.grey.withOpacity(0.1),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(9),
                          child: ScaleTap(
                            onPressed: () async {
                              await recordAmplitudeEvent(
                                QrButtonClicked(
                                  walletType: isBarList ? 'bar' : 'card',
                                  source: 'send',
                                ),
                              );
                              sendFocusNode.unfocus();
                              await Future.delayed(
                                const Duration(milliseconds: 500),
                              );
                              final res = await router.push<String?>(
                                QrScannerRoute(isScannedReceiverAddress: true),
                              );
                              if (res == null) {
                                return;
                              }
                              _sendToState.addressController.text = res;
                              _sendToState.transactionsStore.setReceiverWalletAddress(res);
                              _sendToState
                                ..onAddressChanges(res)
                                ..setOutputAddress(res);
                              await recordAmplitudeEvent(
                                QrScanned(
                                  source: 'send',
                                  walletAddress: res,
                                ),
                              );
                            },
                            child: Assets.icons.qrCode.image(height: 18),
                          ),
                        ),
                        hintStyle: TextStyle(
                          fontFamily: FontFamily.redHatLight,
                          color: AppColors.primaryTextColor.withOpacity(0.8),
                          fontSize: 14,
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontSize: 14,
                        color: AppColors.textHintsColor,
                        fontWeight: FontWeight.normal,
                      ),
                      cursorColor: AppColors.secondaryButtons,
                      keyboardType: TextInputType.text,
                      autocorrect: false,
                      autofocus: true,
                      enableSuggestions: false,
                      scribbleEnabled: false,
                      onTapOutside: (_) {
                        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                        _scrollController.jumpTo(0);
                      },
                      onChanged: (value) {
                        _sendToState.transactionsStore.setReceiverWalletAddress(value);
                        _sendToState
                          ..onAddressChanges(value)
                          ..setOutputAddress(value)
                          ..handleNextButtonStatus();
                        if (value.length > 28) {
                          recordAmplitudeEventPartTwo(
                            SendToAddressFilled(address: value),
                          );
                        }
                      },
                      textAlignVertical: TextAlignVertical.center,
                      textInputAction: TextInputAction.done,
                      onEditingComplete: () {
                        WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
                        _scrollController.jumpTo(0);
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
        const Gap(17),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: const Text(
            'Send from',
            style: TextStyle(
              fontFamily: FontFamily.redHatMedium,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryTextColor,
            ),
          ).expandedHorizontally(),
        ),
        const Gap(8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Observer(
            builder: (_) {
              return _sendToState.btc == null
                  ? const Padding(
                      padding: EdgeInsets.only(top: 14),
                      child: HistoryDropdownShimmer(),
                    )
                  : CardSelectDropdown(
                      isBarList: isBarList,
                    );
            },
          ),
        ),
        const Spacer(),
        Observer(
          builder: (context) {
            return LoadingButton(
              onPressed: _sendToState.transactionsStore.utxoData != null &&
                      _sendToState.nextButtonStatus &&
                      _sendToState.addressController.text.length > 27
                  ? () async {
                      await mempoolRepo.getFees();
                      await _sendToState.transactionsStore.getUtxosData();
                      await recordAmplitudeEventPartTwo(
                        SendNextClicked(
                          sendToAddress: _sendToState.outputAddress,
                          sendFromAddress: _sendToState.selectedCardAddress!,
                        ),
                      );
                      if (_sendToState.transactionsStore.cards.length == 1 &&
                          _sendToState.transactionsStore.bars.isEmpty) {
                        if (await isCardActivated) {
                          tabController.animateTo(1);
                        }
                        _sendToState.transactionsStore.onSelectCard(0);
                      } else if (_sendToState.transactionsStore.cards.isEmpty &&
                          _sendToState.transactionsStore.bars.length == 1) {
                        if (await isBarActivated) {
                          tabController.animateTo(1);
                        }
                        _sendToState.transactionsStore.onSelectBar(0);
                      } else {
                        tabController.animateTo(1);
                      }
                    }
                  : null,
              child: _sendToState.transactionsStore.utxoLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : const Text(
                      'Next',
                      style: TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
            ).paddingHorizontal(60);
          },
        ),
        if (sendFocusNode.hasFocus) const Gap(24) else const Gap(50),
      ],
    );
  }
}
