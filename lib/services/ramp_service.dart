import 'package:ramp_flutter/configuration.dart';
import 'package:ramp_flutter/offramp_sale.dart';
import 'package:ramp_flutter/onramp_purchase.dart';
import 'package:ramp_flutter/ramp_flutter.dart';
import 'package:ramp_flutter/send_crypto_payload.dart';

import '../http/interceptors/api_keys.dart';

class RampService {
  late final RampFlutter ramp;
  late final Configuration configuration;
  bool isConfigured = false;

  void configureRamp({required String address}) {
    if (isConfigured) {
      return;
    }
    configuration = Configuration()
      ..hostApiKey = rampApiKey
      ..hostAppName = 'Coinplus'
      ..hostLogoUrl = 'https://coinplus.com/wp-content/uploads/original-logo.png'
      ..userAddress = address
      ..defaultAsset = 'BTC_BTC'
      ..defaultFlow = 'ONRAMP'
      ..enabledFlows = ['ONRAMP'];

    ramp = RampFlutter();
    ramp
      ..onOnrampPurchaseCreated = onOnRampPurchaseCreated
      ..onSendCryptoRequested = onSendCryptoRequested
      ..onOfframpSaleCreated = onOffRampSaleCreated
      ..onRampClosed = onRampClosed;

    isConfigured = true;
  }

  void presentRamp() {
    ramp.showRamp(configuration);
  }

  void onOnRampPurchaseCreated(
    OnrampPurchase purchase,
    String purchaseViewToken,
    String apiUrl,
  ) {}

  void onSendCryptoRequested(SendCryptoPayload payload) {}

  void onOffRampSaleCreated(
    OfframpSale sale,
    String saleViewToken,
    String apiUrl,
  ) {}

  void onRampClosed() {}
}
