import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/screens/order_summary/widget/cancel_dialog.dart';

import '../../../utils/app_colors.dart';
import '../../../utils/app_strings.dart';
import '../../../utils/style/app_styles.dart';
import '../../commons/bottom_button/bottom_button.dart';

class BottomContainer extends StatelessWidget {
  const BottomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(18),
      // height:(h*0.022).h ,
      height: 150.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30.r),
          topRight: Radius.circular(30.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyC8.withOpacity(0.13),
            spreadRadius: 0,
            blurRadius: 0,
            offset: Offset(0, 3.h),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  // height: (h*0.06).h,
                  // width: (w*0.04).w,
                  height: 60.h,
                  width: 192.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    color: AppColors.appColor,
                  ),
                  child: Center(
                      child: Text(
                    AppStrings.trackOrder,
                    style: AppStyles.font18.medium.colored(AppColors.white),
                  )),
                ),
              ),
              OutlinedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => const CancelOrderDialog());
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: AppColors.redFC,
                    width: 1,
                  ),
                ),
                child: Text(
                  AppStrings.cancelOrder,
                  style: AppStyles.font18.medium.colored(AppColors.redFC),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 18.h,
          ),
          BottomCommonButton(
            onPressed: () {},
            label: AppStrings.continueShopping,
            labelStyle: AppStyles.font18.medium.colored(AppColors.black1F),
            backgroundColor: AppColors.greyED,
            height: 60.h,
          ),
        ],
      ),
    );
  }
}
