import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gap/gap.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import '../../../extensions/elevated_button_extensions.dart';
import '../../../extensions/extensions.dart';
import '../../../gen/assets.gen.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';
import '../../../providers/screen_service.dart';
import '../../../router.gr.dart';
import '../../../store/nfc_state/nfc_state.dart';
import '../../../widgets/loading_button.dart';
import '../form_factor_page/form_factor_page.dart';

class ConnectManuallyButton extends StatefulWidget {
  const ConnectManuallyButton({super.key});

  @override
  State<ConnectManuallyButton> createState() => _ConnectManuallyButtonState();
}

class _ConnectManuallyButtonState extends State<ConnectManuallyButton> {
  final pageIndexNotifier = ValueNotifier(0);
  final _nfcState = NfcStore();

  @override
  void initState() {
    super.initState();
    _nfcState.checkNfcSupport();
  }

  @override
  Widget build(BuildContext context) {
    WoltModalSheetPage page1(
      BuildContext modalSheetContext,
    ) {
      return WoltModalSheetPage(
        backgroundColor: Colors.white,
        sabGradientColor: Colors.white,
        hasTopBarLayer: false,
        isTopBarLayerAlwaysVisible: true,
        leadingNavBarWidget: const Row(
          children: [
            Gap(30),
            Text(
              'Start with your wallet',
              style: TextStyle(
                fontFamily: FontFamily.redHatBold,
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: AppColors.primaryTextColor,
              ),
            ),
          ],
        ),
        singleChildContent: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Gap(5),
              LoadingButton(
                style: context.theme
                    .buttonStyle(
                      textStyle: const TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        color: AppColors.primaryTextColor,
                        fontSize: 15,
                      ),
                    )
                    .copyWith(
                      backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
                    ),
                onPressed: () async {
                  await router.pop(context);
                  final res = await context.pushRoute<String?>(
                    const QrScannerRoute(),
                  );
                  if (res != null) {
                    await router.push(
                      CardFillRoute(receivedData: res),
                    );
                  }
                },
                child: Row(
                  children: [
                    Assets.icons.qrCode.image(
                      height: 24,
                      width: 24,
                      color: AppColors.primaryButtonColor,
                    ),
                    const Gap(8),
                    const Text(
                      'Connect with QR',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: FontFamily.redHatMedium,
                        fontWeight: FontWeight.normal,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(10),
              LoadingButton(
                style: context.theme
                    .buttonStyle(
                      textStyle: const TextStyle(
                        fontFamily: FontFamily.redHatMedium,
                        color: AppColors.primaryTextColor,
                        fontSize: 15,
                      ),
                    )
                    .copyWith(
                      backgroundColor: MaterialStateProperty.all(Colors.grey.withOpacity(0.1)),
                    ),
                onPressed: () => pageIndexNotifier.value = pageIndexNotifier.value + 1,
                child: Row(
                  children: [
                    Assets.icons.stylus.image(
                      height: 24,
                      width: 24,
                      color: AppColors.primaryButtonColor,
                    ),
                    const Gap(8),
                    const Text(
                      'Connect manually',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: FontFamily.redHatMedium,
                        fontWeight: FontWeight.normal,
                        color: AppColors.primaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(15),
            ],
          ),
        ),
      );
    }

    WoltModalSheetPage page2(
      BuildContext modalSheetContext,
    ) {
      return WoltModalSheetPage(
        leadingNavBarWidget: Row(
          children: [
            Column(
              children: [
                const Gap(5),
                IconButton(
                  padding: const EdgeInsets.all(16),
                  icon: const Icon(Icons.arrow_back_rounded),
                  onPressed: () => pageIndexNotifier.value = pageIndexNotifier.value - 1,
                ),
              ],
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(15),
                Text(
                  'Start with your wallet',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatBold,
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                    color: AppColors.primaryTextColor,
                  ),
                ),
                Gap(5),
                Text(
                  'Please select a wallet type',
                  style: TextStyle(
                    fontFamily: FontFamily.redHatLight,
                    color: AppColors.primaryTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
        singleChildContent: FormFactorPage(
          pageIndexNotifier: pageIndexNotifier,
        ),
      );
    }

    return Observer(
      builder: (context) {
        return LoadingButton(
          style: _nfcState.isNfcSupported
              ? context.theme
                  .buttonStyle(
                    textStyle: const TextStyle(
                      fontFamily: FontFamily.redHatSemiBold,
                      color: AppColors.primaryButtonColor,
                      fontSize: 17,
                    ),
                  )
                  .copyWith(
                    backgroundColor: MaterialStateProperty.all(
                      Colors.grey.withOpacity(0.1),
                    ),
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.all(13),
                    ),
                  )
              : null,
          onPressed: () {
            WoltModalSheet.show<void>(
              pageIndexNotifier: pageIndexNotifier,
              context: context,
              pageListBuilder: (modalSheetContext) {
                return [
                  page1(modalSheetContext),
                  page2(modalSheetContext),
                ];
              },
              modalTypeBuilder: (context) {
                final size = MediaQuery.of(context).size.width;
                if (size < 768) {
                  return WoltModalType.bottomSheet;
                } else {
                  return WoltModalType.dialog;
                }
              },
              onModalDismissedWithBarrierTap: () {
                Navigator.of(context).pop();
                pageIndexNotifier.value = 0;
              },
            );
          },
          child: Text(
            _nfcState.isNfcSupported ? 'Connect manually' : 'Connect wallet',
            style: _nfcState.isNfcSupported
                ? const TextStyle(
                    fontSize: 15,
                    fontFamily: FontFamily.redHatSemiBold,
                    color: Colors.black,
                  )
                : const TextStyle(
                    fontSize: 15,
                    fontFamily: FontFamily.redHatSemiBold,
                    color: Colors.white,
                  ),
          ),
        ).paddingHorizontal(63);
      },
    );
  }
}
