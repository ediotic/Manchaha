import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manchaha/utils/app_colors.dart';
import 'package:manchaha/utils/app_strings.dart';
import 'package:manchaha/utils/style/app_styles.dart';

import '../../../shimmer/shimmer.dart';
import '../../../utils/global.dart';

class CustomProductContainerWidget extends StatefulWidget {
  final String imageUrl;
  final String description;
  final String price;
  final String size;
  final String quantity;
  final String orderStatus;
  final bool showDivider;
  final bool showTrackOrderButton;
  final bool showCancelOrderButton;
  final VoidCallback? onTrackOrderPressed;
  final VoidCallback? onCancelOrderPressed;
  final String trackOrderButtonText;
  final String cancelOrderButtonText;
  final Color trackOrderButtonColor;
  final Color cancelOrderButtonColor;

  const CustomProductContainerWidget({
    super.key,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.size,
    required this.quantity,
    required this.orderStatus,
    this.showDivider = true,
    this.showTrackOrderButton = false,
    this.showCancelOrderButton = false,
    this.onTrackOrderPressed,
    this.onCancelOrderPressed,
    this.trackOrderButtonText = AppStrings.trackOrder,
    this.cancelOrderButtonText = AppStrings.cancelOrder,
    this.trackOrderButtonColor = AppColors.appColor,
    this.cancelOrderButtonColor = AppColors.redFC,
  });

  @override
  State<CustomProductContainerWidget> createState() =>
      _CustomProductContainerWidgetState();
}

class _CustomProductContainerWidgetState
    extends State<CustomProductContainerWidget> {
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

  Color _getStatusColor() {
    if (widget.orderStatus.toLowerCase() == 'pending') {
      return AppColors.orange.withOpacity(0.10);
    } else if (widget.orderStatus.toLowerCase() == 'completed') {
      return AppColors.green.withOpacity(0.10);
    } else if (widget.orderStatus.toLowerCase() == 'cancel') {
      return AppColors.redFC.withOpacity(0.10);
    }
    return AppColors.orange.withOpacity(0.10);
  }

  Color _getStatusTextColor() {
    if (widget.orderStatus.toLowerCase() == 'pending') {
      return AppColors.orange;
    } else if (widget.orderStatus.toLowerCase() == 'completed') {
      return AppColors.green;
    } else if (widget.orderStatus.toLowerCase() == 'cancel') {
      return AppColors.redFC;
    }
    return AppColors.orange;
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CustomShimmer(width: w, height: 300.h)
        : Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10.r),
              border: Border.all(color: AppColors.greyE6EB),
            ),
            child: Column(
              children: [
                if (widget.orderStatus.isNotEmpty)
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      margin: EdgeInsets.only(right: 15.w),
                      height: 24.h,
                      width: (w * 0.16).w,
                      decoration: BoxDecoration(
                        color:
                            _getStatusColor(), // Dynamic color based on status
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10.r),
                          bottomRight: Radius.circular(10.r),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          widget.orderStatus,
                          style: AppStyles.font10.medium
                              .colored(_getStatusTextColor()),
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 11.5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: (h * 0.14).h,
                        width: (w * 0.32).w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          image: DecorationImage(
                              image: AssetImage(widget.imageUrl)),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 19.w),
                        height: 136.h,
                        width: 190.w,
                        color: AppColors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.h),
                            Text(
                              widget.description,
                              style: AppStyles.font15.normal
                                  .colored(AppColors.grey30),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Size: ${widget.size}',
                                  style: AppStyles.font14.normal
                                      .colored(AppColors.grey6B),
                                ),
                                SizedBox(width: 18.82.w),
                                Text(
                                  'Qty: ${widget.quantity}',
                                  style: AppStyles.font14.normal
                                      .colored(AppColors.grey6B),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  widget.price,
                                  style: AppStyles.font18.semiBold
                                      .colored(AppColors.black1E),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.showDivider)
                  const Divider(
                    thickness: 0.6,
                    endIndent: 7.5,
                    indent: 7.5,
                    color: AppColors.greyE6,
                  ),
                if (widget.showTrackOrderButton || widget.showCancelOrderButton)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 32.0.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        if (widget.showTrackOrderButton)
                          Expanded(
                            child: GestureDetector(
                              onTap: widget.onTrackOrderPressed,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 13.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30.r),
                                  color: widget.trackOrderButtonColor,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 2),
                                      blurRadius: 5,
                                      spreadRadius: 0,
                                      color: AppColors.black0.withOpacity(0.10),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    widget.trackOrderButtonText,
                                    style: AppStyles.font16.medium
                                        .colored(AppColors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        SizedBox(width: 11.5.w),
                        if (widget.showCancelOrderButton)
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 13.h),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(30.r),
                                border: Border.all(
                                    color: widget.cancelOrderButtonColor),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 2),
                                    blurRadius: 5,
                                    spreadRadius: 0,
                                    color: AppColors.black0.withOpacity(0.10),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  widget.cancelOrderButtonText,
                                  style: AppStyles.font16.medium
                                      .colored(widget.cancelOrderButtonColor),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                SizedBox(height: 19.5.h),
              ],
            ),
          );
  }
}
