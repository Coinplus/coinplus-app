import 'package:ramp_flutter/configuration.dart';
import 'package:ramp_flutter/offramp_sale.dart';
import 'package:ramp_flutter/onramp_purchase.dart';
import 'package:ramp_flutter/ramp_flutter.dart';
import 'package:ramp_flutter/send_crypto_payload.dart';

late final RampFlutter ramp;
late final Configuration configuration;

void configureRamp({required String address}) {
  configuration = Configuration();
  configuration
    ..hostApiKey = '5mvbqf7bbzeyh882n7csfwq9mqc25cwrs7fbp578'
    ..hostAppName = 'Coinplus'
    ..hostLogoUrl = 'https://coinplus.com/wp-content/uploads/2022/10/cp_logo_primary.png'
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