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
  InternalAppColors get appColors => AppColors.dark;

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
      iconTheme: IconThemeData(color: AppColors.dark.defaultTextColor),
      scaffoldBackgroundColor: AppColors.dark.backgroundColor,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.dark.backgroundColor,
        foregroundColor: AppColors.dark.defaultTextColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: instance.darkButton),
    );
  }

  @override
  ButtonStyle get difficultyButton => ElevatedButton.styleFrom(
        foregroundColor: AppColors.dark.defaultTextColor,
        backgroundColor: Colors.transparent,
        textStyle: GoogleFonts.poppins(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: AppColors.dark.defaultTextColor,
        ),
      );

  @override
  TextStyle get stopwatch => GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 32,
        color: AppColors.dark.defaultTextColor,
      );

  @override
  TextStyle get pontuation => GoogleFonts.poppins(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.dark.defaultTextColor,
      );

  @override
  TextStyle get pause => GoogleFonts.poppins(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.dark.defaultTextColor,
      );

  @override
  TextStyle get incorrectNumberText => GoogleFonts.poppins(fontSize: 16, color: AppColors.dark.wrongNumberText);

  @override
  TextStyle get presetNumberText => GoogleFonts.poppins(fontSize: 16, color: AppColors.dark.presetedNumberText);

  @override
  TextStyle get userInputNumberText => GoogleFonts.poppins(fontSize: 16, color: AppColors.dark.definedByUserNumberText);

  @override
  TextStyle get actualSelectedNumberText => GoogleFonts.poppins(fontSize: 16, color: AppColors.dark.selectedNumberText);
}
