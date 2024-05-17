// import 'package:flutter/services.dart';
// import 'package:number_text_input_formatter/number_text_input_formatter.dart';
//
// class NumberTextInputFormat extends TextInputFormatter {
//   static final numberTester = RegExp(r'^0*([1-9][0-9]*)(\.([0-9]+))?$');
//
//   /// Insert prefix after format.
//   final String? prefix;
//
//   /// Insert suffix after format.
//   final String? suffix;
//
//   /// Maximum value of integer.
//   late final String? maxInteger;
//
//   /// The maximum value of the decimal when the integer part reaches the maximum.
//   late final String? maxDecimal;
//
//   /// Maximum number of integer digits.
//   late final int? integerDigits;
//
//   /// Maximum number of decimal digits.
//   late final int? decimalDigits;
//
//   /// Decimal Separator: default is dot.
//   final String decimalSeparator;
//
//   /// Allow input of negative numbers?
//   final bool allowNegative;
//
//   /// Insert 0 before the decimal point if the number starts with a decimal point
//   /// Insert 0 after the decimal point if the number ends with a decimal point
//   final bool fixNumber;
//
//   /// Automatically insert decimal point.
//   final bool insertDecimalPoint;
//
//   /// Always add decimal digits.
//   final bool insertDecimalDigits;
//
//   /// Allow to change decimal point position?
//   final bool overrideDecimalPoint;
//
//   /// Grouping of 2 or more digits with groupIntegerSeparator.
//   final int? groupDigits;
//
//   /// Grouping separator: default is comma.
//   final String groupSeparator;
//
//   NumberTextInputFormat({
//     this.prefix,
//     this.suffix,
//     this.integerDigits,
//     this.decimalDigits,
//     String? maxValue,
//     this.decimalSeparator = '.',
//     this.groupDigits,
//     this.groupSeparator = ',',
//     this.allowNegative = false,
//     this.overrideDecimalPoint = false,
//     this.fixNumber = true,
//     this.insertDecimalPoint = false,
//     this.insertDecimalDigits = false,
//   })  : assert(integerDigits == null || integerDigits > 0),
//         assert(decimalDigits == null || decimalDigits >= 0),
//         assert(decimalSeparator.length == 1),
//         assert(groupDigits == null || groupDigits > 1),
//         assert(groupSeparator.length == 1),
//         assert(decimalSeparator != groupSeparator) {
//     String? maxInteger;
//     String? maxDecimal;
//
//     if (maxValue != null) {
//       final maxValues = numberTester.matchAsPrefix(maxValue);
//       assert(maxValues != null && maxValues.groupCount > 0);
//       maxInteger = maxValues?.group(1);
//       maxDecimal = maxValues?.group(3);
//
//       if (integerDigits != null) {
//         if (maxInteger != null) {
//           if (maxInteger.length <= integerDigits!) {
//             integerDigits = maxInteger.length;
//           } else {
//             maxInteger =
//                 maxInteger.substring(maxInteger.length - integerDigits!);
//           }
//         }
//       } else {
//         integerDigits = maxInteger?.length;
//       }
//
//       if (decimalDigits != null) {
//         if (maxDecimal != null) {
//           if (maxDecimal.length > decimalDigits!) {
//             maxDecimal = maxDecimal.substring(0, decimalDigits);
//           } else if (maxDecimal.length < decimalDigits!) {
//             maxDecimal += '0' * (decimalDigits! - maxDecimal.length);
//           }
//         }
//       } else {
//         decimalDigits = maxDecimal?.length;
//       }
//     }
//
//     this.maxInteger = maxInteger;
//     this.maxDecimal = maxDecimal;
//   }
//
//   @override
//   TextEditingValue formatEditUpdate(
//     TextEditingValue oldValue,
//     TextEditingValue newValue,
//   ) {
//     if (newValue.text.isEmpty == true) {
//       return newValue;
//     }
//
//     final state = TextValueEditor(newValue);
//     TextNumberFilter(this, state)
//       ..prepare({'removing': oldValue.text.length - 1 == newValue.text.length})
//       ..filter();
//
//     if (state.isNotEmpty) {
//       if (prefix != null) {
//         state.prefix(prefix!);
//       }
//       if (suffix != null) {
//         state.suffix(suffix!);
//       }
//     }
//
//     return state.finalize();
//   }
// }
//
// const _negative = 45;
// const _number_0 = 48;
// const _number_9 = 57;
//
// class TextNumberFilter {
//   final NumberTextInputFormat options;
//   final TextValueEditor editor;
//
//   bool hasDecimalPoint = true;
//   bool allowDecimalPoint = true;
//   bool decimalWithoutPoint = false;
//   bool removing = false;
//   int? maxIntegerDigits;
//   int? maxDecimalDigits;
//   String decimalSeparator = '.';
//   String groupSeparator = ',';
//   bool allowing = true;
//   int startPosition = 0;
//   int integerDigits = 0;
//   int? decimalPoint;
//   int decimalDigits = 0;
//   bool limitedNumber = false;
//   bool limitedInteger = false;
//   bool? limitedDecimal;
//   bool isNegative = false;
//   bool numberStarted = false;
//   bool hasNumber = false;
//   bool foundNumbers = false;
//
//   TextNumberFilter(this.options, this.editor);
//
//   void prepare(Map<String, dynamic> params) {
//     removing = params['removing'] == true;
//     hasDecimalPoint = options.decimalDigits == null || options.decimalDigits! > 0;
//     allowDecimalPoint = options.insertDecimalDigits || !options.insertDecimalPoint;
//     decimalWithoutPoint = hasDecimalPoint && !allowDecimalPoint;
//     maxIntegerDigits = options.integerDigits;
//     maxDecimalDigits = options.decimalDigits;
//     if (decimalWithoutPoint) {
//       if (maxIntegerDigits != null && maxDecimalDigits != null) {
//         maxIntegerDigits = maxIntegerDigits! + maxDecimalDigits!;
//       } else {
//         maxIntegerDigits = null;
//       }
//       maxDecimalDigits = 0;
//     }
//     decimalSeparator = options.decimalSeparator;
//     groupSeparator = options.groupSeparator;
//
//     allowing = true;
//     startPosition = 0;
//     integerDigits = 0;
//     decimalPoint = null;
//     decimalDigits = 0;
//     limitedNumber = false;
//     limitedInteger = false;
//     limitedDecimal = null;
//     numberStarted = false;
//     hasNumber = false;
//     foundNumbers = false;
//   }
//
//
//   TextValueEditor filter() {
//     editor.forEach(filterNext, filterComplete);
//     return editor;
//   }
//
//   bool filterNext(int value, int index, LookupTextValueEditor state) {
//     var allow = false;
//     if (!numberStarted && options.allowNegative && value == _negative) {
//       isNegative = true;
//       allow = true;
//     } else if (decimalPoint == null) {
//       if (_number_0 <= value && value <= _number_9) {
//         allow = filterInteger(value, state.index, state);
//       } else if (value == decimalSeparator.codeUnitAt(0)) {
//         allow = filterDecimalPoint(value, state.index, state);
//       }
//     } else {
//       if (_number_0 <= value && value <= _number_9) {
//         allow = filterDecimal(value, state.index, state);
//       } else if (value == decimalSeparator.codeUnitAt(0)) {
//         allow = filterOtherDecimalPoint(value, state.index, state);
//       }
//     }
//     if (allow && !numberStarted) {
//       numberStarted = true;
//     }
//
//     if (allowing != allow || state.index == state.length) {
//       if (!allowing && startPosition < state.index) {
//         if (decimalPoint == state.index) {
//           decimalPoint = startPosition;
//         }
//         state.remove(startPosition, state.index);
//       }
//       startPosition = state.index;
//       allowing = allow;
//     }
//     return true;
//   }
//
//   void filterComplete(int length, LookupTextValueEditor state) {
//     if (!allowing && startPosition < length) {
//       state.remove(startPosition, length);
//     }
//
//     insertIntegerDigits();
//
//     if (editor.isNotEmpty) {
//       if (decimalPoint != null) {
//         if (decimalDigits == 0) {
//           insertDecimalDigits();
//         }
//       } else {
//         if (hasDecimalPoint) {
//           insertDecimalPoint();
//         }
//       }
//
//       groupDigits();
//     }
//   }
//
//   bool filterInteger(int value, int index, LookupTextValueEditor state) {
//     var allow = false;
//     hasNumber = true;
//     if (value != _number_0) {
//       foundNumbers = true;
//     }
//     if (foundNumbers && !limitedInteger) {
//       final newIntegerDigits = integerDigits + 1;
//       if (maxIntegerDigits == null || newIntegerDigits < maxIntegerDigits!) {
//         allow = true;
//       } else if (maxIntegerDigits != null &&
//           newIntegerDigits == maxIntegerDigits!) {
//         allow = filterMaximumInteger(value, state.index, state);
//       } else {
//         allow = filterOverInteger(value, state.index, state);
//       }
//     }
//     if (allow) {
//       integerDigits++;
//     }
//     return allow;
//   }
//
//   bool filterMaximumInteger(int value, int index, LookupTextValueEditor state) {
//     if (options.maxInteger != null &&
//         options.maxInteger!.length == maxIntegerDigits) {
//       final codes = options.maxInteger!.codeUnits;
//       for (var i = 0; i < maxIntegerDigits!; i++) {
//         final code = codes[i];
//         final char = !allowing && i >= startPosition
//             ? state[state.index + i - startPosition]
//             : state[i];
//         if (char < code) {
//           return true;
//         } else if (char > code) {
//           limitedInteger = true;
//           return false;
//         }
//       }
//       limitedNumber = true;
//       return true;
//     } else {
//       return true;
//     }
//   }
//
//   bool filterOverInteger(int value, int index, LookupTextValueEditor state) {
//     return false;
//   }
//
//   bool filterDecimalPoint(int value, int index, LookupTextValueEditor state) {
//     if (hasDecimalPoint && allowDecimalPoint) {
//       if (integerDigits == 0) {
//         if (!allowing && startPosition < state.index) {
//           state.remove(startPosition, state.index);
//         }
//         allowing = true;
//         startPosition = state.index;
//       }
//       decimalPoint = state.index;
//       return true;
//     }
//     return false;
//   }
//
//   bool filterDecimal(int value, int index, LookupTextValueEditor state) {
//     var allow = false;
//     if (maxDecimalDigits == null || decimalDigits < maxDecimalDigits!) {
//       if (maxDecimalDigits == null) {
//         allow = true;
//       } else if (limitedDecimal == false) {
//         allow = true;
//       } else if (limitedDecimal == true) {
//         allow = false;
//       } else if (limitedNumber &&
//           options.maxDecimal != null &&
//           options.maxDecimal!.length == maxDecimalDigits) {
//         allow = filterMaximumDecimal(value, state.index, state);
//       } else {
//         allow = true;
//       }
//     }
//     if (allow) {
//       decimalDigits++;
//     }
//     return allow;
//   }
//
//   bool filterMaximumDecimal(int value, int index, LookupTextValueEditor state) {
//     final codes = options.maxDecimal!.codeUnits;
//     final char = codes[state.index - decimalPoint! - 1];
//     if (value < char) {
//       limitedNumber = false;
//       limitedDecimal = false;
//       return true;
//     } else if (value > char) {
//       limitedDecimal = true;
//       return false;
//     } else {
//       return true;
//     }
//   }
//
//   bool filterOtherDecimalPoint(
//     int value,
//     int index,
//     LookupTextValueEditor state,
//   ) {
//     var allow = false;
//     if (hasDecimalPoint && allowDecimalPoint && options.overrideDecimalPoint) {
//       if (!allowing && startPosition < state.index) {
//         state.remove(startPosition, state.index);
//       }
//       if (decimalPoint! < state.index - 1) {
//         // If the text cursor is after the dot, it takes precedence.
//         if (state.selection?.base == null ||
//             state.selection?.base != state.selection?.extent ||
//             state.selection?.base != decimalPoint! + 1) {
//           // Change decimal point.
//           state.remove(decimalPoint!, decimalPoint! + 1);
//           decimalPoint = state.index;
//           if (decimalPoint! > 1 && state[0] == _number_0) {
//             state.remove(0, 1);
//             decimalPoint = decimalPoint! - 1;
//           }
//           if (maxIntegerDigits != null && maxIntegerDigits! < decimalPoint!) {
//             state.remove(maxIntegerDigits!, decimalPoint!);
//             decimalPoint = maxIntegerDigits;
//           }
//           integerDigits = state.length;
//           decimalDigits = 0;
//           allow = true;
//         }
//       }
//       startPosition = state.index;
//       allowing = allow;
//     }
//     return allow;
//   }
//
//   void insertIntegerDigits() {
//     if ((decimalPoint != null || hasNumber) && integerDigits == 0) {
//       if (!removing && options.fixNumber) {
//         integerDigits = 1;
//         if (isNegative) {
//           editor.insert(1, '0');
//         } else {
//           editor.prefix('0');
//         }
//       }
//     }
//   }
//
//   void insertDecimalDigits() {
//     decimalPoint ??= editor.length - 1;
//     if (!removing && (options.fixNumber || options.insertDecimalDigits)) {
//       decimalDigits = options.decimalDigits ?? 1;
//       editor.suffix('0' * decimalDigits);
//     }
//   }
//
//   void insertDecimalPoint() {
//     if (options.insertDecimalDigits) {
//       if (!removing) {
//         decimalPoint = editor.length;
//         decimalDigits = options.decimalDigits!;
//         editor.suffix('$decimalSeparator${'0' * decimalDigits}');
//       }
//     } else if (options.insertDecimalPoint) {
//       if (integerDigits > options.decimalDigits!) {
//         decimalPoint = editor.length - options.decimalDigits!;
//         integerDigits = decimalPoint! - (isNegative ? 1 : 0);
//         decimalDigits = options.decimalDigits!;
//         editor.insert(decimalPoint!, decimalSeparator);
//       } else {
//         if (!removing ||
//             integerDigits > 1 ||
//             (integerDigits == 1 && editor[isNegative ? 1 : 0] != _number_0)) {
//           final missingNumber = options.decimalDigits! - integerDigits;
//           var missingInteger = '0$decimalSeparator';
//           if (missingNumber > 0) {
//             missingInteger += '0' * missingNumber;
//           }
//           integerDigits = 1;
//           decimalDigits = options.decimalDigits!;
//           if (isNegative) {
//             decimalPoint = 2;
//             editor.insert(1, missingInteger);
//           } else {
//             decimalPoint = 1;
//             editor.prefix(missingInteger);
//           }
//         }
//       }
//     }
//   }
//
//   void groupDigits() {
//     if (options.groupDigits != null) {
//       var index = integerDigits;
//       var startPoint = 0;
//       if (isNegative) {
//         index += 1;
//         startPoint = 1;
//       }
//       while (true) {
//         index -= options.groupDigits!;
//         if (index <= startPoint) {
//           break;
//         }
//         editor.insert(index, groupSeparator);
//       }
//     }
//   }
// }
