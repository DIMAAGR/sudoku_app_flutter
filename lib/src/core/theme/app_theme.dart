import 'package:flutter/material.dart';
import 'package:sudoku/src/core/const/colors.dart';
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
  InternalAppColors get appColors;

  ButtonStyle get iconButton;
  ButtonStyle get lightButton;
  ButtonStyle get darkButton;
  ButtonStyle get difficultyButton;

  TextStyle get presetNumberText;
  TextStyle get userInputNumberText;
  TextStyle get incorrectNumberText;
  TextStyle get actualSelectedNumberText;
  TextStyle get title;
  TextStyle get pause;
  TextStyle get stopwatch;
  TextStyle get pontuation;
}
