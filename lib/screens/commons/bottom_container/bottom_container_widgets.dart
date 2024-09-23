import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';

class CommonBottomContainer extends StatelessWidget {
  final Widget child; // Add a child widget parameter

  const CommonBottomContainer({
    super.key,
    required this.child, // Required parameter for the child widget
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130.h,
      width: 430.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r), // ScreenUtil applied here
        ),
        color: AppColors.white.withOpacity(0),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyC8.withOpacity(0.13),
            spreadRadius: 0.r, // ScreenUtil applied here
            blurRadius: 8.r, // ScreenUtil applied here
            offset: Offset(0, 3.h), // ScreenUtil applied here
          ),
        ],
      ),
      padding: EdgeInsets.all(30.w),
      // ScreenUtil applied here
      child: child,
    );
  }
}
