import 'package:flutter/material.dart';

class ColorSchemeLight {
  static ColorSchemeLight? _instace;
  static ColorSchemeLight? get instance {
    if (_instace == null) _instace = ColorSchemeLight._init();
    return _instace;
  }

  ColorSchemeLight._init();

  final Color primary = Color(0xff00bcd4);
  final Color primaryVariant = Color(0xffffffff);
  final Color secondary = Color(0xff00bcd4);
  final Color secondaryVariant = Color(0xff0097a7);
  final Color surface = Color(0xffffffff);
  final Color background = Color(0xff80deea);
  final Color error = Color(0xffd32f2f);
  final Color onPrimary = Colors.orangeAccent;
  final Color onSecondary = Color(0xff000000);
  final Color onSurface = Color(0xff000000);
  final Color onBackground = Color(0xff000000);
  final Color onError = Color(0xffffffff);
  final Brightness brightness = Brightness.light;
}
