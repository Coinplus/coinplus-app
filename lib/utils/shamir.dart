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
// import 'dart:convert';
// import 'dart:developer';
//
// import 'package:bs58check/bs58check.dart';
// import 'package:flutter/foundation.dart';
// import 'package:pointycastle/digests/sha256.dart';


// final bitcoinExp = BigInt.from(100000000);
//
// class CryptoUtils {
//   static Uint8List doubleSha256(Uint8List data) {
//     final sha256 = SHA256Digest();
//     final firstHash = sha256.process(data);
//     final secondHash = sha256.process(firstHash);
//     return Uint8List.fromList(secondHash);
//   }
// }
//
// Future<Map<String, String>> getWif(String secret1B58, String secret2B58) async {
//
//
//   final outputs = <String, String>{};
//
//
//   return outputs;
// }
//
// Future<String?> getWifBTC(String secret1B58, String secret2B58) async {
//   final wifData = await getWif(secret1B58, secret2B58);
//   return wifData['bitcoin'];
// }
//
// String getPublicKeyFromWif(String wif) {
//   final decoded = base58.decode(wif);
//   final pubkeyBytes = decoded.sublist(1, decoded.length - 5);
//   return base58.encode(pubkeyBytes);
// }
//
// bool isValidPublicAddress(String address) {
//   if (address.isEmpty) {
//     return false;
//   }
//
//   try {
//     final decoded = base58.decode(address);
//     if (decoded.length != 25) {
//       return false;
//     }
//
//     final checksum = decoded.sublist(decoded.length - 4);
//     final body = decoded.sublist(0, decoded.length - 4);
//     final goodChecksum = CryptoUtils.doubleSha256(Uint8List.fromList(body))
//         .sublist(0, 4);
//     if (decoded[0] != 0x00 && decoded[0] != 0x05) {
//       return false;
//     }
//     return listEquals(checksum, goodChecksum);
//   } catch (e) {
//     return false;
//   }
// }
//
// const historyURL = 'https://live.blockcypher.com/btc/address/';
//
// Future<Map<String, String>> getBalance(String address) async {
//   final response = await fetchBalance('https://api.blockcypher.com/v1/btc/main/addrs/$address/balance');
//   final result = json.decode(response) as Map<String, dynamic>;
//   final finalBalance = (BigInt.parse(result['final_balance'] as String) / bitcoinExp).toString();
//   final unconfirmedBalance = (BigInt.parse(result['unconfirmed_balance'] as String) / bitcoinExp).toString();
//   return {'finalBalance': finalBalance, 'unconfirmedBalance': unconfirmedBalance};
// }
//
// Future<String> fetchBalance(String url) async {
//   // You can use your preferred method for fetching data from the given URL.
//   // This example uses a hypothetical fetch function for demonstration purposes.
//   final response = await fetch(url);
//   return response;
// }
//
// // The fetch function is a placeholder for an actual HTTP request function.
// Future<String> fetch(String url) {
//   // Implement your HTTP request here. This example returns a hypothetical response.
//   const response = '''
//     {
//       "final_balance": "1000000000",
//       "unconfirmed_balance": "50000000"
//     }
//   ''';
//   return Future.value(response);
// }





