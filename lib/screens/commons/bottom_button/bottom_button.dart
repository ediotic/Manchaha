import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/style/app_styles.dart';

class BottomCommonButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final TextStyle? labelStyle;
  final double? height;
  final double? width;
  final Color? backgroundColor;
  final BorderRadius? borderRadius; // Custom border radius

  const BottomCommonButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.labelStyle,
    this.height,
    this.width,
    this.backgroundColor,
    this.borderRadius, // Border radius parameter
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 50.h, // Default height with ScreenUtil applied
      width: width ?? double.infinity, // Default width
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? AppColors.appColor,
          // Button color
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ??
                BorderRadius.circular(
                    90.r), // Custom or default rounded corners
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            label,
            style: labelStyle ??
                AppStyles.font16.medium.colored(AppColors.whiteF9),
            // Text style
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
