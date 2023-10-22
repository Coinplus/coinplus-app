import 'dart:typed_data';

Uint8List bigIntToBytes(BigInt number) {
  var hex = number.toRadixString(16);
  if (hex.length % 2 != 0) {
    hex = '0$hex';
  }

  final result = Uint8List(hex.length ~/ 2);
  for (var i = 0; i < hex.length; i += 2) {
    final byte = int.parse(hex.substring(i, i + 2), radix: 16);
    result[i ~/ 2] = byte;
  }
  return result;
}

String bytesToHex(Uint8List bytes) {
  return bytes.map((byte) => byte.toRadixString(16).padLeft(2, '0')).join();
}
