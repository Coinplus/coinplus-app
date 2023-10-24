import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart'
    show QrScannerOverlayShape;
import '../../gen/colors.gen.dart';
import '../../providers/screen_service.dart';
import '../../store/qr_detect_state/qr_detect_state.dart';

@RoutePage<String?>()
class QrScannerPage extends StatefulWidget {
  const QrScannerPage({
    Key? key,
  }) : super(key: key);

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  final _qrController = MobileScannerController(
    formats: [BarcodeFormat.qrCode],
    detectionTimeoutMs: 1000,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _qrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final qrDetect = ValidationState();

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: MobileScanner(
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
                  await router.pop(_data);
                } else if (_data!.startsWith('https')) {
                  final newAddress =
                      _data.split('https://air.coinplus.com/btc/');
                  final splitAddress = newAddress[1];
                  await HapticFeedback.heavyImpact();
                  await router.pop(splitAddress);
                } else {
                  await HapticFeedback.mediumImpact();
                  await router.pop(_data);
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
              onPressed: context.popRoute,
              child: IconButton(
                onPressed: router.pop,
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
        ],
      ),
    );
  }
}
