import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppTheme {
  static AppTheme? _appTheme;

  factory AppTheme() {
    _appTheme = AppTheme._internal();
    return _appTheme!;
  }

  AppTheme._internal();

  /// return light mode theme
  ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: AppColors.white,
      primaryColor: AppColors.white,
      brightness: Brightness.light,
      hoverColor: AppColors.tranparent,
      scrollbarTheme: ScrollbarThemeData(
        thickness: WidgetStateProperty.all(7.5),
        trackColor: WidgetStateProperty.all(
          AppColors.tranparent,
        ),
        trackBorderColor: WidgetStateProperty.all(
          AppColors.tranparent,
        ),
      ),
      fontFamily: AppFonts.poppins,
    );
  }
}
