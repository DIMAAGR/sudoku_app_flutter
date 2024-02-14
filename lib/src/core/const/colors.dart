import 'package:flutter/material.dart';

abstract class AppColors {
  static InternalAppColors get light => _Light();
  static InternalAppColors get dark => _Dark();
}

abstract class InternalAppColors {
  Color get backgroundColor;
  Color get defaultTextColor;
  Color get defaultLightTextColor;
  Color get defaultLightTitleTextColor;
  Color get defaultLightButtonTextColor;
  Color get defaultButtonColor;
  Color get defaultLightButtonColor;
  Color get defaultDarkButtonColor;
  Color get selectedSell;
  Color get unselectedCell;
  Color get wrongCell;

  Color get wrongNumberText;
  Color get presetedNumberText;
  Color get selectedNumberText;
  Color get definedByUserNumberText;

  Color get sameRowOrColumn;
}

class _Light extends InternalAppColors {
  // Background ================1====================================================================
  @override
  Color get backgroundColor => const Color(0xFFFFFFFF);

  // Text ==========================================================================================
  @override
  Color get defaultTextColor => const Color(0xFF3D475D);
  @override
  Color get defaultLightTextColor => const Color(0xFF5b67ca);
  @override
  Color get defaultLightTitleTextColor => const Color(0xFFFFFFFF);
  @override
  Color get defaultLightButtonTextColor => const Color(0xFFFFFFFF);

  // Buttons =======================================================================================
  @override
  Color get defaultButtonColor => const Color(0xFF5B67CA);
  @override
  Color get defaultLightButtonColor => const Color(0xFFF6F6F6);
  @override
  Color get defaultDarkButtonColor => const Color(0xFF353a50);

  // Cell ==========================================================================================
  @override
  Color get selectedSell => const Color(0xFF5b67ca);
  @override
  Color get unselectedCell => const Color(0xFFffffff);
  @override
  Color get wrongCell => const Color(0xFFfecad8);

  @override
  Color get selectedNumberText => const Color(0xFFffffff);

  @override
  Color get presetedNumberText => const Color(0xFF6b7383);

  @override
  Color get wrongNumberText => const Color(0xFFf5637f);

  @override
  Color get definedByUserNumberText => const Color(0xFFbbbfc6);

  @override
  Color get sameRowOrColumn => const Color(0xFFeaecff);
}

class _Dark extends InternalAppColors {
  // Background ====================================================================================
  @override
  Color get backgroundColor => const Color(0xFF2b2e43);

  // Text ==========================================================================================
  @override
  Color get defaultTextColor => const Color(0xFFFFFFFF);
  @override
  Color get defaultLightTitleTextColor => const Color(0xFFFFFFFF);
  @override
  Color get defaultLightTextColor => const Color(0xFF3f4255);
  @override
  Color get defaultLightButtonTextColor => const Color(0xFFFFFFFF);

  // Buttons =======================================================================================
  @override
  Color get defaultButtonColor => const Color(0xFF353b63);
  @override
  Color get defaultDarkButtonColor => const Color(0xFF353a50);
  @override
  Color get defaultLightButtonColor => const Color(0xFFFFFFFF);

  // Cell ==========================================================================================
  @override
  Color get selectedSell => const Color(0xFF5a66c9);
  @override
  Color get unselectedCell => const Color(0xFF353a50);
  @override
  Color get wrongCell => const Color(0xFF673755);

  @override
  Color get selectedNumberText => const Color(0xFFffffff);

  @override
  Color get presetedNumberText => const Color(0xFFffffff);

  @override
  Color get wrongNumberText => const Color(0xFFf45170);

  @override
  Color get definedByUserNumberText => const Color(0xFF7f8290);

  @override
  Color get sameRowOrColumn => const Color(0xFF474c61);
}
