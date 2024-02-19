import 'dart:convert';
import 'dart:developer';

import 'package:bitcoin_base/bitcoin_base.dart';
import 'package:http/http.dart' as http;

Future<void> sendBitcoinFromLegacyWallet() async {
  BigInt _changeValue(BigInt sum, List<BigInt> all) {
    final sumAll = all.fold<BigInt>(
      BigInt.zero,
      (previousValue, element) => previousValue + element,
    );

    final remind = sum - sumAll;
    if (remind < BigInt.zero) {
      throw ArgumentError('invalid values');
    }
    return remind;
  }

  const network = BitcoinNetwork.mainnet;

  // Replace the example private key with your own WIF private key
  final examplePrivateKey = ECPrivate.fromWif(
    'KxudVxmUsE36sajfbZUamEehVY3Xn5UfnqgEhbBs9io7RmizWJtu',
    netVersion: BitcoinNetwork.mainnet.wifNetVer,
  );

  final examplePublicKey = examplePrivateKey.getPublic();

  final publicKey = examplePublicKey.toAddress().toAddress(network);

  log('Public Key: $publicKey');

  final out1 = P2pkhAddress.fromAddress(
    address: publicKey,
    network: BitcoinNetwork.mainnet,
  );

  const outAddress = '1ArypasnN7Lcj4QRNWGgspyJcRr9FM4RDB';

  final out2 = P2shAddress.fromAddress(
    address: outAddress,
    network: network,
  );

  final change = _changeValue(BtcUtils.toSatoshi('260319'), [
    BtcUtils.toSatoshi('100000'),
    BtcUtils.toSatoshi('1000'),
  ]);

  final b = ForkedTransactionBuilder(
    outPuts: [
      BitcoinOutput(address: out1, value: BtcUtils.toSatoshi('100000')),
      BitcoinOutput(address: out2, value: change),
    ],
    fee: BtcUtils.toSatoshi('10000'),
    network: network,
    utxos: [
      UtxoWithAddress(
        utxo: BitcoinUtxo(
          txHash: 'b316f4eccc6777126ff279996948133e7219459b84400d2c4885fa796412350f',
          value: BtcUtils.toSatoshi('100000'),
          vout: 0,
          scriptType: examplePublicKey.toAddress().type,
        ),
        ownerDetails: UtxoAddressDetails(
          publicKey: examplePublicKey.toHex(), // Use toHex() for public key
          address: examplePublicKey.toAddress(),
        ),
      ),
    ],
  );

  final tr = b.buildTransaction((trDigest, utxo, publicKey, sighash) {
    if (publicKey == examplePublicKey.toHex()) {
      return examplePrivateKey.signInput(trDigest, sigHash: sighash);
    }

    throw UnimplementedError();
  });

  Future<void> _broadcastTransaction(String digest) async {
    final params = {
      'jsonrpc': '2.0',
      'API_key': '27c54568-c97c-49a6-8667-993f8de2d4d8',
      'method': 'sendrawtransaction',
      'params': [digest],
    };
    final client = http.Client();
    final res = await client.post(
      Uri.parse('https://go.getblock.io/2359f3004aef4fbba3a1c70f62f660d8'),
      body: jsonEncode(params),
      headers: {'Content-Type': 'application/json'},
    );
    log(res.toString());
  }

  await _broadcastTransaction(tr.serialize());
}

