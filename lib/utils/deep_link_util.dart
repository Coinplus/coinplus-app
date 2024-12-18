import 'package:flutter/material.dart';

import '../gen/fonts.gen.dart';
import '../providers/screen_service.dart';
import '../widgets/custom_snack_bar/snack_bar.dart';
import '../widgets/custom_snack_bar/top_snack.dart';
import 'compute_private_key.dart';

String? onLinkPassed(Map<dynamic, dynamic> data) {
  if (data.containsKey('+non_branch_link') && data['+non_branch_link'] != null) {
    final String url = data['+non_branch_link'];
    final splitting = url.split('/');
    final part = splitting[splitting.length - 1];
    if (isValidPublicAddress(part)) {
      return part;
    } else {
      showTopSnackBar(
        displayDuration: const Duration(milliseconds: 400),
        Overlay.of(router.navigatorKey.currentContext!),
        CustomSnackBar.success(
          backgroundColor: const Color(0xFF4A4A4A).withValues(alpha: 0.9),
          message: 'This is not a valid Coinplus Bitcoin address',
          textStyle: const TextStyle(
            fontFamily: FontFamily.redHatMedium,
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      );
    }
  }
  return null;
}
