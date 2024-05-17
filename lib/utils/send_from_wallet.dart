import 'package:bitcoin_flutter/bitcoin_flutter.dart';
import 'package:flutter/foundation.dart';

import 'secure_storage_utils.dart';

Future<void> createTransaction({
  required List<({String hash, int amount, int vout})> inputs,
  required ({String address, int amount}) output,
  required int fee,
  required String refundAddress,
}) async {
  final network = bitcoin;
  final privateKey = await secureStorage.read(key: refundAddress);
  if (privateKey == null) {
    return;
  }

  final decrypter = ECPair.fromWIF(
    privateKey,
    network: network,
  );
  final txb = TransactionBuilder(network: network)..setVersion(1);

  final totalAmount = inputs.fold(
    0,
    (previousValue, element) => previousValue + element.amount,
  );
  final refundAmount = totalAmount - output.amount - fee;

  final canRefund = refundAmount > 500;

  for (final input in inputs) {
    txb.addInput(input.hash, input.vout);
  }

  txb.addOutput(output.address, output.amount);
  if (canRefund) {
    txb.addOutput(refundAddress, refundAmount);
  }
  txb.sign(vin: 0, keyPair: decrypter);

  final tx = txb.build().toHex();

  if (kDebugMode) {
    print(tx);
  }
}
