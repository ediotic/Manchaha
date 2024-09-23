import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';
import '../app_fonts.dart';
import 'text_styling.dart';

class AppStyles {
  static AppStyles of(BuildContext context) =>
      ThemeStyle.of(context).textStyles;

  static AppStyles ofStatic(BuildContext context) =>
      ThemeStyle.ofStatic(context).textStyles;

  //----------------------------------------------------------------------------
  static const TextStyle appFont = TextStyle(
    color: AppColors.white,
    fontFamily: AppFonts.poppins,
  );

  //----------------------------------------------------------------------------
  const AppStyles.create([this.basic = appFont]);

  static const AppStyles _instance = AppStyles.create();

  factory AppStyles() => _instance;

  //----------------------------------------------------------------------------
  final TextStyle basic;

  /// FontWeight: 400
  static final TextStyle baseFont =
      appFont.copyWith(fontWeight: FontWeight.w400);

  /// FontSize: 8
  static final font8 = TextStyleSet(baseFont.copyWith(fontSize: 8.sp));

  /// FontSize: 9
  static final font9 = TextStyleSet(baseFont.copyWith(fontSize: 9.sp));

  /// FontSize: 10
  static final font10 = TextStyleSet(baseFont.copyWith(fontSize: 10.sp));

  /// FontSize: 11
  static final font11 = TextStyleSet(baseFont.copyWith(fontSize: 11.sp));

  /// FontSize: 12
  static final font12 = TextStyleSet(baseFont.copyWith(fontSize: 12.sp));

  /// FontSize: 13
  static final font13 = TextStyleSet(baseFont.copyWith(fontSize: 13.sp));

  /// FontSize: 14
  static final font14 = TextStyleSet(baseFont.copyWith(fontSize: 14.sp));

  /// FontSize: 15
  static final font15 = TextStyleSet(baseFont.copyWith(fontSize: 15.sp));

  /// FontSize: 16
  static final font16 = TextStyleSet(baseFont.copyWith(fontSize: 16.sp));

  /// FontSize: 17
  static final font17 = TextStyleSet(baseFont.copyWith(fontSize: 17.sp));

  /// FontSize: 18
  static final font18 = TextStyleSet(baseFont.copyWith(fontSize: 18.sp));

  /// FontSize: 20
  static final font20 = TextStyleSet(baseFont.copyWith(fontSize: 20.sp));

  /// FontSize: 22
  static final font22 = TextStyleSet(baseFont.copyWith(fontSize: 22.sp));

  /// FontSize: 24
  static final font24 = TextStyleSet(baseFont.copyWith(fontSize: 24.sp));

  /// FontSize: 26
  static final font26 = TextStyleSet(baseFont.copyWith(fontSize: 26.sp));

  /// FontSize: 27
  static final font27 = TextStyleSet(baseFont.copyWith(fontSize: 27.sp));

  /// FontSize: 28
  static final font28 = TextStyleSet(baseFont.copyWith(fontSize: 28.sp));

  /// FontSize: 40
  static final font40 = TextStyleSet(baseFont.copyWith(fontSize: 40.sp));
}

extension TextStyling on TextStyle {
  //----------------------------------------------------------------------------
  // Font Color Customizations
  //----------------------------------------------------------------------------
  /// FontColor: White
  TextStyle get black => copyWith(color: AppColors.black0);

  /// Custom
  TextStyle colored(Color color) => copyWith(color: color);

  TextStyle opacity(double opacity) =>
      copyWith(color: color?.withOpacity(opacity));

  //----------------------------------------------------------------------------
  // Other Font Customizations
  //----------------------------------------------------------------------------
  /// FontHeight: 1.25
  TextStyle get mediumHigh => copyWith(height: 1.25);

  /// FontHeight: 1.5
  TextStyle get high => copyWith(height: 1.5);

  /// FontDecoration: Underlined
  TextStyle get underlined => copyWith(
        decoration: TextDecoration.underline,
      );

  // TextStyle get redUnderlined => copyWith(
  //     decoration: TextDecoration.underline,
  //     decorationColor: AppColors.appRedColor);

  /// FontColor: toastTextColor
  TextStyle get toastTextColor => copyWith(color: AppColors.black0);
//----------------------------------------------------------------------------
}

class TextStyleSet {
  TextStyleSet(this.original);

  final TextStyle original;

  /// FontWeight: w200
  TextStyle get extraLight => original.copyWith(fontWeight: FontWeight.w200);

  /// FontWeight: w300
  TextStyle get light => original.copyWith(fontWeight: FontWeight.w300);

  /// FontWeight: w400
  TextStyle get normal => original;

  /// FontWeight: w500
  TextStyle get medium => original.copyWith(fontWeight: FontWeight.w500);

  /// FontWeight: w600
  TextStyle get semiBold => original.copyWith(fontWeight: FontWeight.w600);

  /// FontWeight: w700
  TextStyle get bold => original.copyWith(fontWeight: FontWeight.w700);

  /// FontWeight: w800
  TextStyle get extraBold => original.copyWith(fontWeight: FontWeight.w800);

  /// FontWeight: w900
  TextStyle get extraExtraBold =>
      original.copyWith(fontWeight: FontWeight.w900);
}

class WhiteStyles extends AppStyles {
  WhiteStyles.create() : super.create(AppStyles.appFont.black);
  static final WhiteStyles _instance = WhiteStyles.create();

  factory WhiteStyles() => _instance;
}

abstract class ThemeStyles {
  static final ThemeStyle basic = ThemeStyle();
  static final ThemeStyle white = ThemeStyle(text: AppStyles.appFont.black);

  static ThemeStyle colored(Color color) =>
      ThemeStyle(text: AppStyles.appFont.colored(color));
}
