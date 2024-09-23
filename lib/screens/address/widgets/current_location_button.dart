import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_strings.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/style/app_styles.dart';

class CurrentLocationButton extends StatelessWidget {
  const CurrentLocationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 50.h,
        width: 395.w,
        decoration: BoxDecoration(
          color: AppColors.appColor.withOpacity(0.18),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.my_location,
              color: AppColors.appColor,
              size: 15.w,
            ),
            SizedBox(
              width: 7.72.w,
            ),
            Text(
              AppStrings.currentLocation,
              style: AppStyles.font14.normal.colored(AppColors.appColor),
            ),
          ],
        ),
      ),
    );
  }
}
