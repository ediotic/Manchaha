import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class AddressTextFields extends StatelessWidget {
  final double? height;
  final double? width;
  final TextEditingController? controller;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? borderColor;
  final BorderRadiusGeometry? borderRadius;

  const AddressTextFields({
    super.key,
    this.height,
    this.width,
    this.controller,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: height ?? 45.h,
      width: width ?? 394.w,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(10.r),
        border: Border.all(color: borderColor ?? AppColors.greyC9),
      ),
      child: TextField(
        controller: controller,
        style: textStyle,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: hintStyle,
          contentPadding: EdgeInsets.symmetric(horizontal: 10.w),
        ),
      ),
    );
  }
}
