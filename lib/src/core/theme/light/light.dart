import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudoku/src/core/const/colors.dart';
import 'package:sudoku/src/core/theme/app_theme.dart';

class LightTheme extends InternalAppThemeModel {
  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.light.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.light.backgroundColor,
        foregroundColor: AppColors.light.defaultTextColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: instance.darkButton),
    );
  }

  static final LightTheme instance = LightTheme();

  @override
  TextStyle get title => GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.light.defaultTextColor,
      );

  @override
  ButtonStyle get iconButton => IconButton.styleFrom();

  @override
  ButtonStyle get darkButton => ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.light.defaultButtonColor,
        foregroundColor: AppColors.light.defaultLightButtonTextColor,
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.light.defaultTextColor,
        ),
      );

  @override
  ButtonStyle get lightButton => ElevatedButton.styleFrom(
        backgroundColor: AppColors.light.defaultLightButtonColor,
        surfaceTintColor: AppColors.light.defaultLightButtonColor,
        foregroundColor: AppColors.light.defaultTextColor,
        shadowColor: Colors.black26,
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      );
}
