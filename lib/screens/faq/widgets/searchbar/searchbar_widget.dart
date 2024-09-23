import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors.dart';
import '../../../../utils/app_strings.dart';
import '../../../../utils/style/app_styles.dart';

class SearchbarWidget extends StatelessWidget {
  const SearchbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: const [
          BoxShadow(
            color: AppColors.greyC8,
            blurRadius: 10.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: AppStrings.searchByProduct,
          hintStyle: AppStyles.font15.normal.colored(AppColors.greyCF),
          border: InputBorder.none,
          // Line ko remove karne ke liye
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
          prefixIcon: const Icon(
            Icons.search,
            color: AppColors.greyCF,
          ),
          suffixIcon: const Icon(
            Icons.mic,
            color: AppColors.greyCF,
          ),
        ),
        style: TextStyle(
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
