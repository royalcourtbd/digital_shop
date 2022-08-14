import 'package:digital_shop/general/utils/colors.dart';

import 'package:flutter/material.dart';

ThemeData customLightTheme() {
  TextTheme _customLightThemesTextTheme(TextTheme base) {
    return base.copyWith(
      //use
      headline1: base.headline1!.copyWith(
        fontFamily: 'Roboto',
        color: ColorResources.COLOR_BLACK,
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
          fontWeight: FontWeight.w700),
      headline5: base.headline5!.copyWith(
          fontFamily: 'Roboto',
          color: ColorResources.COLOR_BLACK,
          fontWeight: FontWeight.w700),
      headline6: base.headline6!.copyWith(fontSize: 15.0, color: Colors.orange),
      caption: base.caption!.copyWith(
        color: const Color(0xFFCCC5AF),
      ),
      bodyText2: base.bodyText2!.copyWith(
        color: const Color(0xFF807A6B),
      ),
      bodyText1: base.bodyText1!.copyWith(color: Colors.brown),
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
    colorScheme: const ColorScheme(
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
    backgroundColor: ColorResources.SCAFFOLD,
    tabBarTheme: lightTheme.tabBarTheme.copyWith(
      labelColor: const Color(0xffce107c),
      unselectedLabelColor: Colors.grey,
    ),
    errorColor: Colors.red,
    buttonTheme: const ButtonThemeData(buttonColor: ColorResources.COLOR_WHITE),
  );
}
