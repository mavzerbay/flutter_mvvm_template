import 'package:flutter/material.dart';

import '../../constants/app/app_constants.dart';
import 'app_theme.dart';
import 'light/light_theme_interface.dart';

class AppThemeLight extends AppTheme with ILightTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData(
        fontFamily: ApplicationConstants.FONT_FAMILY,
        colorScheme: _appColorScheme,
        textTheme: _textTheme(),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
              iconTheme: IconThemeData(color: Colors.black87),
              brightness: Brightness.light,
            ),
        inputDecorationTheme: InputDecorationTheme(
          focusColor: Colors.black12,
          labelStyle: TextStyle(),
          contentPadding: EdgeInsets.zero,
          fillColor: Colors.white,
          filled: true,
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffff2d55), width: .3), borderRadius: BorderRadius.circular(10)),
          focusedBorder: UnderlineInputBorder(),
        ),
        scaffoldBackgroundColor: Color(0xfff1f3f8),
        floatingActionButtonTheme: ThemeData.light().floatingActionButtonTheme.copyWith(),
        tabBarTheme: tabBarTheme,
        buttonTheme: ThemeData.light().buttonTheme.copyWith(
              colorScheme: ColorScheme.light(
                primary: Color(0xffff2d55),
              ),
            ),
      );

  TabBarTheme get tabBarTheme {
    return TabBarTheme(
      labelPadding: paddingInsets.lowPaddingAll,
      labelColor: _appColorScheme.onSecondary,
      labelStyle: textThemeLight!.headline6,
      unselectedLabelColor: _appColorScheme.onSecondary.withOpacity(0.2),
    );
  }

  TextTheme _textTheme() {
    return ThemeData.light().textTheme.copyWith(
          headline1: textThemeLight!.headline1,
          headline2: textThemeLight!.headline2,
          headline3: textThemeLight!.headline3,
          headline4: textThemeLight!.headline4,
          headline5: textThemeLight!.headline5,
          headline6: textThemeLight!.headline6,
          subtitle1: textThemeLight!.subtitle1,
          bodyText1: textThemeLight!.bodyText1,
          bodyText2: textThemeLight!.bodyText2,
          caption: textThemeLight!.caption,
          button: textThemeLight!.button,
          subtitle2: textThemeLight!.subtitle2,
          overline: textThemeLight!.overline,
        );
  }

  ColorScheme get _appColorScheme {
    return ColorScheme(
        primary: colorSchemeLight!.primary,
        primaryVariant: Colors.white,
        secondary: colorSchemeLight!.secondary,
        secondaryVariant: colorSchemeLight!.secondaryVariant,
        surface: colorSchemeLight!.surface,
        background: Color(0xfff6f9fc),
        error: colorSchemeLight!.error,
        onPrimary: colorSchemeLight!.onPrimary,
        onSecondary: colorSchemeLight!.onSecondary,
        onSurface: colorSchemeLight!.onSurface,
        onBackground: colorSchemeLight!.onBackground,
        onError: colorSchemeLight!.onError,
        brightness: colorSchemeLight!.brightness);
  }
}
