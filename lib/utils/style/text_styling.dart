import 'package:flutter/material.dart';

import '../app_colors.dart';
import 'app_styles.dart';

class ThemeStyle {
  ThemeStyle({
    TextStyle? text,
    Color? color,
  })  : text = text ?? AppStyles.appFont,
        color = color ?? (text ?? AppStyles.appFont).color ?? AppColors.white,
        textStyles = AppStyles.create(text ?? AppStyles.appFont);

  final TextStyle text;
  final Color color;

  final AppStyles textStyles;

  static ThemeStyle of(BuildContext context) => ThemeStyling.of(context);

  static ThemeStyle ofStatic(BuildContext context) =>
      ThemeStyling.ofStatic(context);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ThemeStyle &&
        other.text == text &&
        other.color == color &&
        other.textStyles == textStyles;
  }

  @override
  int get hashCode => text.hashCode ^ color.hashCode ^ textStyles.hashCode;
}

class TextStyles {
  // textStyles with fontWeight and fontFamily as the default values......

  static TextStyle poppinsThin(double size, Color color,
      {String? fontFamily = "Poppins", bool underline = false}) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.w300,
        decoration: underline ? TextDecoration.underline : null,
        fontSize: size,
        fontFamily: fontFamily);
  }

  static TextStyle poppinsMedium(double size, Color color,
      {String? fontFamily = "Poppins", bool underline = false}) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.w500,
        decoration: underline ? TextDecoration.underline : null,
        fontSize: size,
        fontFamily: fontFamily);
  }

  static TextStyle poppinsSemiBold(double size, Color color,
      {String? fontFamily = "Poppins", bool underline = false}) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.w600,
        decorationColor: Colors.white70,
        decoration: underline ? TextDecoration.underline : null,
        fontSize: size,
        fontFamily: fontFamily);
  }

  static TextStyle poppinsBold(double size, Color color,
      {String? fontFamily = "Poppins", bool underline = false}) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        decoration: underline ? TextDecoration.underline : null,
        fontSize: size,
        fontFamily: fontFamily);
  }

  static TextStyle poppinsExtraBold(double size, Color color,
      {String? fontFamily = "Poppins", bool underline = false}) {
    return TextStyle(
        color: color,
        fontWeight: FontWeight.w800,
        decoration: underline ? TextDecoration.underline : null,
        fontSize: size,
        fontFamily: fontFamily);
  }
}

class ThemeStyling extends InheritedWidget {
  factory ThemeStyling.white({required Widget child}) =>
      ThemeStyling(style: ThemeStyles.white, child: child);

  //----------------------------------------------------------------------------
  ThemeStyling({
    ThemeStyle? style,
    required super.child,
    super.key,
  }) : style = style ?? ThemeStyle();

  final ThemeStyle style;

  static ThemeStyling? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeStyling>();
  }

  static ThemeStyle of(BuildContext context) {
    final result = maybeOf(context);
    assert(result != null, 'No ThemeStyles found in context');
    return result!.style;
  }

  static ThemeStyling? maybeOfStatic(BuildContext context) {
    return context.findAncestorWidgetOfExactType<ThemeStyling>();
  }

  static ThemeStyle ofStatic(BuildContext context) {
    final result = maybeOfStatic(context);
    assert(result != null, 'No ThemeStyles found in context');
    return result!.style;
  }

  @override
  bool updateShouldNotify(covariant ThemeStyling oldWidget) => false
      // && style != oldWidget.style
      ;
}
