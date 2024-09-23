import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/app_strings.dart';
import 'package:manchaha/utils/style/app_styles.dart';

import '../../../shimmer/shimmer.dart';
import '../../../utils/global.dart';

class OrderSummaryWidget extends StatefulWidget {
  final String imageUrl;
  final String description;
  final String price;
  final String originalPrice;
  final String discount;
  final String size;
  final String quantity;

  const OrderSummaryWidget({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.size,
    required this.quantity,
  });

  @override
  OrderSummaryWidgetState createState() => OrderSummaryWidgetState();
}

class OrderSummaryWidgetState extends State<OrderSummaryWidget> {
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
    return  _isLoading? CustomShimmer(width: w-40, height:200.h) :  Container(
      // margin: EdgeInsets.symmetric(horizontal: 18.w),
      // height: 196.h,
      // width: (w*0.91).w,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.greyC8.withOpacity(0.9),
            offset: Offset(0, 1.h),
            blurRadius: 13.r,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                // margin: EdgeInsets.only(left:0.w),
                // padding: EdgeInsets.only(left:.w),
                height: (h * 0.14).h,
                width: (w * 0.32).w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Image.asset(widget.imageUrl),
              ),
              Container(
                margin: EdgeInsets.only(left: 19.w),
                height: 136.h,
                width: 190.w,
                color: AppColors.white,
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      widget.description,
                      style: AppStyles.font15.normal.colored(AppColors.grey30),
                    ),
                    Row(
                      children: [
                        Text(
                          widget.price,
                          style: AppStyles.font18.semiBold
                              .colored(AppColors.black1E),
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          widget.originalPrice,
                          style: AppStyles.font15.normal
                              .colored(AppColors.grey9C)
                              .copyWith(decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          widget.discount,
                          style: AppStyles.font14.normal.colored(AppColors.red),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Size: ${widget.size}',
                          style:
                              AppStyles.font14.normal.colored(AppColors.grey6B),
                        ),
                        SizedBox(width: 18.82.w),
                        Text(
                          'Qty: ${widget.quantity}',
                          // Corrected from widget.size to widget.quantity
                          style:
                              AppStyles.font14.normal.colored(AppColors.grey6B),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 0.6,
            color: AppColors.greyE6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  AppStrings.viewDetails,
                  style: AppStyles.font15.medium.colored(AppColors.appColor),
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    color: AppColors.appColor,
                    size: 15,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
