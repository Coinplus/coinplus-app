import 'package:ramp_flutter/configuration.dart';
import 'package:ramp_flutter/offramp_sale.dart';
import 'package:ramp_flutter/onramp_purchase.dart';
import 'package:ramp_flutter/ramp_flutter.dart';
import 'package:ramp_flutter/send_crypto_payload.dart';

class RampService {
  late final RampFlutter ramp;
  late final Configuration configuration;
  bool isConfigured = false;

  void configureRamp({required String address}) {
    if (isConfigured) {
      return;
    }
    configuration = Configuration()
      ..hostApiKey = '5mvbqf7bbzeyh882n7csfwq9mqc25cwrs7fbp578'
      ..hostAppName = 'Coinplus'
      ..hostLogoUrl = 'https://coinplus.com/wp-content/uploads/original-logo.png'
      ..userAddress = address
      ..defaultAsset = 'BTC_BTC'
      ..defaultFlow = 'ONRAMP'
      ..enabledFlows = ['ONRAMP'];

    ramp = RampFlutter();
    ramp
      ..onOnrampPurchaseCreated = onOnrampPurchaseCreated
      ..onSendCryptoRequested = onSendCryptoRequested
      ..onOfframpSaleCreated = onOfframpSaleCreated
      ..onRampClosed = onRampClosed;

    isConfigured = true;
  }

  void presentRamp() {
    ramp.showRamp(configuration);
  }

  void onOnrampPurchaseCreated(
    OnrampPurchase purchase,
    String purchaseViewToken,
    String apiUrl,
  ) {}

  void onSendCryptoRequested(SendCryptoPayload payload) {}

  void onOfframpSaleCreated(
    OfframpSale sale,
    String saleViewToken,
    String apiUrl,
  ) {}

  void onRampClosed() {}
}
