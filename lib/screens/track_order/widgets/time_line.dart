import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/style/app_styles.dart';
import 'package:timeline_tile/timeline_tile.dart';

class OrderTimelineTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isFirst;
  final bool isLast;
  final bool isCompleted;

  const OrderTimelineTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.isFirst = false,
    this.isLast = false,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(
        color: isCompleted ? AppColors.green07 : AppColors.greyED,
        thickness: 2.w,
      ),
      afterLineStyle: LineStyle(
        color: isCompleted ? AppColors.green07 : AppColors.greyED,
        thickness: 2.w,
      ),
      indicatorStyle: IndicatorStyle(
          width: 23.w,
          height: 23.h,
          color: isCompleted ? AppColors.green07 : AppColors.greyED,
          iconStyle: IconStyle(iconData: Icons.done, color: AppColors.white)),
      endChild: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: Container(
          constraints: BoxConstraints(
            minHeight: 50.h,
          ),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppStyles.font15.medium.colored(AppColors.black0),
              ),
              SizedBox(height: 8.h),
              Text(
                subtitle,
                style: AppStyles.font12.normal.colored(AppColors.greyAF),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
