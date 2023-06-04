import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../gen/colors.gen.dart';
import '../../providers/screen_service.dart';
import '../../router.dart';

@RoutePage()
class QrScannerPage extends StatefulWidget {
  const QrScannerPage({Key? key}) : super(key: key);

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  final qrKey = GlobalKey();

  QRViewController? controller;
  String qrText = '';

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                  overlay: QrScannerOverlayShape(
                    overlayColor: AppColors.primary.withOpacity(0.9),
                    borderColor: AppColors.primaryButtonColor,
                    borderRadius: 12,
                    borderLength: 20,
                    borderWidth: 5,
                    cutOutSize: 260,
                    cutOutBottomOffset: 10,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 77,
            left: 16,
            child: ScaleTap(
              onPressed: () => context.popRoute(
                const OnboardingRoute(),
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          const Positioned(
            top: 77,
            right: 134,
            child: Text(
              'Scan a QR code',
              style: TextStyle(
                fontFamily: 'RedHatMedium',
                fontSize: 17,
                color: Colors.white,
              ),
            ),
          ),
          const Positioned(
            top: 179,
            right: 58,
            left: 58,
            child: Text(
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

  Future<void> _onQRViewCreated(QRViewController controller) async {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setQRText(scanData.code!);
      if (qrText.isNotEmpty) {
        controller.pauseCamera();
      }
      if (qrText.isNotEmpty) {
        controller.pauseCamera();
        router.popAndPush(
          CardFillRoute(receivedData: qrText),
        );
      }
    });
  }

  Future<void> setQRText(String text) async {
    qrText = text;
  }
}
