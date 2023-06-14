import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart'
    show QrScannerOverlayShape;

import '../../custom_widgets/qr_alert_dialog.dart';
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
  final qrKey = GlobalKey();

  String qrText = '';
  final _controller = MobileScannerController(
    formats: [BarcodeFormat.qrCode],
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final qrDetect = QrDetectState();
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: MobileScanner(
              controller: _controller,
              placeholderBuilder: (_, widget) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              },
              onDetect: (capture) {
                final _data =
                    capture.barcodes.map((e) => e.displayValue).first;
                if (_data?.length == 34) {
                  qrDetect.startLoading();
                    router.pop(_data);
                } else {
                    _controller.stop();
                    showAlertDialog(context);
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
                          ? Colors.green
                          : AppColors.primaryButtonColor,
                      borderRadius: 12,
                      borderLength: 20,
                      borderWidth: 5,
                      cutOutSize: 260,
                      cutOutBottomOffset: 10,
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            top: 77,
            left: 16,
            child: ScaleTap(
              onPressed: context.popRoute,
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

// Future<void> showAlertDialog(BuildContext context) async {
//   final okButton = LoadingButton(
//     child: const Text(
//       'OK',
//       style: TextStyle(fontFamily: 'RedHatMedium', fontSize: 16),
//     ),
//     onPressed: () {
//       router.pushAndPopAll(const OnboardingRoute());
//     },
//   ).paddingHorizontal(60);
//   final alert = AlertDialog(
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//     contentPadding: const EdgeInsets.all(20),
//     content: const Text(
//       'This is not a wallet address, please try to scan th QR on the certificate of the Bar or QR on the back of the card again',
//       style: TextStyle(fontFamily: 'RedHatLight'),
//     ),
//     actions: [
//       Center(child: okButton),
//     ],
//   );
//   await showDialog(
//     context: context,
//     builder: (context) {
//       return alert;
//     },
//   );
// }
}
