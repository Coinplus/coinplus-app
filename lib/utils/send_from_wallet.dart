import 'dart:developer';

import 'package:bitcoin_flutter/bitcoin_flutter.dart';

void createTransaction() {
  final wallet = Wallet.fromWIF('KxudVxmUsE36sajfbZUamEehVY3Xn5UfnqgEhbBs9io7RmizWJtu');
  log(wallet.address.toString());
  log(wallet.pubKey.toString());
  log(wallet.privKey.toString());
  log(wallet.wif.toString());
}
