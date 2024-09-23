import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/app_images.dart';
import 'package:manchaha/utils/style/app_styles.dart';

import '../../../shimmer/shimmer.dart';
import '../../../utils/global.dart';

class CartItemWidget extends StatefulWidget {
  final String imageUrl;
  final String description;
  final String price;
  final String originalPrice;
  final String discount;
  final String size;
  final Function() onIncrease;
  final Function() onDecrease;
  final int count;
  final Function() onDelete;

  const CartItemWidget({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.originalPrice,
    required this.discount,
    required this.size,
    required this.onIncrease,
    required this.onDecrease,
    required this.count,
    required this.onDelete,
  });

  @override
  CartItemWidgetState createState() => CartItemWidgetState();
}

class CartItemWidgetState extends State<CartItemWidget> {
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
    return _isLoading
        ? CustomShimmer(
            width: w,
            height: 200.h,
          )
        : Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyC8.withOpacity(0.9),
                      offset: Offset(0, 1.h),
                      blurRadius: 13.r,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 12.w),
                      height: 136.h,
                      width: 160.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(widget.imageUrl),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 19.w),
                      color: AppColors.white,
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text to start
                        children: [
                          SizedBox(height: 29.h),
                          Text(
                            widget.description,
                            style: AppStyles.font15.normal
                                .colored(AppColors.grey30),
                          ),
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Align row elements to start
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
                                    .copyWith(
                                        decoration: TextDecoration.lineThrough),
                              ),
                              SizedBox(width: 3.w),
                              Text(
                                widget.discount,
                                style: AppStyles.font14.normal
                                    .colored(AppColors.red),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .start, // Align row elements to start
                            children: [
                              Text(
                                'Size: ${widget.size}',
                                style: AppStyles.font14.normal
                                    .colored(AppColors.grey6B),
                              ),
                              SizedBox(width: 14.82.w),
                              Container(
                                height: 30.h,
                                width: 70.w,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFEEEEEE),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40.r)),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap: widget.onDecrease,
                                      child: Icon(Icons.remove, size: 15.sp),
                                    ),
                                    Text('${widget.count}'),
                                    GestureDetector(
                                      onTap: widget.onIncrease,
                                      child: Icon(Icons.add, size: 15.sp),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 6.w,
                top: 5.h,
                child: GestureDetector(
                  onTap: widget.onDelete,
                  child: Image.asset(AppImages.deleteItem,
                      height: 26.h, width: 26.w),
                ),
              ),
            ],
          );
  }
}
