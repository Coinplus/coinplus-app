// import 'dart:typed_data';
//
// import 'package:dart_bs58check/dart_bs58check.dart';
//
// final modulus14 = BigInt.parse('4875194084160298409672797');
// final modulus28 =
//     BigInt.parse('23767517358231570773047645414309870043308402671871');
//
// BigInt b58strToBN(String b58str) {
//   final bytes = Bs5.decode(b58str);
//
//   final hex =
//       bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
//
//   final parsedBigInt = BigInt.parse(hex, radix: 16);
//
//   return parsedBigInt;
// }
//
// String bNToB58str(BigInt bn) {
//   final bytes = Uint8List.fromList(
//     bn
//         .toRadixString(16)
//         .padLeft((bn.bitLength + 7) ~/ 8 * 2, '0')
//         .toUpperCase()
//         .codeUnits,
//   );
//   return bs58check.encode(bytes);
// }
//
// BigInt modInverse(BigInt a, BigInt n) {
//   final inv = a.modInverse(n);
//   return inv;
// }
//
// BigInt lagrange(List<Map<String, BigInt>> shares, BigInt modulus) {
//   var s = BigInt.zero;
//   for (var pi = 0; pi < shares.length; pi++) {
//     var factors = BigInt.one;
//     for (var pj = 0; pj < shares.length; pj++) {
//       if (pi != pj) {
//         final nom = BigInt.zero - shares[pj]['x']!;
//         final den = shares[pi]['x']! - shares[pj]['x']!;
//         final oneoverden = modInverse(den, modulus);
//         factors = factors * nom * oneoverden;
//       }
//     }
//     s = s + shares[pi]['y']! * factors;
//   }
//   return s % modulus;
// }
//
// String combine(List<List<dynamic>> shares, int l) {
//   final x1 = BigInt.parse(shares[0][0].toString());
//   final y1 = b58strToBN(shares[0][1]);
//
//   final x2 = BigInt.parse(shares[1][0].toString());
//   final y2 = b58strToBN(shares[1][1]);
//
//   BigInt? modulus;
//
//   if (l == 14) {
//     modulus = modulus14;
//   } else if (l == 28) {
//     modulus = modulus28;
//   }
//   final sharesList = [
//     {'x': x1, 'y': y1},
//     {'x': x2, 'y': y2},
//   ];
//   final secretInt = lagrange(sharesList, modulus!);
//   final b58Secret = bNToB58str(secretInt);
//
//   return b58Secret;
// }
