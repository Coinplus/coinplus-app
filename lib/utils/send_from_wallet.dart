import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'package:flutter/foundation.dart';

import '../constants/constant_strings.dart';

Future<void> createTransaction() async {
  final network = bitcoin;
  final alice = ECPair.fromWIF(
    privateKey,
    network: network,
  );

  final txb = TransactionBuilder(network: network)
    ..setVersion(1)
    ..addInput(
      '232729771f142c4d1e2022314789f625c131e490cccb54e28e8cab5b4f6a4aac',
      0,
    )
    ..addOutput('1PGkYEjjUy49PrUHpkHGXAAw9Tf3teDJNh', 1900)
    ..sign(vin: 0, keyPair: alice)
    ..build();

  final txHash = txb.build().getHash();

  final hash = txHash.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();

  if (kDebugMode) {
    print(hash);
  }
}
