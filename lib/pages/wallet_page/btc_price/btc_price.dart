import 'package:flutter/material.dart';

import '../../../extensions/extensions.dart';
import '../../../gen/colors.gen.dart';
import '../../../gen/fonts.gen.dart';

Widget buildCoinWidget(num price) {
  final myFormat = NumberFormat.decimalPattern('en_us');
  final formattedPrice = myFormat.format(price).toString();
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '\$${formattedPrice.substring(0, 9)}',
          style: const TextStyle(
            fontSize: 16,
            fontFamily: FontFamily.redHatMedium,
            color: AppColors.primaryTextColor,
          ),
        ),
      ],
    ),
  );
}
