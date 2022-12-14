import 'package:digital_shop/general/utils/colors.dart';

import 'package:flutter/material.dart';

ThemeData customDarkTheme() {
  TextTheme _customDarkThemesTextTheme(TextTheme base) {
    return base.copyWith(
      headline1: base.headline1!.copyWith(
        fontFamily: 'Roboto',
        color: ColorResources.COLOR_WHITE,
      ),
      headline2: base.headline2!.copyWith(
          fontFamily: 'Roboto',
          color: ColorResources.PRIMARY_COLOR,
          decoration: TextDecoration.underline),
      headline3: base.headline3!.copyWith(
        fontFamily: 'Roboto',
        color: ColorResources.COLOR_BLACK,
      ),
      headline4: base.headline4!.copyWith(
        fontFamily: 'Roboto',
        color: ColorResources.PRIMARY_COLOR,
        fontWeight: FontWeight.w700,
      ),
      headline5: base.headline5!.copyWith(
          fontFamily: 'Roboto',
          color: ColorResources.COLOR_WHITE,
          fontWeight: FontWeight.w700),
      headline6: base.headline6!.copyWith(
        fontSize: 15.0,
        color: Colors.orange,
      ),
      caption: base.caption!.copyWith(
        color: const Color(0xFFCCC5AF),
      ),
      bodyText2: base.bodyText2!.copyWith(
        color: const Color(0xFF807A6B),
      ),
      bodyText1: base.bodyText1!.copyWith(color: Colors.brown),
    );
  }

  final ThemeData darkTheme = ThemeData.dark();
  return darkTheme.copyWith(
    scaffoldBackgroundColor: ColorResources.ON_BACKGROUND,
    textTheme: _customDarkThemesTextTheme(darkTheme.textTheme),
    snackBarTheme: const SnackBarThemeData(
        actionTextColor: ColorResources.OLD_ROSE,
        backgroundColor: ColorResources.PRIMARY_COLOR),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: ColorResources.PRIMARY_COLOR,
      suffixIconColor: ColorResources.PRIMARY_COLOR,
      errorStyle: TextStyle(color: Colors.red.shade200),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade200),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.red.shade200),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorResources.DIVIDER),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorResources.DIVIDER),
      ),
      hintStyle: const TextStyle(color: ColorResources.COLOR_WHITE),
    ),
    colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: ColorResources.PRIMARY_COLOR,
      background: ColorResources.ON_BACKGROUND,
      onPrimary: ColorResources.COLOR_WHITE,
      secondary: ColorResources.SECONDARY_COLOR,
      onSecondary: ColorResources.ON_SECONDARY,
      error: ColorResources.ERROR,
      onError: ColorResources.ON_ERROR,
      onBackground: ColorResources.ON_BACKGROUND,
      surface: ColorResources.SURFACE,
      onSurface: ColorResources.ON_SURFACE,
    ),
    hintColor: const Color(0xFFE7F6F8),
    focusColor: const Color(0xFFADC4C8),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: Colors.white,
        textStyle: const TextStyle(color: Colors.white),
      ),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      },
    ),
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(color: ColorResources.PRIMARY_COLOR),
      mouseCursor: MaterialStateProperty.all(MouseCursor.defer),
      overlayColor: MaterialStateProperty.all(ColorResources.PRIMARY_COLOR),
      fillColor: MaterialStateProperty.all(ColorResources.PRIMARY_COLOR),
      checkColor: MaterialStateProperty.all(ColorResources.COLOR_BLACK),
    ),
    primaryIconTheme: darkTheme.primaryIconTheme.copyWith(
      color: ColorResources.PRIMARY_COLOR,
      size: 20,
    ),
    iconTheme: darkTheme.iconTheme.copyWith(
      color: ColorResources.COLOR_WHITE,
    ),
  );
}
