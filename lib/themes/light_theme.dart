import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_fonts.dart';
import 'app_styles.dart';

final base = ThemeData.light();

final lightTheme = base.copyWith(
  shadowColor: Colors.black,
  colorScheme: base.colorScheme.copyWith(
    primary: Colors.white,
    onPrimary: Colors.black54,
  ),
  tabBarTheme: TabBarTheme(
    unselectedLabelStyle: base.primaryTextTheme.labelLarge!.copyWith(
      color: Colors.white,
    ),
    labelStyle: const TextStyle(
      color: Colors.black54,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      height: 1,
    ),
    indicator: BoxDecoration(
      borderRadius: BorderRadius.circular(13),
      color: Colors.white,
    ),
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: Colors.black54,
    unselectedLabelColor: Colors.white,
    labelPadding: const EdgeInsets.symmetric(
      horizontal: 10,
      vertical: 5,
    ),
  ),
  primaryColor: Colors.grey,
  // shadowColor: Colors.black[300],
  scaffoldBackgroundColor: Colors.white,
  dividerColor: Colors.black,
  dividerTheme: base.dividerTheme.copyWith(
    space: 1,
    indent: 24,
    endIndent: 24,
    color: Colors.black,
  ),
  primaryIconTheme: base.primaryIconTheme.copyWith(color: Colors.black54),
  iconTheme: base.iconTheme.copyWith(color: Colors.black54),
  appBarTheme: base.appBarTheme.copyWith(
    centerTitle: true,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: base.primaryTextTheme.titleLarge!.copyWith(
      fontFamily: FontFamily.CeraPro,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      letterSpacing: -.4,
      height: 1.1,
    ),
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    toolbarTextStyle: base.textTheme
        .copyWith(
          bodyLarge: base.textTheme.bodyLarge!.copyWith(
            fontFamily: FontFamily.CeraPro,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: base.textTheme.titleLarge!.copyWith(
            fontFamily: FontFamily.CeraPro,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: base.textTheme.displaySmall!.copyWith(
            fontFamily: FontFamily.CeraPro,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: base.textTheme.headlineMedium!.copyWith(
            fontFamily: FontFamily.CeraPro,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        )
        .bodyMedium,
  ),
  bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  chipTheme: base.chipTheme.copyWith(
    backgroundColor: Colors.transparent,
    labelPadding: const EdgeInsets.symmetric(horizontal: 20),
    labelStyle: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.CeraPro,
    ),
    selectedColor: Colors.black54,
    secondaryLabelStyle: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.CeraPro,
    ),
    secondarySelectedColor: Colors.transparent,
  ),
  sliderTheme: base.sliderTheme.copyWith(
    activeTrackColor: Colors.grey,
    inactiveTrackColor: Colors.black,
    overlayColor: Colors.transparent,
    thumbColor: Colors.grey,
    thumbShape: SliderComponentShape.noOverlay,
    valueIndicatorColor: Colors.grey,
  ),
  textSelectionTheme: base.textSelectionTheme.copyWith(
    cursorColor: Colors.yellow,
    selectionHandleColor: Colors.yellow,
  ),
  cupertinoOverrideTheme: const CupertinoThemeData(
    primaryColor: Colors.yellow,
  ),
  brightness: Brightness.light,
  inputDecorationTheme: base.inputDecorationTheme.copyWith(
    errorStyle: const TextStyle(
      color: Colors.grey,
      fontFamily: FontFamily.CeraPro,
    ),
    hintStyle: base.primaryTextTheme.bodyLarge!.copyWith(
      color: Colors.black,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      letterSpacing: 0,
      height: 1.25,
    ),
    fillColor: Colors.white,
    contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 2,
      ),
    ),
    enabledBorder: const UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
    ),
    focusedBorder: const UnderlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      borderSide: BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
    ),
    filled: true,
    labelStyle: const TextStyle(
      color: Colors.black,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      letterSpacing: 0,
      height: 1.25,
    ),
  ),
  buttonTheme: base.buttonTheme.copyWith(
    textTheme: ButtonTextTheme.primary,
    buttonColor: Colors.white,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
      ),
      textStyle: WidgetStateProperty.resolveWith(
        (states) {
          return states.contains(WidgetState.disabled)
              ? TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontFamily: FontFamily.CeraPro,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1.1,
                )
              : const TextStyle(
                  color: Colors.black,
                  fontFamily: FontFamily.CeraPro,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1.1,
                );
        },
      ),
      shape: WidgetStateProperty.resolveWith((state) {
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        );
      }),
      foregroundColor: WidgetStateProperty.resolveWith((states) {
        return states.contains(WidgetState.disabled) ? Colors.white : Colors.grey;
      }),
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          return states.contains(WidgetState.disabled) ? Colors.black.withOpacity(0.4) : Colors.black;
        },
      ),
      overlayColor: WidgetStateProperty.all(
        Colors.black,
      ),
    ),
  ),
  tooltipTheme: TooltipThemeData(
    preferBelow: false,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shadowColor: WidgetStateProperty.all(Colors.grey.withOpacity(0.2)),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
      ),
      overlayColor: WidgetStateProperty.all(Colors.black.withOpacity(.5)),
      elevation: WidgetStateProperty.all(0),
      textStyle: WidgetStateProperty.resolveWith(
        (states) {
          return const TextStyle(
            color: Colors.white,
            fontFamily: FontFamily.CeraPro,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            height: 1.1,
          );
        },
      ),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      backgroundColor: WidgetStateProperty.resolveWith(
        (states) {
          return Colors.grey.withOpacity(0.2);
        },
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
  textTheme: base.primaryTextTheme.copyWith(
    displayLarge: base.primaryTextTheme.displayLarge!.copyWith(
      color: Colors.grey,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.bold,
      fontSize: 26,
    ),
    displayMedium: base.primaryTextTheme.displayMedium!.copyWith(
      color: Colors.black,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.bold,
      fontSize: 38,
      letterSpacing: -.76,
      height: 1,
    ),
    displaySmall: base.primaryTextTheme.displaySmall!.copyWith(
      color: Colors.black,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.bold,
      fontSize: 28,
      letterSpacing: -.56,
      height: 1,
    ),
    headlineMedium: base.primaryTextTheme.headlineMedium!.copyWith(
      color: Colors.black,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.normal,
      fontSize: 26,
      letterSpacing: -.52,
      height: 1,
    ),
    headlineSmall: base.primaryTextTheme.headlineSmall!.copyWith(
      fontFamily: FontFamily.CeraPro,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      letterSpacing: -.48,
      height: 1.2,
    ),
    titleLarge: base.primaryTextTheme.titleLarge!.copyWith(
      fontFamily: FontFamily.CeraPro,
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      letterSpacing: -.4,
      height: 1.1,
    ),
    titleMedium: base.primaryTextTheme.titleMedium!.copyWith(
      color: Colors.black,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.bold,
      fontSize: 16,
      height: 1.25,
      letterSpacing: 0,
    ),
    titleSmall: base.primaryTextTheme.titleSmall!.copyWith(
      color: Colors.black,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.25,
      letterSpacing: 0,
    ),
    bodyLarge: base.primaryTextTheme.bodyLarge!.copyWith(
      color: Colors.black,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      letterSpacing: 0,
      height: 1.25,
    ),
    bodyMedium: base.primaryTextTheme.bodyMedium!.copyWith(
      color: Colors.black,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.normal,
      fontSize: 14,
      letterSpacing: -.16,
      height: 1.25,
    ),
    bodySmall: const TextStyle(
      color: Colors.black,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.normal,
      fontSize: 12,
      height: 1.1,
      letterSpacing: -.16,
    ),
    labelSmall: const TextStyle(
      color: Colors.black,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.normal,
      fontSize: 10,
      height: 1.1,
      letterSpacing: -.1,
    ),
    labelLarge: const TextStyle(
      color: Colors.black,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      height: 1.1,
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return Colors.grey;
      }
      return null;
    }),
  ),
  radioTheme: RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return Colors.grey;
      }
      return null;
    }),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return Colors.grey;
      }
      return null;
    }),
    trackColor: WidgetStateProperty.resolveWith<Color?>((states) {
      if (states.contains(WidgetState.disabled)) {
        return null;
      }
      if (states.contains(WidgetState.selected)) {
        return Colors.grey;
      }
      return null;
    }),
  ),
);
