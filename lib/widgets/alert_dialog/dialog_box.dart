import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../gen/fonts.gen.dart';
import '../../providers/screen_service.dart';
import '../loading_button.dart';

class DialogBox extends HookWidget {
  /// Dialog box with single ok button.
  const DialogBox({
    required this.text,
    required this.title,
    this.style,
    required this.buttonText,
    super.key,
  });

  final Widget title;
  final String text;
  final String buttonText;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: const EdgeInsets.only(bottom: 16, right: 24, left: 24),
      alignment: Alignment.center,
      titlePadding: const EdgeInsets.only(top: 32, left: 32, right: 32),
      contentPadding: const EdgeInsets.only(bottom: 24, right: 24, left: 24, top: 16),
      title: title,
      backgroundColor: Colors.white,
      elevation: 0,
      content: Text(
        text,
        textAlign: TextAlign.center,
        maxLines: 8,
        style: const TextStyle(fontFamily: FontFamily.redHatMedium),
      ),
      actions: [
        LoadingButton(
          onPressed: router.pop,
          child: Text(buttonText),
        ),
      ],
    );
  }
}
