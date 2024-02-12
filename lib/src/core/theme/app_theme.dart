import 'package:flutter/material.dart';
import 'package:sudoku/src/core/theme/dark/dark.dart';
import 'package:sudoku/src/core/theme/light/light.dart';

class AppTheme {
  static final AppTheme _instance = AppTheme();
  ThemeMode _defaultBrightness = ThemeMode.light;

  static ThemeData get lightTheme => LightTheme.theme;
  static ThemeData get darkTheme => DarkTheme.theme;
  static ThemeMode get brightness => _instance._defaultBrightness;

  static InternalAppThemeModel actualTheme(context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.light ? LightTheme() : DarkTheme();
  }

  static ThemeMode toggleTheme() {
    bool isLightTheme = _instance._defaultBrightness == ThemeMode.light;
    var newThemeMode = isLightTheme ? ThemeMode.dark : ThemeMode.light;
    _instance._defaultBrightness = newThemeMode;
    return newThemeMode;
  }
}

abstract class InternalAppThemeModel {
  ButtonStyle get iconButton;
  ButtonStyle get lightButton;
  ButtonStyle get darkButton;
  TextStyle get title;
}
