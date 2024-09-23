import 'package:flutter/material.dart';

import '../../gen/fonts.gen.dart';
import 'snack_bar.dart';
import 'top_snack.dart';

Future<void> showCustomSnackBar({
  required String message,
  required BuildContext context,
}) async {
  showTopSnackBar(
    displayDuration: const Duration(
      milliseconds: 600,
    ),
    Overlay.of(context),
    CustomSnackBar.success(
      backgroundColor: const Color(0xFF4A4A4A).withOpacity(0.9),
      message: message,
      textStyle: const TextStyle(
        fontFamily: FontFamily.redHatMedium,
        fontSize: 14,
        color: Colors.white,
      ),
    ),
  );
}
