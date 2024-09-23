import 'package:web3dart/web3dart.dart';

import '../compute_private_key.dart';

Future<String> getEthereumPrivateKey(
  String secret1B58,
  String secret2B58,
) async {
  final privkeyb256 = await computePrivateKeySec256k1(secret1B58, secret2B58);
  var privateKey = privkeyb256.toRadixString(16);

  while (privateKey.length < 64) {
    privateKey = '0$privateKey';
  }
  return privateKey;
}

String getAddressKey(String privateKey) {
  final ethPrivateKey = EthPrivateKey.fromHex(privateKey);
  final address = ethPrivateKey.address;
  return address.hex.toLowerCase();
}

bool isPublicAddressDerivedFromPrivateKey(
  String publicAddress,
  String privateKey,
) {
  if (publicAddress.isEmpty || privateKey.isEmpty) {
    return false;
  }
  return publicAddress.toLowerCase() == getAddressKey(privateKey);
}
