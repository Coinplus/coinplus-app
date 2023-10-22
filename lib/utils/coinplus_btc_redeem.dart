import 'dart:typed_data';

import 'package:bs58/bs58.dart';
import 'package:collection/collection.dart';
import 'package:flutter_bitcoin/flutter_bitcoin.dart';
import 'package:hashlib/hashlib.dart';

import 'data_utils.dart';

final N = BigInt.parse(
  'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEBAAEDCE6AF48A03BBFD25E8CD0364141',
  radix: 16,
);

Uint8List scryptHash(String data) {
  const coinplus = ScryptSecurity('coinplus', N: 16384, r: 8, p: 8);
  final result = scrypt(data.codeUnits, [], security: coinplus, dklen: 32);

  return result.bytes;
}

Future<BigInt> computePrivateKeySec256k1(
  String secret1B58arg,
  String secret2B58arg,
) async {
  final secret1B58 = secret1B58arg.length == 30
      ? secret1B58arg.substring(0, 29)
      : secret1B58arg;
  final secret2B58 = secret2B58arg.length == 30
      ? secret2B58arg.substring(0, 29)
      : secret2B58arg;

  final hashedSecret1 = scryptHash(secret1B58);
  final hashedSecret2 = scryptHash(secret2B58);

  final n1 = BigInt.parse(bytesToHex(hashedSecret1), radix: 16);
  final n2 = BigInt.parse(bytesToHex(hashedSecret2), radix: 16);
  final n0 = (n1 + n2) % N;

  return n0;
}

Future<String> getWif(String secret1B58, String secret2B58) async {
  final privkeyB256 = await computePrivateKeySec256k1(secret1B58, secret2B58);
  final toDigest = [128, ...bigIntToBytes(privkeyB256), 1];
  final doubleSha256 = sha256.convert(sha256.convert(toDigest).bytes).bytes;
  final finalPrivkeyB256 = [...toDigest, ...doubleSha256.sublist(0, 4)];

  return base58.encode(Uint8List.fromList(finalPrivkeyB256));
}

String? wifToPublicKey(String wifKey) {
  final wallet = Wallet.fromWIF(wifKey);

  return wallet.address;
}

bool isValidPublicAddress(String? address) {
  if (address == null || address.isEmpty) {
    return false;
  }

  try {
    final decoded = base58.decode(address);
    if (decoded.length != 25) {
      return false;
    }

    final checksum = decoded.sublist(decoded.length - 4);
    final body = decoded.sublist(0, decoded.length - 4);

    final goodChecksumBytes =
        sha256.convert(sha256.convert(body).bytes).bytes.sublist(0, 4);
    final goodChecksum = Uint8List.fromList(goodChecksumBytes);

    if (decoded[0] != 0x00 && decoded[0] != 0x05) {
      return false;
    }

    return const ListEquality().equals(checksum, goodChecksum);
  } catch (e) {
    return false;
  }
}
