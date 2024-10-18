extension Converter on num {
  static const double btcAsSatoshi = 100000000;

  num usdToBtc({required num? btcCurrentPrice}) {
    return this / (btcCurrentPrice ?? 1);
  }

  num usdToSatoshi({required num? btcCurrentPrice}) {
    return this * btcAsSatoshi / (btcCurrentPrice ?? 1);
  }

  num satoshiToBtc() {
    return this / btcAsSatoshi;
  }

  num satoshiToUsd({required num? btcCurrentPrice}) {
    return this / btcAsSatoshi * (btcCurrentPrice ?? 1);
  }

  num btcToUsd({required num? btcCurrentPrice}) {
    return this * (btcCurrentPrice ?? 1);
  }

  num btcToSatoshi() {
    return this * btcAsSatoshi;
  }

  String handleDecimalsLessThanOne() {
    final stringValue = toString();

    var nonZeroIndex = 2;
    while (nonZeroIndex < stringValue.length && stringValue[nonZeroIndex] == '0') {
      nonZeroIndex++;
    }

    if (nonZeroIndex >= stringValue.length || nonZeroIndex >= 14) {
      return '0';
    }
    final beforeNonZero = stringValue.substring(0, nonZeroIndex);
    final remainingPart = stringValue.substring(nonZeroIndex);
    final remainingDouble = double.parse('0.${remainingPart.replaceAll('-', '')}');
    final truncatedRemaining = remainingDouble.toStringAsFixed(5);
    final formattedTruncated = truncatedRemaining.substring(2).replaceAll(RegExp(r'0*$'), '');
    final hasNegativeSign = remainingPart.startsWith('-');
    final sign = hasNegativeSign ? '-' : '';
    final result = '$beforeNonZero$sign$formattedTruncated';
    return result;
  }
}
