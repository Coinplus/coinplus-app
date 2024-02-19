import 'package:flutter/material.dart';

import '../extensions/extensions.dart';
import '../gen/fonts.gen.dart';

class CryptoPriceFormatter extends StatelessWidget {
  final num price;

  const CryptoPriceFormatter({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _formatPrice(),
    );
  }

  Widget _formatPrice() {
    var formattedPrice = '';
    num fontSize;

    if (price >= 10) {
      formattedPrice = _formatDecimal(price, 2);
    } else if (price < 10 && price >= 1) {
      formattedPrice = _formatDecimal(price, 3);
    } else if (price < 1) {
      formattedPrice = _handleDecimalLessThanOne(price);
    }
    if (formattedPrice.length <= 8) {
      fontSize = 15;
    } else if (formattedPrice.length >= 9 && formattedPrice.length <= 11) {
      fontSize = 11;
    } else {
      fontSize = 9;
    }

    if (formattedPrice.length >= 13) {
      formattedPrice = '0';
      fontSize = 15;
    }

    String _formatWithCommas(String value) {
      final parts = value.split('.');
      parts[0] = parts[0].replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        (match) => '${match[1]},',
      );
      return parts.join('.');
    }

    return Text(
      '\$${_formatWithCommas(formattedPrice)}',
      style: TextStyle(
        fontSize: fontSize.toDouble(),
        fontFamily: FontFamily.redHatMedium,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  String _formatDecimal(num value, int decimalPlaces) {
    var formatted = value.toStringAsFixed(decimalPlaces);
    formatted = formatted.replaceAll(RegExp(r'0*$'), '');
    formatted = formatted.replaceAll(RegExp(r'\.$'), '');
    return formatted;
  }

  String _handleDecimalLessThanOne(num value) {
    final stringValue = value.toString();

    if (stringValue.contains('e-')) {
      final parts = stringValue.split('e-');
      if (parts.length == 2) {
        final exponent = int.parse(parts[1]);
        final zeros = '0' * (exponent - 1);
        final fractionalPart = parts[0].replaceAll('.', '');
        var nonZeroIndex = 0;
        while (nonZeroIndex < fractionalPart.length && fractionalPart[nonZeroIndex] == '0') {
          nonZeroIndex++;
        }
        if (nonZeroIndex == fractionalPart.length) {
          nonZeroIndex = fractionalPart.length;
        }
        final beforeNonZeroIndex = fractionalPart.substring(0, nonZeroIndex);
        final afterNonZeroIndex = fractionalPart.substring(nonZeroIndex, nonZeroIndex + 2);
        final formattedFractionalPart = '0.$zeros$beforeNonZeroIndex$afterNonZeroIndex';
        return formattedFractionalPart;
      }
    }

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

String formatLargeNumber(int number) {
  final numberFormat = NumberFormat.compact(locale: 'en');
  final formattedNumber = numberFormat.format(number);

  return formattedNumber.replaceFirstMapped(
    RegExp(r'(\d+)([A-Za-z]+)'),
        (match) => '${match.group(1)} ${match.group(2)}',
  );
}
