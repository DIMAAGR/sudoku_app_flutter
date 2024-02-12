import 'package:flutter/material.dart';

abstract class AppColors {
  static get light => _Light();
  static get dark => _Dark();
}

class _Light {
  // Background ====================================================================================
  final Color backgroundColor = const Color(0xFFFFFFFF);

  // Text ==========================================================================================
  final Color defaultTextColor = const Color(0xFF3D475D);
  final Color defaultLightTextColor = const Color(0xFF5b67ca);
  final Color defaultLightTitleTextColor = const Color(0xFFFFFFFF);
  final Color defaultLightButtonTextColor = const Color(0xFFFFFFFF);

  // Buttons =======================================================================================
  final Color defaultButtonColor = const Color(0xFF5B67CA);
  final Color defaultLightButtonColor = const Color(0xFFF6F6F6);
  final Color defaultDarkButtonColor = const Color(0xFF353a50);
}

class _Dark {
  // Background ====================================================================================
  final Color backgroundColor = const Color(0xFF2b2e43);

  // Text ==========================================================================================
  final Color defaultTextColor = const Color(0xFFFFFFFF);
  final Color defaultLightTitleTextColor = const Color(0xFFFFFFFF);
  final Color defaultLightTextColor = const Color(0xFF3f4255);
  final Color defaultLightButtonTextColor = const Color(0xFFFFFFFF);

  // Buttons =======================================================================================
  final Color defaultButtonColor = const Color(0xFF353b63);
  final Color defaultDarkButtonColor = const Color(0xFF353a50);
  final Color defaultLightButtonColor = const Color(0xFFFFFFFF);
}
