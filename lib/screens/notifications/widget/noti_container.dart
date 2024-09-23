import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shimmer/shimmer.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/global.dart';
import '../../../utils/style/app_styles.dart';

class NotificationContainer extends StatefulWidget {
  final String title;
  final String subtitle;
  final String iconPath;
  final Color iconBackgroundColor;

  const NotificationContainer({
    super.key,
    required this.title,
    required this.subtitle,
    this.iconPath = AppImages.bag, // Default icon
    this.iconBackgroundColor = AppColors.appColor, // Default background color
  });

  @override
  State<NotificationContainer> createState() => _NotificationContainerState();
}

class _NotificationContainerState extends State<NotificationContainer> {
                   bool _isLoading = true; 

 @override
  void initState() {
    super.initState();
       
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _isLoading = false; // Stop loading after 3 seconds
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    return  _isLoading? CustomShimmer(width:w-40, height:80.h) :Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.blue00.withOpacity(0.14),
            offset: const Offset(0, 2),
            blurRadius: 5,
          ),
        ],
        border: Border.all(color: AppColors.greyE6, width: 1.w),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: widget.iconBackgroundColor,
            radius: 30.r,
            child: Image.asset(widget.iconPath),
          ),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: AppStyles.font15.medium.colored(AppColors.black1F),
              ),
              Text(
                widget.subtitle,
                style: AppStyles.font11.normal.colored(AppColors.grey41),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
