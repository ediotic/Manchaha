import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class CustomPaymentIcon extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final double? height;
  final double? width;
  final double? iconSize;
  final Color? initialColor;
  final Color? selectedColor;
  final double? borderWidth;
  final BorderRadiusGeometry? borderRadius;

  const CustomPaymentIcon({
    super.key,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    this.height,
    this.width,
    this.iconSize,
    this.initialColor,
    this.selectedColor,
    this.borderWidth,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 70.h,
        width: width ?? 122.w,
        decoration: BoxDecoration(
          color: isSelected
              ? selectedColor ?? AppColors.appColor.withOpacity(0.2)
              : initialColor ?? AppColors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(15.r),
          border: Border.all(
            color: isSelected ? AppColors.appColor : AppColors.greyC3,
            width: borderWidth ?? 1.w,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: AppColors.blue00.withOpacity(0.30),
                    blurRadius: 12.r,
                    offset: Offset(0, 6.h),
                  ),
                ]
              : [],
        ),
        child: Icon(
          icon,
          color: isSelected ? AppColors.white : AppColors.greyC3,
          size: iconSize ?? 24.sp,
        ),
      ),
    );
  }
}
