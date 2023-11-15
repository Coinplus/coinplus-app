import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_fonts.dart';
import 'app_styles.dart';

final base = ThemeData.dark();
const scaffoldBackgroundColor = Colors.black54;

final darkTheme = base.copyWith(
  shadowColor: Colors.grey,
  colorScheme: base.colorScheme.copyWith(
    primary: Colors.black54,
    onPrimary: Colors.white,
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
  // shadowColor: Colors.grey[300],
  scaffoldBackgroundColor: Colors.black54,
  dividerColor: Colors.grey,
  dividerTheme: base.dividerTheme.copyWith(
    space: 1,
    indent: 24,
    endIndent: 24,
    color: Colors.grey,
  ),
  primaryIconTheme: base.primaryIconTheme.copyWith(color: Colors.black54),
  iconTheme: base.iconTheme.copyWith(color: Colors.black54),
  appBarTheme: base.appBarTheme.copyWith(
    color: Colors.black54,
    centerTitle: true,
    elevation: 0,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
    titleTextStyle: base.primaryTextTheme.titleLarge!.copyWith(
      fontFamily: FontFamily.CeraPro,
      color: Colors.white,
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
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: base.textTheme.titleLarge!.copyWith(
            fontFamily: FontFamily.CeraPro,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          displaySmall: base.textTheme.displaySmall!.copyWith(
            fontFamily: FontFamily.CeraPro,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headlineMedium: base.textTheme.headlineMedium!.copyWith(
            fontFamily: FontFamily.CeraPro,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        )
        .bodyMedium,
  ),
  bottomNavigationBarTheme: base.bottomNavigationBarTheme.copyWith(
    backgroundColor: Colors.black54,
    elevation: 0,
  ),
  chipTheme: base.chipTheme.copyWith(
    backgroundColor: Colors.transparent,
    labelPadding: const EdgeInsets.symmetric(horizontal: 20),
    labelStyle: const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.CeraPro,
    ),
    selectedColor: Colors.black54,
    secondaryLabelStyle: const TextStyle(
      color: Colors.black54,
      fontWeight: FontWeight.w500,
      fontFamily: FontFamily.CeraPro,
    ),
    secondarySelectedColor: Colors.transparent,
  ),
  sliderTheme: base.sliderTheme.copyWith(
    activeTrackColor: Colors.red,
    inactiveTrackColor: Colors.grey,
    overlayColor: Colors.transparent,
    thumbColor: Colors.red,
    thumbShape: SliderComponentShape.noOverlay,
    valueIndicatorColor: Colors.red,
  ),
  textSelectionTheme: base.textSelectionTheme.copyWith(
    cursorColor: Colors.yellow,
    selectionHandleColor: Colors.yellow,
  ),

  cupertinoOverrideTheme: const CupertinoThemeData(
    primaryColor: Colors.grey,
  ),

  brightness: Brightness.dark,
  inputDecorationTheme: base.inputDecorationTheme.copyWith(
    errorStyle: const TextStyle(
      color: Colors.red,
      fontFamily: FontFamily.CeraPro,
    ),
    hintStyle: base.primaryTextTheme.bodyLarge!.copyWith(
      color: Colors.grey,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      letterSpacing: -.32,
      height: 1.25,
    ),
    fillColor: Colors.black54,
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
      color: Colors.grey,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      letterSpacing: -.32,
      height: 1.25,
    ),
  ),
  buttonTheme: base.buttonTheme.copyWith(
    textTheme: ButtonTextTheme.primary,
    buttonColor: Colors.black54,
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
      ),
      textStyle: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled)
              ? TextStyle(
                  color: Colors.white.withOpacity(0.4),
                  fontFamily: FontFamily.CeraPro,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1.1,
                )
              : const TextStyle(
                  color: Colors.white,
                  fontFamily: FontFamily.CeraPro,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  height: 1.1,
                );
        },
      ),
      shape: MaterialStateProperty.resolveWith((state) {
        return const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
        );
      }),
      foregroundColor: MaterialStateProperty.resolveWith((states) {
        return states.contains(MaterialState.disabled) ? Colors.redAccent.withOpacity(0.4) : Colors.redAccent;
      }),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled) ? Colors.grey.withOpacity(0.4) : Colors.grey;
        },
      ),
      overlayColor: MaterialStateProperty.all(
        Colors.grey.withOpacity(.5),
      ),
    ),
  ),
  tooltipTheme: TooltipThemeData(
    preferBelow: false,
    decoration: BoxDecoration(
      color: Colors.redAccent,
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shadowColor: MaterialStateProperty.all(Colors.grey),
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
      ),
      elevation: MaterialStateProperty.all(0),
      textStyle: MaterialStateProperty.resolveWith(
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
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
      foregroundColor: MaterialStateProperty.all(Colors.white),
      backgroundColor: MaterialStateProperty.resolveWith(
        (states) {
          return states.contains(MaterialState.disabled) ? Colors.grey.withOpacity(0.5) : Colors.grey;
        },
      ),
      overlayColor: MaterialStateProperty.all(
        Colors.grey.withOpacity(.5),
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(style: outlineButtonStyle),
  textTheme: base.primaryTextTheme.copyWith(
    displayLarge: base.primaryTextTheme.displayLarge!.copyWith(
      color: Colors.white,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.bold,
      fontSize: 26,
    ),
    displayMedium: base.primaryTextTheme.displayMedium!.copyWith(
      color: Colors.white,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.bold,
      fontSize: 38,
      letterSpacing: -.76,
      height: 1,
    ),
    displaySmall: base.primaryTextTheme.displaySmall!.copyWith(
      color: Colors.white,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.bold,
      fontSize: 28,
      letterSpacing: -.56,
      height: 1,
    ),
    headlineMedium: base.primaryTextTheme.headlineMedium!.copyWith(
      color: Colors.white,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.normal,
      fontSize: 26,
      letterSpacing: -.52,
      height: 1,
    ),
    headlineSmall: base.primaryTextTheme.headlineSmall!.copyWith(
      fontFamily: FontFamily.CeraPro,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      letterSpacing: -.48,
      height: 1.2,
    ),
    titleLarge: base.primaryTextTheme.titleLarge!.copyWith(
      fontFamily: FontFamily.CeraPro,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      letterSpacing: -.4,
      height: 1.1,
    ),
    titleMedium: base.primaryTextTheme.titleMedium!.copyWith(
      color: Colors.white,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.bold,
      fontSize: 16,
      height: 1.25,
      letterSpacing: -.32,
    ),
    titleSmall: base.primaryTextTheme.titleSmall!.copyWith(
      color: Colors.white,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.w500,
      fontSize: 16,
      height: 1.25,
      letterSpacing: -.32,
    ),
    bodyLarge: base.primaryTextTheme.bodyLarge!.copyWith(
      color: Colors.white,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      letterSpacing: -.32,
      height: 1.25,
    ),
    bodyMedium: base.primaryTextTheme.bodyMedium!.copyWith(
      color: Colors.white,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.normal,
      fontSize: 14,
      letterSpacing: -.16,
      height: 1.25,
    ),
    bodySmall: const TextStyle(
      color: Colors.white,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.normal,
      fontSize: 12,
      height: 1.1,
      letterSpacing: -.16,
    ),
    labelSmall: const TextStyle(
      color: Colors.white,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.normal,
      fontSize: 10,
      height: 1.1,
      letterSpacing: -.1,
    ),
    labelLarge: const TextStyle(
      color: Colors.white,
      fontFamily: FontFamily.CeraPro,
      fontWeight: FontWeight.bold,
      fontSize: 20,
      height: 1.1,
    ),
  ),
  checkboxTheme: CheckboxThemeData(
    fillColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return Colors.red;
      }
      return null;
    }),
  ),
  radioTheme: RadioThemeData(
    fillColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return Colors.red;
      }
      return null;
    }),
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return Colors.red;
      }
      return null;
    }),
    trackColor: MaterialStateProperty.resolveWith<Color?>((states) {
      if (states.contains(MaterialState.disabled)) {
        return null;
      }
      if (states.contains(MaterialState.selected)) {
        return Colors.red;
      }
      return null;
    }),
  ),
);
