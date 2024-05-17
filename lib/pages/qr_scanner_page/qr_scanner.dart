import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:gaimon/gaimon.dart';
import 'package:gap/gap.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart'
    show QrScannerOverlayShape;
import '../../gen/assets.gen.dart';
import '../../gen/colors.gen.dart';
import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../../store/balance_store/balance_store.dart';
import '../../store/qr_detect_state/qr_detect_state.dart';
import '../../widgets/all_alert_dialogs/already_saved_wallet/already_saved_wallet.dart';

@RoutePage<String?>()
class QrScannerPage extends HookWidget {
  const QrScannerPage({
    Key? key,
  }) : super(key: key);

  BalanceStore get _balanceStore => GetIt.I<BalanceStore>();

  @override
  Widget build(BuildContext context) {
    final qrDetect = ValidationState();
    final _qrController = MobileScannerController(
      formats: [BarcodeFormat.qrCode],
      detectionTimeoutMs: 1000,
    );
    final scanWindow = Rect.fromCenter(
      center: MediaQuery.of(context).size.center(Offset.zero),
      width: 200,
      height: 200,
    );
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: MobileScanner(
              scanWindow: scanWindow,
              controller: _qrController,
              placeholderBuilder: (_, widget) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              },
              onDetect: (capture) async {
                qrDetect.detectQr();
                final _data = capture.barcodes.map((e) => e.displayValue).first;
                await _qrController.stop();
                await Future.delayed(const Duration(milliseconds: 300));
                if (_data?.length == 30) {
                  await HapticFeedback.mediumImpact();
                  await router.maybePop(_data);
                } else if (_data!.startsWith('https')) {
                  final newAddress =
                      _data.split('https://air.coinplus.com/btc/');
                  final splitAddress = newAddress[1];
                  await HapticFeedback.heavyImpact();
                  final cardExists = _balanceStore.cards
                      .any((element) => element.address == splitAddress);
                  final barExists = _balanceStore.bars
                      .any((element) => element.address == splitAddress);
                  if (cardExists || barExists) {
                    await router.maybePop();
                    await alreadySavedWallet(context, splitAddress);
                    _balanceStore.onCardAdded(splitAddress);
                    _balanceStore.onBarAdded(splitAddress);
                  } else {
                    await router.maybePop(splitAddress);
                  }
                } else {
                  await HapticFeedback.mediumImpact();
                  final cardExists = _balanceStore.cards
                      .any((element) => element.address == _data);
                  final barExists = _balanceStore.bars
                      .any((element) => element.address == _data);
                  if (cardExists || barExists) {
                    await router.maybePop();
                    await alreadySavedWallet(context, _data);
                    _balanceStore.onCardAdded(_data);
                    _balanceStore.onBarAdded(_data);
                  } else {
                    await router.maybePop(_data);
                  }
                }
              },
            ),
          ),
          Positioned.fill(
            child: Observer(
              builder: (_) {
                return Container(
                  decoration: ShapeDecoration(
                    shape: QrScannerOverlayShape(
                      overlayColor: AppColors.primary.withOpacity(0.9),
                      borderColor: qrDetect.isDetected
                          ? (qrDetect.isValid ? Colors.green : Colors.red)
                          : Colors.blue,
                      borderRadius: 12,
                      borderLength: 20,
                      borderWidth: 5,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.066,
            left: 16,
            child: ScaleTap(
              onPressed: context.maybePop,
              child: IconButton(
                onPressed: router.maybePop,
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            right: 137,
            child: const Text(
              'Scan a QR code',
              style: TextStyle(
                fontFamily: 'RedHatMedium',
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.2,
            right: 58,
            left: 58,
            child: const Text(
              'Hold the QR code inside the square area, \nand it will be automatically scanned',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'RedHatMedium',
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.75,
            left: 100,
            right: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ScaleTap(
                  enableFeedback: false,
                  onPressed: () {
                    Gaimon.rigid();
                    _qrController.toggleTorch();
                  },
                  child: ValueListenableBuilder<TorchState>(
                    valueListenable: _qrController.torchState,
                    builder: (context, state, child) {
                      switch (state) {
                        case TorchState.off:
                          return Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.grey.withOpacity(0.2),
                                ),
                                child: Assets.icons.torch.image(
                                  height: 40,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                              const Gap(8),
                              Text(
                                'Torch',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          );
                        case TorchState.on:
                          return Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  color: Colors.green.withOpacity(0.7),
                                ),
                                child: Assets.icons.torch.image(
                                  height: 40,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                              ),
                              const Gap(8),
                              Text(
                                'Torch',
                                style: TextStyle(
                                  fontFamily: FontFamily.redHatMedium,
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
