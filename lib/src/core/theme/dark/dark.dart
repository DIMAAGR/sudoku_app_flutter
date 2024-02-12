import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sudoku/src/core/const/colors.dart';
import 'package:sudoku/src/core/theme/app_theme.dart';

class DarkTheme extends InternalAppThemeModel {
  static final DarkTheme instance = DarkTheme();

  @override
  ButtonStyle get iconButton => throw UnimplementedError();

  @override
  ButtonStyle get darkButton => ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: AppColors.dark.defaultDarkButtonColor,
        foregroundColor: AppColors.dark.defaultLightButtonTextColor,
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.dark.defaultTextColor,
        ),
      );

  @override
  ButtonStyle get lightButton => ElevatedButton.styleFrom(
        backgroundColor: AppColors.dark.defaultLightButtonColor,
        surfaceTintColor: AppColors.dark.defaultLightButtonColor,
        foregroundColor: AppColors.dark.defaultTextColor,
        shadowColor: Colors.black26,
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      );

  @override
  TextStyle get title => GoogleFonts.poppins(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        color: AppColors.dark.defaultLightTitleTextColor,
      );

  static ThemeData get theme {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.dark.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.dark.backgroundColor,
        foregroundColor: AppColors.dark.defaultTextColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: instance.darkButton),
    );
  }
}
