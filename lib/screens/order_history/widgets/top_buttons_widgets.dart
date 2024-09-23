import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/style/app_styles.dart';

class OrderTypeButton extends StatefulWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const OrderTypeButton({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<OrderTypeButton> createState() => _OrderTypeButtonState();
}

class _OrderTypeButtonState extends State<OrderTypeButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 25.w),
        decoration: BoxDecoration(
          color: widget.isSelected
              ? AppColors.appColor
              : AppColors.white, // Change container color
          borderRadius: BorderRadius.circular(40.r),
          boxShadow: widget.isSelected
              ? [
                  BoxShadow(
                    color: AppColors.black0.withOpacity(0.16), // Shadow color
                    spreadRadius: 0,
                    blurRadius: 6,
                    offset: const Offset(0, 3), // Position of shadow
                  ),
                ]
              : [],
        ),
        child: Center(
          child: Text(
            widget.text,
            style: AppStyles.font14.normal.colored(
              widget.isSelected ? AppColors.white : AppColors.greyA1,
            ),
          ),
        ),
      ),
    );
  }
}
