import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shimmer/shimmer.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_images.dart';
import '../../../utils/global.dart';
import '../../../utils/style/app_styles.dart';

class AddressContainer extends StatefulWidget {
  final String title;
  final String address;
  final int value;
  final int groupValue;
  final ValueChanged<int?> onChanged;

  const AddressContainer({
    super.key,
    required this.title,
    required this.address,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  State<AddressContainer> createState() => _AddressContainerState();
}

class _AddressContainerState extends State<AddressContainer> {
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
    return Container(
      padding:
          EdgeInsets.only(top: 5.h, left: 00.w, right: 00.w, bottom: 4.5.h),
      margin: EdgeInsets.only(top: 32.h, left: 18.w, right: 17.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: widget.groupValue == widget.value
            ? [
                BoxShadow(
                  color: AppColors.greyC8.withOpacity(0.5),
                  offset: Offset(0, 3.h),
                  blurRadius: 13.r,
                ),
              ]
            : null,
        border: widget.groupValue != widget.value
            ? _isLoading
                ? null
                : Border.all(
                    color: AppColors.greyC8,
                    width: 1.w,
                  )
            : null,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: _isLoading
          ? CustomShimmer(
              width: w,
              height: 100.h,
            )
          : Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 15.w, top: 20.h, bottom: 20.h, right: 10.w),
                  child: Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(100.r),
                    ),
                    child: Image.asset(AppImages.locationicon),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.title,
                        style: AppStyles.font16.semiBold
                            .colored(AppColors.black1F),
                      ),
                      SizedBox(
                          height: 5.h), // Add some spacing between the texts
                      Text(
                        widget.address,
                        style:
                            AppStyles.font13.normal.colored(AppColors.grey93),
                      ),
                    ],
                  ),
                ),
                Radio<int>(
                  value: widget.value,
                  groupValue: widget.groupValue,
                  onChanged: widget.onChanged,
                  activeColor: AppColors.appColor,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 31.w),
                  child: const Icon(Icons.more_vert, color: AppColors.grey93),
                ),
              ],
            ),
    );
  }
}
