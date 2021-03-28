import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight _instance;

  static AppThemeLight get instance {
    if (_instance == null) _instance = AppThemeLight._init();
    return _instance;
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        colorScheme: _appColorScheme(),
        textTheme: _textTheme(),
        scaffoldBackgroundColor: Color(0xfff1f3f8),
        floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme.copyWith(),
        tabBarTheme: TabBarTheme(
          labelPadding: paddingInsets.lowPaddingAll,
        ),
      );

  TextTheme _textTheme() {
    return TextTheme(
      headline1: textThemeLight.headline1,
      headline2: textThemeLight.headline2,
      headline3: textThemeLight.headline3,
      headline4: textThemeLight.headline4,
      headline5: textThemeLight.headline5,
      headline6: textThemeLight.headline6,
      subtitle1: textThemeLight.subtitle1,
      bodyText1: textThemeLight.bodyText1,
      bodyText2: textThemeLight.bodyText2,
      caption: textThemeLight.caption,
      button: textThemeLight.button,
      subtitle2: textThemeLight.subtitle2,
      overline: textThemeLight.overline,
    );
  }

  ColorScheme _appColorScheme() {
    return ColorScheme(
        primary: colorSchemeLight.primary,
        primaryVariant: colorSchemeLight.primaryVariant,
        secondary: colorSchemeLight.secondary,
        secondaryVariant: colorSchemeLight.secondaryVariant,
        surface: colorSchemeLight.surface,
        background: colorSchemeLight.background,
        error: colorSchemeLight.error,
        onPrimary: colorSchemeLight.onPrimary,
        onSecondary: colorSchemeLight.onSecondary,
        onSurface: colorSchemeLight.onSurface,
        onBackground: colorSchemeLight.onBackground,
        onError: colorSchemeLight.onError,
        brightness: colorSchemeLight.brightness);
  }
}
