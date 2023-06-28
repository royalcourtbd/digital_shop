import 'package:digital_shop/general/utils/colors.dart';

import 'package:flutter/material.dart';

ThemeData customLightTheme() {
  TextTheme _customLightThemesTextTheme(TextTheme base) {
    return base.copyWith(
      //use
      displayLarge: base.displayLarge!.copyWith(
        fontFamily: 'Roboto',
        color: ColorResources.COLOR_BLACK,
      ),
      displayMedium: base.displayMedium!.copyWith(
          fontFamily: 'Roboto',
          color: ColorResources.PRIMARY_COLOR,
          decoration: TextDecoration.underline),
      displaySmall: base.displaySmall!.copyWith(
        fontFamily: 'Roboto',
        color: ColorResources.COLOR_BLACK,
      ),
      headlineMedium: base.headlineMedium!.copyWith(
          fontFamily: 'Roboto',
          color: ColorResources.PRIMARY_COLOR,
          fontWeight: FontWeight.w700),
      headlineSmall: base.headlineSmall!.copyWith(
          fontFamily: 'Roboto',
          color: ColorResources.COLOR_BLACK,
          fontWeight: FontWeight.w700),
      titleLarge: base.titleLarge!.copyWith(fontSize: 15.0, color: Colors.orange),
      bodySmall: base.bodySmall!.copyWith(
        color: const Color(0xFFCCC5AF),
      ),
      bodyMedium: base.bodyMedium!.copyWith(
        color: const Color(0xFF807A6B),
      ),
      bodyLarge: base.bodyLarge!.copyWith(color: Colors.brown),
    );
  }

  final ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    scaffoldBackgroundColor: ColorResources.COLOR_WHITE,
    textTheme: _customLightThemesTextTheme(lightTheme.textTheme),
    snackBarTheme: const SnackBarThemeData(
      actionTextColor: ColorResources.OLD_ROSE,
      backgroundColor: ColorResources.PRIMARY_COLOR,
    ),
    inputDecorationTheme: InputDecorationTheme(
      errorStyle: TextStyle(color: Colors.red.shade200),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade200),
      ),
      prefixIconColor: ColorResources.PRIMARY_COLOR,
      suffixIconColor: ColorResources.PRIMARY_COLOR,
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade200),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorResources.DIVIDER),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorResources.DIVIDER),
      ),
      hintStyle: const TextStyle(color: ColorResources.COLOR_BLACK),
    ),
    indicatorColor: ColorResources.COLOR_RED,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      },
    ),
    primaryIconTheme: lightTheme.primaryIconTheme.copyWith(
      color: ColorResources.PRIMARY_COLOR,
      size: 20,
    ),
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(color: ColorResources.PRIMARY_COLOR),
      mouseCursor: MaterialStateProperty.all(MouseCursor.defer),
      overlayColor: MaterialStateProperty.all(ColorResources.PRIMARY_COLOR),
      checkColor: MaterialStateProperty.all(ColorResources.COLOR_BLACK),
    ),
    iconTheme: lightTheme.iconTheme.copyWith(
      color: ColorResources.PRIMARY_COLOR,
    ),
    tabBarTheme: lightTheme.tabBarTheme.copyWith(
      labelColor: const Color(0xffce107c),
      unselectedLabelColor: Colors.grey,
    ),
    buttonTheme: const ButtonThemeData(buttonColor: ColorResources.COLOR_WHITE), colorScheme: const ColorScheme(
      onPrimaryContainer: ColorResources.COLOR_WHITE,
      brightness: Brightness.dark,
      primary: ColorResources.PRIMARY_COLOR,
      onPrimary: ColorResources.ON_PRIMARY,
      secondary: ColorResources.SECONDARY_COLOR,
      onSecondary: ColorResources.ON_SECONDARY,
      error: ColorResources.ERROR,
      onError: ColorResources.COLOR_WHITE,
      background: ColorResources.BACKGROUND_COLOR,
      onBackground: ColorResources.COLOR_BLACK,
      surface: ColorResources.SURFACE,
      onSurface: ColorResources.PRIMARY_COLOR,
    ).copyWith(background: ColorResources.SCAFFOLD).copyWith(error: Colors.red),
  );
}
