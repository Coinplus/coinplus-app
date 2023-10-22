import 'dart:typed_data';
import 'package:ecdsa/ecdsa.dart';
import 'package:elliptic/elliptic.dart';
import '../constants/nxp_known_public_key.dart';
import 'data_utils.dart';

final ec = getSecp128r1();
final publicKey = PublicKey.fromHex(ec, knownPublicKey);

bool verifyOriginality(Uint8List tagId, Uint8List signature) {
  final R = BigInt.parse(bytesToHex(signature.sublist(0, 16)), radix: 16);
  final S = BigInt.parse(bytesToHex(signature.sublist(16)), radix: 16);

  return verify(publicKey, tagId, Signature.fromRS(R, S));
}
