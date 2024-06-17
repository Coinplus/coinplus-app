import 'package:flutter/services.dart';

/// A class that extends [TextInputFormatter] to format text input.
///
/// This class is used to replace commas with periods in the text input.
class CommaFormatter extends TextInputFormatter {
  /// Overrides the [formatEditUpdate] method of the [TextInputFormatter] class.
  ///
  /// This method is called each time the user modifies the text in the [TextField].
  /// It takes two parameters:
  /// - [oldValue] represents the [TextEditingValue] before the text change.
  /// - [newValue] represents the current [TextEditingValue].
  ///
  /// The method returns a new [TextEditingValue] where all commas in the text are replaced with periods.
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    final dotsCount = text.split('.').length;
    if (dotsCount == 2 && text.replaceAll(',', '.') == '.') {
      const text = '0.';
      return newValue.copyWith(
        text: text,
        selection: const TextSelection.collapsed(
          offset: text.length,
        ),
      );
    }

    if (oldValue.text == '0' && newValue.text == '00') {
      const text = '0';
      return newValue.copyWith(
        text: text,
        selection: const TextSelection.collapsed(
          offset: text.length,
        ),
      );
    }

    if (dotsCount > 2) {
      final newText = oldValue.text.replaceAll(',', '.');
      newText.split('.').first.trim();
      newText.split('.').lastOrNull?.trim();

      if (oldValue.text.trim() == '.') {
        return oldValue.copyWith(
          text: '0$newText',
        );
      }

      return oldValue.copyWith(
        text: newText,
      );
    }

    final trimmedText = text.replaceFirst(RegExp(r'^0+(?!\.|$)'), '');

    return newValue.copyWith(
      text: trimmedText.replaceAll(',', '.'),
      selection: TextSelection.collapsed(offset: trimmedText.length),
    );
  }
}
