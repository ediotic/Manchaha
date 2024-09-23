import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_images.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/style/app_styles.dart';

class CancelOrderDialog extends StatelessWidget {
  const CancelOrderDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Dialog(
          child: CartImage(),
        ),
        Positioned(
            top: 225.h,
            left: 160.w,
            child: Container(
                height: 125.h,
                width: 125.h,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(100.r),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.black0.withOpacity(0.10),
                        offset: Offset(0, 1.h),
                        blurRadius: 6.r,
                      )
                    ]),
                child: Image.asset(AppImages.dialog)))
      ],
    );
  }
}

class CartImage extends StatelessWidget {
  const CartImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20.h,
          ),
          Text(
            AppStrings.areYou,
            style: AppStyles.font18.medium.colored(AppColors.blue23),
          ),
          Text(AppStrings.cancelThisOrder,
              style: AppStyles.font18.medium.colored(AppColors.blue23)),
          SizedBox(
            height: 10.h,
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
                height: 48.h,
                width: 305.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.r),
                  color: AppColors.redFC,
                ),
                child: Center(
                    child: Text(
                  AppStrings.cancel,
                  style: AppStyles.font15.medium.colored(AppColors.white),
                ))),
          ),
          SizedBox(
            height: 16.5.h,
          ),
          SizedBox(
            width: 305,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: AppColors.appColor,
                  width: 1.5,
                ),
              ),
              child: Text(
                AppStrings.notNow,
                style: AppStyles.font15.medium.colored(AppColors.appColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
