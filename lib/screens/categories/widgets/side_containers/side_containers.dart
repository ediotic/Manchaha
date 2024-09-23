import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/global.dart';

class CustomContainer extends StatelessWidget {
  final bool isSelected;
  final String text;
  final EdgeInsetsGeometry padding;
  final BorderRadiusGeometry? borderRadius;
  final Color backgroundColor;
  final TextStyle textStyle;
  final List<BoxShadow>? boxShadow;
  final double? width;
  final VoidCallback onTap;

  const CustomContainer({
    super.key,
    required this.isSelected,
    required this.text,
    required this.onTap,
    this.padding = const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
    this.borderRadius = const BorderRadius.only(
      topRight: Radius.circular(0),
    ),
    this.backgroundColor = Colors.white,
    this.textStyle = const TextStyle(),
    this.boxShadow,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              width: 5.w,
              height: (h * 0.075).h,
              color: isSelected ? AppColors.blue06 : AppColors.white,
            ),
          ],
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: width,
            padding: padding,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: borderRadius,
              boxShadow: boxShadow,
            ),
            child: Center(
              child: Text(
                text,
                style: textStyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
