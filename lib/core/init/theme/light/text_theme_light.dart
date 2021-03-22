import 'package:flutter/material.dart';

class TextThemeLight {
  static TextThemeLight _instance;
  static TextThemeLight get instance {
    if (_instance == null) _instance = TextThemeLight._init();
    return _instance;
  }

  TextThemeLight._init();

  final TextStyle headline1 = TextStyle(
    color: Color(0x8a000000),
    fontSize: 96,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  final TextStyle headline2 = TextStyle(
    color: Color(0x8a000000),
    fontSize: 60,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );

  final TextStyle headline3 = TextStyle(
        color: Color(0x8a000000),
        fontSize: 48,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  final TextStyle headline4 = TextStyle(
        color: Color(0x8a000000),
        fontSize: 34,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  final TextStyle headline5 = TextStyle(
        color: Color(0xdd000000),
        fontSize: 24,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  final TextStyle headline6 = TextStyle(
        color: Color(0xdd000000),
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  final TextStyle subtitle1= TextStyle(
        color: Color(0xdd000000),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  final TextStyle bodyText1= TextStyle(
        color: Color(0xdd000000),
        fontSize: 16,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  final TextStyle bodyText2= TextStyle(
        color: Color(0xdd000000),
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  final TextStyle caption= TextStyle(
        color: Color(0x8a000000),
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  final TextStyle button= TextStyle(
        color: Color(0xdd000000),
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  final TextStyle subtitle2= TextStyle(
        color: Color(0xff000000),
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );

  final TextStyle overline= TextStyle(
        color: Color(0xff000000),
        fontSize: 10,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      );
}
